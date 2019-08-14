/***************************************************************************//**
* @file     Resource_impl.h
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

#if !defined(EA_82A2ACAA_CBBB_45a1_81BD_AFBB37A6D10D__INCLUDED_)
#define EA_82A2ACAA_CBBB_45a1_81BD_AFBB37A6D10D__INCLUDED_

#include "CFS.h"
#include "debug.h"

/**
 * The PropertySet class defines configure and query operations to access
 * component properties/attributes.
 */
class PropertySet_impl :
	public virtual POA_CF::PropertySet {

  public:
	virtual ~PropertySet_impl();

	PropertySet_impl();

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
	    const CF::Properties & configProperties)
	throw (
	    CF::PropertySet::PartialConfiguration,
	    CF::PropertySet::InvalidConfiguration,
	    CORBA::SystemException);

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
	virtual void
	query(
	    CF::Properties & configProperties)
	throw (
	    CF::UnknownProperties,
	    CORBA::SystemException);

  protected:
	CF::Properties propSet;
	bool init_config;

	CF::DataType
	getProperty(
	    CORBA::String_var id);

	void
	validateForConfig(
	    CF::Properties props,
	    CF::Properties & validProps,
	    CF::Properties & invalidProps);

	void
	validateForQuery(
	    CF::Properties props,
	    CF::Properties & validProps,
	    CF::Properties & invalidProps);

};

/**
 * The LifeCycle interface defines the generic operations for initializing or
 * releasing instantiated component-specific data and/or processing elements.
 */
class LifeCycle_impl :
	public virtual POA_CF::LifeCycle {

  public:
	virtual ~LifeCycle_impl();

	LifeCycle_impl() {

	}

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
};

/**
 * The testable object interface provides a means to perform stand alone testing
 * of an SCA component. This function is useful for built in test (BIT) operations.
 */
class TestableObject_impl :
	public virtual POA_CF::TestableObject {

  public:
	virtual ~TestableObject_impl();

	TestableObject_impl() {

	}

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
	    CORBA::ULong TestID,
	    CF::Properties & testValues)
	throw (
	    CF::UnknownProperties,
	    CF::TestableObject::UnknownTest,
	    CORBA::SystemException);
};

/**
 * This interface provides the getPort operation for those components that provide
 * ports.
 */
class PortSupplier_impl :
	public virtual POA_CF::PortSupplier {

  public:
	virtual ~PortSupplier_impl();

	PortSupplier_impl() {

	}

	CORBA::Object_ptr
	getPort(
	    const char * prm1)
	throw (
	    CF::PortSupplier::UnknownPort,
	    CORBA::SystemException);
};

/**
 * The Resource interface provides a common API for the control and configuration
 * of a software component.
 * The Resource interface inherits from the LifeCycle, PropertySet, TestableObject,
 * and PortSupplier interfaces.
 */
class Resource_impl :
	public virtual PropertySet_impl,
	public virtual PortSupplier_impl,
	public virtual LifeCycle_impl,
	public virtual TestableObject_impl,
	public virtual POA_CF::Resource {

  public:
	virtual ~Resource_impl();

	Resource_impl();

	Resource_impl(
	    const char * uuid);

	char *
	identifier()
	throw (CORBA::SystemException);

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
	 * @exception The stop operation shall raise the StopError exception if an error 
	 *            occurs while stopping the resource.
	 */
	void
	stop()
	throw (
	    CF::Resource::StopError,
	    CORBA::SystemException);

  protected:
	std::string m_identifier;

  private:
	Resource_impl(
	    Resource_impl & prm1);
};

#endif // !defined(EA_82A2ACAA_CBBB_45a1_81BD_AFBB37A6D10D__INCLUDED_)
