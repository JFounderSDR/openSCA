/***************************************************************************//**
* @file     DomainManager_impl.cpp
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

#include "tao/IORTable/IORTable.h"

#include "../include/DomainManager_impl.h"
#include "FileManager_impl.h"
#include "FileSystem_impl.h"
#include "ConfigParser.h"

#ifdef __SDS_OS_VXWORKS__
#include <vxworks.h>
#include <semLib.h>
SEM_ID semAppsMutex;
#endif

DomainManager_impl::DomainManager_impl(
    const char * dmdPrf,
    const char * rootfs) {

	DEBUG(7, DomainManager_impl, "In DomainMgr constructor.")
	m_id = "qwerasdfzxcv";
	//create mutex lock to prevent to access the container 'apps' simultaneously
#ifdef __SDS_OS_VXWORKS__
	semAppsMutex = semBCreate(SEM_Q_PRIORITY, SEM_FULL);
	if (semAppsMutex == NULL) {
		DEBUG(5, DomainManager_impl,
		"[DomainManager_impl] create appsmutex error in constructor ")
	}
#endif
	m_dmdParser = NULL;
	m_dmdSpdParser = NULL;
	m_dmnMgrPrf = dmdPrf;
	m_apps.length(0);

	//create file manager in domain
	FileManager_impl * fileMgr = new FileManager_impl();
	m_fileManager = fileMgr->_this();

	//create file system in domain
	FileSystem_impl * fileSys = new FileSystem_impl(rootfs);
	m_fileSys = fileSys->_this();

	//mount this filesystem into filemgr in domain
	try {
		DEBUG(5, DomainManager_impl::DomainManager_impl,
		    "in constructor will to mount")
		m_fileManager->mount(rootfs, m_fileSys);
	} catch (CF::InvalidFileName & e) {
		DEBUG(5, DomainManager_impl::DomainManager_impl, "m_fileManager->mount \
			failed with invalide file name:" << rootfs)
		exit(EXIT_FAILURE);
	} catch (CF::FileManager::InvalidFileSystem & e) {
		DEBUG(5, DomainManager_impl::DomainManager_impl,
			"m_fileManager->mount failed with invalid file system.")
		exit(EXIT_FAILURE);
	} catch (CF::FileManager::MountPointAlreadyExists & e) {
		DEBUG(5, DomainManager_impl::DomainManager_impl,
			"m_fileManager->mount failed with MountPointAlreadyExists.")
		exit(EXIT_FAILURE);
	} catch (CORBA::SystemException & e) {
		DEBUG(5, DomainManager_impl::DomainManager_impl,
			"m_fileManager->mount failed with CORBA::SystemException.")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(5, DomainManager_impl::DomainManager_impl,
		    "m_fileManager->mount failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	//open dmd.xml and parser it, then close
	CF::File_var dmdfl;
	if (!openProfileFile(m_fileManager.in(), m_dmnMgrPrf.c_str(), dmdfl))
		return;

	DEBUG(5, DomainManager_impl::DomainManager_impl,
	    "in constructor will to instantiate DMDParser")
	m_dmdParser = new DMDParser(dmdfl);
	closeProfileFile(dmdfl.in());

	DEBUG(5, DomainManager_impl::DomainManager_impl,
	    "will to call _dmdparser->getID with m_dmdParser" << m_dmdParser)

	DEBUG(5, DomainManager_impl::DomainManager_impl, 
		" call _dmdparser->getID finished")

	//extract sca platform root from dmd.xml
	std::string fulDmnMgrSpd = replaceFileNameofPath(m_dmnMgrPrf.c_str(),
								m_dmdParser->getDomainManagerSoftPkg());
	DEBUG(7, DomainManager_impl::DomainManager_impl,
	      "domain manager softpkg is: " << fulDmnMgrSpd)

	//parser domainManager spd.xml
	CF::File_var dmdSpdFl;
	if (!openProfileFile(m_fileManager.in(), fulDmnMgrSpd.c_str(), dmdSpdFl))
		return;

	m_dmdSpdParser = new SPDParser(dmdSpdFl);
	closeProfileFile(dmdSpdFl.in());

	//create naming structure for the whole domain
	createNamingStructure();

	DEBUG(2, DomainManager::DomainManager_impl, 
		"Leaving DomainManager constructor.")
}

DomainManager_impl::~DomainManager_impl() {
	DEBUG(7, DomainManager_impl::DomainManager_impl, 
		"In DomainManager destructor.")

	if (!m_dmdSpdParser)
		delete m_dmdSpdParser;

	if (!m_dmdParser)
		delete m_dmdParser;
}

CF::DomainManager::ApplicationFactorySequence *
DomainManager_impl::applicationFactories()
throw (CORBA::SystemException) {
	DEBUG(3, DomainManager_impl, "In applicationFactories.")

	CF::DomainManager::ApplicationFactorySequence_var appFactSeq;
	try {
		appFactSeq =
		    new CF::DomainManager::ApplicationFactorySequence(m_appFacts);
	} catch (...) {
		DEBUG(5, DomainManager_impl::DomainManager_impl,
			"new CF::Application failed with Unknown Exception.")
		throw;
	}
	return appFactSeq._retn();
}

CF::DomainManager::ApplicationSequence *
DomainManager_impl::applications()
throw (CORBA::SystemException) {
	DEBUG(7, DomainManager_impl::applications, "In applications.")

#ifdef __SDS_OS_VXWORKS__
	semTake(semAppsMutex, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
	sds_lock(BOOST_CONSTANT::APP_MUTEX_CND);
#endif

	CF::DomainManager::ApplicationSequence_var apps;
	try {
		apps = new CF::DomainManager::ApplicationSequence(m_apps);
	} catch (...) {
		DEBUG(5, DomainManager_impl::applications,
		"new CF::Application failed with Unknown Exception.")

#ifdef __SDS_OS_VXWORKS__
		semGive(semAppsMutex);
#elif defined __SDS_OS_LINUX__
		sds_unlock(BOOST_CONSTANT::APP_MUTEX_CND);
#endif
		throw;
	}

#ifdef __SDS_OS_VXWORKS__
	semGive(semAppsMutex);
#elif defined __SDS_OS_LINUX__
	sds_unlock(BOOST_CONSTANT::APP_MUTEX_CND);
#endif
	return apps._retn();
}

CF::DomainManager::DeviceManagerSequence *
DomainManager_impl::deviceManagers()
throw (CORBA::SystemException) {
	DEBUG(7, DomainManager_impl, "In deviceManagers.")

	CF::DomainManager::DeviceManagerSequence_var devMgrs;
	try {
		devMgrs = new CF::DomainManager::DeviceManagerSequence(m_devMgrs);
	} catch (...) {
		DEBUG(5, DomainManager_impl::DomainManager_impl, 
		    "new CF::Application failed with Unknown Exception.")
		throw;
	}

	return devMgrs._retn();
}

char *
DomainManager_impl::domainManagerProfile()
throw (CORBA::SystemException) {
	return CORBA::string_dup(m_dmnMgrPrf.c_str());
}

CF::FileManager_ptr
DomainManager_impl::fileMgr()
throw (CORBA::SystemException) {
	return CF::FileManager::_duplicate(m_fileManager);
}

char *
DomainManager_impl::identifier()
throw (CORBA::SystemException) {
	return CORBA::string_dup(m_id.c_str());
}

/**
 * The installApplication operation is used to install new application software in
 * the domain.
 * The input profileFileName parameter is the absolute pathname of the application SAD.
 * The installApplication operation shall verify the existence of the application's SAD
 * file and all files upon which the SAD depends, within the domain manager's file manager.
 * The installApplication operation shall write an ADMINISTRATIVE_EVENT log record to a
 * domain manager's log, upon successful application installation.
 * The installApplication operation shall, upon unsuccessful application installation,
 * write a FAILURE_ALARM log record to a domain manager's log.
 * The installApplication operation shall send a DomainManagementObjectAddedEventType
 * event to the Outgoing Domain Management event channel, upon successful installation
 * of an application. For this event,
 *  1. The producerId is the identifier attribute of the domain manager.
 *  2. The sourceId is the identifier attribute of the installed application factory.
 *  3. The sourceName is the name attribute of the installed application factory.
 *  4. The sourceIOR is the object reference for the installed application factory.
 *  5. The sourceCategory is "APPLICATION_FACTORY".
 */
