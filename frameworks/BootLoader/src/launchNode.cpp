/***************************************************************************//**
* @file     LaunchNode.pp
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

#ifdef __SDS_OS_VXWORKS__
#include <loadLib.h>
#include <unldLib.h>
#include <ioLib.h>
#include <taskLib.h>
#include <symLib.h>
#endif

#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <stdlib.h>

#include <iostream>
#include <vector>
#include <cstring>

#include "../include/LaunchNode.h"
#include "ConfigParser.h"

/**
 * @brief	Constructor of the LaunchNode class.
 * @param[in] fsRoot	Root path of the file system.
 * @param[in] sdrRoot	Path of the platform relative to file system.
 */
LaunchNode::LaunchNode(
	std::string fsRoot,
	std::string sdrRoot) {
	m_fsRoot = fsRoot;
	m_sdrRoot = sdrRoot;
}

LaunchNode::~LaunchNode() {

}

/*
 * @brief	Get file's reference by input file path.
 *
 * @param[in] fileSys	 File system where finding the specific file by input 
 * 						file path.
 * @param[in] filePath	Path of the file user wants to find.
 *
 * @return  The specific file's reference.
 */
CF::File_var
LaunchNode::getFileRef(
    CF::FileSystem_ptr fileSys,
    std::string filePath) {
	size_t pos = filePath.find_first_of("/", 3);
	std::string relativeFilePath = filePath.substr(pos + 1);
	CF::File_ptr filePtr;
	try {
		filePtr = fileSys->open(relativeFilePath.c_str(), true);
	} catch (CF::InvalidFileName& e) {
		DEBUG(5, LaunchNode,
		      "[launch_opensca] when opening" << 
		      filePath << "with invalid name")
		exit(EXIT_FAILURE);
	} catch (CF::FileException& e) {
		DEBUG(5, LaunchNode,
		      "[launch_opensca] when opening " << 
		      filePath << "File exception occur")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(5, LaunchNode,
		      "[launch_opensca] when opening " << 
		      filePath << "Unkown exception occur")
		exit(EXIT_FAILURE);
	}

	if (CORBA::is_nil(filePtr)) {
		DEBUG(5, getFileRef, "file's reference is nil. " << filePath)
		exit(EXIT_FAILURE);
	}

	return filePtr;
}

/*
 * @brief Get params which naming service task needs.
 *
 * @param[in] spdParser	The parser of spd file.
 *
 * @return TaskParams	@see TaskParams
 */
TaskParamsType
LaunchNode::getTaskParamsFromSPD(
    SPDParser& spdParser) {
	DEBUG(5, LaunchNode::getTaskParamsFromSPD, "enter in...")

	TaskParamsType taskParams;
	std::vector<SPDImplementation*>* implVec = spdParser.getImplementations();

	taskParams.stackSize = (*implVec)[0]->getStackSize();
	taskParams.priority = (*implVec)[0]->getPriority();
	taskParams.entryPoint = new char[strlen((*implVec)[0]->getEntryPoint())];
	strcpy(taskParams.entryPoint, (*implVec)[0]->getEntryPoint());

	DEBUG(5, LaunchNode::getTaskParamsFromSPD, "leave...")

	return taskParams;
}

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
LaunchNode::getExecParamsFromPRF(
    FileSystem_impl* fileSys,
    SPDParser& spdParser,
    const std::string& spdflPath) {
	DEBUG(5, LaunchNode::getExecParamsFromPRF, "enter in...")

	std::string prfFileName = const_cast<char*>(spdParser.getPRFFile());
	size_t pos = spdflPath.find_last_of("/");
	std::string prfFilePath = spdflPath.substr(0, pos + 1) + prfFileName;
	if (!isFileExists(fileSys, m_sdrRoot + "/" + prfFilePath)) {
		exit(EXIT_FAILURE);
	}

	std::string prfFileFullPath =
	    m_fsRoot + "/" + m_sdrRoot + "/" + prfFilePath;
	PRFParser prfParser(prfFileFullPath);
	ExecParamsType execParams = prfParser.getExecParams();

	DEBUG(5, LaunchNode::getExecParamsFromPRF, "leave...")
	return execParams;
}

/**
 * @brief  Change execParams' format from ExecParamsType to char**.
 *
 * @param[in] argv	 		destination params.
 * @param[in] execParams	executable params of process.
 */
