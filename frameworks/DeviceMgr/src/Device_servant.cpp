/***************************************************************************//**
* @file     Device_servant.cpp
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

#include "../include/Device_servant.h"

/**
 * @brief A device is a type of resource and has all the requirements associated
 * with the Resource interface. The Device interface defines additional capabilities
 * and attributes for any logical device in the domain. A logical device is a
 * software abstraction for a physical hardware device and provides the following
 * attributes and operations:
 * 	1. Software Profile Attribute ¨C The SPD referenced by this profile element
 * (Profile Descriptor) defines the logical device capabilities (data/command uses
 * and provides ports, configure and query properties, capacity properties, status
 * properties, etc.), which could be a subset of the hardware device¡¯s
 * capabilities.
 * 	2. State Management & Status Attributes ¨C This information describes the
 * administrative, usage, and operational states of the device.
 *	3. Capacity Operations - In order to use a device, certain capacities (e.g.
 * , memory, performance, etc.) are obtained from the device. A device may have
 * multiple capacities which need to be allocated, since each device has its own
 * unique capacity model which is described in the associated software profile.
 */
Device_servant::Device_servant() {
	DEBUG(7, Device_servant, "In default constructor")
	m_initConfig = false;
	m_usageState = CF::Device::IDLE;
	m_operationalState = CF::Device::ENABLED;
	m_adminState = CF::Device::UNLOCKED;
}

Device_servant::Device_servant(
	char* id, 
	char* lbl, 
	char* sftwfl): 
Resource_impl(id) {
	DEBUG(3, Device_servant, "In constructor.")

	m_label = lbl;
	m_softwareProfile = sftwfl;
	m_initConfig = false;
	m_usageState = CF::Device::IDLE;
	m_operationalState = CF::Device::ENABLED;
	m_adminState = CF::Device::UNLOCKED;

	//devUser = new Device_user();
	//create mutex
	//pthread_mutex_init(&_mutex, NULL);
}

Device_servant::Device_servant(
    char* id,
    char* lbl,
    char* sftwfl,
    CF::Properties & capacities):
Resource_impl(id) {
	DEBUG(7, Device_servant, "In constructor")

	m_label = lbl;
	m_softwareProfile = sftwfl;
	m_initConfig = false;
	m_usageState = CF::Device::IDLE;
	m_operationalState = CF::Device::ENABLED;
	m_adminState = CF::Device::UNLOCKED;

	DEBUG(7, Device_servant, "m_adminState is unlocked:" << m_adminState)

	//devUser = new Device_user();
	configure(capacities);

	//create mutex
	//pthread_mutex_init(&_mutex, NULL);
}

Device_servant::~Device_servant() {
	DEBUG(2, Device_servant, "In Device_servant destructor.")
	//delete devUser;
}

CF::Device::AdminType
Device_servant::adminState()
throw (
    CORBA::SystemException) {

	DEBUG(3, Device_servant, "In adminState.")
	return m_adminState;
}

void
Device_servant::adminState(
    CF::Device::AdminType adminType)
throw (
    CORBA::SystemException) {

	m_adminState = adminType;
}

//check if two input parameter is same, and value is valid.
void
Device_servant::allocate(
    CORBA::Any& deviceCapacity,
    const CORBA::Any& resourceRequest) {

	CORBA::TypeCode_var tc1 = deviceCapacity.type();
	CORBA::TypeCode_var tc2 = resourceRequest.type();

	if (tc1->kind() != tc2->kind())
		return;

	switch (tc1->kind()) {
	case CORBA::tk_long:
		CORBA::Long devCapacl;
		CORBA::Long srcReql;
		deviceCapacity >>= devCapacl;
		resourceRequest >>= srcReql;
		if (srcReql <= devCapacl) {
			devCapacl -= srcReql;
			deviceCapacity <<= devCapacl;
		} else {
			DEBUG(3, Device_servant, "can't allocate capacity \
						because device capacity is not sufficient.")
		}
		break;
	case CORBA::tk_ulong:
		CORBA::ULong devCapacul;
		CORBA::ULong srcRequl;
		deviceCapacity >>= devCapacul;
		resourceRequest >>= srcRequl;
		if (srcRequl <= devCapacul) {
			devCapacul -= srcRequl;
			deviceCapacity <<= devCapacul;
		} else {
			DEBUG(3, Device_servant, "can't allocate capacity \
						because device capacity is not sufficient.")
		}
		break;
	case CORBA::tk_short:
		CORBA::Short devCapacs;
		CORBA::Short srcReqs;
		deviceCapacity >>= devCapacs;
		resourceRequest >>= srcReqs;
		if (srcReqs <= devCapacs) {
			devCapacs -= srcReqs;
			deviceCapacity <<= devCapacs;
		} else {
			DEBUG(3, Device_servant, "can't allocate capacity \
						because device capacity is not sufficient.")
		}
		break;
	default:
		break;
	}
}
/**
 * @brief the allocateCapacity operation shall reduce current capacities of Device
 * 		  based upon
 *
 * @param capacities input properties parameters.
 *
 * @return true, if capacities is allocated correctly. or false, if not allocated.
 */