void
DomainManager_impl::installApplication(
    const char * profileFileName)
throw (
    CF::DomainManager::ApplicationInstallationError,
    CF::InvalidFileName,
    CF::InvalidProfile,
    CORBA::SystemException) {
	
	DEBUG(1, DomainManager_impl, "In installApplication.")
	if (strstr(profileFileName, "sad.xml") == NULL) {
		DEBUG(5, DomainManager_impl::installApplication,
		    "SAD file is invalid.")
		throw CF::InvalidFileName();
	}

	//verify the existence of application'SAD file
	if (!verifyFileExistence(profileFileName)) {
		DEBUG(5, DomainManager_impl::installApplication,
		    profileFileName << "don't exist")
		throw CF::InvalidFileName();
	}

	//parser SAD.xml and verify all file upon which SAD.xml depends
	CF::File_var sadfl;
	if (!openProfileFile(m_fileManager.in(), profileFileName, sadfl))
		return;

	//intend to validate syntax error SAD.xml
	SADParser sadParser(sadfl);
	DEBUG(7, DomainManager_impl, "parse SAD.xml finished.")
	closeProfileFile(sadfl.in());

	// extract platform root from full sad.xml path
	std::string fltRoot = "";
	std::string sadPath = profileFileName;
	size_t pos = sadPath.find_first_of("/");
	fltRoot = sadPath.substr(0, pos);
	std::vector<SADComponentPlacement*> * sadCompPlacs = 
		sadParser.getComponents();

	for (int numComp(0); numComp < sadCompPlacs->size();
	        numComp++) {
		std::string spdf =
		    sadParser.getSPDById((*sadCompPlacs)[numComp]->getFileRefId());
		//obtain full path
		std::string spdPath = fltRoot;
		spdPath.append("/");
		spdPath.append(spdf);
		DEBUG(7, DomainManager_impl::installApplication,
		    "spdPath is:" << spdPath << "in round:" << numComp)
		if (!verifySPD(spdPath.c_str())) {
			DEBUG(5, DomainManager_impl,
			    "[DomainManager_impl::installApplication]" << 
			    spdPath << " is invalid.")
			throw CF::InvalidProfile();
		}
	}

	bool appFactInstalled = false;
	std::string appName = sadParser.getName();
	CORBA::ULong appFactLength = m_appFacts.length();
	for (CORBA::ULong i = 0; i < appFactLength; ++i) {
		if (0 == strcmp(appName.c_str(), m_appFacts[i]->name())) {
			appFactInstalled = true;
			break;
		}
	}

	if (!appFactInstalled) {
		//instantiate ApplicationFactory by sad.xml
		ApplicationFactory_impl* appFact =
		new ApplicationFactory_impl(profileFileName, &m_apps);

		m_appFacts.length(appFactLength + 1);
		m_appFacts[appFactLength] = appFact->_this();
	}

	//send a DomainManagementObjectAddedEventType  event to the Outgoing Domain Management
	//event channel, upon successful installation of an application
	openscaSupport::sendObjAdded_event(
	    m_id.c_str(),
	    sadParser.getID(),
	    sadParser.getName(),
	    (CORBA::Object_var) NULL,
	    StandardEvent::APPLICATION_FACTORY);

	DEBUG(3, DomainManager_impl, "Leaving installApplication.")
}

//verify the existence of file in filesystem
bool
DomainManager_impl::verifyFileExistence(
    const char * filepath) {
	bool existFlag = false;
	try {
		existFlag = m_fileManager->exists(filepath);
	} catch (CF::InvalidFileName & e) {
		DEBUG(5, DomainManager_impl::verifyFileExistence,
		    "m_fileManager->exists failed with invalid name:" << filepath)
		return false;
	} catch (CORBA::SystemException & e) {
		DEBUG(5, DomainManager_impl::verifyFileExistence,
		    "m_fileManager->exists failed with CORBA::SystemException:")
		return false;
	} catch (...) {
		DEBUG(5, DomainManager_impl::verifyFileExistence,
		    "m_fileManager->exists failed with Unknown Exception.")
		return false;
	}
	return existFlag;
}

