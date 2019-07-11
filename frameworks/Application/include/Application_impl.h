/***************************************************************************//**
* @file     Application_impl.h
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

#if !defined(EA_AF5668CF_9297_435c_94DB_21ACCCCA13C1__INCLUDED_)
#define EA_AF5668CF_9297_435c_94DB_21ACCCCA13C1__INCLUDED_

#include <iostream>
#include <vector>

#include "Resource_impl.h"
#include "openscaSupport.h"
#include "SADParser.h"
#include "SPDParser.h"
#include "cf_utils.h"
#include "UsesConnectionInfo.h"
#include "Boost_utils.h"

/**
 * The Application class provides the interface for the control, configuration,
 * and status of an instantiated application in the domain.
 * The Application interface inherits the IDL interface of Resource. A created
 * application instance may contain Resource components and/or non-CORBA
 * components. The Application interface UML is depicted in Figure 3-10.
 * The Application interface releaseObject operation provides the interface to
 * release the computing resources allocated during the instantiation of the
 * application, and de-allocate the devices associated with Application instance.
 *
 * An instance of an Application is returned by the create operation of an
 * instance of the ApplicationFactory class.
 */
class Application_impl :
	public virtual POA_CF::Application,
	public virtual Resource_impl {

  public:
	Application_impl(
	    const char * appId,
	    const char * appName,
	    const char * appNameWithInstanceNum,
	    const char * profile,
	    CF::DeviceAssignmentSequence * _devSeq,
	    CF::Application::ComponentElementSequence * _implSeq,
	    CF::Application::ComponentElementSequence * _namingCtxSeq,
	    CF::Application::ComponentProcessIdSequence * _procIdSeq,
	    std::vector <UsesConnectionInfo *> _connectionData,
	    CF::Resource_ptr _assemblyController,
	    CF::DomainManager::ApplicationSequence * _appseq);

	~Application_impl();

	///all application object can increment it when create new app instance
	static unsigned int cuurent_max_instance_num;

	/**
	 * @brief 	The operation shall return a list of devices, each component either
	 *			uses, is loaded on or is executed on. Each component (identified by 
	 *			the componentinstantiation element in the application’s software 
	 *			profile) is associated with at least one device.
	 *
	 * @return a list of devices.
	 */
	CF::DeviceAssignmentSequence *
	componentDevices();

	/**
	 * @brief The operation shall contain the list of components’ SPD implementation 
	 *        IDs within the application for those components created.
	 * @return The list of components’ SPD implementation IDs.
	 */
	CF::Application::ComponentElementSequence *
	componentImplementations();

	/**
	 * @brief The operation shall return the list of components’ Naming Service
	 *        Context within the application for those components using CORBA 
	 *        Naming Service.
	 *
	 * @return The list of components’ Naming Service Context.
	 */
	CF::Application::ComponentElementSequence *
	componentNamingContexts();

	/**
	 * @brief The operation shall return the list of components’ process IDs 
	 *        within the Application for components that are executing on a device.
	 *
	 * @return The list of components’ process IDs.
	 */
	CF::Application::ComponentProcessIdSequence *
	componentProcessIds();

	/**
	 * @brief The configure operation allows id/value pair configuration properties 
	 *        to be assigned to components implementing this interface.
	 *
	 * The configure operation shall assign values to the properties as indicated 
	 * in the input configProperties parameter. Valid properties for the configure 
	 * operation shall at a minimum be the configure readwrite and writeonly 
	 * properties referenced in the component’s SPD.
	 *
	 * @param[in] configProperties	Properties need configured.
	 * @exception The configure operation shall raise a PartialConfiguration exception 
	 *            when some configuration properties were successfully set and some 
	 *            configuration properties were not successfully set.
	 *            
	 *            The configure operation shall raise an InvalidConfiguration 
	 *            exception when a configuration error occurs and no configuration 
	 *            properties were successfully set.
	 */
	void
	configure(
	    const CF::Properties & cofigProperties)
	throw (
	    CF::PropertySet::PartialConfiguration,
	    CF::PropertySet::InvalidConfiguration,
	    CORBA::SystemException);

	/**
	 * @brief The getPort operation obtains an object reference to a specific 
	 *        visible port of the application. The getPort operation returns object 
	 *        references for port names that are in the application SAD
	 *        externalports element.
	 * 
	 * @param[in] id Id of the port needs gotten.
	 *
	 * @return The getPort operation shall return object references only for input 
	 *         port names that match the port names that are in the application SAD 
	 *         externalports element.
	 *
	 * @exception The getPort operation shall raise an UnknownPort exception if 
	 *            the port is invalid.
	 */
	CORBA::Object_ptr
	getPort(
	    const char* id)
	throw (
	    CORBA::SystemException,
	    CF::PortSupplier::UnknownPort);

	bool
	getExternalProvidesPortName(
		const char * externalPortName,
		const char * compInstantId,
		const std::vector<Connection * > * connects,
		std::string & targetPortName);

	bool
	getExternalUsesPortName(
		const char * externalPortName,
		const char * compInstantId,
		const std::vector<Connection * > * connects,
		std::string & targetPortName);

	/**
	 * @brief The purpose of the initialize operation is to provide a mechanism 
	 *        to set a component to a known initial state. For example, 
	 *        data structures may be set to initial values, memory may be allocated,
	 *        hardware devices may be configured to some state, etc.
	 *        
	 *        Initialization behavior is implementation dependent.
	 * @exception The initialize operation shall raise an InitializeError exception 
	 *            when an initialization error occurs.
	 */
	void
	initialize()
	throw (
	    CF::LifeCycle::InitializeError,
	    CORBA::SystemException);

	/**
	 * @brief The operation shall return the name of the created application. The
	 *        ApplicationFactory interface’s create operation name parameter 
	 *        provides the name content.
	 *
	 * @return Name of the application.
	 */
	char *
	name();

	/**
	 * @brief The operation shall return a profile element (Profile Descriptor) 
	 *        with a file reference to the application’s SAD file. Files referenced 
	 *        within the profile are obtained via a FileManager.
	 *
	 * @return Application's sad.xml file.
	 */
	char *
	profile();

	/**
	 * @brief The query operation allows a component to be queried to 
	 *        retrieve its properties.
	 *
	 * The query operation shall return all component properties when the inout 
	 * parameter configProperties is zero size. The query operation shall return 
	 * only those id/value pairs specified in the configProperties parameter if 
	 * the parameter is not zero size. Valid properties for the query operation 
	 * shall be all configure properties (simple properties whose kind element’s 
	 * kindtype attribute is “configure”) whose mode attribute is “readwrite” or 
	 * “readonly” and any allocation properties with an action value of "external" 
	 * as referenced in the component's SPD.
	 *
	 * param[inout] Properties need queried.
	 * @exception The query operation shall raise the CF UnknownProperties exception 
	 *            when one or more properties being requested are not known by the 
	 *            component.
	 */
	void
	query(
	    CF::Properties & configProperties)
	throw (
	    CF::UnknownProperties,
	    CORBA::SystemException);

	/*
	 * @brief The releaseObject operation terminates execution of the application, 
	 *        returns all allocated computing resources, and de-allocates the 
	 *        resources’ capacities in use by the devices associated with the 
	 *        application. Before terminating, the application removes the message 
	 *        connectivity with its associated applications (e.g., ports, resources, 
	 *        and logs) in the domain.
	 *
	 * The following behavior is in addition to the LifeCycle::releaseObject operation 
	 * behavior. The Application::releaseObject operation shall release each 
	 * application component not created by a resource factory by utilizing the 
	 * component’s Resource::releaseObject operation. The Application::releaseObject 
	 * operation shall release each component created by a resource factory via the 
	 * ResourceFactory::releaseResource operation. The Application::releaseObject 
	 * operation shall terminate a resource factory when no more resources are managed 
	 * by the resource factory via the ResourceFactory::shutdown operation. The 
	 * Application::releaseObject operation shall terminate the processes / tasks on 
	 * allocated executable devices belonging to each application component by 
	 * utilizing the ExecutableDevice:terminate operation. The releaseObject operation 
	 * shall de-allocate the memory associated with each application component 
	 * instance from its allocated device by utilizing the LoadableDevice::unload 
	 * operation. 
	 * 
	 * The releaseObject operation shall deallocate the device capacities that were 
	 * allocated during application creation. The actual devices deallocated 
	 * (Device::deallocateCapacity) reflect changes in their capacity based upon 
	 * component capacity requirements deallocated from them, which may also cause 
	 * state changes for the devices.
	 * 
	 * The application shall release all object references to the components making 
	 * up the application.
	 * 
	 * The releaseObject operation shall disconnect ports that were previously 
	 * connected based upon the application’s software profile.
	 * 
	 * The releaseObject operation shall disconnect consumers and producers from a 
	 * CORBA Event Service’s event channel based upon the software profile. The 
	 * releaseObject operation may destroy a CORBA Event Service’s event channel when 
	 * no more consumers and producers are connected to it.
	 * 
	 * For components (e.g., Resource, ResourceFactory) that are registered with 
	 * Naming Service, the releaseObject operation shall unbind those components and 
	 * destroy the associated naming contexts as necessary from the Naming Service.
	 *
	 * The releaseObject operation for an application shall disconnect ports first, 
	 * then release the resources and the resource factories, then call the terminate 
	 * operation, and lastly call the unload operation on the devices.
	 * 
	 * The releaseObject operation shall, upon successful application release, 
	 * write an ADMINISTRATIVE_EVENT log record.
	 * 
	 * The releaseObject operation shall, upon unsuccessful application release, 
	 * write a FAILURE_ALARM log record.
	 * 
	 * The releaseObject operation shall send a DomainManagementObjectRemovedEventType 
	 * event to the Outgoing Domain Management event channel upon successful release 
	 * of an application. For this event,
	 * 		1. The producerId is the identifier attribute of the released application.
	 * 		2. The sourceId is the identifier attribute of the released application.
	 * 		3. The sourceName is the name attribute of the released application.
	 * 		4. The sourceCategory is “APPLICATION”.
	 *
	 * The following steps demonstrate one scenario of the application’s behavior 
	 * for the release of an application that contains ResourceFactory behavior:
	 * 		1. Client invokes releaseObject operation.
	 * 		2. Disconnect Ports.
	 * 		3. Release the ResourceFactory components.
	 * 		4. Shutdown the ResourceFactory components.
	 * 		5. Release the Resource components.
	 * 		6. Terminate the components’ processes.
	 * 		7. Unload the components’ executable images.
	 * 		8. Change the state of the associated devices to be available, along with 
	 * 		   device(s) memory utilization availability and processor utilization 
	 * 		   availability based upon the Device Profile and software profile.
	 * 		9. Unbind application components from Naming Service.
	 * 		10. Log an Event indicating that the application was either successfully 
	 * 			or unsuccessfully released.
	 * 		11. Remove the application reference from the applications attribute 
	 * 			and generate an event to indicate the application has been removed 
	 * 			from the domain.
	 *
	 * @exception The releaseObject operation shall raise a ReleaseError exception 
	 *            when internal processing errors prevent the successful release of 
	 *            any application component.
	 */
	void
	releaseObject()
	throw (
	    CF::LifeCycle::ReleaseError,
	    CORBA::SystemException);

	/**
	 * @brief The runTest operation allows components to be “black box” tested. 
	 *        This allows built-in tests(BITs) to be implemented which provide 
	 *        a means to isolate faults (both software and hardware) within the system.
	 *
	 * The runTest operation shall use the input testId parameter to determine 
	 * which of its predefined test implementations should be performed. 
	 * The id/value pair(s) of the testValues parameter shall be used to provide 
	 * additional information to the implementation-specific test to be run. The
	 * runTest operation shall return the result(s) of the test in the testValues 
	 * parameter.
	 * Tests to be implemented by a component are component-dependent and are 
	 * specified in the component’s Properties Descriptor. Valid testId(s) and both 
	 * input and output testValues(properties) for the runTest operation shall at a 
	 * minimum be the test properties defined in the properties test element of 
	 * the component's Properties Descriptor (refer to Appendix D Domain Profile). 
	 * The testId parameter corresponds to the XML attribute testId of the property 
	 * element test in a propertyfile.
	 * A CF UnknownProperties exception is raised by the runTest operation. 
	 * All testValues parameter properties (i.e., test properties defined in the 
	 * propertyfile(s) referenced in the component’s SPD) shall be validated.
	 * The runTest operation shall not execute any testing when the input testId 
	 * or any of the input testValues are not known by the component or are out of 
	 * range.
	 *
	 * @param[in] 	 TestID    Id of the test, use to decide which test should be run.
	 * @param[inout] testValues Values of test result.
	 * @exception The runTest operation shall raise the UnknownTest exception when 
	 *            there is no underlying test implementation that is associated with 
	 *            the input testId given.
	 *            The runTest operation shall raise the CF UnknownProperties exception 
	 *            when the input parameter testValues contains any CF DataTypes that 
	 *            are not known by the component’s test implementation or any values 
	 *            that are out of range for the requested test. The exception
	 *            parameter invalidProperties shall contain the invalid testValues 
	 *            properties id(s) that are not known by the component or the value(s) 
	 *            are out of range.
	 */
	void
	runTest(
	    CORBA::ULong prm1,
	    CF::Properties & props)
	throw (
	    CORBA::SystemException,
	    CF::UnknownProperties,
	    CF::TestableObject::UnknownTest);

	/**
	 * @brief The start operation is provided to command the resource implementing 
	 *        this interface to start internal processing.
	 *        The start operation puts the resource in an operating condition.
	 * @exception The start operation shall raise the StartError exception if an 
	 *            error occurs while starting the resource.
	 */
	void
	start()
	throw (
	    CF::Resource::StartError,
	    CORBA::SystemException);

	/**
	 * brief The stop operation is provided to command the resource implementing 
	 * 		 this interface to stop internal processing. The stop operation shall 
	 * 		 disable all current operations and put the resource in a non-operating
	 * 		 condition. The stop operation shall not inhibit subsequent configure, 
	 * 		 query, and start operations.
	 * 		 
	 * @exception The stop operation shall raise the StopError exception if an error 
	 *            occurs while stopping the resource.
	 */
	void
	stop()
	throw (
	    CF::Resource::StopError,
	    CORBA::SystemException);

  private:
	/**
	 * The componentDevices attribute shall contain a list of devices, which each
	 * component either uses, is loaded on or is executed on. Each component
	 * (identified by the componentinstantiation element in the application's software
	 * profile) is associated with at least one device.
	 */
	CF::DeviceAssignmentSequence * m_appCompDevices;
	/**
	 * The componentImplementations attribute shall contain the list of components'
	 * SPD implementation IDs within the application for those components created.
	 */
	CF::Application::ComponentElementSequence * m_appCompImpls;
	/**
	 * The componentNamingContexts attribute shall contain the list of components'
	 * Naming Service Context within the application for those components using CORBA
	 * Naming Service.
	 */
	CF::Application::ComponentElementSequence * m_appCompNamingCtxs;
	/**
	 * The componentProcessIds attribute shall contain the list of components' process
	 * IDs within the Application for components that are executing on a device.
	 */
	CF::Application::ComponentProcessIdSequence * m_appCompProcIds;

	CF::DomainManager::ApplicationSequence * m_appseq;
	CF::Resource_ptr m_assemblyController;
	std::vector <UsesConnectionInfo *> m_connectsData;
	openscaSupport::ORB_Wrap * m_orbWrap;
	CF::DomainManager_var m_dmnMgr;
	CF::FileManager_var m_fileMgr;

	SADParser * m_sadParser;
	std::string m_sadProfile;
	std::string m_name;
	std::string m_appNameWithInstanceNum;

	void 
	postConstructor();

	bool 
	getObjectRefFromNamingService(
		const char * objectName,
		CORBA::Object_ptr & obj);

	/**
	* remove reference for this application from DomainManager
	*/
	bool
	removeRefFromDomain(
	    CF::DomainManager_ptr domainMgr);

	/**
	* disconnect all connections for this application in domain
	*/
	bool
	disconnetAllPorts();

	/**
	* destory all component resources for this application in domain
	*/
	bool
	releaseAllResources(
	    CF::DomainManager_ptr dmnMgr);

	/**
	* if there are process running in device, terminate it. Then unload
	* component from system. at last deallocate all capacities allcoate
	* for the component in application.
	*/
	bool
	unloadAndDeallocatCaps(
		CF::DomainManager_ptr dmnMgr);

	bool 
	terminateComponentProcess(
		CORBA::Object_ptr obj,
		const char * compId);

	bool
	unloadComponentCodeFile(
		CORBA::Object_ptr obj,
		SPDParser * compSPDParser,
		const char * compId,
		const char * spdPath);

	bool 
	deallocateDeviceCapacity(
		CORBA::Object_ptr dev,
		const char* compPrfPath);

	/**
	 * no default constructor
	 */
	Application_impl();

	/**
	 * no copy constructor
	 */
	Application_impl(
	    Application_impl& prm1);

};
#endif // !defined(EA_AF5668CF_9297_435c_94DB_21ACCCCA13C1__INCLUDED_)