void
LaunchNode::changeExecParamsFormat(
    char ** argv,
    ExecParamsType execParams) {
#ifdef __SDS_OS_VXWORKS__
	int index = 0;
	for (ExecParamsType::iterator iter = execParams.begin();
	        iter != execParams.end(); iter++) {
		std::string name = iter->first;
		argv[index] = new char[name.size() + 1];
		bzero(argv[index], name.size() + 1);
		strcpy(argv[index], name.c_str());

		std::string value = iter->second;
		argv[++index] = new char[value.size() + 1];
		bzero(argv[index], value.size() + 1);
		strcpy(argv[index], value.c_str());

		++index;
	}

	strcpy(argv[index], NULL);
#endif
}

/**
 * @brief  Change execParams and taskParams' format from ExecParamsType to char**.
 *
 * @param[in] argv	 		destination params.
 * @param[in] execParams	executable params of process.
 * @param[in] taskParams	task params of process.
 */
void
LaunchNode::changeParamsFormat(
    char** argv,
    ExecParamsType execParams,
    TaskParamsType taskParams) {
	int index = 0;
	for (ExecParamsType::iterator execIter = execParams.begin();
	        execIter != execParams.end(); execIter++) {
		std::string name = execIter->first;
		argv[index] = new char[name.size() + 1];
		bzero(argv[index], name.size() + 1);
		strcpy(argv[index], name.c_str());

		std::string value = execIter->second;
		argv[++index] = new char[value.size() + 1];
		bzero(argv[index], value.size() + 1);
		strcpy(argv[index], value.c_str());

		++index;
	}

	argv[index] = new char[strlen("-STACK_SIZE") + 1];
	bzero(argv[index], strlen("-STACK_SIZE") + 1);
	strcpy(argv[index], "-STACK_SIZE");
	++index;

	argv[index] = new char[ULONG_MAX_SIZE + 1];
	bzero(argv[index], ULONG_MAX_SIZE + 1);
	sprintf(argv[index], "%d",
	        taskParams.stackSize); //todo converted to DEC string format
	++index;

	argv[index] = new char[strlen("-PRIORITY") + 1];
	bzero(argv[index], strlen("-PRIORITY") + 1);
	strcpy(argv[index], "-PRIORITY");
	++index;

	argv[index] = new char[ULONG_MAX_SIZE + 1];
	bzero(argv[index], ULONG_MAX_SIZE + 1);
	sprintf(argv[index], "%d",
	        taskParams.priority); //todo converted to DEC string format
	++index;

	argv[index] = new char[strlen("-ENTRY_POINT") + 1];
	bzero(argv[index], strlen("-ENTRY_POINT") + 1);
	strcpy(argv[index], "-ENTRY_POINT");
	++index;

	argv[index] = new char[strlen(taskParams.entryPoint) + 1];
	bzero(argv[index], strlen(taskParams.entryPoint) + 1);
	strcpy(argv[index], taskParams.entryPoint);
	++index;

	argv[index] = NULL;
}

/**
 * @brief	The operation shall start a new process by input parameters.
 * @param[in] fileSys		File system of the platform.
 * @param[in] spdParser		Parser of the spd.xml file.
 * @param[in] spdflPath		Path of the psd.xml file.
 * @param[in] argv			Parameters passed to process's entrypoint.
 * @param[in] taskParams	Task parameters of the process.
 */
void
LaunchNode::execute(
    FileSystem_impl* fileSys,
    SPDParser& spdParser,
    const std::string& spdflPath,
    char* argv[],
    TaskParamsType taskParams) {
#ifdef __SDS_OS_LINUX__
	std::string codeFileName = getBinaryFileNameFromSPD(spdParser, spdflPath);
	DEBUG(5, launchNode,
	      "[LaunchNode::execute] codeFileName is " << codeFileName)

	if (!isFileExists(fileSys, m_sdrRoot + "/" + codeFileName)) {
		DEBUG(5, launchNode, "[LaunchNode::execute] codeFileName is invalid.")
		exit(EXIT_FAILURE);
	}

	std::string fileFullPath = m_fsRoot + "/" + m_sdrRoot + "/" + codeFileName;
	DEBUG(5, launchNode,
	      "[LaunchNode::execute] fileFullPath is " << fileFullPath)

	pid_t pid = fork();
	if (pid == -1) {
		DEBUG(5, launchNode, "[LaunchNode::execute] fork() failed.")
		return;
	}

	if (pid == 0) {
		m_pidMap.insert(
		    std::pair<std::string, pid_t>(taskParams.entryPoint, getpid()));

		execv(fileFullPath.c_str(), argv);
		DEBUG(5, launchNode, "[LaunchNode::execute] child process end.")
		exit(0);
	}
#endif
}

