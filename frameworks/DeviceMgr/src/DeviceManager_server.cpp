/***************************************************************************//**
* @file     ExecutableDevice_server.cpp
* @author   open Team
* @version  9
* @date     2017-03-12
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

#include "tao/PortableServer/PortableServer.h"
#include "tao/PortableServer/POAS.h"
#include "tao/ORB.h"
#include "tao/IORTable/IORTable.h"

#include "debug.h"
#include "openscaSupport.h"
#include "../include/DeviceManager_impl.h"
#include "ConfigParser.h"
#include "utils.h"
#include "Boost_utils.h"

void
usage() {
	std::cout << "Example: Device_Manager_Main -DEBUG <deubg level>" << std::endl;
	std::cout << "Example: Device_Manager_Main -DEBUG 1 " << std::endl;
	std::cout << "Example: Device_Manager_Main -ID DCE:fewf-wfe-34ss-fsef:1" <<
	          std::endl;
	std::cout << "Example: Device_Manager_Main -SFTFL deviceManager.spd.xml" <<
	          std::endl;
	std::cout << "Example: Device_Manager_Main --help" << std::endl;
}

int64_t
getCurrentTime() {
	struct timeval tv;
	gettimeofday(&tv, NULL);
	return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

/**
 * @brief check if input parameter is valid
 * @param[in] argc-			 total parameter num in main
 * @param[in] argv_index-	 index of argv[] from 0 to argc-1
 */
bool
checkInParam(
    int argc,
    int argv_index) {
	if (argv_index + 1 == argc) {
		std::cout << "[MHAL_Dev_Main]ERROR: illegal input parameter" << std::endl;
		usage();
		return false;
	}
	return true;
}

