/***************************************************************************//**
* @file     Bootloader.cpp
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

#include <string.h>
#include <stdio.h>
#include <sys/time.h>
#include <dirent.h>

#ifdef __SDS_OS_VXWORKS__
#include <taskLib.h>
#endif

#include <iostream>
#include <istream>

#include "../include/LaunchNode.h"
#include "../include/debug.h"
#include "utils.h"
#include "cf_utils.h"
#include "SPDParser.h"
#include "DCDParser.h"
#include "FileSystem_impl.h"
#include "CFS.h"
#include "ConfigParser.h"
#include "Boost_utils.h"

#define SEND_ID			1800
#define RECE_ID			1300

const std::string
checkConfigInfo(
    ConfigParser * configParser,
    const char * item);

void
splitString(
    const std::string & context,
    std::vector<std::string> & subStrs,
    const std::string & splitStr);

#ifdef __SDS_OS_VXWORKS__
extern "C"
int launch_opensca(int argc, char* argv[])
#elif defined __SDS_OS_LINUX__
int main(int argc, char* argv[])
#endif
{
	createSharedMemory(SCA_SHM, SCA_SHM_SIZE);
	set_debug_level(0);
	set_rte_debug_level(0);
	DEBUG(5, Bootloader_main, "start...")
    std::string exePath = getConfigFilePathByExecutablePath();
    setConfigFilePathToSHM(exePath.c_str());
    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
	DEBUG(5, Bootloader_main, "Test BootLoader configParser end...")
	std::string fsRoot = checkConfigInfo(&configParser, CONSTANT::FSROOT);
	if ("" == fsRoot) {
		DEBUG(0, Bootloader_main, "Test BootLoader first checkConfigInfo...")
		return -1;
	}

	DEBUG(5, Bootloader_main, "Test BootLoader first checkConfigInfo end...")

	std::string sdrRoot = checkConfigInfo(&configParser, CONSTANT::SDRROOT);
	if ("" == sdrRoot) {
		DEBUG(0, Bootloader_main, "Test BootLoader second checkConfigInfo...")
		return -1;
	}

	DEBUG(5, Bootloader_main, "Test BootLoader second checkConfigInfo end...")

	std::string snFile = const_cast<char*>(CONSTANT::SNFILE);
	FileSystem_impl* fileSystemImpl = new FileSystem_impl(fsRoot.c_str());
	std::string snPath = "/" + sdrRoot + "/" + snFile;
	std::string snFilePath = fsRoot + snPath;

#ifdef __SDS_OS_VXWORKS__
	domainMgrMtx = semBCreate(SEM_Q_PRIORITY, SEM_EMPTY);
	devMgrMtx = semBCreate(SEM_Q_PRIORITY, SEM_EMPTY);
	sysMgrMtx = semBCreate(SEM_Q_PRIORITY, SEM_EMPTY);
#endif

	std::string namingServiceSPDPath =
	    checkConfigInfo(&configParser, CONSTANT::NAMING_SERVICE_SPDPATH);
	if ("" == namingServiceSPDPath) {
		return -1;
	}

	std::string mainDCDPath = checkConfigInfo(
								&configParser, CONSTANT::MAINDCDPATH);
	DEBUG(7, Bootloader, "mainDCDPath: " << mainDCDPath)
	if ("" == mainDCDPath) {
		return -1;
	}

	std::string DMDPath = checkConfigInfo(&configParser, CONSTANT::DMDPATH);
	if ("" == DMDPath) {
		return -1;
	}

	LaunchNode* launchNode = new LaunchNode(fsRoot, sdrRoot);
	DEBUG(0, Bootloader_main, "BootLoader launch namingservice start...")
	DEBUG(5, launch_opensca, "execute namingservice")
	launchNode->executeNamingService(fileSystemImpl, namingServiceSPDPath);

	///< load binary file: DomainMgr.out
	DEBUG(0, Bootloader_main, "BootLoader launch Domain_Manager start...")
	DEBUG(5, launch_opensca, "load binary file: Domain_Manager.out")
	launchNode->executeDmnMgr(fileSystemImpl, DMDPath);

	///< load binary file: DevMgr.out
	DEBUG(5, launch_opensca, "load binary file: Device_Manager.out")
	launchNode->executeDevMgr(fileSystemImpl, mainDCDPath);

#ifdef __SDS_OS_VXWORKS__
	semTake(sysMgrMtx, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
	waitSemaphore(BOOST_CONSTANT::SYSTEM_MANAGER_CND);
#endif

	DEBUG(5, launch_opensca, "launch opensca platform finish.")

	delete fileSystemImpl;
	delete launchNode;

	wait(NULL);
	///< destroy sca_shm shared memory.
	removeSharedMemory(SCA_SHM);

	DEBUG(0, Bootloader_main, "leaving...")
	return 0;
}

const std::string
checkConfigInfo(
    ConfigParser* configParser,
    const char* item) {
	if (!configParser->getValueById(item)) {
		DEBUG(5, checkConfigInfo, "can't find " << item)
		return "";
	}

	return configParser->getValueById(item);
}

void
splitString(
    const std::string & context,
    std::vector<std::string> & subStrs,
    const std::string & splitStr) {
	std::string::size_type pos1;
	std::string::size_type pos2;
	pos2 = context.find(splitStr);
	pos1 = 0;

	while (string::npos != pos2) {
		subStrs.push_back(context.substr(pos1, pos2 - pos1));

		pos1 = pos2 + splitStr.size();
		pos2 = context.find(splitStr, pos1);
	}

	if (pos1 != context.length())
		subStrs.push_back(context.substr(pos1));
}