/**
 * @brief	This function used to execute NamingService.
 *
 * @param[in] fileSys File system used to find file by input file path.
 * @param[in] spdflPath Naming service's spd file's path, relative to SDRROOT.
 */
void
LaunchNode::executeNamingService(
    FileSystem_impl* fileSys,
    const std::string& spdflPath) {
	DEBUG(5, launchNode, "[LaunchNode::executeNamingService] entering...")

	std::string spdflFullPath = m_fsRoot + "/" + m_sdrRoot + "/" + spdflPath;
	SPDParser spdParser(spdflFullPath);

#ifdef __SDS_OS_VXWORKS__
	loadFile(fileSys, spdParser, spdflPath);
#endif

	TaskParamsType taskParams = getTaskParamsFromSPD(spdParser);
	ExecParamsType execParams =
	    getExecParamsFromPRF(fileSys, spdParser, spdflPath);

#ifdef __SDS_OS_VXWORKS__
	int argc = execParams.size() * 2 + 2 + 1;
	char** argv = new char*[argc];
	bzero(argv, argc);
	changeExecParamsFormat(argv, execParams);

    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
  	std::string namingServiceEndpoints = 
  		checkConfigInfo(&configParser, CONSTANT::NAMING_SERVICE_ENDPOINTS);
  	argv[argc - 3] = new char[strlen("-ORBListenEndpoints") + 1];
  	memset(argv[argc - 3], 0, strlen("-ORBListenEndpoints") + 1);
  	strcpy(argv[argc - 3], "-ORBListenEndpoints");

  	argv[argc -2] = new char[namingServiceEndpoints.size() + 1];
  	memset(argv[argc - 2], 0, namingServiceEndpoints.size() + 1);
  	strcpy(argv[argc - 2], namingServiceEndpoints.c_str());

	pid_type pid = 0;
	// spawn new task for DmnMgr

	if (!spawnProcess(argc, argv, taskParams.entryPoint, taskParams.stackSize,
	                  taskParams.priority, pid)) {
		DEBUG(5, launchNode,
		      "[LaunchNode::executeNamingService] spawnprocess failed")
		exit(EXIT_FAILURE);
	}
#elif defined __SDS_OS_LINUX__
	int argc = execParams.size() * 2 + TASK_PARAMS_COUNT + 2 + 1;
	char** argv = new char*[argc];
	bzero(argv, argc);

	// -ORB parameters should be neighbouring, otherwise will parse failed
	changeParamsFormat(argv + 2, execParams, taskParams);

    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
  	std::string namingServiceEndpoints = 
  	configParser.getValueById(CONSTANT::NAMING_SERVICE_ENDPOINTS);
  	argv[0] = new char[strlen("-ORBListenEndpoints") + 1];
  	memset(argv[0], 0, strlen("-ORBListenEndpoints") + 1);
  	strcpy(argv[0], "-ORBListenEndpoints");

  	argv[1] = new char[namingServiceEndpoints.size() + 1];
  	memset(argv[1], 0, namingServiceEndpoints.size() + 1);
  	strcpy(argv[1], namingServiceEndpoints.c_str());

	execute(fileSys, spdParser, spdflPath, argv, taskParams);
#endif

	sMsSleep(10);
	delete2DArray(argc, argv);

	DEBUG(5, launchNode, "[LaunchNode::executeNamingService] execute NamingSvr succ")
}

/**
 * @brief	This function is used to execute device manager.
 *
 * @param[in] fileSys 	FileSystem used to find file by input file path.
 * @param[in] spdflPath DeviceManager's dcd file's path, relative to SDRROOT.
 */
