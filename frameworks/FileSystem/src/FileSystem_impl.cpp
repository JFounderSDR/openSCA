/***************************************************************************//**
* @file     FileSystem_impl.cpp
* @author   open Team
* @version  9
* @date     2017-03-16
* @brief
* @Remark : <Description>
* @verbatim
* ==============================================================================
* <Date>     | <Version> | <Author>       | <Description>
* ==============================================================================
*  2015-05-23 | 1       | open Team       | Create file
* ==============================================================================
* @endverbatim
* ******************************************************************************
* <h2><center>&copy; Copyright(c)2015-2025 JFounder Info Tech Co.,Ltd</center></h2>
* All rights reserved. The right to copy, distribute, modify or otherwise make use
* of this software may be licensed only pursuant to the terms of an applicable
* JFounder license agreement. Company website: www.onetek.net
*//****************************************************************************/

#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>

#ifdef __SDS_OS_VXWORKS__
#include <iolib.h>
#include <vxworks.h>
#endif

#include "../include/debug.h"
#include "utils.h"
#include "../include/FileSystem_impl.h"

//class FileServantInfo;
FileServantInfo::FileServantInfo() {
	m_fileName = "";
}

FileServantInfo::~FileServantInfo() {

}

/**
 * The FileSystem class defines CORBA operations that enable remote access to a
 * physical file system.
 * The files stored on a file system may be plain files or directories. Valid
 * individual filenames and directory names shall be 40 characters or less. Valid
 * characters for a filename or directory name are the 62 alphanumeric characters
 * (Upper, and lowercase letters and the numbers 0 to 9) in addition to the ��.��
 * (period), ��_�� (underscore) and ��-�� (hyphen) characters. The filenames ��.��
 * (��dot��) and ��..�� (��dot-dot��) are invalid in the context of a file system.
 * Valid pathnames are structured according to the POSIX specification whose valid
 * characters include the ��/�� (forward slash) character in addition to the valid
 * filename characters. A valid pathname may consist of a single filename. A valid
 * pathname shall not exceed 1024 characters.
 */

FileSystem_impl::FileSystem_impl(
    const char * root) {
	//check if _root is valid path, such as "/NFS"
	if ( !openscaSupport::isValidFileName(root) ) {
		DEBUG(2, FileSystem_impl, "invalid root path of Filesystem: " << root)

		throw CF::InvalidFileName(CF::CFENOTDIR, "invalid root path of filesystem");
	}
	m_root = root;

	DEBUG(3, FileSystem_impl, "leaving constructor")
}

FileSystem_impl::~ FileSystem_impl() {
	DEBUG(5, FileSystem_impl, "deconstruct filesystem object")
}

/**
 * The copy operation provides the ability to copy a plain file to another plain
 * file
 */
void
FileSystem_impl::copy(
    const char * sourceFileName,
    const char * destinationFileName)
throw (
    CF::FileException,
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(5, FileSystem_impl,
	      "copy from " << sourceFileName << " to " << destinationFileName)

	if (sourceFileName[0] != '/' ||
	        destinationFileName[0] != '/' ||
	        !openscaSupport::isValidFileName(sourceFileName) ||
	        !openscaSupport::isValidFileName(destinationFileName)) {
		DEBUG(2, FileSystem_impl, "copy passed bad filename, throwing exception.")
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileSystem_impl::copy] Invalid file name");
	}

	std::string sFile = m_root.append(sourceFileName);
	std::string dFile = m_root.append(destinationFileName);

	//check if source file exist
	if (!this->exists(sFile.c_str())) {
		DEBUG(2, FileSystem, sFile << "don't exist")
		std::string emsg(sFile);
		emsg.append("don't exist");
		throw CF::FileException(CF::CFEEXIST, emsg.c_str());
	}

	//copy source file to dest file
	try {
		this->copyFile(sFile.c_str(), dFile.c_str());
	} catch (...) {
		DEBUG(2, FileSystem, "error occured when copy file")
	}
}

