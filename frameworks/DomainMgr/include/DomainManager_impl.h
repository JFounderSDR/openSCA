/***************************************************************************//**
* @file     DomainManager_impl.h
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
#if !defined(EA_25297BB4_B3F9_4505_8EA1_A199CC7D3AD2__INCLUDED_)
#define EA_25297BB4_B3F9_4505_8EA1_A199CC7D3AD2__INCLUDED_

#include <iostream>
#include <vector>

#include "orbsvcs/CosEventChannelAdminS.h"

#include "Boost_utils.h"
#include "Resource_impl.h"
#include "DMDParser.h"
#include "SPDParser.h"
#include "SADParser.h"
#include "DCDParser.h"
#include "SCDParser.h"
#include "PRFParser.h"
#include "cf_utils.h"
#include "CFS.h"
#include "ApplicationFactory_impl.h"
#include "UsesConnectionInfo.h"
#include "Boost_utils.h"

class ServiceNode;
class DeviceNode;

/**
 * @brief The DomainManager interface is for the control and configuration of the 
 *        system domain. The DomainManager interface operations may be logically 
 *        grouped into three categories: Human Computer Interface (HCI), Registration, 
 *        and CF administration.
 *        
 *        The HCI operations are used to configure the domain, get the domain’s 
 *        capabilities (devices, services, and applications), and initiate maintenance 
 *        functions. Host operations are performed by an HCI client capable of 
 *        interfacing to the domain manager.
 *        
 *        The registration operations are used to register / unregister device 
 *        managers, device manager’s devices, device manager’s services, and 
 *        applications at startup or during run-time for dynamic device, service, 
 *        and application extraction and insertion.
 *        
 *        The administration operations are used to access the interfaces of 
 *        registered device managers and domain manager's file manager.
 */
