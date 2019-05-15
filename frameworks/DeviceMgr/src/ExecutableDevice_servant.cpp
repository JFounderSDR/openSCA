/***************************************************************************//**
* @file     ExecutableDevice_servant.cpp
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

#ifdef __SDS_OS_VXWORKS__
#include <loadLib.h>
#include <usrLib.h>
#include <unldLib.h>
#include <taskLib.h>
#endif

#include <iostream>

#include "../include/ExecutableDevice_servant.h"

ExecutableDevice_servant::ExecutableDevice_servant(
    char * id,
    char * labl,
    char * sftwfl):
	LoadableDevice_servant(id, labl, sftwfl) {

}

void
ExecutableDevice_servant::configure(
    const CF::Properties & configProperties)
throw (
    CF::PropertySet::PartialConfiguration,
    CF::PropertySet::InvalidConfiguration,
    CORBA::SystemException) {
	DEBUG(7, DeviceManager_impl, "In ExecutableDevice_servant::configure")
}

CF::ExecutableDevice::ProcessID_Type
ExecutableDevice_servant::execute(
    const char * name,
    const CF::Properties & options,
    const CF::Properties & parameters)
throw (
    CF::ExecutableDevice::ExecuteFail,
    CF::InvalidFileName,
    CF::ExecutableDevice::InvalidOptions,
    CF::ExecutableDevice::InvalidParameters,
    CF::ExecutableDevice::InvalidFunction,
    CF::Device::InvalidState,
    CORBA::SystemException) {

	DEBUG(5, ExecutableDevice_servant, "In execute with name:" << name)

	CF::ExecutableDevice::ProcessID_Type pcRetVal =
	    (CF::ExecutableDevice::ProcessID_Type) (-1);

	if (name == NULL) {
		DEBUG(5, DevMgr, "input parameter name:" << name << "is invalid")
		throw CF::InvalidFileName();
	}

	if (m_adminState != CF::Device::UNLOCKED) {
		DEBUG(5, DevMgr, "the state of device is locked:" << m_adminState)
		throw CF::Device::InvalidState();
	}

	if (m_operationalState == CF::Device::DISABLED) {
		DEBUG(5, DevMgr,
		      "the state of device is disabled" << m_operationalState)
		throw CF::Device::InvalidState();
	}

	CF::Properties invalidProperties;
	invalidProperties.length(0);

	CORBA::ULong ulStackSize = 0;
	CORBA::ULong ulPriority = 0;
	std::string entryPoint;

	DEBUG(7, ExecutableDevice_servant::execute, "options length is " << options.length())

	//parse stackSize and priority from options
	parseOptions(options, ulStackSize, ulPriority, entryPoint, invalidProperties);

	if (invalidProperties.length() > 0) {
		throw CF::ExecutableDevice::InvalidOptions(invalidProperties);
	}

	invalidProperties.length(0);

	int argc = parameters.length() * 2 + TASK_PARAMS_COUNT + 1;
	char** argv = parseExecuteParams(argc, parameters, ulStackSize, ulPriority,
	                  entryPoint, invalidProperties);

    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
	std::string fsRoot = configParser.getValueById(CONSTANT::FSROOT);
	std::string fullOutPath = fsRoot + "/" + name;
	DEBUG(7, ExecutableDevice_servant::execute, "fullOutPath:" << fullOutPath)

	pid_type pid = fork();
	if (pid == -1) {
		DEBUG(5, ExecutableDevice_servant,
		      "[ExecutableDevice_servant::execute] fork() failed.")
		return -1;
	}

	if (pid == 0) {
		m_pidMap.insert(std::pair<std::string, pid_t>(entryPoint, getpid()));
		execv(fullOutPath.c_str(), argv);

		DEBUG(5, ExecutableDevice_servant,
		      "[ExecutableDevice_servant::execute] child process end.")
		exit(0);
	}

	pcRetVal = (CF::ExecutableDevice::ProcessID_Type) pid;
	sMsSleep(10);
	if (argv != NULL) {
		delete2DArray(argc, argv);
	}

	DEBUG(7, [ExecutableDevice::SpawnProcess], "leaving ...")
	return pcRetVal;
}

void
ExecutableDevice_servant::parseOptions(
    const CF::Properties & options,
    CORBA::ULong & stackSize,
    CORBA::ULong & priority,
    std::string & entryPoint,
    CF::Properties & invalidProperties) {

	CORBA::ULong ulStackSize = 0;
	CORBA::ULong ulPriority = 0;

	//parse stackSize and priority from options
	for (int i = 0; i < options.length(); i++) {
		CORBA::String_var propertyId = CORBA::string_dup(options[i].id);

		if (0 == strcmp(propertyId.in(), "")) {
			invalidProperties.length(invalidProperties.length() + 1);
			invalidProperties[invalidProperties.length() - 1] = options[i];
			continue;
		}

		if ( strcmp(propertyId.in(), "STACK_SIZE_ID") == 0) {
			if ( options[i].value >>= stackSize ) {
				ulStackSize = (unsigned long)stackSize;
				DEBUG(7, SPM_Zynq7045_1_servant::execute:,
				      " stackSize is " << ulStackSize)
			} else {
				invalidProperties.length(invalidProperties.length() + 1);
				invalidProperties[invalidProperties.length() - 1] = options[i];
			}
		} else if ( strcmp(propertyId.in(), "PRIORITY_ID") == 0) {
			if ( options[i].value >>= priority ) {
				ulPriority = (unsigned long)priority;
				DEBUG(7, SPM_Zynq7045_1_servant::execute:,
				      " priority is " << ulPriority)
			} else {
				invalidProperties.length(invalidProperties.length() + 1);
				invalidProperties[invalidProperties.length() - 1] = options[i];
			}
		} else if ( strcmp(propertyId.in(), "ENTRY_POINT") == 0) {
			const char* val = NULL;

			if ( options[i].value >>= val ) {
				entryPoint = val;
				DEBUG(7, SPM_Zynq7045_1_servant::execute:,
				      " entypoint is " << entryPoint)
			} else {
				invalidProperties.length(invalidProperties.length() + 1);
				invalidProperties[invalidProperties.length() - 1] = options[i];
			}
		} else {
			invalidProperties.length(invalidProperties.length() + 1);
			invalidProperties[invalidProperties.length() - 1] = options[i];
		}
	}
}

char **
ExecutableDevice_servant::parseExecuteParams(
    int argc,
    const CF::Properties & parameters,
    CORBA::ULong ulStackSize,
    CORBA::ULong ulPriority,
    const std::string & entryPoint,
    CF::Properties & invalidProperties) {
	char** argv = new char*[argc];
	bzero(argv, argc);
	int index = 0;
	for (int j = 0; j < parameters.length(); j++) {
		std::string strArg = CORBA::string_dup(parameters[j].id);
		const char* str_val = 0;

		argv[2 * j] = NULL;
		argv[(2 * j) + 1] = NULL;

		if (strArg != "") {
			argv[2 * j] = new char[strArg.length() + 1];
			bzero(argv[2 * j], strArg.length() + 1);
			strcpy(argv[2 * j], strArg.c_str());

			CORBA::Any::to_string v_str(str_val, 0);

			if ( parameters[j].value >>= v_str ) {
				argv[(2 * j) + 1] = new char[strlen(str_val) + 1];
				bzero(argv[(2 * j) + 1], strlen(str_val) + 1);
				strcpy(argv[( 2 * j ) + 1], str_val);
				index = (2 * j) + 1;
			} else {
				invalidProperties.length(invalidProperties.length() + 1);
				invalidProperties[invalidProperties.length() - 1] =
				    parameters[j];
			}
		} else {
			invalidProperties.length(invalidProperties.length() + 1);
			invalidProperties[invalidProperties.length() - 1] = parameters[j];
		}
	}

	argv[++index] = new char[strlen("-STACK_SIZE") + 1];
	bzero(argv[index], strlen("-STACK_SIZE") + 1);
	strcpy(argv[index], "-STACK_SIZE");

	argv[++index] = new char[sizeof(ulStackSize) + 1];
	bzero(argv[index], sizeof(ulStackSize) + 1);
	sprintf(argv[index], "%d", ulStackSize);

	argv[++index] = new char[strlen("-PRIORITY") + 1];
	bzero(argv[index], strlen("-PRIORITY") + 1);
	strcpy(argv[index], "-PRIORITY");

	argv[++index] = new char[sizeof(ulPriority) + 1];
	bzero(argv[index], sizeof(ulPriority) + 1);
	sprintf(argv[index], "%d", ulPriority);

	argv[++index] = new char[strlen("-ENTRY_POINT") + 1];
	bzero(argv[index], strlen("-ENTRY_POINT") + 1);
	strcpy(argv[index], "-ENTRY_POINT");

	argv[++index] = new char[strlen(entryPoint.c_str()) + 1];
	bzero(argv[index], strlen(entryPoint.c_str()) + 1);
	strcpy(argv[index], entryPoint.c_str());

	argv[++index] = NULL;

	if ((invalidProperties.length() > 0) &&  (argv)) {
		delete2DArray(argc, argv);
		throw CF::ExecutableDevice::InvalidParameters (invalidProperties);
	}

	DEBUG(7, SPM_Zynq7045_1_servant::execute:, "argc:" << argc)

	return argv;
}

void
ExecutableDevice_servant::terminate(
    CF::ExecutableDevice::ProcessID_Type processId)
throw (
    CF::Device::InvalidState,
    CF::ExecutableDevice::InvalidProcess,
    CORBA::SystemException) {

	DEBUG(5, ExecutableDevice_servant, "In terminate.")

	if ((m_adminState == CF::Device::LOCKED)
	        || (m_operationalState == CF::Device::DISABLED)) {
		DEBUG(5, DevMgr,
		      "Cannot call terminate on a LOCAKED or DISABLED device")
		throw CF::Device::InvalidState();
	}

	bool bResult = KillProcess((pid_type)processId);
	if (!bResult) {
		DEBUG(5, DevMgr, "kill porcess failed")
		throw CF::ExecutableDevice::InvalidProcess();
	}
}

bool 
ExecutableDevice_servant::KillProcess(
		pid_type pid)
{
	DEBUG(3, ExecutableDevice_impl, "In killProcess")
#ifdef __SDS_OS_VXWORKS__
	taskLock();
	if (taskDeleteForce(pid) == ERROR) {
		DEBUG(2, ExecutableDevice, "In killProcess pid_type delete task failed")
		return false;
	}
	taskUnlock();
#elif defined __SDS_OS_LINUX__
	int retval = kill(pid, SIGKILL);
	if (retval)
	{
		DEBUG(2, ExecutableDevice, "In killProcess pid_t delete task failed")
		return false;
	}
#endif
	DEBUG(3, ExecutableDevice_impl, "killProcess success")
	return true;
}