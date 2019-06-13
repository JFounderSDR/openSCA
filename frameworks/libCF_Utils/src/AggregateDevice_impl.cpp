/***************************************************************************//**
* @file     AggregateDevice_impl.h
* @author   open Team
* @version  9
* @date     2017-03-14
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

#include "../include/AggregateDevice_impl.h"

AggregateDevice_impl::AggregateDevice_impl() {
	DEBUG(5, AggregateDevice_impl, "construction enter in ...")

	DEBUG(5, AggregateDevice_impl, "construction leave ...")
}

/**
 * @brief	Get a list of devices added to this device.
 *
 * @return  a list of devices added to this device.
 */
CF::DeviceSequence *
AggregateDevice_impl::devices() {
	CF::DeviceSequence_var devices;
	try {
		devices = new CF::DeviceSequence(m_subDevices);
	} catch (CORBA::SystemException & e) {
		DEBUG(5, AggregateDevice_impl::devices, "CORBA::SystemException")
	} catch (...) {
		DEBUG(5, AggregateDevice_impl::devices, "Unknown Exception")
	}

	return devices._retn();
}


/**
 * @brief	Check existion of the specific device.
 *
 * @param[in] device	device which needs to be checked.
 * @param[inout] index	index of the device at m_subDevices.
 *
 * @return  existion of the specific device.
 * @retval true		the device is existent.
 * @retval false	the device is nonexistent.
 */
bool
AggregateDevice_impl::devExists(
    const CF::Device_ptr device,
    CORBA::ULong & index) {
	DEBUG(5, AggregateDevice_impl::devExists, "enter in ...")

	for (CORBA::ULong i = 0; i < m_subDevices.length(); i++) {
		if ( 0 == strcmp(m_subDevices[i]->identifier(), 
						device->identifier()) ) {
			index = i;
			DEBUG(5, AggregateDevice_impl::devExists, 
				"child device is existed, leave ...")
			return true;
		}
	}

	DEBUG(5, AggregateDevice_impl::devExists, "leave ...")
	return false;
}

/**
 * @brief	The addDevice operation shall add the input associatedDevice parameter to the
 *			AggregateDevice’s devices attribute when the associatedDevice does not exist in the devices
 *			attribute. The associatedDevice is ignored when duplicated.
 *			The addDevice operation shall write a FAILURE_ALARM log record, upon unsuccessful adding
 *			of an associatedDevice to the AggregateDevice’s devices attribute.
 *
 * @param[in] associatedDevice  device need to be added.
 */
void
AggregateDevice_impl::addDevice(
    CF::Device_ptr associatedDevice)
throw(CF::InvalidObjectReference) {
	DEBUG(5, AggregateDevice_impl::addDevice, "enter in ...")

	if (CORBA::is_nil(associatedDevice)) {
		DEBUG(5, AggregateDevice_impl::addDevice, "associatedDevice is nil")

		throw CF::InvalidObjectReference("[AggregateDevice_impl::addDevice],\
				can't add device, associatedDevice is nil");
	}
	CORBA::ULong index;
	if (!devExists(associatedDevice, index)) {
		m_subDevices.length( m_subDevices.length() + 1 );
		m_subDevices[m_subDevices.length() - 1] = 
			CF::Device::_duplicate(associatedDevice);
	}
	DEBUG(5, AggregateDevice_impl::addDevice, "leave ...")
}

/**
 * @brief	The removeDevice operation shall remove the input associatedDevice
 * 			parameter from the AggregateDevice’s devices attribute.
 *  		The removeDevice operation shall write a FAILURE_ALARM log record,
 *  		upon unsuccessful removal of the associatedDevice from the
 *  		AggregateDevice devices attribute.
 *
 * @param[in] associatedDevice  device need to be removed.
 */
void
AggregateDevice_impl::removeDevice(
    CF::Device_ptr associatedDevice)
throw(CF::InvalidObjectReference) {
	DEBUG(5, AggregateDevice_impl::removeDevice, "enter in ...")

	if (CORBA::is_nil(associatedDevice)) {
		DEBUG(5, AggregateDevice_impl::removeDevice, 
			"associatedDevice is nil")

		throw CF::InvalidObjectReference("[AggregateDevice_impl::removeDevice],\
			can't remove device, associatedDevice is nil");
	}

	CORBA::ULong index;
	if (devExists(associatedDevice, index)) {
		for (CORBA::ULong i = index; i < m_subDevices.length() - 1; i++) {
			m_subDevices[i] = m_subDevices[i + 1];
		}
		m_subDevices.length( m_subDevices.length() - 1 );
	}

	DEBUG(5, AggregateDevice_impl::removeDevice, "leave ...")
}
