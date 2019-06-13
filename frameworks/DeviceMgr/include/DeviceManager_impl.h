/***************************************************************************//**
* @file     DeviceManager_impl.h
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

#if !defined(EA_3D5474C8_6D97_4a64_A618_52978668FDBD__INCLUDED_)
#define EA_3D5474C8_6D97_4a64_A618_52978668FDBD__INCLUDED_

#include "Resource_impl.h"
#include "openscaSupport.h"
#include "DCDParser.h"
#include "SPDParser.h"
#include "FileSystem_impl.h"
#include "debug.h"
#include "utils.h"
#include "cf_utils.h"
#include "Boost_utils.h"
#include "ExecutableDevice_servant.h"
#include "UsesConnectionInfo.h"
#include "CyclicBufferController.h"

/**
 * @brief The enum describe the component's type, 
 *        options are Device and Service.
 */
typedef enum {
	Device,
	Service
} ComponentTypeEnum;


/**
 * @brief	The struct describes an instantiated component's information.
 */
typedef struct {
	std::string id;				///< Identifier of the instantiated component.
	std::string name;			///< Name of the instantiated component.
	std::string compIOR;		///< IOR of the instantiated component reference.
	ComponentTypeEnum compType;	///< Type of the component, @see ComponentTypeEnum.
} InstantedCompInfoType;

typedef std::vector<InstantedCompInfoType> InstantedCompInfoVec;

/**
 * @brief The DeviceManager interface is used to manage a set of logical devices and
 * services. The interface for a DeviceManager is based upon its attributes, which
 * are:
 * 1. Device Configuration Profile - a mapping of physical device locations
 * to meaningful labels (e.g., audio1, serial1, etc.), along with the devices and
 * services to be deployed.
 * 2. File System - the FileSystem associated with this device manager.
 * 3. Device Manager Identifier - the instance-unique identifier for this device
 * manager.
 * 4. Device Manager Label - the meaningful name given to this device manager.
 * 5. Registered Devices - a list of devices that have registered with this device
 * manager.
 * 6. Registered Services - a list of services that have registered with this
 * device manager.
 */