//verify the existence and validation of spd.xml, and verify scd.xml and prf.xml on which
// spd.xml for every components
bool
DomainManager_impl::verifySPD(
    const char * spdPrfl) {
	if (spdPrfl == NULL)
		return false;

	try {
		//verify the existence of spd.xml in filesystem
		if (!verifyFileExistence(spdPrfl)) {
			std::cerr << "[DomainManager_impl::verifySPD]" << 
				spdPrfl << " don't exist." << std::endl;
			return false;
		}

		// check the filename ends with the extension given in the spec
		if ((strstr(spdPrfl, ".spd.xml")) == NULL)
			std::cerr << "File " << spdPrfl << 
				" should end with .spd.xml" << std::endl;

		DEBUG(5, DomainManager_impl,
		    "[DomainManager::verifySPD] Validating: " << spdPrfl)
		
		CF::File_var spdfl, prffl, scdfl;

		if (!openProfileFile(m_fileManager.in(), spdPrfl, spdfl))
			return false;
		//intend to validate syntax error SPD.xml
		SPDParser spdParser(spdfl);
		closeProfileFile(spdfl.in());

		// query SPD for PRF
		std::string prfPath = 
			replaceFileNameofPath(spdPrfl, spdParser.getPRFFile());

		if (!this->verifyFileExistence(prfPath.c_str())) {
			std::cerr << "[DomainManager_impl::verifySPD]" << prfPath
			    << " don't exist." << std::endl;
			return false;
		}

		// check the file name ends with the extension given in the spec
		if (((strstr(spdParser.getPRFFile(), ".prf.xml")) == NULL) &&
		      strlen(spdParser.getPRFFile()))
			std::cerr << "File " << spdParser.getPRFFile()
			    << " should end in .prf.xml." << std::endl;

		if (!openProfileFile(m_fileManager.in(), prfPath.c_str(), prffl))
			return false;
		//intend to validate syntax error PRF.xml
		closeProfileFile(prffl.in());

		// query SPD for SCD
		std::string scdPath = 
			replaceFileNameofPath(spdPrfl, spdParser.getSCDFile());
		if (!verifyFileExistence(scdPath.c_str())) {
			std::cerr << "[DomainManager_impl::verifySPD]" << 
				scdPath << " don't exist." << std::endl;
			return false;
		}

		// Check the filename ends with  the extension given in the spec
		if ((strstr(scdPath.c_str(), ".scd.xml")) == NULL)
			std::cerr << "File " << spdParser.getSCDFile() << 
				" should end with .scd.xml." << std::endl;

		if (!openProfileFile(m_fileManager.in(), scdPath.c_str(), scdfl))
			return false;
		//intend to validate syntax error SCD.xml
		closeProfileFile(scdfl.in());
	} catch (CF::InvalidFileName ex) {
		throw CF::DomainManager::ApplicationInstallationError(
			CF::CFEBADF, ex.msg);
	}

	return true;
}

/**
 * The registerDevice operation is used to register a device for a specific device
 * manager with the domain manager.
 * The registerDevice operation shall verify that the input parameters, registeringDevice
 * and registeredDeviceMgr, are not nil CORBA object references.
 * The registerDevice operation shall add the device indicated by the input registeringDevice
 * parameter and the device's attributes to the domain manager, if it does not already exist.
 * The registerDevice operation shall return without exception and not register a new device
 * when that device, indicated by the input registeringDevice parameter, has the same identifier
 * attribute as a previously registered device and the reference to the registered device refers
 * to an existing object.
 * The registerDevice operation shall register the new device indicated by the input
 * registeringDevice parameter, when the previously registered device has the same identifier
 * attribute as the new device and the reference to the registered device refers to nonexistent object.
 * The registerDevice operation shall write an ADMINISTRATIVE_EVENT log record when reference
 * to the registered device refers to a nonexistent object.
 * The registerDevice operation associates the device indicated by the input registeringDevice
 * parameter with the device manager indicated by the input registeredDeviceMgr parameter when the
 * device manager is a valid registered DeviceManager in the domain manager.
 * The registerDevice operation shall establish any pending connections from previously registered
 * device managers when the registering device completes these connections.
 * The registerDevice operation shall write an ADMINISTRATIVE_EVENT log record to a domain manager log upon
 * successful device registration.
 */
void
DomainManager_impl::registerDevice(
    CF::Device_ptr registeringDevice,
    CF::DeviceManager_ptr registeredDeviceMgr)
throw (
    CF::DomainManager::RegisterError,
    CF::DomainManager::DeviceManagerNotRegistered,
    CF::InvalidProfile,
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	DEBUG(2, DomainManager_impl, "In registerDevice.")

	//verify that registeringDevice is nil
	if (CORBA::is_nil(registeringDevice)) {
		DEBUG(5, DomainManager_impl::registerDevice, 
			"input registeringDevice parameter is nil.")
		throw CF::InvalidObjectReference();
	}

	//verify that registeredDevicemgr is nil
	if (CORBA::is_nil(registeredDeviceMgr)) {
		DEBUG(5, DomainManager_impl::registerDevice,
		    "input registeredDeviceMgr parameter is nil.")
		throw CF::InvalidObjectReference();
	}

	//validate if the devMgr indcated by the input parameter is registered in domain
	bool foundDevMgr = false;
	for (int numDevMgr = 0; numDevMgr < m_devMgrs.length();
	        numDevMgr++) {
		if (strcmp(registeredDeviceMgr->identifier(),
		        m_devMgrs[numDevMgr]->identifier()) == 0) {
			foundDevMgr = true;
			break;
		}
	}

	if (!foundDevMgr) {
		DEBUG(5, DomainManager_impl::registerDevice,
		    "the input devmgr is not registered in domain.")
		throw CF::DomainManager::DeviceManagerNotRegistered();
	}

	bool foundDev = false;
	for (int numDev = 0; numDev < m_devNodes.size(); numDev++) {
		if (strcmp(registeringDevice->identifier(),
		        m_devNodes[numDev]->m_label) == 0) {
			return;
		}
	}

	if (!foundDev) {
		DeviceNode* devNode = new DeviceNode();
		devNode->m_devicePtr = CF::Device::_duplicate(registeringDevice);
		devNode->m_devMgrPtr =
		    CF::DeviceManager::_duplicate(registeredDeviceMgr);
		devNode->m_label = CORBA::string_dup(registeringDevice->identifier());
		devNode->m_softwareProfile =
		    CORBA::string_dup(registeringDevice->softwareProfile());
		//\TODO get properties from registeringDevice
		m_devNodes.push_back(devNode);
	}
}

/**
 * The registerDeviceManager operation is used to register a device manager, its
 * device(s), and its services. Software profiles may be obtained from the device
 * manager's FileSystem.
 * The registerDeviceManager operation verifies that the input deviceMgr parameter
 * is a not a nil CORBA object reference.
 * The registerDeviceManager operation shall add the device manager indicated
 * by the input deviceMgr parameter to the DomainManager deviceManagers attribute,
 * if it does not already exist. The registerDeviceManager operation shall add the
 * input device manager's registered devices and each registered device's attributes
 * (e.g., identifier, softwareProfile, allocation properties, etc.) to the domain manager.
 * The domain manager associates the input device manager's registered devices with the
 * device manager in order to support the unregisterDeviceManager operation.
 * The registerDeviceManager operation shall add all the services contained in
 * the registering device manager's registeredServices attribute to the domain manager.
 * The registerDeviceManager operation associates the device manager indicated
 * by the input deviceMgr parameter with its registered services in the domain
 * manager in order to support the unregisterDeviceManager operation.
 * The registerDeviceManager operation shall return without exception and not
 * register a new device manager when that device manager, indicated by the input
 * deviceMgr parameter, has the same identifier attribute as a previously registered
 * device manager and the reference to the registered device manager refers to an
 * existing object.
 * The registerDeviceManager operation shall register the new device manager
 * indicated by the input deviceMgr parameter, when the previously registered device
 * manager has the same identifier attribute as the new device manager and the reference
 * to the registered device manager refers to a nonexistent object.
 * The registerDeviceManager operation shall write an ADMINISTRATIVE_EVENT log
 * record when reference to the registered device manager refers to a nonexistent object.
 * The registerDeviceManager operation shall establish any connections for the
 * device manager indicated by the input deviceMgr parameter, which are specified in the
 * connections element of the device manager's Device Configuration Descriptor (DCD) file,
 * that are possible with the current set of registered devices and services. Connections
 * not currently possible are left unconnected pending future device service registrations.
 * For connections established for a CORBA Event Service's event channel, the
 * registerDeviceManager operation shall connect a CosEventComm::PushConsumer or
 * CosEventComm::PushSupplier object to the event channel as specified in the DCD��s domainfinder
 * element. If the event channel does not exist, the registerDeviceManager operation shall
 * create the event channel. The registerDeviceManager operation shall obtain all the software
 * profiles from the registering device manager's file systems.
 * The registerDeviceManager operation shall mount the device manager's file system to the
 * domain manager's file manager. The mounted FileSystem name shall have the format,
 * "/DomainName/HostName", where DomainName is the name of the domain and HostName is the
 * input deviceMgr's label attribute.
 * The registerDeviceManager operation shall, upon unsuccessful device manager registration,
 * write a FAILURE_ALARM log record to a domain manager's Log.
 * The registerDeviceManager operation shall send a DomainManagementObjectAddedEventType
 * event to the Outgoing Domain Management event channel upon successful registration of
 * a device manager. For this event,
 *   1. The producerId is the identifier attribute of the domain manager.
 *   2. The sourceId is the identifier attribute of the registered device manager.
 *   3. The sourceName is the label attribute of the registered device manager.
 *   4. The sourceIOR is the object reference for the registered device manager.
 *   5. The sourceCategory is "DEVICE_MANAGER".
 */
