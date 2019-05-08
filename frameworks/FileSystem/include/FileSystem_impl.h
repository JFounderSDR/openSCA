/***************************************************************************//**
* @file     FileSystem_impl.h
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

#if !defined(EA_C49588F1_8059_4f50_8057_486EA8C34183__INCLUDED_)
#define EA_C49588F1_8059_4f50_8057_486EA8C34183__INCLUDED_

#include <vector>

#include "CFS.h"
#include "openscaSupport.h"

#include "File_impl.h"

class FileServantInfo {
  public:
	FileServantInfo();
	virtual ~FileServantInfo();

	std::string m_fileName;
	CF::File_var m_servant;
};

/**
 * @brief The FileSystem interface defines CORBA operations that enable remote 
 *        access to a physical file system. (see Figure 3-30)
 *        The files stored on a file system may be plain files or directories. 
 *        Valid individual filenames and directory names shall be 40 characters 
 *        or less. Valid characters for a filename or directory name are the 62 
 *        alphanumeric characters (Upper, and lowercase letters and the numbers 0 
 *        to 9) in addition to the “.” (period), “_” (underscore) and “-“ (hyphen) 
 *        characters. The filenames “.” (“dot”) and “..” (“dot-dot”) are invalid 
 *        in the context of a file system.
 *        
 *        Valid pathnames are structured according to the POSIX specification whose 
 *        valid characters include the “/” (forward slash) character in addition to 
 *        the valid filename characters. A valid pathname may consist of a single 
 *        filename. A valid pathname shall not exceed 1024 characters.
 */