class DomainManager_impl :		
public PropertySet_impl,
public virtual POA_CF::DomainManager {

public:
	DomainManager_impl();

	DomainManager_impl(
		const char * dmdprf,
		const char * rootfs);

	~DomainManager_impl();

	/**
	 * @brief The operation shall return a list with one application factory per 
	 *        application (SAD file and associated files) successfully installed 
	 *        (i.e. no exception raised). The domain manager shall write an 
	 *        ADMINISTRATIVE_EVENT log record to a domain manager’s log, when the 
	 *        applicationFactories attribute is obtained by a client.
	 *
	 * @return List with one application factory per application.
	 */
	CF::DomainManager::ApplicationFactorySequence *
	applicationFactories()
	throw (CORBA::SystemException);

	/**
	 * @brief The operation shall return a sequence of instantiated Applications in 
	 *        the domain. The readonly applications attribute shall contain the list 
	 *        of Applications that have been instantiated. The domain manager shall 
	 *        write an ADMINISTRATIVE_EVENT log record to a domain manager’s log, 
	 *        when the application’s attribute is obtained by a client.
	 *
	 * @return Sequence of instantiated Applications in the domain.
	 */
	CF::DomainManager::ApplicationSequence *
	applications()
	throw (CORBA::SystemException);

	/**
	 * @brief The operation shall return a sequence of registered device managers in 
	 *        the domain. The readonly deviceManagers attribute shall contain a list 
	 *        of registered device managers that have registered with the domain 
	 *        manager. The domain manager shall write an ADMINISTRATIVE_EVENT log to 
	 *        a domain manager’s log, when the deviceManagers attribute is obtained 
	 *        by a client.
	 *
	 * @return Sequence of registered device managers in the domain.
	 */
	CF::DomainManager::DeviceManagerSequence *
	deviceManagers()
	throw (CORBA::SystemException);

	/**
	 * @brief The domainManagerProfile attribute contains the domain manager’s 
	 *        Profile Descriptor. The readonly domainManagerProfile attribute shall 
	 *        contain a profile element (Profile Descriptor) with a file reference 
	 *        to the DomainManager Configuration Descriptor (DMD) file. Files
	 *        referenced within the profile are obtained via the domain manager’s 
	 *        FileManager.
	 *
	 * @return Domain manager’s Profile Descriptor.
	 */
	char *
	domainManagerProfile()
	throw (CORBA::SystemException);

	/**
	 * @brief The readonly fileMgr attribute shall contain the domain manager file 
	 *        manager. The domain manager shall write an ADMINISTRATIVE_EVENT log 
	 *        record to a domain manager’s log, when the fileMgr attribute is 
	 *        obtained by a client.
	 *
	 * @return Domain manager file manager.
	 */
	CF::FileManager_ptr
	fileMgr()
	throw (CORBA::SystemException);

	/**
	 * @brief The operation shall return a unique identifier for a DomainManager 
	 *        instance. The identifier shall be identical to the 
	 *        domainmanagerconfiguration element id attribute of the
	 *        domain manager’s Descriptor (DMD) file.
	 *
	 * @return A unique identifier for a DomainManager instance.
	 */
	char *
	identifier()
	throw (CORBA::SystemException);

	/**
	 * @brief The installApplication operation is used to install new application 
	 *        software in the domain.
	 *
	 * The input profileFileName parameter is the absolute pathname of the 
	 * application SAD.
	 * 
	 * The installApplication operation shall verify the existence of the 
	 * application's SAD file and all files upon which the SAD depends, within the 
	 * domain manager's file manager.
	 * 
	 * The installApplication operation shall write an ADMINISTRATIVE_EVENT log 
	 * record to a domain manager's log, upon successful application installation.
	 * 
	 * The installApplication operation shall, upon unsuccessful application 
	 * installation, write a FAILURE_ALARM log record to a domain manager's log.
	 * 
	 * The installApplication operation shall send a 
	 * DomainManagementObjectAddedEventType event to the Outgoing Domain Management 
	 * event channel, upon successful installation of an application. For this event,
	 * 		1. The producerId is the identifier attribute of the domain manager.
	 * 		2. The sourceId is the identifier attribute of the installed application 
	 * 			factory.
	 * 		3. The sourceName is the name attribute of the installed application 
	 * 			factory.
	 * 		4. The sourceIOR is the object reference for the installed application 
	 * 			factory.
	 * 		5. The sourceCategory is “APPLICATION_FACTORY”.
	 *
	 * @param[in] profileFileName	Application's sad.xml file.
	 *
	 * @exception The installApplication operation shall raise the 
	 *            ApplicationInstallationError exception when the installation of the 
	 *            application file(s) was not successfully completed.
	 *            
	 *            The installApplication operation shall raise the CF InvalidFileName 
	 *            exception when the input SAD file or any of the SAD’s referenced 
	 *            filenames do not exist in the file system identified by the 
	 *            absolute path of the input profileFileName parameter. The 
	 *            installApplication operation shall log a FAILURE_ALARM log record 
	 *            to a domain manager's Log with a message consisting of
	 *            "installApplication::invalid file is xxx", where "xxx" is the input 
	 *            or referenced filename, when the CF InvalidFileName exception occurs.
	 *            The installApplication operation shall raise the CF InvalidProfile 
	 *            exception when any referenced property definition is missing. 
	 *
	 * 			  The installApplication operation shall write a FAILURE_ALARM log 
	 * 			  record to a domain manager's log when the CF InvalidProfile 
	 * 			  exception is raised. The value of the logData attribute of this 
	 * 			  record is "installApplication::invalid Profile is yyy", where 
	 * 			  "yyy" is the input or referenced file name.
	 * 			  
	 * 			  The installApplication operation shall raise the 
	 * 			  ApplicationAlreadyInstalled exception when the softwareassembly 
	 * 			  element id attribute of the referenced application is the same as 
	 * 			  a previously registered application.
	 */
	void
	installApplication(
		const char * profileFileName)
	throw (
		CF::DomainManager::ApplicationInstallationError,
		CF::InvalidFileName,
		CF::InvalidProfile,
		CORBA::SystemException);

	/**
	 * @brief The registerDevice operation is used to register a device for a 
	 *        specific device manager with the domain manager.
	 *
	 * The registerDevice operation shall verify that the input parameters, 
	 * registeringDevice and registeredDeviceMgr, are not nil CORBA object references.
	 * The registerDevice operation shall add the device indicated by the input 
	 * registeringDevice parameter and the device’s attributes to the domain manager, 
	 * if it does not already exist.
	 * 
	 * The registerDevice operation shall return without exception and not register 
	 * a new device when that device, indicated by the input registeringDevice 
	 * parameter, has the same identifier attribute as a previously registered device 
	 * and the reference to the registered device refers to an existing object.
	 * 
	 * The registerDevice operation shall register the new device indicated by the 
	 * input registeringDevice parameter, when the previously registered device has 
	 * the same identifier attribute as the new device and the reference to the 
	 * registered device refers to a nonexistent object.
	 * 
	 * The registerDevice operation shall write an ADMINISTRATIVE_EVENT log record 
	 * when reference to the registered device refers to a nonexistent object.
	 * 
	 * The registerDevice operation associates the device indicated by the input 
	 * registeringDevice parameter with the device manager indicated by the input 
	 * registeredDeviceMgr parameter when the device manager is a valid registered 
	 * DeviceManager in the domain manager.
	 * 
	 * The registerDevice operation shall establish any pending connections from 
	 * previously registered device managers when the registering device completes 
	 * these connections.
	 * 
	 * The registerDevice operation shall write an ADMINISTRATIVE_EVENT log record 
	 * to a domain manager log upon successful device registration.
	 *
	 * The registerDevice operation shall write a FAILURE_ALARM log record to a 
	 * domain manager log, when the CF InvalidProfile exception is raised.
	 * 
	 * The registerDevice operation shall write a FAILURE_ALARM log record to a 
	 * domain manager log when the DeviceManagerNotRegistered exception is raised.
	 * 
	 * The registerDevice operation shall write a FAILURE_ALARM log record to a 
	 * domain manager log when the CF InvalidObjectReference exception is raised.
	 * 
	 * The registerDevice operation shall write a FAILURE_ALARM log record to a 
	 * domain manager log when the RegisterError exception is raised.
	 * 
	 * The registerDevice operation shall send a DomainManagementObjectAddedEventType 
	 * event to the Outgoing Domain Management event channel, upon successful 
	 * registration of a device. For this event,
	 * 	1. The producerId is the identifier attribute of the domain manager.
	 * 	2. The sourceId is the identifier attribute of the registered device.
	 * 	3. The sourceName is the label attribute of the registered device.
	 * 	4. The sourceIOR is the object reference for the registered device.
	 * 	5. The sourceCategory is “DEVICE”.
	 *
	 * @param[in] registeringDevice		Device needs registered.
	 * @param[in] registeredDeviceMgr	DeviceManager needs registered.
	 *
	 * @exception The registerDevice operation shall raise the CF InvalidProfile 
	 *            exception when:
	 *            	1. The device's SPD file and the SPD’s referenced files do not 
	 *            	   exist, or
	 *            	2. The device profile does not reference allocation properties.
	 *            	
	 *            The registerDevice operation shall raise a 
	 *            DeviceManagerNotRegistered exception when the input 
	 *            registeredDeviceMgr parameter is not a nil reference and the 
	 *            referenced device manager is not registered with the domain manager.
	 *            
	 *            The registerDevice operation shall raise the CF 
	 *            InvalidObjectReference exception when input parameters 
	 *            registeringDevice or registeredDeviceMgr contains an invalid 
	 *            reference.
	 *            
	 *            The registerDevice operation shall raise the RegisterError 
	 *            exception when an internal error exists which causes an 
	 *            unsuccessful registration.
	 */
	void
	registerDevice(
		CF::Device_ptr registeringDevice,
		CF::DeviceManager_ptr registeredDeviceMgr)
	throw (
		CF::DomainManager::RegisterError,
		CF::DomainManager::DeviceManagerNotRegistered,
		CF::InvalidProfile,
		CF::InvalidObjectReference,
		CORBA::SystemException);

	/**
	 * @brief The registerDeviceManager operation is used to register a device 
	 *        manager, its device(s), and its services. Software profiles may be 
	 *        obtained from the device manager's FileSystem.
	 *
	 * The registerDeviceManager operation verifies that the input deviceMgr 
	 * parameter is a not a nil CORBA object reference.
	 * 
	 * The registerDeviceManager operation shall add the device manager indicated 
	 * by the input deviceMgr parameter to the DomainManager deviceManagers attribute, 
	 * if it does not already exist. The registerDeviceManager operation shall add 
	 * the input device manager’s registered devices and each registered device’s 
	 * attributes (e.g., identifier, softwareProfile, allocation properties, etc.) to 
	 * the domain manager. The domain manager associates the input device manager’s 
	 * registered devices with the device manager in order to support the 
	 * unregisterDeviceManager operation.
	 * 
	 * The registerDeviceManager operation shall add all the services contained in 
	 * the registering device manager’s registeredServices attribute to the domain 
	 * manager. The registerDeviceManager operation associates the device manager 
	 * indicated by the input deviceMgr parameter with its registered services in 
	 * the domain manager in order to support the unregisterDeviceManager operation.
	 * 
	 * The registerDeviceManager operation shall return without exception and not 
	 * register a new device manager when that device manager, indicated by the 
	 * input deviceMgr parameter, has the same identifier attribute as a previously 
	 * registered device manager and the reference to the registered device manager 
	 * refers to an existing object.
	 * 
	 * The registerDeviceManager operation shall register the new device manager 
	 * indicated by the input deviceMgr parameter, when the previously registered 
	 * device manager has the same identifier attribute as the new device manager 
	 * and the reference to the registered device manager refers to a nonexistent 
	 * object.
	 * 
	 * The registerDeviceManager operation shall write an ADMINISTRATIVE_EVENT log 
	 * record when reference to the registered device manager refers to a nonexistent 
	 * object.
	 * 
	 * The registerDeviceManager operation shall establish any connections for the 
	 * device manager indicated by the input deviceMgr parameter, which are specified 
	 * in the connections element of the device manager’s Device Configuration 
	 * Descriptor (DCD) file, that are possible with the current set of registered 
	 * devices and services. Connections not currently possible are left unconnected 
	 * pending future device / service registrations.
	 * 
	 * For connections established for a CORBA Event Service’s event channel, the
	 * registerDeviceManager operation shall connect a CosEventComm::PushConsumer or
	 * CosEventComm::PushSupplier object to the event channel as specified in the 
	 * DCD’s domainfinder element. If the event channel does not exist, the 
	 * registerDeviceManager operation shall create the event channel.
	 *
	 * The registerDeviceManager operation shall obtain all the software profiles 
	 * from the registering device manager's file systems.
	 * 
	 * The registerDeviceManager operation shall mount the device manager's file 
	 * system to the domain manager’s file manager. The mounted FileSystem name 
	 * shall have the format, “/DomainName/HostName”, where DomainName is the name 
	 * of the domain and HostName is the input deviceMgr’s label attribute.
	 * 
	 * The registerDeviceManager operation shall, upon unsuccessful device manager 
	 * registration, write a FAILURE_ALARM log record to a domain manager’s Log.
	 * 
	 * The registerDeviceManager operation shall send a 
	 * DomainManagementObjectAddedEventType event to the Outgoing Domain Management 
	 * event channel upon successful registration of a device manager. For this event,
	 * 	1. The producerId is the identifier attribute of the domain manager.
	 * 	2. The sourceId is the identifier attribute of the registered device manager.
	 * 	3. The sourceName is the label attribute of the registered device manager.
	 * 	4. The sourceIOR is the object reference for the registered device manager.
	 * 	5. The sourceCategory is “DEVICE_MANAGER”.
	 *
	 * @param[in] deviceMgr 	DeviceManager needs registered.
	 *
	 * @exception The registerDeviceManager operation shall raise the CF 
	 *            InvalidObjectReference exception when the input parameter deviceMgr 
	 *            contains an invalid reference to a DeviceManager interface.
	 *            
	 *            The registerDeviceManager operation shall raise the CF 
	 *            InvalidProfile exception when the device manager’s DCD file and 
	 *            the DCD’s referenced files do not exist.
	 *            
	 *            The registerDeviceManager operation shall raise the RegisterError 
	 *            exception when an internal error exists which causes an 
	 *            unsuccessful registration.
	 */
	void
	registerDeviceManager(
		CF::DeviceManager_ptr deviceMgr)
	throw (
		CF::DomainManager::RegisterError,
		CF::InvalidProfile,
		CF::InvalidObjectReference,
		CORBA::SystemException);

	/**
	 * @brief The registerService operation is used to register a service for a 
	 *        specific device manager with the domain manager.
	 *
	 * The registerService operation shall verify the input registeringService and 
	 * registeredDeviceMgr are valid object references.
	 * 
	 * The registerService operation shall verify the input registeredDeviceMgr has 
	 * been previously registered with the domain manager.
	 * 
	 * The registerService operation shall add the registeringService’s object 
	 * reference and the registeringService’s name to the domain manager, if the name 
	 * for the type of service being registered does not exist within the domain 
	 * manager. The registerService operation shall return without exception and not 
	 * register a new service when that service, indicated by the input
	 * registeringService parameter, has the same name and type as a previously 
	 * registered service and the reference to the registered service refers to an 
	 * existing object.
	 * 
	 * The registerService operation shall register the new service, indicated by 
	 * the input registeringService parameter, when the previously registered service 
	 * has the same name and type as the new service and the reference to the 
	 * registered service refers to a nonexistent object.
	 * 
	 * The registerService operation shall write an ADMINISTRATIVE_EVENT log record 
	 * when reference to the registered service refers to a nonexistent object.
	 * 
	 * The registerService operation shall associate the input registeringService 
	 * parameter with the input registeredDeviceMgr parameter in the domain manager, 
	 * when the registeredDeviceMgr parameter indicates a device manager that is 
	 * registered with the domain manager.
	 * 
	 * The registerService operation shall establish any pending connections from 
	 * previously registered device managers when the registering service completes 
	 * these connections.
	 * 
	 * The registerService operation shall, upon successful service registration, 
	 * write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
	 * 
	 * The registerService operation shall, upon unsuccessful service registration, 
	 * write a FAILURE_ALARM log record to a domain manager's log.
	 * 
	 * The registerService operation shall send a DomainManagementObjectAddedEventType 
	 * event to the Outgoing Domain Management event channel, upon successful 
	 * registration of a service. For this event,
	 * 	1. The producerId is the identifier attribute of the domain manager.
	 * 	2. The sourceId is the identifier attribute of the componentinstantiation 
	 * 		element associated with the registered service.
	 * 	3. The sourceName is the input name parameter for the registering service.
	 * 	4. The sourceIOR is the object reference for the registered service.
	 * 	5. The sourceCategory is “SERVICE”.
	 *
	 * @param[in] registeringService	Object reference of the service needs 
	 * 									registered to domain.
	 * @param[in] registeredDeviceMgr	DeviceManager which the registering serivce
	 * 									belongs to.
	 * @param[in] name					Name of the registering service.
	 * 
	 * @exception The registerService operation shall raise a 
	 *            DeviceManagerNotRegistered exception when the input 
	 *            registeredDeviceMgr parameter is not a nil reference and is not 
	 *            registered with the domain manager.
	 *            
	 *            The registerService operation shall raise the CF 
	 *            InvalidObjectReference exception when input parameters 
	 *            registeringService or registeredDeviceMgr contains an invalid 
	 *            reference.
	 *            
	 *            The registerService operation shall raise the RegisterError 
	 *            exception when an internal error exists which causes an unsuccessful 
	 *            registration.
	 */
	void
	registerService(
		CORBA::Object_ptr registeringService,
		CF::DeviceManager_ptr registeredDeviceMgr,
		const char * name)
	throw (
		CF::DomainManager::RegisterError,
		CF::DomainManager::DeviceManagerNotRegistered,
		CF::InvalidObjectReference,
		CORBA::SystemException);

	/**
	 * The registerWithEventChannel operation is used to connect a consumer to a
	 * domain��s event channel.
	 */
	void 
	registerWithEventChannel(
			CORBA::Object_ptr registeringObject,
			const char* registeringId, 
			const char* eventChannelName)
	throw (
			CF::DomainManager::AlreadyConnected,
			CF::DomainManager::InvalidEventChannelName,
			CF::InvalidObjectReference, 
			CORBA::SystemException);

	/**
	 * The unregisterFromEventChannel operation is used to disconnect a consumer from
	 * a domain��s event channel. 
	 */
	void 
	unregisterFromEventChannel(
			const char* unregisteringId,
			const char* eventChannelName)
	throw (
			CF::DomainManager::NotConnected,
			CF::DomainManager::InvalidEventChannelName,
			CORBA::SystemException);

	/**
	 * @brief The uninstallApplication operation is used to uninstall an application 
	 *        factory from the domain.
	 *
	 * The ApplicationId parameter is the softwareassembly element id attribute of the
	 * ApplicationFactory’s Software Assembly Descriptor file.
	 * 
	 * The uninstallApplication operation shall make the ApplicationFactory 
	 * unavailable from the domain manager (i.e. its services no longer provided for 
	 * the application).
	 * 
	 * The uninstallApplication operation shall, upon successful uninstall of an 
	 * application, write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
	 * 
	 * The uninstallApplication operation shall, upon unsuccessful uninstall of an 
	 * application, write a FAILURE_ALARM log record to a domain manager's log.
	 * 
	 * The uninstallApplication operation shall send a 
	 * DomainManagementObjectRemovedEventType event to the Outgoing Domain Management 
	 * event channel, upon the successful uninstallation of an application. 
	 * For this event,
	 * 	1. The producerId is the identifier attribute of the domain manager.
	 * 	2. The sourceId is the identifier attribute of the uninstalled application 
	 * 		factory.
	 * 	3. The sourceName is the name attribute of the uninstalled application factory.
	 * 	4. The sourceCategory is “APPLICATION_FACTORY”.
	 * 	
	 * @param[in] applicationId 	Id of the application needs to be uninstalled.
	 *
	 * @exception The uninstallApplication operation shall raise the InvalidIdentifier 
	 *            exception when the ApplicationId is invalid.
	 *            
	 *            The uninstallApplication operation shall raise the 
	 *            ApplicationUninstallationError exception when an internal error 
	 *            causes an unsuccessful uninstallation of the application.
	 */
	void uninstallApplication(
		const char * applicationId)
	throw (
		CF::DomainManager::ApplicationUninstallationError,
		CF::DomainManager::InvalidIdentifier,
		CORBA::SystemException);

	/**
	 * @brief The unregisterDevice operation is used to remove a device entry from 
	 *        the domain manager for a specific device manager.
	 *
	 * The unregisterDevice operation shall remove a device entry from the domain 
	 * manager.
	 * 
	 * The unregisterDevice operation shall release (client-side CORBA release) the
	 * unregisteringDevice from the domain manager.
	 * 
	 * The unregisterDevice operation shall disconnect the established connections 
	 * (including those made to the CORBA Event Service event channels) of the 
	 * unregistering device. Connections broken as a result of the unregisterDevice 
	 * operation shall be considered as “pending” for future connections when the 
	 * component to which the device was connected still exists.
	 * 
	 * The unregisterDevice operation may destroy the CORBA Event Service event 
	 * channel when no more consumers and producers are connected to it.
	 * 
	 * The unregisterDevice operation shall, upon the successful unregistration of a 
	 * device, write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
	 * 
	 * The unregisterDevice operation shall, upon unsuccessful unregistration of a 
	 * device, write a FAILURE_ALARM log record to a domain manager's log.
	 * 
	 * The unregisterDevice operation shall send a 
	 * DomainManagementObjectRemovedEventType event to the Outgoing Domain Management 
	 * event channel, upon successful unregistration of a device. For this event,
	 * 	1. The producerId is the identifier attribute of the domain manageinvalid new-expression of abstract class typer.
	 * 	2. The sourceId is the identifier attribute of the unregistered device.
	 * 	3. The sourceName is the label attribute of the unregistered device.
	 * 	4. The sourceCategory is “DEVICE”.
	 *
	 * @param[in] unregisteringDevice	Device needs to be uninstalled.
	 *
	 * @exception The unregisterDevice operation shall raise the CF 
	 *            InvalidObjectReference exception when the input parameter contains 
	 *            an invalid reference to a Device interface.
	 *            
	 *            The unregisterDevice operation shall raise the UnregisterError 
	 *            exception when an internal error exists which causes an unsuccessful 
	 *            unregistration.
	 */
	void
	unregisterDevice(
		CF::Device_ptr unregisteringDevice)
	throw (
		CF::DomainManager::UnregisterError,
		CF::InvalidObjectReference,
		CORBA::SystemException);

	/**
	 * @brief The unregisterDeviceManager operation is used to unregister a 
	 *        DeviceManager component from the domain manager. A device manager may 
	 *        be unregistered during run-time for dynamic extraction or maintenance 
	 *        of the device manager.
	 *
	 * The unregisterDeviceManager operation shall unregister a DeviceManager 
	 * component from the DomainManager.
	 * 
	 * The unregisterDeviceManager operation shall release all device(s) and 
	 * service(s) associated with the device manager that is being unregistered.
	 * 
	 * The unregisterDeviceManager operation shall disconnect the established 
	 * connections (including those made to the CORBA Event Service event channels) 
	 * of the unregistering device manager as well as for its registered devices and 
	 * services. Connections broken as a result of the unregisterDeviceManager 
	 * operation shall be considered as “pending” for future connections when the 
	 * component to which the device manager or its registered devices and services 
	 * were connected still exists. The unregisterDeviceManager operation may destroy 
	 * e CORBA Event Service channel when no more consumers and producers are 
	 * connected to it.
	 * 
	 * The unregisterDeviceManager operation shall unmount all device manager's file 
	 * systems from its file manager.
	 * 
	 * The unregisterDeviceManager operation shall, upon the successful unregistration 
	 * of a device manager, write an ADMINISTRATIVE_EVENT log record to a domain 
	 * manager's log.
	 * 
	 * The unregisterDeviceManager operation shall, upon unsuccessful unregistration 
	 * of a device manager, write a FAILURE_ALARM log record to a domain 
	 * manager's log.
	 * 
	 * The unregisterDeviceManager operation shall send a
	 * DomainManagementObjectRemovedEventType event to the Outgoing Domain Management
	 * event channel, upon successful unregistration of a device manager. 
	 * For this event,
	 * 	1. The producerId is the identifier attribute of the domain manager.
	 * 	2. The sourceId is the identifier attribute of the unregistered device manager.
	 * 	3. The sourceName is the label attribute of the unregistered device manager.
	 * 	4. The sourceCategory is “DEVICE_MANAGER”.
	 *
	 * @param[in] deviceMgr		DeviceManager needs to be uninstalled.
	 *
	 * @exception The unregisterDeviceManager operation shall raise the CF 
	 *            InvalidObjectReference when the input deviceMgr parameter contains 
	 *            an invalid reference to a DeviceManager interface.
	 *            
	 *            The unregisterDeviceManager operation shall raise the 
	 *            UnregisterError exception when an internal error exists which 
	 *            causes an unsuccessful unregistration.
	 */
	void
	unregisterDeviceManager(
		CF::DeviceManager_ptr deviceMgr)
	throw (
		CF::DomainManager::UnregisterError,
		CF::InvalidObjectReference,
		CORBA::SystemException);

	/**
	 * @brief The unregisterService operation is used to remove a service entry 
	 *        from the domain manager for a specific device manager.
	 *
	 * The unregisterService operation shall disconnect the established connections 
	 * (including those made to the CORBA Event Service event channels) of the 
	 * unregistering service indicated by the input unregisteringService parameter. 
	 * Connections broken as a result of the unregisterService operation shall be 
	 * considered as “pending” for future connections when the component to which
	 * the service was connected still exists.
	 * 
	 * The unregisterService operation shall remove the unregisteringService entry 
	 * specified by the input name parameter from the domain manager.
	 * 
	 * The unregisterService operation shall release (client-side CORBA release) the
	 * unregisteringService from the domain manager.
	 * 
	 * The unregisterService operation shall, upon the successful unregistration of 
	 * a service, write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
	 * 
	 * The unregisterService operation shall, upon unsuccessful unregistration of 
	 * a service, write a FAILURE_ALARM log record to a domain manager's log.
	 * 
	 * The unregisterService operation shall send a 
	 * DomainManagementObjectRemovedEventType event to the Outgoing Domain Management 
	 * event channel, upon successful unregistration of a service. For this event,
	 * 	1. The producerId is the identifier attribute of the domain manager.
	 * 	2. The sourceId is the identifier attribute of the componentinstantiation 
	 * 		element associated with the unregistered service.
	 * 	3. The sourceName is the input name parameter for the unregistering service.
	 * 	4. The sourceCategory is “SERVICE”.
	 *
	 * @param[in] unregisteringService	Service needs to be uninstalled.
	 * @param[in] name					Name of the service.
	 *
	 * @exception The unregisterService operation shall raise the CF 
	 *            InvalidObjectReference exception when the input parameter contains 
	 *            an invalid reference to a service interface.
	 *            
	 *            The unregisterService operation shall raise the UnregisterError 
	 *            exception when an internal error exists which causes an 
	 *            unsuccessful unregistration.
	 */
	void
	unregisterService(
		CORBA::Object_ptr unregisteringService,
		const char * name)
	throw (
		CF::DomainManager::UnregisterError,
		CF::InvalidObjectReference,
		CORBA::SystemException);

protected:
	void
	addDevMgr(
		CF::DeviceManager_ptr deviceMgr);

	void
	addDevMgrDevices(
		CF::DeviceManager_ptr deviceMgr);

	void
	addDevMgrServices(
		CF::DeviceManager_ptr deviceMgr);

	bool
	deviceMgrIsRegistered(
		CF::DeviceManager_ptr registeredDeviceMgr);

	void
	disconnectThisService(
		const char * serviceName);

	bool
	verifyFileExistence(
		const char* filepath);

	bool
	verifySPD(
		const char * spdPrfl);

	void
	storeServiceInDomainMgr(
		CORBA::Object_ptr registeringService,
		CF::DeviceManager_ptr registeredDeviceMgr,
		const char * name);

	void
	establishServiceConnections(
		CF::Device_ptr registeringDevice,
		CF::DeviceManager_ptr registeredDeviceMgr);

	bool
	serviceIsRegistered(
		const char * serviceName);

	bool
	deviceIsRegistered(
		CF::Device_ptr);

	void
	removeDeviceFromDomainMgr(
		CF::Device_ptr unregisteringDevice);

	/**
	 * @brief This function removes the registeringService and its name to the DomainMgr.
	 *        if the service already exists it does nothing.
	 */
	void
	removeServiceFromDomainMgr(
		CORBA::Object_ptr registeringService,
		const char * name);

	void
	removeDeviceMgrDevices(
		CF::DeviceManager_ptr deviceMgr);

	void
	removeDeviceMgrServices(
		CF::DeviceManager_ptr deviceMgr);

	void
	removeDeviceMgr(
		CF::DeviceManager_ptr deviceMgr);

	//create naming structure for the whole domain
	void
	createNamingStructure();

private:
	/**
	 * The applications attribute is read-only containing a sequence of instantiated
	 * Applications in the domain. The readonly applications attribute shall contain
	 * the list of Applications that have been instantiated. The domain manager shall
	 * write an ADMINISTRATIVE_EVENT log record to a domain manager's log, when the
	 * application's attribute is obtained by a client.
	 */
	CF::DomainManager::ApplicationSequence m_apps;

	/**
	 * The deviceManagers attribute is read-only containing a sequence of registered
	 * device managers in the domain. The readonly deviceManagers attribute shall
	 * contain a list of registered device managers that have registered with the
	 * domain manager. The domain manager shall write an ADMINISTRATIVE_EVENT log to a
	 * domain manager's log, when the deviceManagers attribute is obtained by a client.
	 *
	 */
	CF::DomainManager::DeviceManagerSequence m_devMgrs;

	/**
	 * The domainManagerProfile attribute contains the domain manager's Profile
	 * Descriptor.
	 * The readonly domainManagerProfile attribute shall contain a profile element
	 * (Profile Descriptor) with a file reference to the DomainManager Configuration
	 * Descriptor (DMD) file. Files referenced within the profile are obtained via the
	 * domain manager's FileManager.
	 */
	std::string m_dmnMgrPrf;

	/**
	 * The readonly fileMgr attribute shall contain the domain manager file manager.
	 * The domain manager shall write an ADMINISTRATIVE_EVENT log record to a domain
	 * manager's log, when the fileMgr attribute is obtained by a client.
	 */
	CF::FileManager_var m_fileManager;

	CF::FileSystem_var m_fileSys;

	/**
	 * The readonly identifier attribute shall contain a unique identifier for a
	 * DomainManager instance. The identifier shall be identical to the
	 * domainmanagerconfiguration element id attribute of the domain manager's
	 * Descriptor (DMD) file.
	 */
	std::string m_id;

	/**
	 * The readonly applicationFactories attribute shall contain a list with one
	 * application factory per application (SAD file and associated files)
	 * successfully installed (i.e. no exception raised). The domain manager shall
	 * write an ADMINISTRATIVE_EVENT log record to a domain manager's log, when the
	 * applicationFactories attribute is obtained by a client.
	 */
	CF::DomainManager::ApplicationFactorySequence m_appFacts;

	CosEventChannelAdmin::EventChannel_var IDM_channel;

	/**
	 * todo Move all Event channel support into opensca support
	 */
	CosEventChannelAdmin::EventChannel_var ODM_channel;

	CosEventChannelAdmin::ProxyPushConsumer_var ODM_Channel_consumer;

	///The pointer of event Channel Manager instantiation
//	EventChannelManagerServant* 		m_evtChannelMgrServant;

	DMDParser * m_dmdParser;
	SPDParser * m_dmdSpdParser;
	std::vector<DeviceNode *> m_devNodes;
	std::vector<ServiceNode *> m_srvNodes;
	std::vector<UsesConnectionInfo *> m_pendingConnections;
};

/**
 * @brief The class used to describle a service, containing service's
 *        object reference, name and device manager which the service belongs to.
 */
class ServiceNode {
public:
	CF::DeviceManager_ptr m_devMgrPtr;
	char * m_name;
	CORBA::Object_ptr m_objectPtr;

	ServiceNode()
	: m_name(NULL) {

	}

	~ServiceNode() {

	}
};

/**
 * @brief	The class used to describle a device, containing device's object
 *        	reference, label, software profile and properties, and device manager
 *        	which the device belongs to.
 */
class DeviceNode {
public:
	CF::Device_ptr m_devicePtr;
	CF::DeviceManager_ptr m_devMgrPtr;
	char * m_label;
	CF::Properties m_properties;
	char * m_softwareProfile;

	DeviceNode()
	: m_softwareProfile(NULL), m_label(NULL) {

	}

	~DeviceNode() {

	}
};
#endif // !defined(EA_25297BB4_B3F9_4505_8EA1_A199CC7D3AD2__INCLUDED_)
