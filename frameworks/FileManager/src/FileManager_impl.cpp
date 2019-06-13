/***************************************************************************//**
* @file     FileManager_impl.cpp
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

#include "../include/debug.h"
#include "../include/FileManager_impl.h"

/**
 * Multiple, distributed file systems may be accessed through a file manager. The
 * FileManager interface appears to be a single file system although the actual
 * file storage may span multiple physical file systems.
 * This is called a federated file system. A federated file system is created
 * using the mount and unmount operations. Typically, the domain manager or system
 * initialization software will invoke these operations.
 * The FileManager inherits the IDL interface of a FileSystem. Based upon the
 * pathname of a directory or file and the set of mounted file systems, the file
 * manager delegates the FileSystem operations to the appropriate file system. For
 * example, if a file system is mounted at ��/ppc2��, an open operation for a file
 * called ��/ppc2/profile.xml�� would be delegated to the mounted file system. The
 * mounted file system will be given the filename relative to it. In this example
 * the FileSystem��s open operation would receive ��/profile.xml�� as the fileName
 * argument.
 * Another example of this concept is shown using the copy operation. When a
 * client invokes the copy operation, the file manager delegates the operation to
 * the appropriate file systems (based upon supplied pathnames) thereby allowing
 * copy of files between file systems.
 * If a client does not need to mount and unmount file systems, it may treat the
 * file manager as a file system by CORBA widening a FileManager reference to a
 * FileSystem reference. One can always widen a FileManager to a FileSystem since
 * the FileManager is derived from a FileSystem.
 */

FileManager_impl::FileManager_impl() {
	DEBUG(4, FileManager, "entering FileManager_impl constructor")

	//initialize m_numMounts and m_mountTable variable
	m_numMounts = 0;
	//ten file system can be mounted to file manager at most
	m_mountTable = new CF::FileManager::MountSequence(10);

	DEBUG(4, FileManager, "leaving FileManager costructor")
}

FileManager_impl::~FileManager_impl() {
	DEBUG(4, FileManager, "call FileManager_impl deconstructor")

	if (m_mountTable) {
		delete m_mountTable;
		m_mountTable = NULL;
	}
}

void
FileManager_impl::copy(
    const char * sourceFileName,
    const char * destinationFileName)
throw (
    CF::FileException,
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(5, FileManager, "entering copy with " << sourceFileName <<
	      " to " << destinationFileName)

	if (!openscaSupport::isValidFileName(sourceFileName) ||
	        !openscaSupport::isValidFileName(destinationFileName)) {
		DEBUG(5, FileManager, "copy passed invalid filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::copy] Invalid file name");
	}

	unsigned int srcFS_idx(0), dstFS_idx(0);
	std::string srcPath;
	std::string dstPath;

	if ( !getFSandFSPath(sourceFileName, srcFS_idx, srcPath) ) {
		DEBUG(2, FileManager, "get file system path fail, throwing exception")
		throw CF::FileException();
	}

	if ( !getFSandFSPath(destinationFileName, dstFS_idx, dstPath) ) {
		DEBUG(2, FileManager, "get file system path fail, throwing exception")
		throw CF::FileException();
	}

	if ( !m_mountTable[srcFS_idx].fs->exists (srcPath.c_str()) ) {
		DEBUG(3, FileManager,
		      "Throwing exception from copy because source file does not exist.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileSystem::Copy] Invalid file name");
	}

	if (srcFS_idx == dstFS_idx) { // Check if copy is within one FileSystem
		try {
			m_mountTable[srcFS_idx].fs->copy (srcPath.c_str(), dstPath.c_str());
		} catch ( CF::FileException& ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"fs->copy\" " << srcPath <<
			      " to " << dstPath << " failed with CF::FileException")
		} catch ( CF::InvalidFileName& ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"fs->copy\" " << srcPath <<
			      " to " << dstPath << " failed with CF::InvalidFileName")
		} catch ( CORBA::SystemException& se ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"fs->copy\" " << srcPath <<
			      " to " << dstPath << " failed with CORBA::SystemException")
			DEBUG(4, FileManager, "[FileManager::copy] \"fs->copy\" " << srcPath <<
			      " to " << dstPath << " failed with CORBA::SystemException\n")
		} catch ( ... ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"fs->copy\" " << srcPath <<
			      " to " << dstPath << " failed with Unknown Exception\n")
		}
		return;
	}

	// Copy file across FileSystems
	CF::File_var srcFile;
	try {
		srcFile = m_mountTable[srcFS_idx].fs->open(srcPath.c_str(), true);
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"fs->open\" " << srcPath <<
		      " failed with CORBA::SystemException")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"fs->open\" " << srcPath <<
		      " failed with Unknown Exception\n")
	}

	unsigned int srcSize = srcFile->sizeOf();

	if (srcSize == 0) {
		///\todo Check spec to see why we throw if size == 0
		try {
			srcFile->close();
		} catch ( CORBA::SystemException & se ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"srcFile->close\" failed with\
								  CORBA::SystemException for file size of zero\n")
		} catch ( ... ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"srcFile->close\" failed with\
								 Unknown Exception for file size of zero")
		}
		throw CF::FileException ();
	}

	if (!m_mountTable[dstFS_idx].fs->exists(dstPath.c_str())) {
		try {
			m_mountTable[dstFS_idx].fs->create(dstPath.c_str());
		} catch ( CORBA::SystemException & se ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"fs->create\" " << dstPath <<
			      " failed with CORBA::SystemException\n")
		} catch ( ... ) {
			DEBUG(2, FileManager, "[FileManager::copy] \"fs->create\" " << dstPath <<
			      " failed with Unknown Exception")
		}
	}

	CF::File_var dstFile;
	try {
		dstFile = m_mountTable[dstFS_idx].fs->open (dstPath.c_str(), false);
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"fs->open\" " << dstPath <<
		      " failed with CORBA::SystemException\n")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"fs->copy\" " << dstPath <<
		      " failed with Unknown Exception")
	}

	CF::OctetSequence_var data;

	try {
		srcFile->read (data, srcSize);
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"srcFile->read\" \
							  failed with CORBA::SystemException")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"srcFile->read\" \
							  failed with Unknown Exception\n")
	}

	try {
		dstFile->write (data);
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"dstFile->write\" \
							  failed with CORBA::SystemException")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"dstFile->write\" \
							  failed with Unknown Exception")
	}

	try {
		srcFile->close();
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"srcFile->close\" \
							  failed with CORBA::SystemException\n")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"srcFile->close\" \
							  failed with Unknown Exception\n")
	}

	try {
		dstFile->close();
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"dstFile->close\" \
							  failed with CORBA::SystemException\n")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::copy] \"dstFile->close\" \
							  failed with Unknown Exception\n")
	}

}