CORBA::Boolean
Device_servant::allocateCapacity(
    const CF::Properties & capacities)
throw (
    CF::Device::InvalidState,
    CF::Device::InvalidCapacity,
    CORBA::SystemException) {

	DEBUG(4, Device_servant, "In allcateCapacity.")

	CF::Properties currentProps;
	bool extraCap = false;
	//pthread_mutex_lock(&_mutex);

	if (capacities.length() == 0) {
		DEBUG(3, Device_servant, "no capacity to configure.")
		return true;
	}
	//check for device state
	if ((m_adminState != CF::Device::UNLOCKED) ||
	        (m_operationalState == CF::Device::DISABLED)) {
		DEBUG(2, Device_servant, "this device is unlocked or disabled.")
		throw CF::Device::InvalidState();
	}

	//check for device usagestate
	if (m_usageState == CF::Device::BUSY) {
		DEBUG(2, Device_servant, "this device is busy and can't be allocated.")
		return true;
	}

	//query all properties
	currentProps.length((capacities.length()));
	for (unsigned int i(0); i < capacities.length(); i++) {
		currentProps[i].id = CORBA::string_dup(capacities[i].id.in());
	}

	try {
		query(currentProps);
	} catch (CF::UnknownProperties & e) {
		DEBUG(3, Device_servant,
		      "there are unkown properties, throwing exception.")
		return false;
	} catch (...) {
		DEBUG(3, Device_servant, "occurred unkown exception.")
		return false;
	}

	//check for sufficient capacities and configure
	for (unsigned int i = 0; i < capacities.length(); i++) {
		for (unsigned int j = 0; j < currentProps.length(); j++) {
			if (strcmp(capacities[i].id, currentProps[j].id))
				allocate(currentProps[j].value, capacities[i].value);
		}
	}

	//store new capacities
	try {
		configure(currentProps);
	} catch (...) {
		DEBUG(3, Device_servant, "occur exception when configure device.")
		//pthread_mutex_unlock(&_mutex);
		return false;
	}

	//check remaining capacity and update usage state
	for (unsigned int i = 0; i < currentProps.length(); i++) {
		if (compareAnyToZero(currentProps[i].value) == POSITIVE) {
			extraCap = true;
			break;
		}
	}
	if (extraCap) {
		setUsageState(CF::Device::ACTIVE);
	} else {
		setUsageState(CF::Device::BUSY);
	}

	//pthread_mutex_unlock(&_mutex);
	return true;
}

/**
 * @brief compareAnys function compares both Any type inputs
 *
 * @return FIRST_BIGGER if the first argument is bigger
 * @retunr SECOND_BIGGER is the second argument is begger and BOTH_EQUAL if they
 * 		   are equal
 */
Device_servant::AnyComparisonType
Device_servant::compareAnys(
    CORBA::Any& first,
    CORBA::Any& second) {

	CORBA::TypeCode_var tc1 = first.type();
	CORBA::TypeCode_var tc2 = second.type();

	switch (tc1->kind()) {
	case CORBA::tk_ulong: {
		CORBA::ULong frst, scnd;
		first >>= frst;
		second >>= scnd;

		if (frst > scnd) {
			return FIRST_BIGGER;
		} else if (frst == scnd) {
			return BOTH_EQUAL;
		} else {
			return SECOND_BIGGER;
		}
	}

	case CORBA::tk_long: {
		CORBA::Long frst, scnd;
		first >>= frst;
		second >>= scnd;

		if (frst > scnd) {
			return FIRST_BIGGER;
		} else if (frst == scnd) {
			return BOTH_EQUAL;
		} else {
			return SECOND_BIGGER;
		}
	}

	case CORBA::tk_short: {
		CORBA::Short frst, scnd;
		first >>= frst;
		second >>= scnd;

		if (frst > scnd) {
			return FIRST_BIGGER;
		} else if (frst == scnd) {
			return BOTH_EQUAL;
		} else {
			return SECOND_BIGGER;
		}
	}

	default:
		return UNKNOWN;
	}
	return UNKNOWN;
}