class DeviceManager_impl: 		
public virtual PropertySet_impl,
public virtual PortSupplier_impl,
public virtual POA_CF::DeviceManager 
{
public:
	virtual ~DeviceManager_impl();

	/**
	 * @brief	Contructor of the DeviceManager_impl class.
	 * @param[in] 	dcdPrfl		Path of the dcd.xml file.
	 * @param[in]	fsRoot		Path of the file system.
	 * @param[in]	sdrRoot		Path of the sca platform.
	 */
	DeviceManager_impl(
	    const char * dcdPrfl,
	    const char * fsRoot,
	    const char * sdrRoot);

	/**
	 * @brief	The operation shall return device manager's dcd.xml file path.
	 * @return 	Device manager's dcd.xml file path
	 */
	char *
	deviceConfigurationProfile()
	throw (CORBA::SystemException);

	/**
	 * @brief 	The operation shall return device manager's dcd.xml file.
	 * 
	 * The readonly deviceConfigurationProfile attribute contains the device 
	 * manager’s profile descriptor.
	 * 
	 * The readonly deviceConfigurationProfile attribute shall contain a 
	 * profile element (Profile Descriptor) with a file reference to the 
	 * device manager’s Device Configuration Descriptor(DCD) file. 
	 * Files referenced within the profile are obtained via the FileSystem.
	 */
	CF::FileSystem_ptr
	fileSys()
	throw (CORBA::SystemException);

	/**
	 * @brief	The operatino shall return the id of the implementation which 
	 *        	is used to instantiate device manager, all implementations is 
	 *        	specificed in device manager's spd.xml file.
	 *
	 * @param[in]	componentInstantiationId	Id of device manager's instantiation.
	 * @return	Id of the implementation.
	 * @ecxeption	The operation may throw CORBA SystemException.
	 */
	char *
	getComponentImplementationId(
	    const char * componentInstantiationId)
	throw (CORBA::SystemException);

	/**
	 * @brief 	The operation shall return device manager's instantation id.
	 * 
	 * The readonly identifier attribute shall contain the instance-unique 
	 * identifier for a device manager. The identifier shall be identical to the 
	 * deviceconfiguration element id attribute of the device manager's Device 
	 * Configuration Descriptor (DCD) file.
	 * 
	 * @return 	Device manager's instantation id.
	 * @ecxeption	The operation may throw CORBA SystemException.
	 */
	char * identifier()
	throw (CORBA::SystemException);

	/**
	 * @brief 	The operation shall return device manager's label.
	 *
	 * The readonly label attribute shall contain the device manager's label. 
	 * The label is the meaningful name given to a device manager.
	 * 
	 * @return  Device manager's label.
	 * @ecxeption	The operation may throw CORBA SystemException.
	 */
	char * label()
	throw (CORBA::SystemException);

	/**
	 * @brief 	The registerDevice operation provides the mechanism to 
	 *         	register a device with a device manager.
	 *
	 * The registerDevice operation shall add the input registeringDevice to 
	 * the DeviceManager registeredDevices attribute when the input 
	 * registeringDevice does not already exist in the registeredDevices attribute. 
	 * The registeringDevice is ignored when duplicated.
	 *
	 * The registerDevice operation shall register the registeringDevice with the 
	 * domain manager when the device manager has already registered to the 
	 * domain manager and the registeringDevice has been successfully added to the 
	 * DeviceManager registeredDevices attribute.
	 * The registerDevice operation shall write a FAILURE_ALARM log record to a 
	 * domain manager's log, upon unsuccessful registration of a device to the 
	 * DeviceManager registeredDevices attribute.
	 *
	 * @exception 	The registerDevice operation shall raise the CF 
	 *             	InvalidObjectReference when the input registeringDevice is a 
	 *             	nil CORBA object reference.
	 */
	void
	registerDevice(
	    CF::Device_ptr registeringDevice)
	throw (CF::InvalidObjectReference, CORBA::SystemException);

	/**
	 * @brief	The operation shall return all devices have registered with
	 *        	device manager.
	 *
	 * The registerDevice operation shall raise the CF InvalidObjectReference 
	 * when the input registeringDevice is a nil CORBA object reference.
	 * 
	 * return 	All registered devices.
	 */
	CF::DeviceSequence *
	registeredDevices()
	throw (CORBA::SystemException);

	/**
	 * @brief	The operation shall return all services have registered with
	 *        	device manager.
	 *
	 * The readonly registeredServices attribute shall contain a list of services 
	 * that have registered with this device manager or a sequence length of zero 
	 * if no services have registered with the device manager.
	 *
	 * @return  All registered services.
	 */
	CF::DeviceManager::ServiceSequence *
	registeredServices()
	throw (CORBA::SystemException);

	/**
	 * @brief	The registerService operation provides the mechanism to register a 
	 *        	service with a device manager.
	 *
	 * The registerService operation shall add the input registeringService to the 
	 * DeviceManager registeredServices attribute when the input registeringService 
	 * does not already exist in the registeredServices attribute. 
	 * The registeringService is ignored when duplicated.
	 * The registerService operation shall register the registeringService with the 
	 * domain manager when the device manager has already registered to the domain 
	 * manager and the registeringService has been successfully added to the 
	 * DeviceManager’s registeredServices attribute.
	 * The registerService operation shall write a FAILURE_ALARM log record, upon 
	 * unsuccessful registration of a service to the DeviceManager registeredServices 
	 * attribute.
	 *
	 * @exception	The registerService operation shall raise the CF 
	 *            	InvalidObjectReference exception when the input registeringService 
	 *            	is a nil CORBA object reference.
	 */
	void
	registerService(
	    CORBA::Object_ptr registeringService,
	    const char * name)
	throw (CF::InvalidObjectReference, CORBA::SystemException);

	/**
	 * @brief 	The shutdown operation provides the mechanism to terminate 
	 *         	a device manager.
	 *         	
	 * The shutdown operation shall unregister the device manager from the domain
	 * manager. The shutdown operation shall perform releaseObject on all of the device
	 * manager's registered devices (DeviceManager registeredDevices attribute).
	 * The shutdown operation shall cause the device manager to be unavailable (i.e.
	 * released from the CORBA environment and its process terminated on the OS), when
	 * all of the device manager's registered devices are unregistered from the
	 * device manager.
	 *
	 * @exception	The operatino may raise CORBA SystemException.
	 */
	void
	shutdown()
	throw (CORBA::SystemException);

	/**
	 * @brief	The unregisterDevice operation unregisters a device from a 
	 *        	device manager.
	 *
	 * The unregisterDevice operation shall remove the input registeredDevice 
	 * from the DeviceManager registeredDevices attribute. The unregisterDevice 
	 * operation shall unregister the input registeredDevice from the domain manager 
	 * when the input registeredDevice is registered with the device manager and 
	 * the device manager is not shutting down.
	 * The unregisterDevice operation shall write a FAILURE_ALARM log record, 
	 * when it cannot successfully remove a registeredDevice from the DeviceManager 
	 * registeredDevices attribute.
	 *
	 * @exception 	The unregisterDevice operation shall raise the CF 
	 *             	InvalidObjectReference when the input registeredDevice is a nil 
	 *             	CORBA object reference or does not exist in the DeviceManager’s
	 *             	registeredDevices attribute.
	 */
	void
	unregisterDevice(
	    CF::Device_ptr registeredDevice)
	throw (CF::InvalidObjectReference, CORBA::SystemException);

	/**
	 * @brief	The unregisterService operation unregisters a service from a 
	 *        	device manager.
	 *
	 * The unregisterService operation shall remove the input registered service 
	 * specified by the input name parameter from the 
	 * DeviceManager::registeredServices attribute. The unregisterService
	 * operation shall unregister the input unregistering service from the domain 
	 * manager when the device manager is not in the SHUTTING_DOWN state.
	 * The unregisterService operation shall write a FAILURE_ALARM log record, 
	 * when it cannot successfully remove a registeredService from the DeviceManager 
	 * registeredServices attribute.
	 *
	 * @exception	The unregisterService operation shall raise the CF 
	 *            	InvalidObjectReference when the input unregistering service is a 
	 *            	nil CORBA object reference or does not exist in the DeviceManager
	 *            	registeredServices attribute.
	 */
	void
	unregisterService(
	    CORBA::Object_ptr registeredService,
	    const char * name)
	throw (CF::InvalidObjectReference, CORBA::SystemException);

	/**
	 * @brief	The operation shall establish connections between devices.
	 * @param[in] connections	 All connections need established, @see Connection.
	 */
	void
	createConnections(
	    std::vector<Connection *> * connections);

	/**
	 * @brief this routine launch all of devices and services described in DCD.xml
	 *
	 * Launch DCD consite of two step. the first step is to launch Aggregate Device 
	 * and obtain the reference of releted AggregateService from PRF.xml. 
	 * The Attribute of AggregateService have id("AGGREGATE_SERVICE_IOR") and value
	 * ("corbaloc://host:port/AggregateService") the second is to launch Child Device, 
	 * if it have 'deployondevice', then deploy on its parent device.

	 * @param[in]	-relatvie path of DCD.xml
	 */
	void
	launchDCD(
	    const char * dcdpfl)
	throw (
	    std::runtime_error,
	    CORBA::SystemException);

	/**
	 * @brief	The operation shall do some preparatory work for next steps,
	 *        	for example, activate file system, get domain manager reference
	 *        	and so on.
	 */
	void
	postConstructor()
	throw (
	    std::runtime_error,
	    CORBA::SystemException);

private:
	enum DevMgrAdmnType {
		DEVMGR_REGISTERED,
		DEVMGR_UNREGISTERED,
		DEVMGR_SHUTTING_DOWN
	};

	DevMgrAdmnType m_adminState;
	std::vector<UsesConnectionInfo *> m_connectionsInfo;

	/**
	 * @brief 	Instantiate every fileSystems in DCD.xml and register with FileManager.
	 */
	void
	activateFileSystems();

	/**
	 * @brief	The operation shall get domain manager reference.
	 * @param[in] dmnMgrName	Doamin manager's name.
	 */
	void
	getDmnMgrref(
	    const char * dmnMgrName);

	/**
	 *@brief  instantiate all components in partitioning section of dcd.xml
	 * 
	 *	the progress of instantiate DCDComps consiste of following step:
	 *	1.parsering spd.xml and prf.xml
	 *	2.load binary code.
	 *	3.excute code loaded.
	 *	4.configure configurable and allocation properties.
	 *	5.register device with devicemanager.
	 */
	void
	instantDCDComps()
	throw (std::runtime_error, CORBA::SystemException);

	/**
	 * @brief	The operation shall get uses port of a connection.
	 * @param[inout] usesPortName	Name of uses port.
	 * @param[inout] portPtr		Object reference of the uses port.
	 * @param[in]	 connect		Connection need established.
	 */
	void
	getUsesPort(
	    std::string & usesPortName,
	    CF::PPort_var & portPtr,
	    const Connection * connect);

	/**
	 * @brief	The operation shall get provides port of a connection.
	 * @param[inout] providesPortName	Name of provides port.
	 * @param[inout] providesObj		Object reference of the provides port.
	 * @param[in]	 connect			Connection need established.
	 */
	void
	getProvidesPort(
	    std::string & providesPortName,
	    CORBA::Object_var & providesObj,
	    const Connection * connect);

	/**
	 * @brief	The operation check whether the device is registered.
	 * @param[in] registeredDevice	Device need checked.
	 * @return 	Whether the device is registered.
	 * @retval true		The device is registered.
	 * @retval false	The device is unregistered.
	 */
	bool
	deviceIsRegistered(
	    CF::Device_ptr registeredDevice);

	/**
	 * @brief	The operation check whether the service is registered.
	 * @param[in] name	Name of the service need checked.
	 * @return 	Whether the service is registered.
	 * @retval true		The service is registered.
	 * @retval false	The service is unregistered.
	 */
	bool
	serviceIsRegistered(
	    const char * name);

	/**
	 * @brief	The operation shall load and execute component's code.
	 * @param[in] exeDevPtr    Executable device on which the component's code will be
	 * 						   loaded and executed.
	 * @param[in] spdImpls	   All alternatiove	implementations of the component, 
	 * 						   which are specificed in spd.xml file.
	 * @param[in] devInstId	   Id of the device's instantation.
	 * @param[in] devInstName  Name of the device's instantation.
	 * @param[in] devInstSftfl Device's spd.xml file path.
	 * @param[in] parentIOR	   IOR of the device's parent device.
	 * @param[in] registryIOR  IOR of the registry component, which can be used by 
	 * 						   instantiating device to register itself with device
	 * 						   manager.
	 */
	bool
	loadAndExecuteComponent(
	    CF::ExecutableDevice_ptr exeDevPtr,
	    std::vector<SPDImplementation *> * spdImpls,
	    const char * devInstId,
	    const char * devInstName,
	    const char * devInstSftfl,
	    const char * parentIOR = "",
	    const char * registryIOR = "");

	/**
	 * @brief	The operation shall load and execute component's code.
	 * @param[in] exeDevServant A handler used to load and execut component's code.
	 * @param[in] spdImpls	   All alternatiove	implementations of the component, 
	 * 						   which are specificed in spd.xml file.
	 * @param[in] devInstId	   Id of the device's instantation.
	 * @param[in] devInstName  Name of the device's instantation.
	 * @param[in] devInstSftfl Device's spd.xml file path.
	 * @param[in] parentIOR	   IOR of the device's parent device.
	 * @param[in] registryIOR  IOR of the registry component, which can be used by 
	 * 						   instantiating device to register itself with device
	 * 						   manager.
	 */
	bool
	loadAndExecuteComponent(
	    ExecutableDevice_servant * exeDevServant,
	    std::vector<SPDImplementation*> * spdImpls,
	    const char * devInstId,
	    const char * devInstName,
	    const char * devInstSftfl,
	    const char * parentIOR = "",
	    const char * registryIOR = "")
	throw (std::runtime_error, CORBA::SystemException) ;

	/**
	 * @brief	The operation shall initialize and configure component.
	 * @param[in] 	 prfParser	Parser of the component's prf.xml file.
	 * @param[in] 	 devName	Name of the device need initialized and configured.
	 * @param[inout] devRef		Object reference of the device.
	 */
	bool
	initAndConfigComp(
	    PRFParser & prfParser,
	    const char * devName,
	    CF::Device_var & devRef);

	/**
	 * @brief	The operation shall initialize and configure component.
	 * @param[in] 	 prfParser	Parser of the component's prf.xml file.
	 * @param[in] 	 devName	Name of the device need initialized and configured.
	 * @param[inout] devRef		Object reference of the device.
	 * @param[in]	 parentDev  The device's parent device.
	 * @exception	The operation may raise std runtime error and CORBA
	 *            	SystemException.
	 */
	bool
	initAndConfigComp(
	    PRFParser & prfParser,
	    const char * devName,
	    CF::Device_var & devRef,
	    CF::Device_ptr parentDev);

	/**
	 * @brief	The operation shall open component prf.xml file by 
	 *        	the component's spd.xml file.
	 * @param[in] fileSys	File system of the platform.
	 * @param[in] absSpdfl	Absolute path of the component's spd.xml file.
	 * @return Object reference of component's prf.xml file.
	 * @exception	The operation may raise std runtime error and CORBA
	 *            	SystemException.
 	 */
	CF::File_ptr
	openPRFProfilebySPDfl(
	    CF::FileSystem_ptr fileSys,
	    const char * absSpdfl)
	throw (
	    std::runtime_error,
	    CORBA::SystemException);

	/**
	 * @brief	The operation shall instantiate devices which dosen't 
	 *        	have parent device.
	 *
	 * @param[in] cp	ComponentPlacement of the device need instantiated,
	 * 					@see DCDComponentPlacement.
	 * @param[in] dcdp	Parser of the dcd.xml file.
	 * @exception	The operation may raise std runtime error and CORBA
	 *            	SystemException.
	 */
	bool
	instantGeneralComp(
	    DCDComponentPlacement & cp,
	    DCDParser * dcdp);

	/**
	 * @brief Instantiate a compositepartof component, include procedure of 
	 *        load,execute, and register
	 *
	 * @attention	now only support to instantiate component kind type of Device, 
	 *				except Service.
	 * @param[in] 	dcp		ComponentPlacement of the device need instantiated
	 * @param[in] 	dcdp	Parser of the dcd.xml file.
	 */
	bool
	instantCompositepartComp(
	    DCDComponentPlacement & dcp,
	    DCDParser * dcdp);

	/**
	 * The readonly deviceConfigurationProfile attribute contains the device manager’s
	 * profile descriptor.
	 * The readonly deviceConfigurationProfile attribute shall contain a profile
	 * element (Profile Descriptor) with a file reference to the device manager’s
	 * Device Configuration Descriptor (DCD) file. Files referenced within the profile
	 * are obtained via the FileSystem.
	 */
	std::string m_deviceConfigurationProfile;
	CF::DomainManager_var m_dmnMgr;

	/**
	 * The readonly fileSys attribute shall contain the FileSystem associated with
	 * this device manager.
	 */
	CF::FileSystem_var m_fileSys;
	std::string m_fsRoot;

	/**
	 * read only attributes
	 */
	std::string m_identifier;

	/**
	 * The readonly label attribute shall contain the device manager's label.
	 * The label is the meaningful name given to a device manager.
	 */
	std::string m_label;

	/**
	 * The readonly registeredDevices attribute shall contain a list of devices that
	 * have registered with this device manager or a sequence length of zero if no
	 * devices have registered with the device manager.
	 */
	CF::DeviceSequence m_registeredDevices;

	/**
	 * The readonly registeredServices attribute shall contain a list of services that
	 * have registered with this device manager or a sequence length of zero if no
	 * services have registered with the device manager.
	 */
	std::string m_nodeName;

	CF::DeviceManager::ServiceSequence m_registeredServices;

	CF::DeviceManager_var m_deviceMgrObj;

	openscaSupport::ORB_Wrap* m_orbWrap;

	std::string m_platformRoot;

	InstantedCompInfoVec m_instantedCompInfos;

	DeviceManager_impl();

	DeviceManager_impl(
	    DeviceManager_impl & impl);

	void 
	getExecOptions(
		CORBA::ULong stackSize,
		CORBA::ULong priority,
		const std::string & entryPoint,
		CF::Properties & options);

	void
	getExecParameters(
		ExecParamsType execParams,
		const char * devInstId,
		const char * devInstName,
		const char * devSpdPath,
		const char * parentIOR,
		const char * registryIOR,
		CF::Properties & params);

	bool
	matchSPDImplementation(
		std::vector <SPDImplementation*> * spdImpls,
		std::string & codefile,
		std::string & entryPoint,
		CORBA::ULong & stackSize,
		CORBA::ULong & priority);

	bool 
	matchSPDImplementation(
		std::vector <SPDImplementation*> * spdImpls,
		std::vector<PRFProperty*> * allocProps,
		std::string & codefile,
		std::string & entryPoint,
		CORBA::ULong & stackSize,
		CORBA::ULong & priority,
		CF::LoadableDevice::LoadType & loadType);

	bool 
	getComponentObjRefFromNamingService(
		const char* namingContext,
		CF::Device_var & obj);


	bool
	getChildDevObjRefFromParentDev(
	    const char * chidDevName,
	    CF::Device_ptr parentDev,
	    CF::Device_var & childDev);

	/**
	 *@brief  create a CF::File object for specialed profile
	 *
	 *@note	  shall close this CF::File object after use
	 *@param[in]	fs 		-file system ojbect reference
	 *@param[in]	profile	-the file wait for opening
	 *@returnval	CF::File reference of specialed file
	 */
	CF::File_var 
	openprofileFile(
			CF::FileSystem_ptr fs, 
			const char* profile)
	throw(
			CF::InvalidObjectReference,
			CF::InvalidFileName,
			CF::FileException,
			CORBA::SystemException);
};
#endif // !defined(EA_3D5474C8_6D97_4a64_A618_52978668FDBD__INCLUDED_)