void
DomainManager_impl::registerDeviceManager(
    CF::DeviceManager_ptr deviceMgr)
throw (
    CF::DomainManager::RegisterError,
    CF::InvalidProfile,
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	DEBUG(2, DomainManager_impl::registerDeviceManager, "enter in")

	if (CORBA::is_nil(deviceMgr)) {
		throw CF::InvalidObjectReference();
	}

	// add device manager to list
	DEBUG(5, DomainManager_impl::registerDeviceManager, 
		"Adding DeviceManager ref to list")
	addDevMgr(CF::DeviceManager::_duplicate(deviceMgr));

	openscaSupport::sendObjAdded_event(
	    m_id.c_str(),
	    deviceMgr->identifier(),
	    deviceMgr->label(),
	    (CORBA::Object_var) NULL,
	    StandardEvent::DEVICE_MANAGER);

	//mount filesystem under "/DomainName1/<deviceMgr.label>"
	DEBUG(2, DomainManager_impl::registerDeviceManager, \
		"Mounting DeviceManager FileSystem")

	std::string mountPoint = "/";
	mountPoint += deviceMgr->label();

	try {
		m_fileManager->mount(mountPoint.c_str(), deviceMgr->fileSys());
	} catch (CF::InvalidFileName & _ex) {
		DEBUG(5, DomainManager_impl::registerDeviceManager,
		    "While mounting DevMgr FileSys: " << _ex.msg)
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(5, DomainManager_impl::registerDeviceManager,
		    " While mounting DevMgr FileSys: Unknown Exception")
		exit(EXIT_FAILURE);
	}
	DEBUG(2, DomainManager_impl::registerDeviceManager, 
		"Adding DeviceManager Devices to list")
	//add all devices under device manager to registereddevice att.
	//associate input deviceMgr with registeredDevices
	addDevMgrDevices(deviceMgr);

	DEBUG(2, DomMgr, "Leaving DomainManager::registerDeviceManager")
}

void
DomainManager_impl::addDevMgr(
    CF::DeviceManager_ptr deviceMgr) {
	DEBUG(2, DomainManager_impl::addDevMgr, 
		"Entering DomainManager::addDeviceMgr")

	if (!deviceMgrIsRegistered(deviceMgr)) {
		m_devMgrs.length(m_devMgrs.length() + 1);
		m_devMgrs[m_devMgrs.length() - 1] = deviceMgr;
	}

	DEBUG(5, DomainManager_impl::addDevMgr, 
		"Leaving DomainManager::addDeviceMgr")
}

//This function returns TRUE if the input registeredDeviceMgr is contained
//in the _deviceManagers list attribute
bool
DomainManager_impl::deviceMgrIsRegistered(
    CF::DeviceManager_ptr registeredDeviceMgr) {
	//Look for registeredDeviceMgr in _deviceManagers
	for (int i = 0; i < m_devMgrs.length(); i++) {
		if (strcmp(m_devMgrs[i]->identifier(),
		        registeredDeviceMgr->identifier()) == 0) {
			return true;
		}
	}
	return false;
}

void
DomainManager_impl::addDevMgrDevices(
    CF::DeviceManager_ptr deviceMgr) {
	DEBUG(2, DomainManager_impl::addDevMgrDevices, 
		"Entering DomainManager::addDeviceMgrDevices")

	CF::DeviceSequence * devices;
	devices = deviceMgr->registeredDevices();

	//Call registerDevice for each device in the DeviceMgr
	for (int i = 0; i < devices->length(); i++) {
		CF::Device_ptr _dev = (*devices)[i];
		registerDevice(_dev, deviceMgr);
	}
	//The registerDevice operation will try to establish any service connections specified in the
	//deviceMgr's DCD for each device.
	DEBUG(2, DomainManager_impl::addDevMgrDevices, 
		"Leaving DomainManager::addDeviceMgrDevices")
}

void
DomainManager_impl::addDevMgrServices(
    CF::DeviceManager_ptr deviceMgr) {
	DEBUG(2, DomainManager_impl::addDevMgrServices, "Entering in")

	CF::DeviceManager::ServiceSequence * services;
	services = deviceMgr->registeredServices();

	//Call registerService for each service in the DeviceMgr
	for (int i = 0; i < services->length(); i++) {
		//(CF::Device_ptr)&devices[i];
		CF::DeviceManager::ServiceType serv = (*services)[i];
		registerService(serv.serviceObject, deviceMgr, serv.serviceName);
	}

	//Note: The registerService operation will establish any pending connection for the registering service
	DEBUG(2, DomainManager_impl::addDevMgrServices, "Leaving...")
}