CF::File_ptr
FileManager_impl::create(
    const char * fileName)
throw (
    CF::FileException,
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering create with " << fileName)

	if (!openscaSupport::isValidFileName(fileName)) {
		DEBUG(2, FileManager, "create passed invalid filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::create] Invalid file name");
	}

	unsigned int fileFS = 0;
	std::string filePath;

	if ( !getFSandFSPath(fileName, fileFS, filePath) ) {
		DEBUG(2, FileManager,
		      "[FileManager_impl::create]call \"getFSandFSPath\" failed")
		throw CF::FileException();
	}

	CF::File_var file_var;
	try {
		file_var = m_mountTable[fileFS].fs->create (filePath.c_str());
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::create] \"fs->create\" " << filePath <<
		      " failed with CORBA::SystemException")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::create] \"fs->create\" " << filePath <<
		      " failed with Unknown Exception")
	}

	DEBUG(5, FileManager, "leaving FileManager::create")
	return file_var._retn();
}

CORBA::Boolean
FileManager_impl::exists(
    const char * fileName)
throw (
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering exists with " << fileName)

	if (!openscaSupport::isValidFileName(fileName)) {
		DEBUG(2, FileManager, "exists passed invalid filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::exists] Invalid file name");
	}

	DEBUG(5, FileManager, "Running FS.exists for file " << fileName)

	try {
		for ( unsigned int i = 0; i < m_numMounts; i++ ) {
			DEBUG(5, FileManager, "found file system in m_mountTable ")
			if (CORBA::is_nil(m_mountTable[i].fs)) {
				DEBUG(5, FileManager, "file system in m_mountTable is invalid " << fileName)
				continue;
			}
			if (m_mountTable[i].fs->exists (fileName) )
				return true;
		}
	} catch (...) {
		DEBUG(2, FileManager, "[FileManager_impl::exists] \"fs->exists\" failed with" <<
		      fileName)
		throw CF::InvalidFileName();
	}

	throw CF::InvalidFileName();
}

/**
 * @brief  this function is used to get mountTableIndex and file system path.
 * @param  path            absolute path
 * @param  mountTableIndex the index in mount table
 * @param  FSPath          the path of file system
 * @return                 true or false
 */
