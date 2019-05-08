/***************************************************************************//**
* @file     File_impl.h
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

#if !defined(EA_457C59A6_FC7F_4ede_8524_5357EF20F4E0__INCLUDED_)
#define EA_457C59A6_FC7F_4ede_8524_5357EF20F4E0__INCLUDED_

#include "CFS.h"
/**
 * @brief The File interface provides the ability to read and write files 
 *        residing within a compliant, distributed file system. A file can be 
 *        thought of conceptually as a sequence of octets with a current filePointer 
 *        describing where the next read or write will occur. This filePointer 
 *        points to the beginning of the file upon construction of the file object. 
 *        The File interface is modeled after the POSIX/C file interface.
 */
class File_impl :
	public virtual POA_CF::File {

  public:
	File_impl(
	    const char * fileName,
	    const char * root,
	    bool readOnly,
	    bool create);

	~File_impl();

	/**
	 * @brief The close operation is needed in order to release file resources 
	 *        once they are no longer needed.
	 *
	 * The close operation shall release any OE file resources associated with 
	 * the component. The close operation shall make the file unavailable to 
	 * the component.
	 */
	void
	close()
	throw (
	    CF::FileException,
	    CORBA::SystemException);

	/**
	 * @brief The operation shall return the pathname used as the input fileName 
	 *        parameter of the FileSystem::create operation when the file was created.
	 *
	 * @return Name of the file.
	 */
	char *
	fileName()
	throw (CORBA::SystemException) {
		return  CORBA::string_dup(m_fName.c_str());
	}

	/**
	 * @brief The operation shall return the current file position. 
	 *        The filePointer attribute value dictates where the next read or 
	 *        write will occur.
	 *
	 * @return Current file position.
	 */
	CORBA::ULong
	filePointer()
	throw (CORBA::SystemException) {
		return  m_fstm.tellg();
	}

	/**
	 * @brief Applications require the read operation in order to retrieve data 
	 *        from remote files.
	 *
	 * The read operation shall read, from the referenced file, the number of 
	 * octets specified by the input length parameter and advance the value of 
	 * the filePointer attribute by the number of octets actually read. 
	 * The read operation shall read less than the number of octets specified in 
	 * the inputlength parameter, when an end of file is encountered.
	 *
	 * @param[out] data		Buffer to store data read.
	 * @param[in]  length	Length of data to read.
	 *
	 * @exception The read operation shall raise the IOException when a read 
	 *            error occurs.
	 */
	void
	read(
	    CF::OctetSequence_out data,
	    CORBA::ULong length)
	throw (
	    CF::File::IOException,
	    CORBA::SystemException);

	/**
	 * @brief The setFilePointer operation positions the file pointer where the next 
	 *        read or write will occur.
	 *        The setFilePointer operation shall set the filePointer attribute value 
	 *        to the input filePointer.
	 *
	 * @param[in] _filePointer	Where the next read or write will occur.
	 *
	 * @exception The setFilePointer operation shall raise the CF FileException when 
	 *            the file pointer for the referenced file cannot be set to the value 
	 *            of the input filePointer parameter.
	 *            
	 *            The setFilePointer operation shall raise the InvalidFilePointer 
	 *            exception when the value of the filePointer parameter exceeds the 
	 *            file size.
	 */
	void
	setFilePointer(
	    CORBA::ULong _filePointer)
	throw (
	    CF::FileException,
	    CF::File::InvalidFilePointer,
	    CORBA::SystemException);

	/**
	 * @brief An application may need to know the size of a file in order to 
	 *        determine memory allocation requirements.
	 *        There is no significant behavior beyond the behavior described 
	 *        by the following section.
	 *
	 * @return The sizeOf operation shall return the number of octets stored 
	 *         in the file.
	 *
	 * @exception The sizeOf operation shall raise the CF FileException when 
	 *            a file-related error occurs (e.g., file does not exist anymore).
	 */
	CORBA::ULong
	sizeOf()
	throw (
	    CF::FileException,
	    CORBA::SystemException);

	/**
	 * @brief Applications require the write operation in order to write data to 
	 *        remote files.
	 *
	 * The write operation shall write data to the file referenced. The write 
	 * operation shall increment the filePointer attribute to reflect the number 
	 * of octets written, when the operation is successful.
	 * 
	 * If the write is unsuccessful, the value of the filePointer attribute shall 
	 * maintain or be restored to its value prior to the write operation call. 
	 * If the file was opened using the FileSystem::open operation with an input 
	 * read_Only parameter value of TRUE, writes to the file are considered to 
	 * be in error.
	 *
	 * @param[in] data	Data needs written.
	 *
	 * @exception The write operation shall raise the IOException when a write 
	 *            error occurs.
	 */
	void
	write(
	    const CF::OctetSequence & data)
	throw (
	    CF::File::IOException,
	    CORBA::SystemException);

  private:
	std::fstream m_fstm;
	/**
	 * The readonly fileName attribute shall contain the pathname used as the input
	 * fileName parameter of the FileSystem::create operation when the file was created
	 */
	std::string m_fName;

	//no default constructor
	File_impl();

};

#endif // !defined(EA_457C59A6_FC7F_4ede_8524_5357EF20F4E0__INCLUDED_)