/**
 * The registerService operation is used to register a service for a specific
 * device manager with the domain manager.
 * The registerService operation shall verify the input registeringService and
 * registeredDeviceMgr are valid object references.
 * The registerService operation shall verify the input registeredDeviceMgr
 * has been previously registered with the domain manager.
 * The registerService operation shall add the registeringService's object
 * reference and the registeringService's name to the domain manager, if the name
 * for the type of service being registered does not exist within the domain manager.
 * The registerService operation shall return without exception and not register a new
 * service when that service, indicated by the input registeringService parameter,
 * has the same name and type as a previously registered service and the reference
 * to the registered service refers to an existing object.
 * The registerService operation shall register the new service, indicated by the input
 * registeringService parameter, when the previously registered service has the same
 * name and type as the new service and the reference to the registered service refers
 * to a nonexistent object.
 * The registerService operation shall write an ADMINISTRATIVE_EVENT log record when
 * reference to the registered service refers to a nonexistent object.
 * The registerService operation shall associate the input registeringService
 * parameter with the input registeredDeviceMgr parameter in the domain manager, when the
 * registeredDeviceMgr parameter indicates a device manager that is registered
 * with the domain manager.
 * The registerService operation shall establish any pending connections from
 * previously registered device managers when the registering service completes
 * these connections.
 * The registerService operation shall, upon successful service registration,
 * write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
 * The registerService operation shall, upon unsuccessful service registration,
 * write a FAILURE_ALARM log record to a domain manager's log.
 * The registerService operation shall send a DomainManagementObjectAddedEventType
 * event to the Outgoing Domain Management event channel, upon successful
 * registration of a service. For this event,
 *  1. The producerId is the identifier attribute of the domain manager.
 *  2. The sourceId is the identifier attribute of the componentinstantiation
 *     element associated with the registered service.
 *  3. The sourceName is the input name parameter for the registering service.
 *  4. The sourceIOR is the object reference for the registered service.
 *  5. The sourceCategory is "SERVICE".
 */
void
DomainManager_impl::registerService(
    CORBA::Object_ptr registeringService,
    CF::DeviceManager_ptr registeredDeviceMgr,
    const char * name)
throw (
    CF::DomainManager::RegisterError,
    CF::DomainManager::DeviceManagerNotRegistered,
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	//Verify they are not a nil reference
	if (CORBA::is_nil(registeringService) || 
		CORBA::is_nil(registeredDeviceMgr)) {

		throw (CF::InvalidObjectReference("Cannot register Service. Either \
			registeringService or DeviceMgr is a nil reference."));
	}

	//The registerService operation shall verify the input registeredDeviceMgr has been previously
	//registered with the DomainManager.

	//Verify that input is a registered DeviceManager
	if (!deviceMgrIsRegistered(registeredDeviceMgr)) {
		DEBUG(5, DomainManager_impl::registerService,
		    "deviceMgr is not registered.")
		throw CF::DomainManager::DeviceManagerNotRegistered();
	}

	//Add registeringService and its name to domain manager
	storeServiceInDomainMgr(registeringService, registeredDeviceMgr, name);

	//establishPendingServiceConnections(name);
}

/**
 * The registerWithEventChannel operation is used to connect a consumer to a
 * domain's event channel.
 * The registerWithEventChannel operation shall connect the object identified by
 * the input registeringObject parameter to an event channel as specified by the
 * input eventChannelName parameter.
 */
void 
DomainManager_impl::registerWithEventChannel(
		CORBA::Object_ptr registeringObject,
		const char* registeringId,
		const char* eventChannelName)
throw (
		CF::DomainManager::AlreadyConnected,
        CF::DomainManager::InvalidEventChannelName,
        CF::InvalidObjectReference, 
        CORBA::SystemException)
{
	
}

/**
 * The unregisterFromEventChannel operation is used to disconnect a consumer from
 * a domain's event channel. 
 * The unregisterFromEventChannel operation shall disconnect a registered component
 * from the event channel as identified by the input parameters.
 */
void 
DomainManager_impl::unregisterFromEventChannel(
		const char* unregisteringId,
		const char* eventChannelName) 
throw (
		CF::DomainManager::NotConnected,
        CF::DomainManager::InvalidEventChannelName,
		CORBA::SystemException)
{

}

void
DomainManager_impl::establishServiceConnections(
    CF::Device_ptr registeringDevice,
    CF::DeviceManager_ptr registeredDeviceMgr) {
	//get DCD's connections
	CF::File_var dcd;
	if (!openProfileFile(m_fileManager.in(), 
			registeredDeviceMgr->deviceConfigurationProfile(), dcd))
		return;

	DCDParser dcdParser(dcd);
	closeProfileFile(dcd.in());

	std::vector<Connection*> * connection = dcdParser.getConnections();

	for (int numConnections = connection->size() - 1; numConnections >= 0;
	        numConnections--) {
		UsesPort * usesPortParser =
		    (*connection)[numConnections]->getUsesPort();
		FindBy * findUsesPortBy = usesPortParser->getFindBy();
		ProvidesPort * providesPortParser = NULL;
		FindBy * findProvidesPortBy = NULL;

		if ((*connection)[numConnections]->isProvidesPort())
			providesPortParser =
			    (*connection)[numConnections]->getProvidesPort();
		else if ((*connection)[numConnections]->isFindBy())
			findProvidesPortBy = (*connection)[numConnections]->getFindBy();

		//get the connections that involve this device
		int deviceIsUsing = -1;
		if (0 == strcmp(usesPortParser->getID(), 
						registeringDevice->label()))
			deviceIsUsing = 1;
		else if (0 == strcmp(providesPortParser->getID(), 
							registeringDevice->label()))
			deviceIsUsing = 0;

		if (deviceIsUsing < 0)
			continue;

		char serviceName[128];
			//verify that the service is registered
		if (deviceIsUsing) {
			strcpy(serviceName, providesPortParser->getID());
		} else {
			strcpy(serviceName, usesPortParser->getID());
		}

		if (serviceIsRegistered(serviceName)) {
				//get object pointers
				//establish the connection
			CORBA::Object_var usesObj;
			CORBA::Object_var providesObj;

			if (providesPortParser != NULL)
				findProvidesPortBy = providesPortParser->getFindBy();

			if (findUsesPortBy->isFindByNamingService()) {
				while (CORBA::is_nil(usesObj));
			}

			if (findProvidesPortBy->isFindByNamingService()) {
				while (CORBA::is_nil(providesObj));
			}

			CF::PortSupplier_ptr usesPort =
			CF::PortSupplier::_narrow(usesObj);
			CF::PPort_ptr port =
			CF::PPort::_narrow(usesPort->getPort(usesPortParser->getID()));
			port->connectPort(providesObj,
				CORBA::string_dup((*connection)[numConnections]->getID()));

			CORBA::release(usesPort);
			CORBA::release(port);
		} else {
				//m_pendingConnections.push_back(new Connection( *(*_connection)[ _numConnections ] ));
		}
	}
}

//This function adds the registeringService and its name to the DomainMgr.
//if the service already exists it does nothing
void
DomainManager_impl::storeServiceInDomainMgr (
    CORBA::Object_ptr registeringService,
    CF::DeviceManager_ptr registeredDeviceMgr,
    const char * name) {
	//check if device is already registered
	if (serviceIsRegistered(name)) {
		return;                //if registeringDevice exists already, do nothing
	}
	//If this part is reached, the registering device has to be added
	//Get read-only attributes from registeringDevice
	ServiceNode * newServiceNode = new ServiceNode;

	newServiceNode->m_objectPtr = registeringService;
	newServiceNode->m_devMgrPtr = registeredDeviceMgr;
	newServiceNode->m_name = CORBA::string_dup(name);

	//add registeringService to DomainManager's registeredServices
	m_srvNodes.push_back(newServiceNode);
}