//source file exist by default
void
FileSystem_impl::copyFile(
    const char * sFile,
    const char * dFile) {
	DEBUG(3, FileSystem, "entering copyFile with sFile is" <<
	      sFile << "and dFile is" << dFile)
	//open sFile by call FileSystem::open()
	CF::File_var _srcFile = CF::File::_nil();
	_srcFile = this->open(sFile, true);
	//open dFile if exist, otherwise create it named dFile
	CF::File_var _destFile = CF::File::_nil();
	if (this->exists(dFile)) {
		_destFile = this->open(dFile, false);
	} else {
		try {
			_destFile = this->create(dFile);
		} catch (CF::FileException & e) {
			DEBUG(2, FileSystem, "create" << dFile << "fail")
			throw CF::FileException();
		} catch (CORBA::SystemException & e) {
			throw;
		}
	}

	//read data from srcFile and then write date to dest file
	unsigned int _cnt(0);

	if ( _srcFile->sizeOf() == 0 ) {
		DEBUG(3, FileSystem, "the size of sourcefile is zero")
		return;
	}

	try {
		do {
			//dynamic alloc memory
			CF::OctetSequence * _buf = NULL;
			_srcFile->read(_buf, 1024);
			_destFile->write(*_buf);
			_cnt = _buf->length();
			if (_buf != NULL)
				delete _buf;
		} while (_cnt != 0);
	} catch (CF::FileException & e) {
		DEBUG(2, FileSystem, "[FileSystem_impl::copyFile]Exception: copy file error")

		throw CF::FileException(CF::CFEIO,
		                        "[FileSystem_impl::copyFile]Exception: copy file error");
	}
}

/**
 * The create operation provides the ability to create a new plain file on the
 * file system
 */
CF::File_ptr
FileSystem_impl::create(
    const char * fileName)
throw (
    CF::FileException,
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(5, FileSystem, "In create with " << fileName);

	if (!openscaSupport::isValidFileName(fileName)) {
		DEBUG(2, FileSystem, "create passed bad filename, throw exception");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileSystem::create] Invalid file name");
	}

	if (exists(fileName)) {
		DEBUG(2, FileSystem, fileName << " has existed in filesystem.");

		return NULL;
	}

	File_impl * file = new File_impl (fileName, m_root.c_str(), false, true);
	CF::File_var fileServant = file->_this();

	FileServantInfo newFile;
	newFile.m_fileName = fileName;
	newFile.m_servant = fileServant;
	m_files.push_back(newFile);

	return fileServant._retn();
}

/**
 * The exists operation provides the ability to verify the existence of a file
 * within a file system
 */
CORBA::Boolean
FileSystem_impl::exists(
    const char * fileName)
throw (
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(4, FileSystem, "In FileSystem::exists with filename:" << fileName)
	//check if file name is valid
	if (!openscaSupport::isValidFileName(fileName)) {
		DEBUG(2, FileSystem, fileName << "is invalid filename")
		throw CF::InvalidFileName(CF::CFEINVAL,
		                          "[FileSystem::exists]Invalid file name");
	}

	//convert filename to absolute path
	std::string file = m_root;
	file.append("/");
	file.append(fileName);

	try {
		//call posix API
		//open() - captital and small letter insensitive
		FILE * fd = fopen(file.c_str(), "r");
		if (fd == NULL) {
			DEBUG(2, FileSystem::exists, ":open " << file << " failed.")
			throw CF::InvalidFileName();
		}
		DEBUG(7, FileSystem_impl, "In exists open suc.")
		fclose( fd );
	} catch (...) {
		DEBUG(2, FileSystem, "open or close" << file << false)
		throw CF::InvalidFileName();;
	}

	return  true;
}

/**
 * The list operation provides the ability to obtain a list of files along with
 * their information in the file system according to a given search pattern. The
 * list operation may be used to return information for one file or for a set of
 * files
 */