bool
FileManager_impl::getFSandFSPath(
    const char * path,
    unsigned int & mountTableIndex,
    std::string & FSPath) {
	DEBUG(4, FileManager, "entering getFSandFSPath with path " << path)

	std::string tmpFSPath;

	for (unsigned int i = 0; i < m_numMounts; ++i) {
		bool flag = pathMatches(path, m_mountTable[i].mountPoint, tmpFSPath);
		if ( flag == true) {
			mountTableIndex = i;
			FSPath = tmpFSPath;
			return true;
		}
	}

	DEBUG(5, FileManager, "Found mountIndex " << mountTableIndex <<
	      " and local path " << FSPath)
	return false;
}

/**
 * File management user interfaces may need to list a file manager��s mounted file
 * systems
 */
CF::FileManager::MountSequence *
FileManager_impl::getMounts()
throw (CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering MountSequence");

	CF::FileManager::MountSequence_var result =
	    new CF::FileManager::MountSequence(m_mountTable);
	return result._retn();
}

CF::FileSystem::FileInformationSequence *
FileManager_impl::list(
    const char * pattern)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering list with " << pattern);
#if 0
	if (pattern[0] != '/')
		throw CF::InvalidFileName(CF::CFEINVAL,
		                          "[FileManager::list] Relative path given.");

	CF::FileSystem::FileInformationType* fit_arr[m_numMounts];
	int fit_length[m_numMounts];
	int result_length = 0;
	int tmp_length = 0;
	try {
		for (unsigned int i = 0; i < m_numMounts; i++) {
			DEBUG(4, FileManager, "Calling FileSystem->list");
			CF::FileSystem::FileInformationSequence_var fis =
			    m_mountTable[i].fs->list(pattern);
			DEBUG(4, FileManager, "Returned from FileSystem->list");
			result_length += fis->length();
			DEBUG(4, FileManager, "Recording " << result_length << " matches")
			fit_length[i] = fis->length();
			fit_arr[i] = fis->get_buffer(true);
		}
		DEBUG(4, FileManager, "Creating FIS results");
		tmp_length = result_length;
		CF::FileSystem::FileInformationType *fit =
		    new CF::FileSystem::FileInformationType[result_length];
		CF::FileSystem::FileInformationType *tmp;
		CF::FileSystem::FileInformationType *beginner = fit;

		DEBUG(4, FileManager, "Adding to FIS results");

		for (int j = 0; j < m_numMounts; j++) {
			std::cout << "[FileManager::list] In mount number " << j << "\n";
			tmp = fit_arr[j];

			for (unsigned int k = 0; k < fit_length[j]; k++) {
				std::cout << "[FileManager::list] Adding file number " << k
				          << "\n";
				*fit = *tmp;
				fit++;
				tmp++;
			}
		}
		fit = beginner;
		CF::FileSystem::FileInformationSequence_var result =
		    new CF::FileSystem::FileInformationSequence(result_length,
		            result_length, fit);

		DEBUG(4, FileManager, "About to return from list");
		return result._retn();
	} catch (CF::FileException& e) {
		DEBUG(2, FileManager, "[FileManager_impl::list]unkown exception");
	} catch (...) {
		DEBUG(2, FileManager, "[FileManager_impl::list]unkown exception");
	}
#endif
	return  NULL;
}

void
FileManager_impl::mkdir(
    const char * directoryName)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering mkdir with " << directoryName)

	if (!openscaSupport::isValidFileName(directoryName)) {
		DEBUG(2, FileManager, "mkdir passed bad filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::mkdir] Invalid directory name");
	}

	unsigned int fileFS(0);
	std::string filePath;

	if ( !getFSandFSPath(directoryName, fileFS, filePath) ) {
		DEBUG(2, FileManager, "[FileManager_impl::mkdir]call \"getFSandFSPath\" failed")
		throw CF::FileException();
	}

	try {
		m_mountTable[fileFS].fs->mkdir(filePath.c_str());
	} catch ( CORBA::SystemException & ex ) {
		DEBUG(2, FileManager, "[FileManager::mkdir] \"fs->mkdir\" " << filePath <<
		      " failed with CORBA::SystemException")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::mkdir] \"fs->mkdir\" " << filePath <<
		      " failed with Unknown Exception\n")
	}

	DEBUG(4, FileManager, "Leaving mkdir.")
}

/**
 * The file manager supports the notion of a federated file system. To create a
 * federated file system, the mount operation associates a file system with a
 * mount point (a directory name)
 */
void
FileManager_impl::mount(
    const char * mountPoint,
    CF::FileSystem_ptr _fileSystem)