#ifdef __SDS_OS_VXWORKS__
//extern "C"
int Device_Manager_Main(int argc, char* argv[])
#elif defined __SDS_OS_LINUX__
int main(int argc, char* argv[])
#endif
{
	DEBUG(7, DeviceMgr, "enter in...")
	int debugLevel = 10;
	std::string id = "";
	std::string devMgrName = "";
	std::string poaName = "";
	std::string stackSize = "";
	std::string priority = "";
	std::string entryPoint = "";

	//parse input parameter
	for (unsigned int numArg = 0; numArg < argc; numArg++) {
		//parse DEUBG
		if (strcmp(argv[numArg], "-DEBUG") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			if (isdigit(*argv[numArg + 1])) {
				debugLevel = atoi(argv[numArg + 1]);
			} else {
				std::cout
				        << "[Device_Manager_Main]ERROR: illegal debug level given "
				        << std::endl;
				usage();
				exit(EXIT_FAILURE);
			}
		}

		//parse id
		if (strcmp(argv[numArg], "-COMPONENT_IDENTIFIER") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			id = argv[numArg + 1];
			DEBUG(7, [Device_Manager_Main], "id is " << id)
		}

		//parse service name
		if (strcmp(argv[numArg], "-DEVICEMANAGER_NAME") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			devMgrName = argv[numArg + 1];
			DEBUG(7, [Device_Manager_Main], " service name is " << devMgrName)
		}

		//parse POA name
		if (strcmp(argv[numArg], "-POA_NAME") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			poaName = argv[numArg + 1];
			DEBUG(7, [Device_Manager_Main], " POA name is " << poaName)
		}

		//parse stackSize
		if (strcmp(argv[numArg], "-STACK_SIZE") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			stackSize = argv[numArg + 1];
			DEBUG(7, [Device_Manager_Main], " stackSize is " << stackSize)
		}

		//parse priority
		if (strcmp(argv[numArg], "-PRIORITY") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			priority = argv[numArg + 1];
			DEBUG(7, [Device_Manager_Main], " priority is " << priority)
		}

		//parse entryPoint
		if (strcmp(argv[numArg], "-ENTRY_POINT") == 0) {
			if (checkInParam(argc, numArg) == false)
				exit(EXIT_FAILURE);

			entryPoint = argv[numArg + 1];
			DEBUG(7, [Device_Manager_Main], " entryPoint is " << entryPoint)
		}

	}		//for (unsigned int numArg=0; numArg<argc; numArg++)

#ifdef __SDS_OS_VXWORKS__
	semTake(devMgrMtx, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
	waitSemaphore(BOOST_CONSTANT::DEVICE_MANAGER_CND);
#endif

	DEBUG(7, DeviceMgr, "begin to instantiate ORB_Wrap")

	//new ORB_Wrap include new orb and activate poamanager
	openscaSupport::ORB_Wrap * orbWrap = new openscaSupport::ORB_Wrap();
    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
	std::string fsRoot = configParser.getValueById(CONSTANT::FSROOT);
	std::string sdrRoot = configParser.getValueById(CONSTANT::SDRROOT);
	std::string dcdPath = configParser.getValueById(CONSTANT::MAINDCDPATH);
	std::string dcdPfl = sdrRoot + "/" + dcdPath;
	DEBUG(7, DeviceMgr, " fsRoot is: " << fsRoot)
	DEBUG(7, DeviceMgr, " dcdPfl is: " << dcdPfl)

	PortableServer::POA_var childPoa = PortableServer::POA::_nil();
	childPoa = openscaSupport::createPersistentPOA(
	               (openscaSupport::ORB_Wrap::poa).in(), "DeviceManager");
	if (CORBA::is_nil(childPoa)) {
		DEBUG(1, [Device_Manager_Main], "create child poa failed")
		return -1;
	}

	//instantiate devicemanager servant
	PortableServer::Servant_var<DeviceManager_impl> devmgrServant =
	    new DeviceManager_impl(dcdPfl.c_str(), fsRoot.c_str(), sdrRoot.c_str());

	/// obtain object reference of this service
	assert(devmgrServant);
	PortableServer::ObjectId_var objectId = PortableServer::string_to_ObjectId(
	        devMgrName.c_str());
	childPoa->activate_object_with_id(objectId.in(), devmgrServant.in());

	CORBA::Object_var servantObj = childPoa->id_to_reference(objectId.in());
	CORBA::String_var ior = orbWrap->orb->object_to_string(servantObj.in());

	// resolve IORTable and bind ior with IORTable
	CORBA::Object_var obj = orbWrap->orb->resolve_initial_references(
	                            "IORTable");
	IORTable::Table_var iorTable = IORTable::Table::_narrow(obj);
	if (CORBA::is_nil(iorTable)) {
		DEBUG(1, [AggregateService_main], "narrow IORTable failed")
		return -1;
	}

	std::string bindName(poaName);
	bindName.append("/");
	bindName.append(devMgrName);
	iorTable->bind(bindName.c_str(), ior);

	int firstSlashPos = dcdPath.find_first_of("/");
	std::string rearSubStr = dcdPath.substr(firstSlashPos + 1);
	int secondSlashPos = rearSubStr.find_first_of("/");
	std::string nodeName = rearSubStr.substr(0, secondSlashPos);
	orbWrap->bind_object_to_string(servantObj.in(),
	                               ("OpenSCA_Domain/Nodes/" + nodeName + "/Device_Manager").c_str());

	DEBUG(1, DeviceMgr, "DeviceManger is runing...")

	devmgrServant->postConstructor();
	devmgrServant->launchDCD((fsRoot + "/" + dcdPfl).c_str());

#ifdef __SDS_OS_VXWORKS__
	semGive(sysMgrMtx);
#elif defined __SDS_OS_LINUX__
	postSemaphore(BOOST_CONSTANT::SYSTEM_MANAGER_CND);
#endif

	try {
		// run orb
		orbWrap->orb->run();
		// shutdown orb
		orbWrap->orb->shutdown();
	} catch (...) {
		DEBUG(5, DevMgr, "DeviceManager run with unkown exception")
	}

	DEBUG(5, DevMgr, "DeviceManager is shutdowning")
	return 0;
}
