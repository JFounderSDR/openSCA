/***************************************************************************//**
* @file     FileManager_impl.h
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

#if !defined(EA_6CEC8459_BEA4_4051_9156_82FC46CCA15F__INCLUDED_)
#define EA_6CEC8459_BEA4_4051_9156_82FC46CCA15F__INCLUDED_

#include "FileSystem_impl.h"
#include "CFS.h"

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
 * example, if a file system is mounted at /ppc2, an open operation for a file
 * called /ppc2/profile.xml would be delegated to the mounted file system. The
 * mounted file system will be given the filename relative to it. In this example
 * the FileSystem's open operation would receive /profile.xml as the fileName
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
class FileManager_impl :
	public virtual POA_CF::FileSystem,
	public virtual POA_CF::FileManager {
  public:
	FileManager_impl();
	~FileManager_impl();

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
	 * @brief The getMounts operation returns a MountSequence that describes the 
	 *        mounted file systems.
	 *
	 * @return The getMounts operation shall return a MountSequence that contains 
	 *         the file systems mounted within the file manager.
	 */
	CF::FileManager::MountSequence *
	getMounts()
	throw (CORBA::SystemException);

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
	 * @brief The file manager supports the notion of a federated file system. 
	 *        To create a federated file system, the mount operation associates 
	 *        a file system with a mount point (a directory name).
	 *
	 * The mount operation shall associate the specified file system with the mount 
	 * point referenced by the input mountPoint parameter. A mount point name shall 
	 * begin with a \93/\94 (forward slash character). The input mountPoint parameter 
	 * is a logical directory name for a file system.
	 *
	 * @param[in] mountPoint	Identifier of the file system.
	 * @param[in] _fileSystem	File system needs mounted.
	 *
	 * @exception The mount operation shall raise the CF InvalidFileName exception 
	 *            when the input mount point does not conform to the file name 
	 *            syntax in section 3.1.3.4.2.1.
	 *            
	 *            The mount operation shall raise the MountPointAlreadyExists 
	 *            exception when the mount point already exists in the file manager.
	 *            
	 *            The mount operation shall raise the InvalidFileSystem exception 
	 *            when the input FileSystem is a null object reference.
	 */
	void
	mount(
	    const char * mountPoint,
	    CF::FileSystem_ptr _fileSystem)
	throw (
	    CORBA::SystemException,
	    CF::InvalidFileName,
	    CF::FileManager::InvalidFileSystem,
	    CF::FileManager::MountPointAlreadyExists);

	/**
	 * @brief The open operation provides the ability to open a plain file for 
	 *        read or write. The open operation shall open the file referenced by 
	 *        the input fileName parameter. The open operation shall open the file 
	 *        with read-only access when the input read_Only parameter is TRUE. 
	 *        The open operation shall open the file for write access when the 
	 *        input read_Only parameter is FALSE.
	 *
	 * @param[in] fileName Name of the file needs opened.
	 * @param[in] read_Only	Whether open the file with readonly mode.
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
	    CORBA::Boolean read_Only)
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
	 * 	1. SIZE - an ID value of "SIZE\94 causes the query operation to return an 
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

	/**
	 * @brief Mounted file systems may need to be removed from a file manager.
	 *        The unmount operation shall remove a mounted file system from the 
	 *        file manager whose mounted name matches the input mountPoint name.
	 *
	 * @param[in] mountPoint	File system will be unmounted.
	 *
	 * @exception The unmount operation shall raise the NonExistentMount exception 
	 *            when the mount point does not exist.
	 */
	void
	unmount(
	    const char * mountPoint)
	throw (
	    CF::FileManager::NonExistentMount,
	    CORBA::SystemException);

  private:
	CF::FileManager::MountSequence_var m_mountTable;
	unsigned int m_numMounts;
	
	/**
	 * @brief  this function is used to get mountTableIndex and file system path.
	 * @param  path            absolute path
	 * @param  mountTableIndex the index in mount table
	 * @param  FSPath          the path of file system
	 * @return                 true or false
	 */
	bool
	getFSandFSPath(
	    const char * path,
	    unsigned int & mountTableIndex,
	    std::string & FSPath);

	bool
	pathMatches(
	    const char * path,
	    const char * mPoint,
	    std::string & FSPath);
};

#endif // !defined(EA_6CEC8459_BEA4_4051_9156_82FC46CCA15F__INCLUDED_)
