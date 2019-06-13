/***************************************************************************//**
* @file     test_baseInterface.h
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
#ifndef _TEST_BASE_INTERFACE_H
#define _TEST_BASE_INTERFACE_H

#include <map>
#include <string>
#include <iostream>
#include <vector>
#include "CFS.h"
#include "orbsvcs/orbsvcs/CosNamingC.h"
#include "tao/PortableServer/PortableServer.h"
#include "prop_helpers.h"
#include "test_utils.h"
#include "test_communicationPorts.h"

using namespace std; 

#define PLATFORM_PACKAGE_NAME  ("SCA_Platform")
#define SAD_XML_SUFFIX  (".sad.xml")

#define   DEVICE_MANAGER_ID   ("DCE:3b1cbc9d-eda0-434b-84c4-ff2f6884adc2:1")

// application properties id
#define BLOCK_ERROR_RATE 	("DCE:8b91015a-b0cd-47eb-b475-c44c70bb56a4:1")
#define LOCAL_LD		 	("DCE:1b26d09b-472d-4515-b872-4063e9d39062:1")
#define TARGET_LD		 	("DCE:59d888d5-15e6-413b-aa5c-bd344f040998:1")
#define CONNECTION		 	("DCE:6cb56ba8-0bb9-455e-b34f-cba88b481bff:1")
#define START_STATUS	 	("DCE:085d86cb-1d1c-45fd-94ed-afa8c0e98414:1")
#define BUSINESS_TYPE		("DCE:04a9d833-be0c-4fe6-a5c6-a67e1ca7dcfa:1")

// device properties id
#define IS_BOARD			("DCE:b591a1fb-6082-4bf8-921b-163daba64613:1")
#define HEALTH_STATE		("DCE:7a35162b-1e92-4bc8-90e6-0dde8f477b6c:1")

namespace OpenSCATest {

	enum dataType {charType, stringType, shortType,
			ushortType, longType, ulongType, octetType,
			booleanType, floatType, doubleType};

	class BaseTest
	{
	public:

		CORBA::ORB_var m_orbVar;

		PortableServer::POAManager_var m_poaManager;

		PortableServer::POA_var m_poa;

		CosNaming::NamingContext_var m_namingContextVar;

		CF::DomainManager_var m_domainMgr;

		CF::DeviceManager_var m_deviceMgr;

		CWave_Use_port_i * m_usePort;
		CWave_Provide_port_i * m_providePort;

		CF::DomainManager::ApplicationSequence_var m_appSeq;
		CF::DeviceSequence_var m_devSeq;

		BaseTest();

		~BaseTest();

		/**
		 * @brief The operation used for initialize orb, must be invoked before  
		 * 		  connect with the target platform.
		 *
		 * @param[in] ip
		 * @param[in] port
		 */
		void
		initializeORB(
			const std::string ip,
			int port);

		void 
		getPoa();

		void 
		getPoaManager();

		/**
		 * @brief The operation used for get naming service.Getting domain manager
		 * 		  needs naming service support.
		 */
		void
		getNamingService();

		void
		getDomainManager();

		void
		getDeviceManager();

		/**
		 * @brief The operation shall return object ref by string from 
		 *        specified naming context.
		 *
		 * @param[in] nameContextPtr	Naming context on which the object bind.
		 * @param[in] name	Name of the object context.
		 *
		 * @return Object reference bound with specific name. 
		 */
		CORBA::Object_ptr
		get_object_from_string(
			const CosNaming::NamingContext_ptr nameContextPtr,
			const char * name);

		/**
		 * @brief The operation shall convert string to CosNaming::Name.
		 *
		 * @param[in] name	String to be transformed .
		 *
		 * @return get CosNaming::Name. 
		 */
		CosNaming::Name_var
		string_to_CosName(
			const char * name);

		/**
		 * @brief The operation used for install new application software 
		 * 		  in the domain.
		 *
		 * @param[in] appName   name of application.
		 */
		void
		installApplication(
			const std::string appName);

		/**
		 * @brief The operation used for uninstall application software
		 * 		  in the domain.
		 *
		 * @param[in] appName   name of application.
		 */
		void
		uninstallApplication(
			const std::string appName);

		/**
		 * @brief The operation used for create the connection with the application
		 *		  ports, initialize Uses port and Provides port.
		 *
		 * @param[in] appName     name of application.
		 * @param[in] portNames   name of ports.
		 */
		void
		connectApplication(
			const std::string appName,
			const std::vector<std::string> portNames);

		/**
		 * @brief The operation used for disconnect application.
		 */
		bool
		disconnectApplication();

		/*
		 * @brief get all the applications in the domain manager.
		 */
		void
		getAllApplications();

		/*
		 * @brief get all the devices in the device manager.
		 */
		void
		getAllDevices();

		/**
		 * @brief The operation used for start application. Open the 
		 *	      sending and receiving threads.
		 *
		 * @param[in] appName     name of application.
		 */
		void
		startApplication(
			const std::string appName);

		/**
		 * @brief The operation used for stop application. Destroy the 
		 *	      sending and receiving data threads.
		 *
		 * @param[in] appName     name of application.
		 */
		void
		stopApplication(
			const std::string appName);

		/**
		 * @brief The operation used for print all applications
		 *		  name and id in the domain manager.
		 */
		void
		printAllAppsNameAndId();

		/**
		 * @brief The operation used for print all devices
		 *		  name and id in the device manager.
		 */
		void
		printAllDevsNameAndId();

		/**
		 * @brief The operation used for obtain application
		 *		  all properties.
		 *
		 * @param[in] appName     name of application.
		 *
		 * @return application properties. 
		 */
		CF::Properties
		getAppAllProperties(
			const std::string appName);

		/**
		 * @brief The operation used for obtain device
		 *		  all properties.
		 *
		 * @param[in] devName     name of device.
		 *
		 * @return device properties. 
		 */
		CF::Properties
		getDevAllProperties(
			const std::string devName);

		/**
		 * @brief The operation used for print the  
		 *		  applicaton all properties.
		 *
		 * @param[in] appName     name of application.
		 */
		void
		printAppAllProperties(
			const std::string appName);

		/**
		 * @brief The operation used for print the 
		 *		  device all properties.
		 *
		 * @param[in] devName     name of device.
		 */
		void
		printDevAllProperties(
			const std::string devName);

		/**
		 * @brief The operation used for obtain the application
		 *		  special property value by property id.
		 *
		 * @param[in] appName     name of application.
		 * @param[in] propId      id of property.
		 */
		void 
		getAppSpecialPropertyValue(
			const std::string appName,
			const std::string propId);

		/**
		 * @brief The operation used for obtain the device special
		 *		  property value by property id.
		 *
		 * @param[in] devName     name of device.
		 * @param[in] propId      id of property.
		 */
		void
		getDevSpecialPropertyValue(
			const std::string devName,
			const std::string propId);

		/**
		 * @brief The operation used for configure application 
		 * 		  property value by id.
		 *
		 * @param[in] appName     name of application.
		 * @param[in] propId   	  id of property.
		 * @param[in] propValue   value of property.
		 * @param[in] valueType   type of property value.
		 */
		void
		configureAppPropertyValueById(
			const std::string appName,
			const std::string propId,
			const std::string propValue,
			const std::string valueType);

		/**
		 * @brief The operation used for configure device
		 * 		  property value by id.
		 *
		 * @param[in] devName     name of device.
		 * @param[in] propId   	  id of property.
		 * @param[in] propValue   value of property.
		 * @param[in] valueType   type of property value.
		 */
		void
		configureDevPropertyValueById(
			const std::string devName,
			const std::string propId,
			const std::string propValue,
			const std::string valueType);

	private:

		StandardInterfaces::RealOctet_var m_provide_port_v;
		CF::PPort_var m_use_port_v;

		std::string m_namingServiceIorStr;

		CF::PPort_var m_targetPort;

		std::map<std::string, dataType> m_dataTypeMap;


		/**
		 * @brief The operation used for create new application instance.
		 * 		  
		 * @param[in] appName   name of application.
		 */
		void
		createApplication(
			const std::string appName);

		/**
		 * @brief The operation used for release application resources.
		 *
		 * @param[in] appName   name of application.
		 */
		void
		releaseApplication(
			const std::string appName);

		void
		initializeUsePort();

		void
		initializeProvidePort();

		/*
		 * @brief The operation used for obtain the application 
		 * 		  instance by application name.
		 *
		 * @param[in] appName   name of application.
		 * 
		 * @return the application instance.
		 */
		CF::Application_ptr
		getAppByName(
			const std::string appName);

		/*
		 * @brief The operation used for obtain the device instance
		 *		  by device name.
		 *
		 * @param[in] devName   name of device.
		 * 
		 * @return the device instance.
		 */
		CF::Device_var
		getDevByName(
			const std::string devName);

		void
		connectApplicationPorts(
			CF::Application_ptr app,
			const std::string usePort,
			const std::string providePort);

		void 
		printAppPropertyValue(
			CF::DataType & props);

		void 
		printDevPropertyValue(
			CF::DataType & props);

		/*
		 *	@brief The operation used for obtain CF::Properties by 
		 * 		   property id, value, type.
		 * 
		 *  @param[in] propId      id of property.
		 *	@param[in] propValue   value of property.
		 *	@param[in] valueType   type of value.
		 *
		 *  @return the CF::Properties.
		 */
		CF::Properties
		getCFProperties(
			const std::string propId,
			const std::string propValue,
			const std::string valueType);

		void
		initializeDataTypeMap();
	};
}

#endif // _TEST_BASE_INTERFACE_H
