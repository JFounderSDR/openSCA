/***************************************************************************//**
* @file     LaunchNode.h
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

#if !defined(EA_109E5054_9642_441f_A2F8_C052C399050E__INCLUDED_)
#define EA_109E5054_9642_441f_A2F8_C052C399050E__INCLUDED_

#ifdef __SDS_OS_VXWORKS__
#include <loadLib.h>
#include <taskLib.h>
#include <unldLib.h>
#include <usrLib.h>
#endif

#include <string>
#include <map>

#include "debug.h"
#include "DCDParser.h"
#include "DMDParser.h"
#include "SPDParser.h"
#include "FileSystem_impl.h"
#include "utils.h"

/**
 * @brief If os is vxworks, the LoadFileInfo used to description 
 * the information of file loaded to memory.
 *
 * localFile	Name of the file.
 * laodType		Type of the file.
 * refcnt		Reference counts of the file.
 * moduleID		Module id of the file.
 */
#ifdef __SDS_OS_VXWORKS__
struct LoadFileInfo {
	std::string localFile;
	std::string loadType;
	unsigned int refcnt;
	MODULE_ID moduleID;
};

/**
 * @brief	The LoadFileMap type used to store all files' information,
 *        	these files are loaded into memory successfully.
 */
typedef std::map<std::string, LoadFileInfo> LoadFileMap;
#endif

/**
 * @brief this class is designed to launch the whole OpenSCA platform, include
 *		  load and execute DmnMgr / DevMgr / NamingService . meanwhile it provide
 *		  interface to teminate all task related to SCA_platform.
 */
class LaunchNode {
  public:

  	/**
  	 * @brief	Constructor of the LaunchNode class.
  	 * @param[in] fsRoot	Root path of the file system.
  	 * @param[in] sdrRoot	Path of the platform relative to file system.
  	 */
	LaunchNode(
	    std::string fsRoot,
	    std::string sdrRoot);

	virtual ~LaunchNode();

	/**
	 * @brief	This function is used to execute device manager.
	 *
	 * @param[in] fileSys 	FileSystem used to find file by input file path.
	 * @param[in] spdflPath DeviceManager's dcd file's path, relative to SDRROOT.
	 */
	void
	executeDevMgr(
	    FileSystem_impl * fileSys,
	    const std::string & dcdflPath);

	/**
	 * @brief	This function is used to execute domain manager.
	 *
	 * @param[in] fileSys 		file system used to find file by input file path.
	 * @param[in] dmdflPath		domainManager's dmd file's path, relative to SDRROOT.
	 */
	void
	executeDmnMgr(
	    FileSystem_impl * fileSys,
	    const std::string & dmdflPath);

	/**
	 * @brief	Get file's reference by input file path.
	 *
	 * @param[in] fileSys	 File system where finding the specific file by input 
	 * 						file path.
	 * @param[in] filePath	Path of the file user wants to find.
	 *
	 * @return  The specific file's reference.
	 */
	CF::File_var
	getFileRef(
	    CF::FileSystem_ptr fileSys,
	    std::string filePath);

	/**
	 * @brief Get params which naming service task needs.
	 *
	 * @param[in] spdParser	The parser of spd file.
	 *
	 * @return TaskParams	@see TaskParams
	 */
	TaskParamsType
	getTaskParamsFromSPD(
	    SPDParser & spdParser);

	/**
	 * @brief  Get execute params.
	 *
	 * @param[in] fileSys Filesystem of the platform.
	 * @param[in] spdParser Parser of spd file.
	 * @param[in] spdflPath The path of spd file.
	 *
	 * @return	execute params
	 */
	ExecParamsType
	getExecParamsFromPRF(
	    FileSystem_impl* fileSys,
	    SPDParser& spdParser,
	    const std::string& spdflPath);

	/**
	 * @brief  Change execParams' format from ExecParamsType to char**.
	 *
	 * @param[in] argv	 		destination params.
	 * @param[in] execParams	executable params of process.
	 */
	void
	changeExecParamsFormat(
	    char ** argv,
	    ExecParamsType execParams);

