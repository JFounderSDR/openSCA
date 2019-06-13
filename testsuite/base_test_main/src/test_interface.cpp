/***************************************************************************//**
* @file     test_interface.cpp
* @author   open Team
* @version  9
* @date     2019-05-22
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

#include "test_utils.h"
#include "test_baseInterface.h"

#define   CONNECT_PLATFORM_IP   	("192.168.1.84")
#define   CONNECT_PLATFORM_PORT 	8010
#define   APP_NAME 					("MsgTransApp")
#define   DEV_NAME 					("U1_Zynq7035")
#define   UPORT_NAME 				("external_data_out")
#define   PPORT_NAME 				("external_data_in")
#define   TRANSFER_DATA_MAX_LEN		8000

int main(int argc, char * argv[])
{
	OpenSCATest::BaseTest * baseTestObject = new OpenSCATest::BaseTest();

	// initialize ORB
	baseTestObject->initializeORB(CONNECT_PLATFORM_IP, CONNECT_PLATFORM_PORT);
	baseTestObject->getNamingService();
	baseTestObject->getDomainManager();

	// install application
	baseTestObject->installApplication(APP_NAME);

	baseTestObject->getAllApplications();

	// start up application
	baseTestObject->startApplication(APP_NAME);

	// get device manager
	baseTestObject->getDeviceManager();

	baseTestObject->getAllDevices();

	// print application name and id
	baseTestObject->printAllAppsNameAndId();

	// print device name and id
	baseTestObject->printAllDevsNameAndId();

	// print application all properties
	baseTestObject->printAppAllProperties(APP_NAME);

	// print device all properties
	baseTestObject->printDevAllProperties(DEV_NAME);

	// configure application property value by property id
	std::string propId = "DCE:085d86cb-1d1c-45fd-94ed-afa8c0e98414:1";
	std::string propValue = "true";
	std::string valueType = "boolean";
	baseTestObject->configureAppPropertyValueById(APP_NAME, propId, propValue, valueType);

	// get application special property value
	baseTestObject->getAppSpecialPropertyValue(APP_NAME, propId);

	// configure device property value by property id
	propId = "DCE:b591a1fb-6082-4bf8-921b-163daba64613:1";
	propValue = "true";
	valueType = "boolean";
	baseTestObject->configureDevPropertyValueById(DEV_NAME, propId, propValue, valueType);

	// get device special property value
	baseTestObject->getDevSpecialPropertyValue(DEV_NAME, propId);

	// stop application
	baseTestObject->stopApplication(APP_NAME);

	// uninstall application
	baseTestObject->uninstallApplication(APP_NAME);

	delete baseTestObject;

	return 0;
}