CF::FileSystem::FileInformationSequence *
FileSystem_impl::list(
    const char * pattern)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(1, FileSystem_impl, "In list with " << pattern);

	std::string rootDirPath(m_root);

	CF::FileSystem::FileInformationSequence_var result = new
	CF::FileSystem::FileInformationSequence;
	result->length(0);

	recursiveList(rootDirPath.c_str(), pattern, result);

	return result._retn();
}

/**
 * The mkdir operation provides the ability to create a directory on the file
 * system
 */
void
FileSystem_impl::mkdir(
    const char * directoryName)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(4, FileSystem, "In FileSystem::mkdir with " << directoryName);

	if (!openscaSupport::isValidFileName(directoryName)) {
		DEBUG(2, FileSystem, "mkdir passed invalid filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileSystem::mkdir] Invalid file name");
	}

	//convert directoryName to absolutely path
	std::string _absdir = m_root;
	_absdir.append("/");
	_absdir.append(directoryName);

	if (this->exists(_absdir.c_str()))
		throw CF::FileException (CF::CFEEXIST, "[FileSystem::mkdir] Directory exists.");

#ifdef __VXWORKS__
	int fd = ::mkdir(_absdir.c_str());
#elif __linux__
	int fd = ::mkdir(_absdir.c_str(), S_IRWXU);
#endif
	if (fd == -1) {
		DEBUG(2, FileSystem, "mkdir " << directoryName <<
		      "failed, and throwing exception")
		throw CF::FileException(CF::CFEFAULT, "[FileSystem_impl::mkdir]mkdir failed");
	}

}

/**
 * The open operation provides the ability to open a plain file for read or write
 */
CF::File_ptr
FileSystem_impl::open(
    const char * fileName,
    CORBA::Boolean readOnly)
throw (
    CF::FileException,
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(4, FileSystem, "In FileSystem::open with filename:" << fileName);

	if (!openscaSupport::isValidFileName(fileName)) {
		DEBUG(2, FileSystem, "open passed invalid filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileSystem::open] Invalid file name");
	}

	if (!exists(fileName)) {
		DEBUG(6, FileSystem, fileName << " does not exist in open, throwing exception.")
		throw CF::FileException(CF::CFEEXIST,
		                        "[FileSystem::open] File does not exist.");
	}

	File_impl * file = new File_impl (fileName, m_root.c_str(), true, false);
	CF::File_var fileServant = file->_this();

	FileServantInfo newFile;
	newFile.m_fileName = fileName;
	newFile.m_servant = fileServant;
	m_files.push_back(newFile);

	DEBUG(7, FileSystem::open, "fileName is : " << fileName)
	return fileServant._retn();
}

/**
 * The query operation provides the ability to retrieve information about a file
 * system
 */
void
FileSystem_impl::query(
    CF::Properties & fileSysProperties)
throw (
    CF::FileSystem::UnknownFileSystemProperties,
    CORBA::SystemException) {
	DEBUG(4, FileSystem, "entering query")

	unsigned int len = fileSysProperties.length();
	for (unsigned int i = 0; i < len; i++) {
		if (strcmp(fileSysProperties[i].id, CF::FileSystem::SIZE) == 0) {
			//get size of file system
			CORBA::ULong fs_size = getDirSize(m_root.c_str());

			fileSysProperties[i].value <<= fs_size;
		} else if (strcmp(fileSysProperties[i].id,
		                  CF::FileSystem::AVAILABLE_SIZE) == 0) {
			CORBA::ULong freeSize;
			int fd = ::open(m_root.c_str(), O_RDONLY, 0);
#ifdef __VXWORKS__
			int status = ioctl(fd, FIONFREE, (int)&freeSize);
#elif __linux__
			int status = ioctl(fd, 30, (int)&freeSize);
#endif
			if (status == -1) {
				DEBUG(2, FileSystem, "error occur when call ioctl")
				return;
			}

			fileSysProperties[i].value <<= freeSize;
			::close(fd);
		} else {
			CF::Properties unknownPro;
			unknownPro.length(1);
			unknownPro[0] = fileSysProperties[i];
			throw CF::FileSystem::UnknownFileSystemProperties(unknownPro);
		}
	}

	DEBUG(4, FileSystem, "leaving file system::query")
}

