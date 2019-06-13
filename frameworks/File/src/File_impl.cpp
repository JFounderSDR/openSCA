/***************************************************************************//**
* @file     File_impl.cpp
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
#include <iostream>

#include "../include/debug.h"
#include "openscaSupport.h"

#include "../include/File_impl.h"

/**
 * The File interface provides the ability to read and write files residing within
 * a compliant, distributed file system. A file can be thought of conceptually as
 * a sequence of octets with a current filePointer describing where the next read
 * or write will occur. This filePointer points to the beginning of the file upon
 * construction of the file object. The File interface is modeled after the
 * POSIX/C file interface.
 */

//default constructor, its not implemented, so recommand not to  use it
File_impl::File_impl() {

}

File_impl::File_impl(
    const char * fileName,
    const char * fspath,
    bool readOnly,
    bool create) {
	DEBUG(4, File_impl, "In constructor with" << fileName
	      << " and path:" << fspath)

	if (!(openscaSupport::isValidFileName(fileName)
	        && openscaSupport::isValidFileName(fspath))) {
		DEBUG(4, File_impl, "valid File name in File_impl constructor" )

		throw CF::InvalidFileName(CF::CFEINVAL,
		                          "[File_impl::File_impl]invalid file name");
	}

	//set file mode
	std::ios_base::openmode mode;
	if (create) {
		mode = std::ios::in | std::ios::out | std::ios::trunc;
	} else if (readOnly) {
		mode = std::ios::in;
	} else {
		mode = std::ios::in | std::ios::out;
	}
	//full file path: fspath / fileName
	m_fName = "";
	m_fName.append(fspath);
	m_fName.append("/");
	m_fName.append(fileName);

	DEBUG(7, File_impl, "m_fName is " << m_fName)

	m_fstm.open(m_fName.c_str(), mode);
	if (!m_fstm.is_open()) {
		DEBUG(3, File_impl, "[File_impl::File_impl]open file failed")
		exit(EXIT_FAILURE);
	}
}

File_impl::~File_impl() {
	DEBUG(5, File_impl, "Calling File_impl, deconstructor")
}

void
File_impl::close()
throw (
    CF::FileException,
    CORBA::SystemException) {
	m_fstm.close();
	if (m_fstm.fail()) {
		DEBUG(2, File_impl, "[File_impl::close] Exception: close file failed")
	}
}

/**
 * Applications require the read operation in order to retrieve data from remote
 * files.
 */
void
File_impl::read(
    CF::OctetSequence_out data,
    CORBA::ULong length)
throw (CF::File::IOException,
       CORBA::SystemException) {
	DEBUG(6, File_impl, "entering into File_impl::read with length:" << length)

	CORBA::Octet* buf = CF::OctetSequence::allocbuf(length);
#if 0
	m_fstm.seekg(0, ios::beg);
	unsigned int _cnt = m_fstm.readsome((char*)buf,
	                                  length);	//notice: readsome fail to read file
#endif
	m_fstm.read((char*)buf, length);

	DEBUG(6, File_impl, "read count:" << m_fstm.gcount())
#if 0
	if ( _cnt == 0) {
		DEBUG(3, File_impl, "read size is :" << _cnt)
		throw CF::File::IOException(CF::CFEIO, "[File_impl::read]read zero");
	}
	data = new CF::OctetSequence(length, _cnt, buf, true);
#endif
	data = new CF::OctetSequence(m_fstm.gcount(), m_fstm.gcount(), buf, true);

#if 0
	if (m_fstm.fail()) {
		DEBUG(3, File_impl, "read file error")
		throw CF::File::IOException(CF::CFEIO, "[File_impl::read]read file error");
	}
#endif
	DEBUG(4, File_impl, "[File_impl::read] read end")
}

void
File_impl::setFilePointer(
    CORBA::ULong _filePointer)
throw (
    CF::FileException, CF::File::InvalidFilePointer,
    CORBA::SystemException) {
	DEBUG(3, File_impl, "entering setFilePointer with _filePosinter=" <<
	      _filePointer)

	if (_filePointer > this->sizeOf()) {
		throw CF::File::InvalidFilePointer();
	}
	//set position of input pointer
	m_fstm.seekg(_filePointer);
	//set position of output pointer
	m_fstm.seekp(_filePointer);

	if (m_fstm.fail()) {
		throw CF::FileException(CF::CFEIO, "set file pointer fail");
	}
}

/**
 * An application may need to know the size of a file in order to determine memory
 * allocation requirements.
 */
CORBA::ULong
File_impl::sizeOf()
throw (
    CF::FileException,
    CORBA::SystemException) {
	DEBUG(3, File_impl, "entering sizeof()")

	CORBA::ULong fPos(0), fSize(0);

	fPos = m_fstm.tellg();
	//notice: must use off inputparam, otherwise fail to get size
	m_fstm.seekg(0, ios::end);
	fSize = m_fstm.tellg();
	m_fstm.seekg(fPos);

	if (m_fstm.fail()) {
		throw CF::FileException(CF::CFEIO, "get size of file error");
	}

	return  fSize;
}

/**
 * Applications require the write operation in order to write data to remote files.
 */
void
File_impl::write(
    const CF::OctetSequence & data)
throw (
    CF::File::IOException,
    CORBA::SystemException) {
	DEBUG(3, File_impl, "entering File_impl::write")
	m_fstm.write((const char*)data.get_buffer(), data.length());

	if (m_fstm.fail()) {
		DEBUG(2, File_impl, "error writer file")
		throw CF::File::IOException(CF::CFEIO, "error wrte file");
	}
}