bool
DomainManager_impl::serviceIsRegistered(
    const char * serviceName) {
	for (int i = 0; i < m_srvNodes.size(); i++) {
		if (strcmp(m_srvNodes[i]->m_name, serviceName) == 0) {
			return true;
		}
	}
	return false;
}


/**
 * The uninstallApplication operation is used to uninstall an application factory
 * from the domain.
 * The ApplicationId parameter is the softwareassembly element id attribute of the
 * ApplicationFactory's Software Assembly Descriptor file.
 * The uninstallApplication operation shall make the ApplicationFactory unavailable
 * from the domain manager (i.e. its services no longer provided for the application).
 * The uninstallApplication operation shall, upon successful uninstall of an application,
 * write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
 * The uninstallApplication operation shall, upon unsuccessful uninstall of an application,
 * write a FAILURE_ALARM log record to a domain manager's log.
 * The uninstallApplication operation shall send a DomainManagementObjectRemovedEventType
 * event to the Outgoing Domain Management event channel, upon the successful uninstallation
 * of an application. For this event,
 *  1. The producerId is the identifier attribute of the domain manager.
 *  2. The sourceId is the identifier attribute of the uninstalled application factory.
 *  3. The sourceName is the name attribute of the uninstalled application factory.
 *  4. The sourceCategory is "APPLICATION_FACTORY".
 */
void
DomainManager_impl::uninstallApplication(
    const char * applicationName)
throw (
    CF::DomainManager::ApplicationUninstallationError,
    CF::DomainManager::InvalidIdentifier,
    CORBA::SystemException) {
	DEBUG(1, DomainManager_impl, "In uninstallApplication.")

	if (applicationName == NULL) {
		DEBUG(5, DomainManager_impl, "[DomainManager_impl::uninstallApplication]"
		      << "the input applicationName is nil")
		throw CF::DomainManager::InvalidIdentifier();
	}

	bool foundAppFact = false;
	int numFact(0);

	while ((numFact < m_appFacts.length()) && !foundAppFact) {
		if (strcmp(applicationName, m_appFacts[numFact]->name()) == 0) {
			foundAppFact = true;
			break;
		}
		numFact++;
	}

	if (!foundAppFact) {
		DEBUG(5, DomainManager_impl, "[DomainManager_impl::uninstallApplication]"
		      << "Can't found required app fact by " << applicationName)
		throw CF::DomainManager::InvalidIdentifier();
	}

	//delete appfact from applicationfactories sequence
	for (int i = numFact; i < m_appFacts.length() - 1; i++) {
		m_appFacts[i] = m_appFacts[i + 1];
	}
	m_appFacts.length(m_appFacts.length() - 1);

	//\TODO figure out that send DomainManagementObjectRemovedEventType event to outgoing channel
}

/**
 * The unregisterDevice operation is used to remove a device entry from the domain
 * manager for a specific device manager.
 * The unregisterDevice operation shall remove a device entry from the domain manager.
 * The unregisterDevice operation shall release (client-side CORBA release) the
 * unregisteringDevice from the domain manager.
 * The unregisterDevice operation shall disconnect the established connections
 * (including those made to the CORBA Event Service event channels) of the unregistering
 * device. Connections broken as a result of the unregisterDevice operation shall be
 * considered as "pending" for future connections when the component to which the device
 * was connected still exists.
 * The unregisterDevice operation may destroy the CORBA Event Service event channel when
 * no more consumers and producers are connected to it.
 * The unregisterDevice operation shall, upon the successful unregistration of a device,
 * write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
 * The unregisterDevice operation shall, upon unsuccessful unregistration of a device,
 * write a FAILURE_ALARM log record to a domain manager's log.
 * The unregisterDevice operation shall send a DomainManagementObjectRemovedEventType
 * event to the Outgoing Domain Management event channel, upon successful unregistration
 * of a device. For this event,
 *   1. The producerId is the identifier attribute of the domain manager.
 *   2. The sourceId is the identifier attribute of the unregistered device.
 *   3. The sourceName is the label attribute of the unregistered device.
 *   4. The sourceCategory is "DEVICE".
 */
void
DomainManager_impl::unregisterDevice(
    CF::Device_ptr unregisteringDevice)
throw (
    CF::DomainManager::UnregisterError,
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	DEBUG(1, DomainManager_impl, "Entering unregisterDevice")
	//verify valid reference for a device
	if (CORBA::is_nil(unregisteringDevice) || 
		!deviceIsRegistered(unregisteringDevice)) {

		throw CF::InvalidObjectReference();
	}
	removeDeviceFromDomainMgr(unregisteringDevice);
	DEBUG(9, DomMgr, "Leaving unregisterDevice")
}

//This function removes the registeringDevice and its atributes from the DomainMgr.
//if the device doesn't exist, it does nothing
void
DomainManager_impl::removeDeviceFromDomainMgr(
    CF::Device_ptr unregisteringDevice) {
	DEBUG(5, DomMgr, "Entering removeDeviceFromDomainMgr")

	std::vector<DeviceNode * >::iterator p = m_devNodes.begin();
	//check if device is already registered
	while (p != m_devNodes.end()) {
		DeviceNode *tmp = *p;
		std::string unregDevLabel;
		try {
			unregDevLabel = unregisteringDevice->label();
		} catch (CORBA::SystemException & se) {
			DEBUG(5, DomainManager_impl::removeDeviceFromDomainMgr,
			    "unregisterDevice->label failed with CORBA::SystemException")
			exit(EXIT_FAILURE);
		} catch (...) {
			DEBUG(5, DomainManager_impl::removeDeviceFromDomainMgr,
			    "unregisterDevice->label failed with Unknown Exception")
			exit(EXIT_FAILURE);
		}

		std::string devPtrLabel = tmp->m_devicePtr->label();

		if (!strcmp(unregDevLabel.c_str(), devPtrLabel.c_str())) {
			try {
				CORBA::release(tmp->m_devicePtr); //Releasing DomMgr's reference
			} catch (...) {
				DEBUG(5, DomainManager_impl::removeDeviceFromDomainMgr, 
				    "CORBA::release failed with Unknown Exception")
			}
			m_devNodes.erase(p);
			DEBUG(5, DomainManager_impl::removeDeviceFromDomainMgr, 
				"Leaving removeDeviceFromDomainMgr : Device found")
			return;
		} else {
			p++;
		}
	}

	DEBUG(5, DomainManager_impl::removeDeviceFromDomainMgr, 
		"Leaving removeDeviceFromDomainMgr : Device not found")
	//If this part is reached, unregisteringDevice was not registered
	return;
}