/**
 * @brief compareAnyToZero function compares the any type input to zero
 *
 * @return POSITIVE if the first argument is bigger
 * @retunr NEGATIVE is the second argument is bigger and ZERO if they are equal
 */
Device_servant::AnyComparisonType
Device_servant::compareAnyToZero(
    CORBA::Any & first) {

	CORBA::TypeCode_var tc1 = first.type();

	switch (tc1->kind()) {
	case CORBA::tk_ulong: {
		CORBA::ULong frst;
		first >>= frst;

		if (frst > 0) {
			return POSITIVE;
		} else if (frst == 0) {
			return ZERO;
		} else {
			return NEGATIVE;
		}
	}

	case CORBA::tk_long: {
		CORBA::Long frst;
		first >>= frst;

		if (frst > 0) {
			return POSITIVE;
		} else if (frst == 0) {
			return ZERO;
		} else {
			return NEGATIVE;
		}
	}

	case CORBA::tk_short: {
		CORBA::Short frst;
		first >>= frst;

		if (frst > 0) {
			return POSITIVE;
		} else if (frst == 0) {
			return ZERO;
		} else {
			return NEGATIVE;
		}
	}

	default:
		return UNKNOWN;
	}
	return UNKNOWN;
}

CF::AggregateDevice_ptr
Device_servant::compositeDevice()
throw (
    CORBA::SystemException) {
	return NULL;
}

void
Device_servant::configure(
    const CF::Properties & configProperties)
throw (
    CF::PropertySet::PartialConfiguration,
    CF::PropertySet::InvalidConfiguration,
    CORBA::SystemException) {
	DEBUG(5, Device_servant, "In configure.")

	if (!m_initConfig) {
		m_originalCaps.length(configProperties.length());

		for (unsigned int i = 0; i < configProperties.length(); i++) {
			m_originalCaps[i].id = CORBA::string_dup(configProperties[i].id);
			m_originalCaps[i].value = configProperties[i].value;
		}
		m_initConfig = true;
	}

	try {
		PropertySet_impl::configure(configProperties);
	} catch (CF::PropertySet::PartialConfiguration) {
		DEBUG(5, Device_servant, "partial configuration exception.")
		throw CF::PropertySet::PartialConfiguration();
	} catch (CF::PropertySet::InvalidConfiguration) {
		DEBUG(5, Device_servant, "invalid configuration exception.")
		throw CF::PropertySet::InvalidConfiguration();
	} catch (...) {
		DEBUG(5, Device_servant, "occur unkown exception when config.")
		throw;
	}
}

void
Device_servant::deallocate(
    CORBA::Any & deviceCapacity,
    const CORBA::Any & resourceRequest) {

	CORBA::TypeCode_var tc1 = deviceCapacity.type();
	CORBA::TypeCode_var tc2 = resourceRequest.type();

	switch (tc1->kind()) {
	case CORBA::tk_ulong: {
		CORBA::ULong devCapac, rscReq;
		deviceCapacity >>= devCapac;
		resourceRequest >>= rscReq;
		devCapac += rscReq;
		deviceCapacity <<= devCapac;
		break;
	}

	case CORBA::tk_long: {
		CORBA::Long devCapac, rscReq;
		deviceCapacity >>= devCapac;
		resourceRequest >>= rscReq;
		devCapac += rscReq;
		deviceCapacity <<= devCapac;
		break;
	}

	case CORBA::tk_short: {
		CORBA::Short devCapac, rscReq;
		deviceCapacity >>= devCapac;
		resourceRequest >>= rscReq;
		devCapac += rscReq;
		deviceCapacity <<= devCapac;
		break;
	}

	default:
		break;
	}
}

void
Device_servant::deallocateCapacity(
    const CF::Properties & capacities)