void
LaunchNode::executeDevMgr(
    FileSystem_impl* fileSys,
    const std::string& dcdflPath) {
	DEBUG(5, launchNode, "[LaunchNode::executeDevMgr] entering...")

	std::string dcdflFullPath = m_fsRoot + "/" + m_sdrRoot + "/" + dcdflPath;
	DCDParser dcdParser(dcdflFullPath);

	//get spd file
	std::string spdflName = dcdParser.getDeviceManagerSoftPkg();
	size_t pos = dcdflFullPath.find_last_of("/");
	std::string spdflFullPath = dcdflFullPath.substr(0, pos + 1) + spdflName;
	SPDParser spdParser(spdflFullPath);

	//load binary file
	std::string spdflRelativePath =
	    dcdflPath.substr(0, dcdflPath.find_last_of("/") + 1) + spdflName;

#ifdef __SDS_OS_VXWORKS__
	loadFile(fileSys, spdParser, spdflRelativePath);
#endif

	TaskParamsType taskParams = getTaskParamsFromSPD(spdParser);
	ExecParamsType execParams =
	    getExecParamsFromPRF(fileSys, spdParser, spdflRelativePath);

#ifdef __SDS_OS_VXWORKS__
	int argc = execParams.size() * 2 + 1;
	char** argv = new char*[argc];
	bzero(argv, argc);

	changeExecParamsFormat(argv, execParams);

	pid_type pid = 0;
	// spawn new task for Devmgr
	if (!spawnProcess(argc, argv, taskParams.entryPoint, taskParams.stackSize,
	                  taskParams.priority, pid)) {
		DEBUG(5, launchNode, "[LaunchNode::executeDevMgr] spawnprocess failed")
		exit(EXIT_FAILURE);
	}
#elif defined __SDS_OS_LINUX__
	int argc = execParams.size() * 2 + TASK_PARAMS_COUNT + 1;
	char** argv = new char*[argc];
	bzero(argv, argc);

	changeParamsFormat(argv, execParams, taskParams);

	execute(fileSys, spdParser, spdflRelativePath, argv, taskParams);
#endif

	sMsSleep(10);
	delete2DArray(argc, argv);

	DEBUG(5, launchNode, "[LaunchNode::executeDevMgr] execute DevMgr succ")
}

/*
 * @brief	This function is used to execute domain manager.
 *
 * @param[in] fileSys 		file system used to find file by input file path.
 * @param[in] dmdflPath		domainManager's dmd file's path, relative to SDRROOT.
 */
void
LaunchNode::executeDmnMgr(
    FileSystem_impl* fileSys,
    const std::string& dmdflPath) {
	DEBUG(5, launchNode, "[LaunchNode::executeDmnMgr] entering...")

	std::string dmdflFullPath = m_fsRoot + "/" + m_sdrRoot + "/" + dmdflPath;
	DMDParser dmdParser(dmdflFullPath);

	//get spd file
	std::string spdflName = dmdParser.getDomainManagerSoftPkg();
	size_t pos = dmdflFullPath.find_last_of("/");
	std::string spdflFullPath = dmdflFullPath.substr(0, pos + 1) + spdflName;
	SPDParser spdParser(spdflFullPath);

	//load binary file
	std::string spdflRelativePath =
	    dmdflPath.substr(0, dmdflPath.find_last_of("/") + 1) + spdflName;

#ifdef __SDS_OS_VXWORKS__
	loadFile(fileSys, spdParser, spdflRelativePath);
#endif

	TaskParamsType taskParams = getTaskParamsFromSPD(spdParser);
	ExecParamsType execParams =
	    getExecParamsFromPRF(fileSys, spdParser, spdflRelativePath);

#ifdef __SDS_OS_VXWORKS__
	int argc = execParams.size() * 2 + 1;
	char** argv = new char*[argc];
	bzero(argv, argc);

	changeExecParamsFormat(argv, execParams);

	pid_type pid = 0;
	// spawn new task for DmnMgr
	if (!spawnProcess(argc, argv, taskParams.entryPoint, taskParams.stackSize,
	                  taskParams.priority, pid)) {
		DEBUG(5, launchNode, "[LaunchNode::executeDmnMgr] spawnprocess failed")
		exit(EXIT_FAILURE);
	}
#elif defined __SDS_OS_LINUX__
	int argc = execParams.size() * 2 + TASK_PARAMS_COUNT + 1;
	char** argv = new char*[argc];
	bzero(argv, argc);

	changeParamsFormat(argv, execParams, taskParams);

	execute(fileSys, spdParser, spdflRelativePath, argv, taskParams);
#endif

	sMsSleep(10);
	delete2DArray(argc, argv);

	DEBUG(5, launchNode, "[LaunchNode::executeDmnMgr] execute DmnMgr succ")
}

/**
 * @brief Terminate a specific process by process id.
 * @param[in] pid	Identifier of the process. 
 * @return	Result of killing the process.
 * @retval true		Kill the process successfully.
 * @retval false	Kill the process failed.
 */
bool
LaunchNode::killProcess(
    pid_type pid) {
	DEBUG(5, launchNode, "[LaunchNode::killProcess pid_type] entering...")

#ifdef __SDS_OS_VXWORKS__
	if (taskDelete(pid) == ERROR) {
		DEBUG(2, ExecutableDevice, "In killProcess pid_type delete task failed")
		return false;
	}
#elif defined __SDS_OS_LINUX__
	int retval = kill(pid, SIGKILL);

	if (retval) {
		DEBUG(2, ExecutableDevice, "In killProcess pid_t delete task failed")
		return false;
	}
#endif

	return true;
}