throw (
    CORBA::SystemException,
    CF::InvalidFileName,
    CF::FileManager::InvalidFileSystem,
    CF::FileManager::MountPointAlreadyExists) {
	DEBUG(4, FileManager, "Entering FileManager::mount")

	//check if mountPoint format is valid
	if ( !openscaSupport::isValidFileName(mountPoint) ) {
		DEBUG(2, FileManager, "[FileManager_impl::mount]mountPoint format \
							  is invalid" << "throwing exception")
		throw CF::InvalidFileName(CF::CFEINVAL, "[FileManager_impl::mount]\
			mountPoint format is invalid");
	}

	//check if _fileSystem is valid
	if ( CORBA::is_nil(_fileSystem) ) {
		DEBUG(2, FileManager, "[FileManager_impl::mount]_fileSystem is nil, \
							  throwing exception")
		throw CF::FileManager::InvalidFileSystem();
	}

	//check if the file system is mounted
	for (unsigned int i = 0; i < m_mountTable->length(); i++) {
		if (strcmp(mountPoint, m_mountTable[i].mountPoint) == 0) {
			DEBUG(5, FileManager, "[FileManager_impl::mount]" <<
			      mountPoint << "has been mounted")
			throw CF::FileManager::MountPointAlreadyExists();
		}
	}

	//mount file system to file manager
	m_numMounts++;
	m_mountTable->length(m_numMounts);

	m_mountTable[m_numMounts - 1].mountPoint = CORBA::string_dup(mountPoint);
	m_mountTable[m_numMounts - 1].fs = CF::FileSystem::_duplicate(_fileSystem);

	DEBUG(4, FileManager, "leaving FileManager::mount")
}


CF::File_ptr
FileManager_impl::open(
    const char * fileName,
    CORBA::Boolean read_Only)
throw (
    CF::FileException,
    CF::InvalidFileName,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering open with " << fileName)

	if (!openscaSupport::isValidFileName(fileName)) {
		DEBUG(7, FileManager, "open passed bad filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::open] Invalid file name");
	}

	CF::File_var _file;
	for ( unsigned int i = 0; i < m_numMounts; i++ ) {
		if ( m_mountTable[i].fs->exists(fileName) ) {
			try {
				_file = m_mountTable[i].fs->open (fileName, read_Only);
			} catch ( CF::InvalidFileName & _ex ) {
				DEBUG(2, FileManager, "[FileManager::open] While opening file " <<
				      fileName << ": " << _ex.msg)
				throw CF::FileException(CF::CFNOTSET, "[FileManager::open]\
													  File not found in any mounted File Systems");
			} catch ( CF::FileException & _ex ) {
				DEBUG(2, FileManager, "[FileManager::open] While opening file " <<
				      fileName << ": " << _ex.msg)
				throw CF::FileException(CF::CFNOTSET, "[FileManager::open]\
													  File not found in any mounted File Systems");
			} catch ( ... ) {
				DEBUG(2, FileManager, "[FileManager::open] While opening file " <<
				      fileName << ": Unknown Exception")
				exit(1);
			}
			break;
		}
	}

	return _file._retn();
}

//standard fomat of full path is /tffs/dev/devmgr.out
// "/tffs" is mount point
// "/dev/devmgr.out" is file system path
bool
FileManager_impl::pathMatches(
    const char * path,
    const char * mPoint,
    std::string & FSPath) {
	DEBUG(4, FileManager, "entering FileManager::pathMatches")

	unsigned int _path_len = strlen(path);
	unsigned int _mPoint_len = strlen(mPoint);
	char fsp[128];

	if (_path_len <= _mPoint_len) {
		return false;
	}

	for (unsigned int i(0); i < _mPoint_len; i++) {
		if (path[i] != mPoint[i])
			return false;
	}

	if ( path[_mPoint_len] == '/') {
		for (unsigned int k = _mPoint_len; k < _path_len; k++)
			fsp[k - _mPoint_len] = path[k];

		fsp[_path_len - _mPoint_len] = '\0';
		FSPath.append(fsp);
	}

	DEBUG(5, FileManager, "leaving FileManager::pathMatches")
	return true;
}

void
FileManager_impl::query(
    CF::Properties & fileSysProperties)