CORBA::ULong
FileSystem_impl::getDirSize(
    const char * dirName) {
	DEBUG(4, FileSystem, "entering getDirSize with dirName:" << dirName)

	CORBA::ULong size(0);
	struct dirent * _dirent;
	struct stat statbuf;

	//open and read dir
	DIR * _dir = opendir(dirName);
	if (_dir == NULL) {
		DEBUG(2, FileSystem, "error occur when call opendir")
		return 0;
	}
	//read a directory by sequence until readdir() return null
	while ((_dirent = readdir(_dir)) != NULL) {
		if ((strcmp(_dirent->d_name, ".") == 0)
		        || (strcmp(_dirent->d_name, "..") == 0)) {
			continue;
		}

		std::string fullName(dirName);
		fullName.append("/");
		fullName.append(_dirent->d_name);

		if (stat(fullName.c_str(), & statbuf) == ERROR) {
			DEBUG(2, FileSystem, "error occur when call stat")
			return 0;
		}

		if ( S_ISDIR(statbuf.st_mode) ) {	//is dir
			CORBA::ULong tmpSize = getDirSize(fullName.c_str());
			size += tmpSize;
		} else {	//is file
			CORBA::ULong tmpSize = statbuf.st_size;
			size += tmpSize;
		}
	}

	closedir(_dir);

	return size;
}

void
FileSystem_impl::recursiveList(
    const char * dirPath,
    const char * pattern,
    CF::FileSystem::FileInformationSequence_var & fis) {

}


/**
 * The remove operation provides the ability to remove a plain file from a file
 * system
 */
void
FileSystem_impl::remove(
    const char * fileName)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	if (!openscaSupport::isValidFileName(fileName)) {
		std::string msg = "[Filesystem::remove]Exception:";
		msg.append(fileName);
		msg.append("is invalid");
		throw CF::InvalidFileName();
	}

	//convert filename to absoulte file name
	std::string absfile = m_root;
	absfile.append("/");
	absfile.append(fileName);

	if ( !(this->exists( absfile.c_str() )) ) {
		DEBUG(2, FileSystem, absfile << "don't exist")
		std::string msg = "[Filesystem::remove]Exception:";
		msg.append(absfile);
		msg.append("don't exist");
		throw CF::FileException(CF::CFEEXIST, msg.c_str());
	}

	//call POSIX API remove
	int stat = ::remove(absfile.c_str());
	if ( stat == -1 ) {
		DEBUG(2, FileSystem, "error occur when remove " << absfile)
		throw CF::FileException();
	}
}

/**
 * The rmdir operation provides the ability to remove a directory from the file
 * system
 */
void
FileSystem_impl::rmdir(
    const char * directoryName)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(4, FileSystem, "entering filesystem::rmdir with:" << directoryName)

	if (!openscaSupport::isValidFileName(directoryName)) {
		std::string msg = "[Filesystem::rmdir]Exception:";
		msg.append(directoryName);
		msg.append("is invalid");
		throw CF::InvalidFileName( CF::CFEINVAL, msg.c_str() );
	}

	//convert filename to absolute file name
	std::string absfile = m_root;
	absfile.append("/");
	absfile.append(directoryName);

	// call POSIX API::rmdir()
	int stat = ::rmdir(absfile.c_str());
	if ( stat == -1 ) {
		DEBUG(2, FileSystem, "[FileSystem_impl::rmdir]error occur when call rmdir")

		throw CF::FileException(CF::CFENOTEMPTY, "[FileSystem_impl::rmdir]error \
				occur when call rmdir");
	}
}