/**
 * @brief		Get binary file's name by parsering spd file.
 * @param[in]	spdParser	parser of the spd.xml file.
 * @param[in]	spdflPath   spd file's path.
 * @return 		binary file's name
 */
std::string
LaunchNode::getBinaryFileNameFromSPD(
    SPDParser& spdParser,
    const std::string& spdflPath) {
	std::string codeFileName =
	    const_cast<char*>((
	    	*(spdParser.getImplementations()))[0]->getCodeFile());
	size_t pos = spdflPath.find_last_of("/");
	return spdflPath.substr(0, pos + 1) + codeFileName;
}

/**
 * @brief		Load binary file into memory
 * @param[in]   fileSys  	file system used to find binary file
 * @param[in]	spdParser	parser of the spd.xml file.
 * @param[in]	spdflPath	spd file's path, relative to SDRROOT
 */
void
LaunchNode::loadFile(
    FileSystem_impl* fileSys,
    SPDParser& spdParser,
    const std::string& spdflPath) {
#ifdef __SDS_OS_VXWORKS__
	std::string codeFileName = getBinaryFileNameFromSPD(spdParser, spdflPath);
	if (!isFileExists(fileSys, m_sdrRoot + "/" + codeFileName)) {
		exit(EXIT_FAILURE);
	}

	DEBUG(5, launchNode, "[LaunchNode::loadFile] entering...")

	std::string codeFileFullName =
	    m_fsRoot + "/" + m_sdrRoot + "/" + codeFileName;

	//open file with open call
	int fdx = ::open(codeFileFullName.c_str(), O_RDONLY, 0);
	if (fdx == ERROR) {
		DEBUG(5, launchNode,
		      "[LaunchNode::loadFile]open file:" << 
		      codeFileFullName << " failed")
		exit(EXIT_FAILURE);
	}

	MODULE_ID mid = loadModule(fdx, LOAD_ALL_SYMBOLS);
	::close(fdx);

	if (mid == 0) {
		std::cerr << "Failed to load file: " << codeFileFullName << std::endl;
		exit(EXIT_FAILURE);
	}

	//store info into filemap
	LoadFileInfo loadFileInfo;
	loadFileInfo.localFile = codeFileFullName;
	loadFileInfo.loadType = "executable";
	loadFileInfo.refcnt = 1;
	loadFileInfo.moduleID = mid;
	m_loadFileMap[codeFileFullName] = loadFileInfo;

	DEBUG(5, launchNode, "leaving LaunchNode::loadfile...")
#endif

}

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
LaunchNode::spawnProcess(
    int argc,
    char* argv[],
    char* entryPoint,
    unsigned long ulStackSize,
    unsigned long ulPriority,
    pid_type& pid) {
#ifdef __SDS_OS_VXWORKS__
	DEBUG(5, launchNode, "[LaunchNode::spawnProcess] entering...")

	int taskNameLen = strlen(entryPoint) + 2;
	char* taskName = new char[taskNameLen];
	taskName[0] = 't';
	taskName[1] = '\0';
	strcat(taskName, entryPoint);
	DEBUG(5, launchNode, "[LaunchNode::spawnProcess] taskName is " << taskName)

	extern SYMTAB_ID sysSymTbl;
	char* address;
	SYM_TYPE type;
	if (symFindByName(sysSymTbl, entryPoint, &address, &type) == ERROR) {
		std::cerr << "ERROR: Could not find symbol: " << 
			std::string(entryPoint) << std::endl;
		return false;
	}

	pid = taskSpawn(
	          taskName,					///< task name
	          ulPriority,				///< task priority
	          VX_FP_TASK | VX_SPE_TASK,	///< task options
	          ulStackSize,				///< task stack size
	          (FUNCPTR) address,		///< task entry point
	          argc, (int) (argv), 0, 0, 0, 0, 0, 0, 0, 0);

	delete[] taskName;

	if (pid == ERROR) {
		std::cerr << "ERROR: Failed to spawn task: " << std::string(argv[0])
		          << std::endl;
		return false;
	}
	return true;

#endif
}

/*
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
LaunchNode::isFileExists(
    FileSystem_impl* fileSys,
    const std::string& filePath) {
	assert(fileSys);
	if (!(fileSys->exists(filePath.c_str()))) {
		DEBUG(5, isFileExists, "do not exist in file system." << filePath)
		return false;
	}
	return true;
}