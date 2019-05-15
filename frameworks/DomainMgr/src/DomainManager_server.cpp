/***************************************************************************//**
* @file     DomainManager_server.cpp
* @author   open Team
* @version  9
* @date     2017-03-18
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

#include <cstring>
#include <string>
#include <iostream>
#include "debug.h"
#include "openscaSupport.h"
#include "../include/DomainManager_impl.h"
#include "SPDParser.h"
#include "DMDParser.h"
#include "ConfigParser.h"
#include "Boost_utils.h"

#ifdef __SDS_OS_VXWORKS__
extern "C"
int Domain_Manager_Main(int argc, char * argv[])
#elif defined __SDS_OS_LINUX__
int main(int argc, char * argv[])
#endif
{
#ifdef __SDS_OS_VXWORKS__
	semTake(domainMgrMtx, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
	waitSemaphore(BOOST_CONSTANT::DOMAIN_MANAGER_CND);
#endif
    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);

	std::string sdrRoot = configParser.getValueById(CONSTANT::SDRROOT);
	std::string dmdPath = configParser.getValueById(CONSTANT::DMDPATH);
	std::string dmdfl = sdrRoot + "/" + dmdPath;
	std::string fsRoot = configParser.getValueById(CONSTANT::FSROOT);

	DEBUG(7, DomainMgr, " argc is: " << argc)

	//get execute params
	char** dmnMgrArgv = new char * [argc];
	for (int i = 0; i < argc; i++) {
		dmnMgrArgv[i] = new char[strlen(argv[i]) + 1];
		bzero(dmnMgrArgv[i], strlen(argv[i]) + 1);
		strcpy(dmnMgrArgv[i], argv[i]);
	}
	DEBUG(7, DomainMgr, "begin to instantiate ORB_Wrap")
	DEBUG(7, DomainMgr_Server, " fsRoot is: " << fsRoot)
	DEBUG(7, DomainMgr_Server, " dmdpfl is: " << dmdfl)

	openscaSupport::ORB_Wrap * orbWrap = new openscaSupport::ORB_Wrap();

	//instantiate domainmanager servant
	DomainManager_impl* dmnMgrImpl =
	    new DomainManager_impl(dmdfl.c_str(), fsRoot.c_str());
//	dmnMgrImpl->postConstructor();
	CF::DomainManager_var dmnMgrServant = dmnMgrImpl->_this();

	//get spd path
	DMDParser dmdParser(fsRoot + "/" + dmdfl);
	std::string spdName = dmdParser.getDomainManagerSoftPkg();
	int pos = dmdfl.find_last_of("/");
	std::string spdfl = dmdfl.substr(0, pos + 1) + spdName;

	//get domain name by parsering spd file
	SPDParser spdParser(fsRoot + "/" + spdfl);
	std::string domainName = spdParser.getSoftPkgName();
	std::string openscaDomain = const_cast<char*>(CONSTANT::OPENSCA_DOMAIN);
	domainName = openscaDomain + "/" + domainName;

	orbWrap->bind_object_to_string(dmnMgrServant.in(), domainName.c_str());

	DEBUG(1, dmnmgr_server, "DomainManger is runing...")

#ifdef __SDS_OS_VXWORKS__
	semGive(devMgrMtx);
#elif defined __SDS_OS_LINUX__
	postSemaphore(BOOST_CONSTANT::DEVICE_MANAGER_CND);
#endif

	try {
		//run orb
		orbWrap->orb->run();
#if 0
		//modify under code for this is invaild code,beceause this code not exec forever by maketure
		//orbWrap->orb->destroy();
#endif
	} catch (...) {
		DEBUG(5, DomainManager_server,
		      "DomainManager run with unkown exception")
	}

	//delete execute params
	for (int i = 0; i < argc; i++) {
		delete[] dmnMgrArgv[i];
		dmnMgrArgv[i] = NULL;
	}
	dmnMgrArgv = NULL;
	DEBUG(5, DomainManager_server, "DomainManager is shutdowning")
	return 0;
}