class FileSystem_impl :
	public virtual POA_CF::FileSystem {

  public:
	virtual ~FileSystem_impl();

	FileSystem_impl(
	    const char * root);

	/**
	 * @brief The copy operation provides the ability to copy a plain file to 
	 *        another plain file.
	 *        
	 *        The copy operation shall copy the source file identified by the input 
	 *        sourceFileName parameter to the destination file identified by the 
	 *        input destinationFileName parameter.
	 *        
	 *        The copy operation shall overwrite the destination file, when the 
	 *        destination file already exists and is not identical to the source file.
	 *
	 * @param[in] sourceFileName		File from which to copy.
	 * @param[in] destinationFileName	File to which copy.
	 *
	 * @exception The copy operation shall raise the CF FileException exception 
	 *            when a file-related error occurs. The copy operation shall raise 
	 *            the CF InvalidFileName exception when the destination pathname
	 *            is identical to the source pathname.
	 *            
	 *            The copy operation shall raise the CF InvalidFileName exception 
	 *            when the sourceFileName or destinationFileName input parameters 
	 *            are not a valid absolute pathnames.
 	 */
	void
	copy(
	    const char * sourceFileName,
	    const char * destinationFileName)
	throw (
	    CF::FileException,
	    CF::InvalidFileName,
	    CORBA::SystemException);

	/**
	 * @brief The create operation provides the ability to create a new plain 
	 *        file on the file system.
	 *
	 * 		  The create operation shall create a new File based upon the input 
	 * 		  fileName parameter.
	 *
	 * @param[in] fileName	Name of file needs created.
	 *
	 * @return 	The create operation shall return a file object reference to the 
	 *          opened file.
	 *
	 * @exception 	The create operation shall raise the CF FileException if the 
	 *             	file already exists or another file error occurred.
	 *			    The create operation shall raise the CF InvalidFileName exception 
	 *			    when the input fileName parameter is not a valid absolute pathname.
	 */
	CF::File_ptr
	create(
	    const char * fileName)
	throw (
	    CF::FileException,
	    CF::InvalidFileName,
	    CORBA::SystemException);

	/**
	 * @brief The exists operation provides the ability to verify the existence of 
	 *        a file within a file system.
	 *        The exists operation shall check to see if a file exists based on the 
	 *        fileName parameter.
	 *
	 * @param[in] fileName 	Name of file needs to verified the existence.
	 *
	 * @return  Whether the file is existent.
	 * @retval true		File is existent.
	 * @retval flase	File is not existent.
	 *
	 * @exception The exists operation shall raise the CF InvalidFileName exception 
	 *            when input fileName parameter is not a valid absolute pathname.
	 */
	CORBA::Boolean
	exists(
	    const char * fileName)
	throw (
	    CF::InvalidFileName,
	    CORBA::SystemException);

	/**
	 * @brief The list operation provides the ability to obtain a list of files 
	 *        along with their information in the file system according to a given 
	 *        search pattern. The list operation may be used to return information 
	 *        for one file or for a set of files.
	 *
	 * @return The list operation shall return a FileInformationSequence for files 
	 *         that match the search pattern specified in the input pattern parameter. 
	 *         The list operation shall return a zero length sequence when no file 
	 *         is found which matches the search pattern.
	 *
	 * @exception The list operation shall raise the CF InvalidFileName exception 
	 *            when the input pattern parameter is not an absolute pathname or 
	 *            cannot be interpreted due to unexpected characters. The list 
	 *            operation shall raise the CF FileException when a file-related 
	 *            error occurs.
	 */
	CF::FileSystem::FileInformationSequence *
	list(
	    const char * pattern)
	throw (
	    CF::InvalidFileName,
	    CF::FileException,
	    CORBA::SystemException);

	/**
	 * @brief The mkdir operation provides the ability to create a directory on the 
	 *        file system. The mkdir operation shall create a file system directory
	 *        based on the directoryName given. The mkdir operation shall create 
	 *        all parent directories required to create the directoryName path given.
	 *
	 * @param[in] directoryName	Name of the directory needs created.
	 *
	 * @exception The mkdir operation shall raise the CF FileException if the 
	 *            directory indicated by the input directoryName parameter already 
	 *            exists or if a file-related error occurred during the operation.
	 *            The mkdir operation shall raise the CF InvalidFileName exception 
	 *            when the directoryName is not a valid directory name.
	 */
	void
	mkdir(
	    const char * directoryName)
	throw (
	    CF::InvalidFileName,
	    CF::FileException,
	    CORBA::SystemException);

	/**
	 * @brief The open operation provides the ability to open a plain file for 
	 *        read or write. The open operation shall open the file referenced by 
	 *        the input fileName parameter. The open operation shall open the file 
	 *        with read-only access when the input readOnly parameter is TRUE. 
	 *        The open operation shall open the file for write access when the 
	 *        input readOnly parameter is FALSE.
	 *
	 * @param[in] fileName Name of the file needs opened.
	 * @param[in] readOnly	Whether open the file with readonly mode.
	 *
	 * @return The open operation shall return a File instance on successful 
	 *         completion. he open operation shall set the filePointer attribute 
	 *         of the returned file instance to the beginning of the file.
	 *
	 * @exception The open operation shall raise the CF FileException if the file 
	 *            does not exist or another file error occurred.
	 *            The open operation shall raise the CF InvalidFileName exception 
	 *            when the input fileName parameter is not a valid absolute pathname.
	 */
	CF::File_ptr
	open(
	    const char * fileName,
	    CORBA::Boolean readOnly)
	throw (
	    CF::FileException,
	    CF::InvalidFileName,
	    CORBA::SystemException);

	/**
	 * @brief The query operation provides the ability to retrieve information 
	 *        about a file system.
	 *
	 * The query operation shall return file system information to the calling 
	 * client based upon the given fileSystemProperties' ID. The FileSystem::query 
	 * operation shall recognize and provide the designated return values for the
	 * following fileSystemProperties (section 3.1.3.4.2.3.2):
	 * 	1. SIZE - an ID value of "SIZE” causes the query operation to return an 
	 * 	   unsigned long long containing the file system size (in octets).
	 * 	2. AVAILABLE SPACE - an ID value of "AVAILABLE SPACE" causes the query
	 * 	   operation to return an unsigned long long containing the available 
	 * 	   space on the file system (in octets)
	 *
	 * @param[in] fileSysProperties	Properties need queried.
	 *
	 * @exception The query operation shall raise the UnknownFileSystemProperties 
	 *            exception when the given file system property is not recognized.
	 */
	void
	query(
	    CF::Properties & fileSysProperties)
	throw (
	    CF::FileSystem::UnknownFileSystemProperties,
	    CORBA::SystemException);

	/**
	 * @brief The remove operation shall remove the plain file which corresponds 
	 *        to the input fileName parameter.
	 *
	 * @param[in] fileName Name of the file needs removed.
	 *
	 * @exception The remove operation shall raise the CF InvalidFileName exception 
	 *            when the input fileName parameter is not a valid absolute pathname.
	 *            The remove operation shall raise the CF FileException when a 
	 *            file-related error occurs.
	 */
	void
	remove(
	    const char * fileName)
	throw (
	    CF::InvalidFileName,
	    CF::FileException,
	    CORBA::SystemException);

	/**
	 * @brief The rmdir operation provides the ability to remove a directory from 
	 *        the file system.
	 *
	 * The rmdir operation shall remove the directory identified by the input 
	 * directoryName parameter. The rmdir operation shall not remove the directory 
	 * identified by the input directoryName parameter when the directory contains 
	 * files.
	 *
	 * @param[in] directoryName	Name of the directory needs removed.
	 *
	 * @exception The rmdir operation shall raise the CF FileException when the 
	 *            directory identified by the input directoryName parameter does 
	 *            not exist, the directory contains files, or an error occurs which
	 *            prohibits the directory from being deleted.
	 *            The rmdir operation shall raise the CF InvalidFileName exception 
	 *            when the input directoryName parameter is not a valid path prefix.
	 */
	void
	rmdir(
	    const char * directoryName)
	throw (
	    CF::InvalidFileName,
	    CF::FileException,
	    CORBA::SystemException);

  private:
	std::vector <FileServantInfo> m_files;
	openscaSupport::ORB_Wrap * m_orb;
	/**
	 * root path of filesystem, default root path is "/tffs0"
	 */
	std::string m_root;

	//copy source file to dest file
	void
	copyFile(
	    const char * sFile,
	    const char * dFile);

	/**
	 * get size of dir
	 */
	CORBA::ULong
	getDirSize(
	    const char * dirName);

	void
	recursiveList(
	    const char * dirPath,
	    const char * pattern,
	    CF::FileSystem::FileInformationSequence_var & fis);

	FileSystem_impl(); //no default constructor
};

#endif // !defined(EA_C49588F1_8059_4f50_8057_486EA8C34183__INCLUDED_)