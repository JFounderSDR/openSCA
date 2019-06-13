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

#ifndef __Aggregate_Device_Servant__
#define __Aggregate_Device_Servant__

#include "CFS.h"
#include "debug.h"

class AggregateDevice_impl :
	public virtual POA_CF::AggregateDevice {
  public:
	AggregateDevice_impl();

	/**
	 * @brief	Get a list of devices added to this device.
	 * 
	 * @return  a list of devices added to this device.
	 */
	CF::DeviceSequence *
	devices ();

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
	addDevice(
	    CF::Device_ptr associatedDevice)
	throw(CF::InvalidObjectReference);

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
	removeDevice(
	    CF::Device_ptr associatedDevice)
	throw(CF::InvalidObjectReference);

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
	devExists(
	    const CF::Device_ptr device,
	    CORBA::ULong & index);

  private:
	/**
	 * The readonly devices attribute shall contain a list of devices
	 * that have been added to this device or a sequence length of zero
	 * if the device has no aggregation relationships with other devices.
	 */
	CF::DeviceSequence m_subDevices;
};

#endif