/**
 * The unregisterDeviceManager operation is used to unregister a DeviceManager
 * component from the domain manager. A device manager may be unregistered during
 * run-time for dynamic extraction or maintenance of the device manager.
 * The unregisterDeviceManager operation shall unregister a DeviceManager component
 * from the DomainManager.
 * The unregisterDeviceManager operation shall release all device(s) and service(s)
 * associated with the device manager that is being unregistered.
 * The unregisterDeviceManager operation shall disconnect the established connections
 * (including those made to the CORBA Event Service event channels) of the unregistering
 * device manager as well as for its registered devices and services. Connections broken
 * as a result of the unregisterDeviceManager 4.
 * The sourceCategory is "DEVICE_MANAGER". operation shall be considered as "pending"
 * for future connections when the component to which the device manager or its registered
 * devices and services were connected still exists.
 * The unregisterDeviceManager operation may destroy the CORBA Event Service channel when
 * no more consumers and producers are connected to it.
 * The unregisterDeviceManager operation shall unmount all device manager's file systems
 * from its file manager.
 * The unregisterDeviceManager operation shall, upon the successful unregistration of a
 * device manager, write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
 * The unregisterDeviceManager operation shall, upon unsuccessful unregistration
 * of a device manager, write a FAILURE_ALARM log record to a domain manager's log.The
 * unregisterDeviceManager operation shall send a DomainManagementObjectRemovedEventType
 * event to the Outgoing Domain Management event channel, upon successful unregistration
 * of a device manager. For this event,
 *  1. The producerId is the identifier attribute of the domain manager.
 *  2. The sourceId is the identifier attribute of the unregistered device manager.
 *  3. The sourceName is the label attribute of the unregistered device manager.
 */
void
DomainManager_impl::unregisterDeviceManager(
    CF::DeviceManager_ptr deviceMgr)
throw (
    CF::DomainManager::UnregisterError,
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	//The unregisterDeviceManager operation shall raise the CF InvalidObjectReference when the
	//input parameter DeviceManager contains an invalid reference to a DeviceManager interface.
	// make sure that the pointer is valid
	if (CORBA::is_nil(deviceMgr)) {
		/*writeLogRecord(FAILURE_ALARM,invalid reference input parameter.); */
		throw (CF::InvalidObjectReference(
			"[DomainManager::unregisterDeviceManager] \
			Cannot unregister Device. DeviceMgr is a nil reference."));
		return;
	}

	//NOTE: All disconnections of service event channels are performed by unregisterDevice
	//(called by removeDeviceMgrDevices)

	//release all device(s) and service(s)
	removeDeviceMgrDevices(deviceMgr);
	removeDeviceMgrServices(deviceMgr);

	//The unregisterDeviceManager operation shall unmount all DeviceManagerÂs FileSystems from
	//its File Manager.
	//Unmount filesystem from "/DomainName1/<deviceMgr.label>"
	std::string mountPoint = "/";
	mountPoint += m_id;
	mountPoint += "/";
	mountPoint += deviceMgr->label();

	try {
		m_fileManager->unmount(mountPoint.c_str());
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DomainManager_impl::unregisterDeviceManager,
			"fileMgr->unmount failed with CORBA::SystemException")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(5, DomainManager_impl::unregisterDeviceManager,
			"fileMgr->unmount failed with Unknown Exception")
		exit(EXIT_FAILURE);
	}

	//The unregisterDeviceManager operation shall unregister a DeviceManager component from the
	//DomainManager.
	removeDeviceMgr(deviceMgr);
}

void
DomainManager_impl::removeDeviceMgrDevices(
    CF::DeviceManager_ptr deviceMgr) {
	DEBUG(2, DomainManager_impl::removeDeviceMgrDevices, "Entering in...")
	//The unregisterDeviceManager operation shall release all device(s) associated with
	//the DeviceManager that is being unregistered.
	CF::DeviceSequence *devices;

	try {
		devices = deviceMgr->registeredDevices();
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DomainManager_impl::removeDeviceMgrDevices,
		    "deviceMgr->registeredDevices failed with CORBA::SystemException")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(5, DomainManager_impl::removeDeviceMgrDevices,
		    "deviceMgr->registeredDevices failed with Unknown Exception")
		exit(EXIT_FAILURE);
	}

	//Call unregisterDevice for each device in the DeviceMgr
	for (int i = 0; i < devices->length(); i++) {
		CF::Device_ptr dev = (*devices)[i];
		try {
			unregisterDevice(dev);
		} catch (CF::InvalidObjectReference & ior) {
			DEBUG(5, DomainManager_impl::removeDeviceMgrDevices,
			    "unregisterDevice failed with CF::InvalidObjectReference")
			exit(EXIT_FAILURE);
		}
	}

	DEBUG(5, DomainManager_impl::removeDeviceMgrDevices, "Leaving ...")
}

void
DomainManager_impl::removeDeviceMgrServices(
    CF::DeviceManager_ptr deviceMgr) {
	DEBUG(5, DomainManager_impl::removeDeviceMgrServices, "Entering in")
	//The unregisterDeviceManager operation shall release all service(s) associated with
	//the DeviceManager that is being unregistered.
	CF::DeviceManager::ServiceSequence * services;
	services = deviceMgr->registeredServices();

	//Call unregisterDevice for each device in the DeviceMgr
	for (int i = 0; i < services->length(); i++) {
		unregisterService((*services)[i].serviceObject, 
			(*services)[i].serviceName);
	}
	DEBUG(5, DomainManager_impl::removeDeviceMgrServices, "Leaving ...")
}

void
DomainManager_impl::removeDeviceMgr(
    CF::DeviceManager_ptr deviceMgr) {
	DEBUG(9, DomainManager_impl::removeDeviceMgr, "Entering in")
	//Look for registeredDeviceMgr in _deviceManagers
	//if deviceMgr is not registered, do nothing
	for (int i = 0; i < m_devMgrs.length(); i++) {
		if (strcmp(m_devMgrs[i]->label(), deviceMgr->label()) == 0) {
			//_deviceManagers.remove(i);
			for (unsigned int j = i; j < m_devMgrs.length() - 1; j++) {
				m_devMgrs[j] = m_devMgrs[j + 1];
			}
			m_devMgrs.length(m_devMgrs.length() - 1);
			break;
		}
	}
	DEBUG(9, DomainManager_impl::removeDeviceMgr, "Leaving ...")
}


/**
 * The unregisterService operation is used to remove a service entry from the
 * domain manager for a specific device manager.
 * The unregisterService operation shall disconnect the established connections
 * (including those made to the CORBA Event Service event channels) of the
 * unregistering service indicated by the input unregisteringService parameter.
 * Connections broken as a result of the unregisterService operation shall be
 * considered as "pending" for future connections when the component to which
 * the service was connected still exists.
 * The unregisterService operation shall remove the unregisteringService entry
 * specified by the input name parameter from the domain manager.
 * The unregisterService operation shall release (client-side CORBA release) the
 * unregisteringService from the domain manager.
 * The unregisterService operation shall, upon the successful unregistration of a
 * service, write an ADMINISTRATIVE_EVENT log record to a domain manager's log.
 * The unregisterService operation shall, upon unsuccessful unregistration of a
 * service, write a FAILURE_ALARM log record to a domain manager's log.
 * The unregisterService operation shall send a DomainManagementObjectRemovedEventType
 * event to the Outgoing Domain Management event channel, upon successful
 * unregistration of a service. For this event,
 *  1. The producerId is the identifier attribute of the domain manager.
 *  2. The sourceId is the identifier attribute of the componentinstantiation
 *     element associated with the unregistered service.
 *  3. The sourceName is the input name parameter for the unregistering service.
 *  4. The sourceCategory is "SERVICE".
 */