throw (
    CF::Device::InvalidState,
    CF::Device::InvalidCapacity,
    CORBA::SystemException) {

	DEBUG(5, Device_servant, "In deallocateCapacity.")
	CF::Properties currentProps;

	//Flag to check remaining extra capacity to allocate
	bool totalCap = true;
	//Flag to indicate if the requested property was found
	bool foundProperty;
	AnyComparisonType compResult;

	if (capacities.length() == 0) {
		DEBUG(5, Device_servant, "no capacity to configure.")
		return;
	}
	//check for device state
	if ((m_adminState != CF::Device::UNLOCKED) ||
	        (m_operationalState == CF::Device::DISABLED)) {
		DEBUG(2, Device_servant, "this device is unlocked or disabled.")
		throw CF::Device::InvalidState();
	}

	//query all properties
	currentProps.length((capacities.length()));
	for (unsigned int i(0); i < capacities.length(); i++) {
		currentProps[i].id = CORBA::string_dup(capacities[i].id.in());
	}

	try {
		query(currentProps);
	} catch (CF::UnknownProperties & e) {
		DEBUG(5, Device_servant,
		      "there are unkown properties, throwing exception.")
		return;
	} catch (...) {
		DEBUG(5, Device_servant, "occurred unkown exception.")
		return;
	}

	//check for sufficient capacities and configure
	for (unsigned int i = 0; i < capacities.length(); i++) {
		for (unsigned int j = 0; j < currentProps.length(); j++) {
			if (strcmp(capacities[i].id, currentProps[j].id))
				deallocate(currentProps[j].value, capacities[i].value);
		}
	}

	//store new capacities
	try {
		configure(currentProps);
	} catch (...) {
		DEBUG(5, Device_servant, "occur exception when configure device.")
		return;
	}

	// Check for exceeding dealLocations and back-to-total capacity
	for (unsigned int i = 0; i < currentProps.length(); i++) {
		for (unsigned int j = 0; j < m_originalCaps.length(); j++) {
			if (strcmp(currentProps[i].id, m_originalCaps[j].id) == 0) {
				continue;
			}
			compResult = compareAnys(currentProps[i].value,
			                         m_originalCaps[j].value);

			if (compResult == FIRST_BIGGER) {
				throw (CF::Device::InvalidCapacity("Cannot deallocate capacity.\
					New capacity would exceed original bound.", capacities));
			} else if (compResult == SECOND_BIGGER) {
				totalCap = false;
				break;
			}
		}
	}

	//store new capacities
	configure(currentProps);

	//Update usage state
	if (!totalCap) {
		setUsageState(CF::Device::ACTIVE);
	} else {
		setUsageState(CF::Device::IDLE);
	}
}

void
Device_servant::initialize()
throw (
    CF::LifeCycle::InitializeError,
    CORBA::SystemException) {

	DEBUG(5, DeviceManager_impl, "In Device_servant initialize.")
}

char *
Device_servant::label()
throw (
    CORBA::SystemException) {

	return CORBA::string_dup(m_label.c_str());
}

CF::Device::OperationalType
Device_servant::operationalState()
throw (
    CORBA::SystemException) {

	return m_operationalState;
}

void
Device_servant::query(
    CF::Properties& props)
throw (
    CF::UnknownProperties,
    CORBA::SystemException) {

	DEBUG(5, Device_servant, "In query.")

	try {
		PropertySet_impl::query(props);
	} catch (...) {
		DEBUG(5, Device_servant, "query occur exception...")
	}
}

void
Device_servant::runTest(
    CORBA::ULong TestID,
    CF::Properties& testValues)
throw (
    CF::UnknownProperties,
    CF::TestableObject::UnknownTest,
    CORBA::SystemException) {

	DEBUG(5, Device_servant, "In runTest.")
}

void
Device_servant::setUsageState(
    CF::Device::UsageType newUsageState) {

	DEBUG(5, Device_servant, "In setUsageState.")
	m_usageState = newUsageState;
}

char *
Device_servant::softwareProfile()
throw (
    CORBA::SystemException) {

	return CORBA::string_dup(m_softwareProfile.c_str());
}

void
Device_servant::start()
throw (
    CF::Resource::StartError,
    CORBA::SystemException) {

	DEBUG(5, DeviceManager_impl, "In Device_servant start.")
}

void
Device_servant::stop()
throw (
    CF::Resource::StopError,
    CORBA::SystemException) {

	DEBUG(5, Device_servant, "In stop")
}

CF::Device::UsageType
Device_servant::usageState()
throw (CORBA::SystemException) {
	return m_usageState;
}

CORBA::Object_ptr
Device_servant::getPort(
    const char* name)
throw (
    CF::PortSupplier::UnknownPort,
    CORBA::SystemException) {
	CORBA::Object_ptr port = CORBA::Object::_nil();
	return port;
}