throw (
    CF::FileSystem::UnknownFileSystemProperties,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering query")

	bool check;

	for (unsigned int i = 0; i < fileSysProperties.length (); i++) {
		check = false;

		if (strcmp (fileSysProperties[i].id, CF::FileSystem::SIZE) == 0) {
			CORBA::Long totalSize, temp;
			totalSize = 0;

			for (unsigned int j = 0; j < m_mountTable->length(); j++) {
				CF::DataType dt;
				dt.id = CORBA::string_dup ("SIZE");
				CF::Properties pr (2, 1, &dt, 0);

				try {
					m_mountTable[j].fs->query (pr);
				} catch ( CORBA::SystemException & se ) {
					DEBUG(2, FileManager, "[FileManager::query] \"fs->query\"\
										  failed with CORBA::SystemException\n")
				} catch ( ... ) {
					DEBUG(2, FileManager, "[FileManager::query] \"fs->query\" \
										  failed with Unknown Exception\n")
				}

				CF::DataType * _dt = pr.get_buffer ();

				for (unsigned int k = 0; k < pr.length (); k++) {
					_dt->value >>= temp;
					totalSize = totalSize + temp;
					_dt++;
				}

				fileSysProperties[i].value >>= temp;
				fileSysProperties[i].value <<= totalSize + temp;

				check = true;
			}
		}

		if (strcmp (fileSysProperties[i].id,
		            CF::FileSystem::AVAILABLE_SIZE) == 0) {
			CORBA::Long totalSize;
			totalSize = 0;

			for (unsigned int i = 0; i < m_mountTable->length(); i++) {
			}

			check = true;
		}

		if (!check)
			throw CF::FileSystem::UnknownFileSystemProperties ();
	}
	DEBUG(4, FileManager, "Leaving query.")
}

void
FileManager_impl::remove(
    const char * fileName)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering remove with " << fileName)

	if (fileName[0] != '/' ||
	        !openscaSupport::isValidFileName(fileName)) {
		DEBUG(2, FileManager, "remove passed invalid filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::remove] Invalid file name");
	}

	unsigned int FSIndex(0);
	std::string FSPath;

	if ( !getFSandFSPath(fileName, FSIndex, FSPath) ) {
		DEBUG(2, FileManager,
		      "[FileManager_impl::remove]call \"getFSandFSPath\" failed")
		throw CF::FileException();
	}

	if (m_mountTable[FSIndex].fs->exists (FSPath.c_str()))
		m_mountTable[FSIndex].fs->remove (FSPath.c_str());

	DEBUG(4, FileManager, "Leaving remove.")
}

void
FileManager_impl::rmdir(
    const char * directoryName)
throw (
    CF::InvalidFileName,
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "Entering rmdir with " << directoryName)

	if (!openscaSupport::isValidFileName(directoryName)) {
		DEBUG(2, FileManager, "rmdir passed bad filename, throwing exception.");
		throw CF::InvalidFileName (CF::CFEINVAL,
		                           "[FileManager::rmdir] Invalid directory name");
	}

	unsigned int num_fs(0);
	std::string filePath;

	if ( !getFSandFSPath(directoryName, num_fs, filePath) ) {
		DEBUG(2, FileManager, "[FileManager_impl::rmdir]call \"getFSandFSPath\" failed")
		throw CF::FileException();
	}

	try {
		m_mountTable[num_fs].fs->rmdir (filePath.c_str());
	} catch ( CORBA::SystemException & se ) {
		DEBUG(2, FileManager, "[FileManager::rmdir] \"fs->rmdir\" " << filePath <<
		      " failed with CORBA::SystemException")
	} catch ( ... ) {
		DEBUG(2, FileManager, "[FileManager::rmdir] \"fs->rmdir\" " << filePath <<
		      " failed with Unknown Exception")
	}

	DEBUG(4, FileManager, "Leaving rmdir.")
}

/**
 * Mounted file systems may need to be removed from a file manager
 */
void
FileManager_impl::unmount(
    const char * mountPoint)
throw (
    CF::FileManager::NonExistentMount,
    CORBA::SystemException) {
	DEBUG(4, FileManager, "entering FileManager::unmount")

	if ( !openscaSupport::isValidFileName(mountPoint) ) {
		DEBUG(2, FileManager, mountPoint << "is invalid mount point")
		throw CF::InvalidFileName();
	}

	//find mountPoint in m_mountTable
	int idx = -1;		//index of mountPoint in m_mountTable
	bool found = false;	//the flag whether find mountPoint or not
	for (unsigned int i = 0; i < m_mountTable->length(); i++) {
		if ( strcmp(m_mountTable[i].mountPoint, mountPoint) == 0) {
			DEBUG(5, FileManager, "found the " << mountPoint << "in m_mountTable")
			idx = i;
			found = true;
			break;
		}
	}

	//delete mount point from mout_table
	if ( found == true ) {
		for (unsigned int i = idx; i < m_mountTable->length() - 1; i++)
			m_mountTable[i] = m_mountTable[i + 1];

		m_mountTable->length(m_mountTable->length() - 1);
		m_numMounts--;
	}

	DEBUG(5, FileManager, "leaving FileManager::unmount")
}
