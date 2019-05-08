/***************************************************************************//**
* @file     Device_servant.h
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

#if !defined(EA_8EEF0755_FB2A_489f_90F2_23CFF0755138__INCLUDED_)
#define EA_8EEF0755_FB2A_489f_90F2_23CFF0755138__INCLUDED_

#include "debug.h"
#include "Resource_impl.h"

/**
 * @brief A device is a type of resource and has all the requirements 
 * associated with the Resource interface. The Device interface defines 
 * additional capabilities and attributes for any logical device in the domain. 
 * A logical device is a software abstraction for a physical hardware device 
 * and provides the following attributes and operations:
 *	1. Software Profile Attribute - The SPD referenced by this profile element
 * (Profile Descriptor) defines the logical device capabilities (data/command 
 * uses and provides ports, configure and query properties, capacity 
 * properties, status properties, etc.), which could be a subset of the 
 * hardware device's capabilities. 
 *  2. State Management & Status Attributes - This information describes the
 * administrative, usage, and operational states of the device. 
 *	3. Capacity Operations - In order to use a device, certain capacities (e.g.
 * , memory, performance, etc.) are obtained from the device. A device may have
 * multiple capacities which need to be allocated, since each device has its own
 * unique capacity model which is described in the associated software profile.
 */
class Device_servant:
public virtual Resource_impl,
public virtual POA_CF::Device
{
public:
	Device_servant();
	
	/**
	 * @brief	Constructor of the Device_servant.
	 * @param[in] id	 Identifier of the device.
	 * @param[in] lbl	 Label of the device.
	 * @param[in] sftwfl Device's spd.xml file path.
	 */
	Device_servant(
		char * id, 
		char * lbl, 
		char * sftwfl);
	
	Device_servant(
		char* id,
    	char* lbl,
    	char* sftwfl,
    	CF::Properties & capacities);

	~Device_servant();
	
	/**
	 * @brief	The operation shall return device's administrative state.
	 *
	 * The administrative state indicates the permission to use or prohibition 
	 * against using the device. The adminState attribute shall contain the device・s 
	 * admin state value. The adminState attribute shall only allow the setting of 
	 * LOCKED and UNLOCKED values, where setting ：LOCKED； is only effective when the 
	 * adminState attribute value is UNLOCKED, and setting ：UNLOCKED； is only 
	 * effective when the adminState attribute value is LOCKED or SHUTTING_DOWN.
	 * Illegal state transitions commands are ignored.
	 * 
	 * The adminState attribute, upon being commanded to be LOCKED, shall transition 
	 * from the UNLOCKED to the SHUTTING_DOWN state and set the adminState to LOCKED 
	 * for its entire aggregation of devices (if it has any). The adminState shall 
	 * then transition to the LOCKED state when the device・s usageState is IDLE and 
	 * its entire aggregation of devices are LOCKED. 
	 * 
	 * The device shall send a StateChangeEventType event to the Incoming Domain 
	 * Management event channel, whenever the adminState attribute changes. 
	 * For this event,
	 * 1. The producerId field is the identifier attribute of the device.
	 * 2. The sourceId field is the identifier attribute of the device.
	 * 3. The stateChangeCategory field is ：ADMINISTRATIVE_STATE_EVENT；.
	 * 4. The stateChangeFrom field is the value of the adminState attribute before 
	 * the state change
	 * 5. The stateChangeTo field is the value of the adminState attribute after 
	 * the state change.
	 * 
	 * @return  Administrative state of the device.
	 * @exception The operation may raise CORBA::SystemException.
	 */
	CF::Device::AdminType 
	adminState()
	throw (
		CORBA::SystemException);
	
	/**
	 * @brief	The operation shall set device's administrative state.
	 * @param[in]	adminType	New device's administrative state.
	 * @exception	The operation may raise CORBA::SystemException.
	 */
	void 
	adminState(
		CF::Device::AdminType adminType)
	throw (
		CORBA::SystemException);

	/**
	 * @brief The allocateCapacity operation provides the mechanism to 
	 *        request and allocate capacity from the Device.
	 *        
	 * The allocateCapacity operation shall reduce the current capacities of the 
	 * device based upon the input capacities parameter, when the device・s adminState 
	 * is UNLOCKED, device・s operationalState is ENABLED, and device・s usageState 
	 * is not BUSY.
	 * The allocateCapacity operation shall set the Device・s usageState attribute 
	 * to BUSY, when the device determines that it is not possible to allocate any 
	 * further capacity. The allocateCapacity operation shall set the usageState 
	 * attribute to ACTIVE, when capacity is being used and any capacity is still 
	 * available for allocation.
	 * 
	 * The allocateCapacity operation shall only accept properties for the input 
	 * capacities parameter which are simple properties whose kindtype is allocation 
	 * and whose action element is external contained in the component・s SPD.
	 *
	 * param[in] Capacities that the deployed component consumed.
	 *
	 * @return The allocateCapacity operation shall return TRUE, 
	 *         if the capacities have been allocated, or FALSE, if not allocated.
	 *
	 * @exception The allocateCapacity operation shall raise the InvalidCapacity 
	 *            exception, when the input capacities parameter contains invalid 
	 *            properties or when attributes of those CF Properties contain
	 *            an unknown id or a value of the wrong data type.
	 */
	CORBA::Boolean 
	allocateCapacity(
		const CF::Properties & capacities)
	throw (
		CF::Device::InvalidState, 
		CF::Device::InvalidCapacity,
		CORBA::SystemException);

	/**
	 * @brief	The operation shall return the compositeDevice reference.
	 *
	 * The readonly compositeDevice attribute shall contain the object reference 
	 * of the aggregate device when this device is a parent device. 
	 * The readonly compositeDevice attribute shall contain a nil CORBA object 
	 * reference when this device is not a parent device.
	 *
	 * @return The object reference of the aggregate device.
	 * @exception The operation may raise CORBA::SystemException.
	 */
	CF::AggregateDevice_ptr 
	compositeDevice() 
	throw (
		CORBA::SystemException);

	/**
	 * @brief The configure operation allows id/value pair configuration properties 
	 *        to be assigned to components implementing this interface.
	 *
	 * The configure operation shall assign values to the properties as indicated 
	 * in the input configProperties parameter. Valid properties for the configure 
	 * operation shall at a minimum be the configure readwrite and writeonly 
	 * properties referenced in the component・s SPD.
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
	 * @brief The deallocateCapacity operation provides the mechanism to return 
	 *        capacities back to the device, making them available to other users.
	 *
	 * The deallocateCapacity operation shall adjust the current capacities of 
	 * the device based upon the input capacities parameter.
	 * The deallocateCapacity operation shall set the usageState attribute to ACTIVE 
	 * when, after adjusting capacities, any of the device・s capacities are still 
	 * being used.
	 * The deallocateCapacity operation shall set the usageState attribute to IDLE 
	 * when, after adjusting capacities, none of the device・s capacities are still 
	 * being used.
	 * The deallocateCapacity operation shall set the adminState attribute to LOCKED 
	 * as specified in 3.1.3.2.4.4.2.
	 *
	 * @param[in] capacities Capacities shall be deallocated.
	 *
	 * @exception The deallocateCapacity operation shall raise the InvalidCapacity 
	 *            exception, when the capacity ID is invalid or the capacity value 
	 *            is the wrong type. The InvalidCapacity exception msg parameter 
	 *            describes the reason for the exception.
	 *            The deallocateCapacity operation shall raise the InvalidState 
	 *            exception, when the device・s adminState is LOCKED or 
	 *            operationalState is DISABLED.
	 */
	void 
	deallocateCapacity(
		const CF::Properties & capacities)
	throw (
		CF::Device::InvalidState, 
		CF::Device::InvalidCapacity,
		CORBA::SystemException);

	/**
	 * @brief The getPort operation provides a mechanism to obtain a specific 
	 *        consumer or producer port. A port supplier may contain zero-to-many 
	 *        consumer and producer port components. The exact number is specified 
	 *        in the component・s software profile SCD (section 3.1.3.5). Multiple 
	 *        input and/or output ports provide flexibility for port suppliers that 
	 *        manage varying priority levels and categories of incoming and outgoing 
	 *        messages, provide multi-threaded message handling, or other special 
	 *        message processing.
	 *
	 *		  The getPort operation returns the object reference to the named port 
	 *		  as stated in the component's SCD.
	 *
	 * @param[in] name Name of the port.
	 * @return The getPort operation shall return the CORBA object reference 
	 *         that is associated with the input port name.
	 * @exception The getPort operation shall raise an UnknownPort exception 
	 *            if the port name is invalid.
	 */
	CORBA::Object_ptr 
	getPort(
		const char * name)
	throw (
		CF::PortSupplier::UnknownPort, 
		CORBA::SystemException);

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
	 * @brief	The operation shall return device's label.
	 *
	 * 			The readonly label attribute shall contain the device・s label. 
	 * 			The label attribute is the meaningful name given to a device. 
	 * 			The attribute could convey location information within the system 
	 * 			(e.g.,audio1, serial1, etc.).
	 * 			
	 * @return Label of the device.
	 * @exception The operation may raise CORBA::SystemException.
	 */
	char *
	label() 
	throw (
		CORBA::SystemException);

	/**
	 * @brief The operation shall return device's operation state.
	 *
	 * The readonly operationalState attribute shall contain the device・s 
	 * operational state (ENABLED or DISABLED). The operational state indicates 
	 * whether or not the device is functioning.
	 * The device shall send a StateChangeEventType event to the Incoming Domain 
	 * Management event channel, whenever the operationalState attribute changes. 
	 * For this event,
	 * 1. The producerId field is the identifier attribute of the device.
	 * 2. The sourceId field is the identifier attribute of the device.
	 * 3. The stateChangeCategory field is ：OPERATIONAL_STATE_EVENT；.
	 * 4. The stateChangeFrom field is the value of the operationalState attribute 
	 * 	  before the state change.
	 * 5. The stateChangeTo field is the value of the operationalState attribute 
	 * 	  after the state change.
	 *
	 * @return Device's operation state.
	 * @exception The operation may raise CORBA::SystemException.
	 */
	CF::Device::OperationalType 
	operationalState()
	throw (
		CORBA::SystemException);

	/**
	 * @brief The query operation allows a component to be queried to 
	 *        retrieve its properties.
	 *
	 * The query operation shall return all component properties when the inout 
	 * parameter configProperties is zero size. The query operation shall return 
	 * only those id/value pairs specified in the configProperties parameter if 
	 * the parameter is not zero size. Valid properties for the query operation 
	 * shall be all configure properties (simple properties whose kind element・s 
	 * kindtype attribute is ：configure；) whose mode attribute is ：readwrite； or 
	 * ：readonly； and any allocation properties with an action value of "external" 
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

	/**
	 * @brief The runTest operation allows components to be ：black box； tested. 
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
	 * specified in the component・s Properties Descriptor. Valid testId(s) and both 
	 * input and output testValues(properties) for the runTest operation shall at a 
	 * minimum be the test properties defined in the properties test element of 
	 * the component's Properties Descriptor (refer to Appendix D Domain Profile). 
	 * The testId parameter corresponds to the XML attribute testId of the property 
	 * element test in a propertyfile.
	 * A CF UnknownProperties exception is raised by the runTest operation. 
	 * All testValues parameter properties (i.e., test properties defined in the 
	 * propertyfile(s) referenced in the component・s SPD) shall be validated.
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
	 *            are not known by the component・s test implementation or any values 
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

	/**
	 * @brief The operation shall return device's spd.xml file path.
	 *
	 * The softwareProfile attribute contains the profile descriptor for this device.
	 * The readonly softwareProfile attribute shall contain a profile element 
	 * (Profile Descriptor) with a file reference to the SPD file. Files referenced 
	 * within the profile are obtained via the FileManager.
	 *
	 * @return Device's spd.xml file path.
	 * @exception The operation may raise CORBA::SystemException.
	 */
	char *
	softwareProfile() 
	throw (
		CORBA::SystemException);

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

	/**
	 * @brief The operation shall return device's usage state.
	 *
	 * The readonly usageState attribute shall contain the device・s usage state 
	 * (IDLE, ACTIVE, or BUSY). UsageState indicates whether or not a device is 
	 * actively in use at a specific instant, and if so, whether or not it has spare 
	 * capacity for allocation at that instant.
	 * The device shall send a StateChangeEventType event to the Incoming Domain 
	 * Management event channel, whenever the usageState attribute changes. 
	 * For this event,
	 * 1. The producerId field is the identifier attribute of the device.
	 * 2. The sourceId field is the identifier attribute of the device.
	 * 3. The stateChangeCategory field is ：USAGE_STATE_EVENT；.
	 * 4. The stateChangeFrom field is the value of the usageState attribute before 
	 * 	  the state change.
	 * 5. The stateChangeTo field is the value of the usageState attribute after 
	 * 	  the state change.
	 *
	 * @return Device's usage state.
	 *
	 * @exception The operation shall raise CORBA::SystemException.
	 */
	CF::Device::UsageType 
	usageState() 
	throw (
		CORBA::SystemException);

	/**
	 * @brief The operation shall set the device's usage state to a new value.
	 * @param[in] newUsageState		New usage state setted for the device.
	 */
	void 
	setUsageState(
		CF::Device::UsageType newUsageState);

protected:
	enum AnyComparisonType {
		FIRST_BIGGER,
		SECOND_BIGGER,
		BOTH_EQUAL,
		POSITIVE,
		NEGATIVE,
		ZERO,
		UNKNOWN
	};
	
	CF::Device::AdminType m_adminState;
	std::string m_label;
	CF::Device::OperationalType m_operationalState;
	std::string m_softwareProfile;
	CF::Device::UsageType m_usageState;
	
	/**AggregateDevice _compositeDevice*/
	bool m_initConfig;
	char * keyProperties[6];
	
	CF::Properties m_originalCaps;

	/**
	 * @brief The operation shall update device's capacity,
	 *        using deviceCapacity minus resourceRequest.
	 *
	 * @param[inout] deviceCapacity	 Capacity value of the device.
	 * @param[in]	 resourceRequest Capacity need by deployed component.
	 */
	void 
	allocate(
		CORBA::Any & deviceCapacity,
		const CORBA::Any & resourceRequest);

	AnyComparisonType 
	compareAnys(
		CORBA::Any & first, 
		CORBA::Any & second);

	AnyComparisonType 
	compareAnyToZero(
		CORBA::Any & first);

	void 
	deallocate(
		CORBA::Any & deviceCapacity,
		const CORBA::Any & resourceRequest);
};
#endif // !defined(EA_8EEF0755_FB2A_489f_90F2_23CFF0755138__INCLUDED_)