void
DomainManager_impl::unregisterService(
    CORBA::Object_ptr unregisteringService,
    const char * name)
throw (
    CF::DomainManager::UnregisterError,
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	//The unregisterService operation shall raise the CF InvalidObjectReference exception when the
	//input parameter contains an invalid reference to a Service interface.
	if (CORBA::is_nil(unregisteringService) || !serviceIsRegistered(name)) {
		/*writeLogRecord(FAILURE_ALARM,Device reference is not valid);*/

		//The unregisterDevice operation shall raise the CF InvalidObjectReference exception when the
		//input parameter contains an invalid reference to a Device interface.
		throw (CF::InvalidObjectReference(
		           "Cannot Unregister Service. Invalid reference"));
		return;
	}

	//The unregisterService operation shall release (client-side CORBA release) the
	//unregisteringService from the DomainManager.
	disconnectThisService(name);
	removeServiceFromDomainMgr(unregisteringService, name);
}

//This function removes the registeringService and its name to the DomainMgr.
//if the service already exists it does nothing
void
DomainManager_impl::removeServiceFromDomainMgr(
    CORBA::Object_ptr registeringService,
    const char * name) {
	std::vector<ServiceNode * >::iterator it = m_srvNodes.begin();
	//check if service is already registered
	while (it != m_srvNodes.end()) {
		ServiceNode * tmp = * it;
		if (strcmp(name, tmp->m_name) == 0) {
			m_srvNodes.erase(it);
			return;  //unregisteringDevice has been removed
		} else {
			it++;
		}
	}
	//If this part is reached, unregisteringDevice was not registered
	return;
}

void
DomainManager_impl::disconnectThisService(
    const char * serviceName) {
	//search registered devices to obtain the deviceManager of this service
	CF::DeviceManager_ptr devMgr;
	for (int i = 0; i < m_srvNodes.size(); i++)
		if (!strcmp(serviceName, m_srvNodes[i]->m_name))
			devMgr = m_srvNodes[i]->m_devMgrPtr;

	//get the DCD
	CF::File_var dcd;
	if (!openProfileFile(m_fileManager.in(), 
		devMgr->deviceConfigurationProfile(), dcd))
		return;

	DCDParser dcdParser(dcd);
	closeProfileFile(dcd.in());

	//parse connections of this DCD
	std::vector<Connection*> * connection = dcdParser.getConnections();

	//Find the connections that involve this service
	//disconnect the ports the are using this service
	for (int numConnections = connection->size() - 1; numConnections >= 0;
	        numConnections--) {
		UsesPort * usesPortParser =
		    (*connection)[numConnections]->getUsesPort();

		FindBy * findUsesPortBy = usesPortParser->getFindBy();

		ProvidesPort * providesPortParser = NULL;

		FindBy * findProvidesPortBy = NULL;

		//ComponentSupportInterface* _componentSuppInterface = NULL:

		if ((*connection)[numConnections]->isProvidesPort())
			providesPortParser =
			    (*connection)[numConnections]->getProvidesPort();
		else if ((*connection)[numConnections]->isFindBy())
			findProvidesPortBy = (*connection)[numConnections]->getFindBy();

		//get the connections that involve this device
		if (!strcmp(providesPortParser->getID(), serviceName)) {
			CORBA::Object_var usesObj = CORBA::Object::_nil();

			if (findUsesPortBy->isFindByNamingService()) {
				while (CORBA::is_nil(usesObj));
			}

			CF::PortSupplier_ptr usesPort = CF::PortSupplier::_narrow(usesObj);

			CF::PPort_ptr port =
			    CF::PPort::_narrow(usesPort->getPort(usesPortParser->getID()));

			port->disconnectPort(
			    CORBA::string_dup((*connection)[numConnections]->getID()));

			//store this connection in pendingConnections so it is established
			//again when this service registers again
			//m_pendingConnections.push_back ( new Connection ( *(*_connection)[ _numConnections ]));
			CORBA::release(usesPort);
			CORBA::release(port);
		}
	}
}

//\TODO find device in by device managers
//This function returns TRUE if the input registeredDevice is contained in the _registeredDevices
bool
DomainManager_impl::deviceIsRegistered(
    CF::Device_ptr registeredDevice) {
	DEBUG(5, DomainManager_impl::deviceIsRegistered, "Entering in...")
	for (int i = 0; i < m_devNodes.size(); i++) {
		std::string regDevLabel;
		std::string devPtrLabel;
		try {
			regDevLabel = registeredDevice->label();
		} catch (...) {
			DEBUG(5, DomainManager_impl::deviceIsRegistered,
				"registeredDevice->label failed with Unknown Exception")
			exit(EXIT_FAILURE);
		}
	}
	DEBUG(6, DomainManager_impl::deviceIsRegistered, "Leaving false")

	return false;
}

//create naming structure for the whole domain
void
DomainManager_impl::createNamingStructure() {
	DEBUG(7, DomainManager_impl, "In createNamingStructure")

	openscaSupport::ORB_Wrap orbWrap;
	//openscaSupport::ORB_Wrap* orbWrap = new openscaSupport::ORB_Wrap();

	orbWrap.bind_new_context_with_string(CONSTANT::OPENSCA_DOMAIN);

	std::string openscaDomain = const_cast<char * >(CONSTANT::OPENSCA_DOMAIN);
	std::string applications = const_cast<char * >(CONSTANT::APPLICATIONS);
	orbWrap.bind_new_context_with_string(
	    (openscaDomain + "/" + applications).c_str());

	std::string nodes = const_cast<char * >(CONSTANT::NODES);
	orbWrap.bind_new_context_with_string(
	    (openscaDomain + "/" + nodes).c_str());

	char path[1024];
    std::string exePath = get_exe_path(path, 1024);
  	ConfigParser cp(exePath);
	std::string dcdPath = cp.getValueById(CONSTANT::MAINDCDPATH);
	int firstSlashPos = dcdPath.find_first_of("/");
	std::string rearSubStr = dcdPath.substr(firstSlashPos + 1);
	int secondSlashPos = rearSubStr.find_first_of("/");
	std::string mainNode = rearSubStr.substr(0, secondSlashPos);
	orbWrap.bind_new_context_with_string(
	    (openscaDomain + "/" + nodes + "/" + mainNode).c_str());

	orbWrap.bind_new_context_with_string("OpenSCA_Domain/Services");
}