	/**
	 * @brief  Change execParams and taskParams' format from ExecParamsType to char**.
	 *
	 * @param[in] argv	 		destination params.
	 * @param[in] execParams	executable params of process.
	 * @param[in] taskParams	task params of process.
	 */
	void
	changeParamsFormat(
	    char ** argv,
	    ExecParamsType execParams,
	    TaskParamsType taskParams);

	/**
	 * @brief	This function used to execute NamingService.
	 *
	 * @param[in] fileSys File system used to find file by input file path.
	 * @param[in] spdflPath Naming service's spd file's path, relative to SDRROOT.
	 */
	void
	executeNamingService(
	    FileSystem_impl * fileSys,
	    const std::string & spdflPath);

	/**
	 * @brief Terminate a specific process by process id.
	 * @param[in] pid	Identifier of the process. 
	 * @return	Result of killing the process.
	 * @retval true		Kill the process successfully.
	 * @retval false	Kill the process failed.
	 */
	bool 
	killProcess(
		pid_type pid);

	/**
	 * @brief		Get binary file's name by parsering spd file.
	 * @param[in]	spdParser	parser of the spd.xml file.
	 * @param[in]	spdflPath   spd file's path.
	 * @return 		binary file's name
	 */
	std::string
	getBinaryFileNameFromSPD(
	    SPDParser& spdParser,
	    const std::string& spdflPath);

	/**
	 * @brief		Load binary file into memory
	 * @param[in]   fileSys  	file system used to find binary file
	 * @param[in]	spdParser	parser of the spd.xml file.
	 * @param[in]	spdflPath	spd file's path, relative to SDRROOT
	 */
	void
	loadFile(
	    FileSystem_impl* fileSys,
	    SPDParser& spdParser,
	    const std::string& spdflPath);

	/**
	 * @brief	The operation shall start a new process by input parameters.
	 * @param[in] argc			Counts of parameters passed to the entrypoint 
	 * 							of the process.
	 * @param[in] argv			Parameters passed to process's entrypoint.
	 * @param[in] ulStackSize	Size of the stack the process needs.
	 * @param[in] ulPriority	Priority of the process.
	 * @param[inout] pid		Id of the process.
	 */
	bool
	spawnProcess(
	    int argc, char * argv[],
	    char * entryPoint,
	    unsigned long ulStackSize,
	    unsigned long ulPriority,
	    pid_type & pid);

	/**
	 * @brief Check the input file is existed in the iinput fileSystem.
	 *
	 * @param[in] fileSys	pointet to FileSystem.
	 * @param[in] filePath  the checked file's path.
	 *
	 * @return result of file's existing.
	 * @retval true		file exists in file system
	 * @retval false	file dosen't exist in file system.
	 */
	bool
	isFileExists(
	    FileSystem_impl * fileSys,
	    const std::string& filePath);

  private:
	std::string m_fsRoot;
	std::string m_sdrRoot;

#ifdef __SDS_OS_VXWORKS__
	LoadFileMap m_loadFileMap;
#endif

#ifdef __SDS_OS_LINUX__
	PidMap m_pidMap;
#endif

	/**
	 * @brief	The operation shall start a new process by input parameters.
	 * @param[in] fileSys		File system of the platform.
	 * @param[in] spdParser		Parser of the spd.xml file.
	 * @param[in] spdflPath		Path of the psd.xml file.
	 * @param[in] argv			Parameters passed to process's entrypoint.
	 * @param[in] taskParams	Task parameters of the process.
	 */
	void
	execute(
	    FileSystem_impl * fileSys,
	    SPDParser & spdParser,
	    const std::string & spdflPath,
	    char * argv[],
	    TaskParamsType taskParams);

};
#endif // !defined(EA_109E5054_9642_441f_A2F8_C052C399050E__INCLUDED_)
