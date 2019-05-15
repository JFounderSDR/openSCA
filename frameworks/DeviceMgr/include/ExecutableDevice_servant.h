/***************************************************************************//**
* @file     ExecutableDevice_servant.h
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

#if !defined(EA_823B4368_4B7C_47b0_BA48_2EC972AE19D1__INCLUDED_)
#define EA_823B4368_4B7C_47b0_BA48_2EC972AE19D1__INCLUDED_

#include "LoadableDevice_servant.h"
#include "utils.h"
#include "ConfigParser.h"
#include "openscaSupport.h"
#include "Boost_utils.h"

/**
 * @brief This interface extends the LoadableDevice interface by adding 
 *        execute and terminate behavior to a device.
 */
class ExecutableDevice_servant :		
public virtual LoadableDevice_servant,
public virtual POA_CF::ExecutableDevice 
{
public:
	ExecutableDevice_servant(
		char* id,
		char* labl,
		char* sftwfl);

	ExecutableDevice_servant() {

	}

	~ExecutableDevice_servant() {

	}

	void
	configure(
		const CF::Properties & configProperties)
	throw (
		CF::PropertySet::PartialConfiguration,
		CF::PropertySet::InvalidConfiguration,
		CORBA::SystemException);

	/**
	 * @brief The execute operation provides the mechanism for starting up 
	 *        and executing a software process/thread on a device.
	 *
	 * The execute operation shall execute the function or file identified by 
	 * the input name parameter using the input parameters and options parameters. 
	 * Whether the input name parameter is a function or a file name is 
	 * device-implementation-specific.
	 * 
	 * The execute operation shall convert the input parameters 
	 * (id/value string pairs) parameter to the standard argv of the POSIX exec 
	 * family of functions, where argv(0) is the function name. The execute operation 
	 * shall map the input parameters parameter to argv starting at index 1 as follows,
	 * argv (1) maps to input parameters (0) id and argv (2) maps to input 
	 * parameters (0) value and so forth. The execute operation passes argv through 
	 * the operating system “execute” function.
	 *
	 * The execute operation input options parameters are STACK_SIZE_ID and 
	 * PRIORITY_ID. The execute operation shall use these options, when specified, 
	 * to set the operating system’s process/thread stack size and priority, 
	 * for the executable image of the given input name parameter.
	 *
	 * @param[in] name			Name of the code file need executed.
	 * @param[in] options		Options parameters are STACK_SIZE_ID and PRIORITY_ID. 
	 * 							The execute operation shall use these options, when 
	 * 						 	specified, to set the operating system’s process/thread 
	 * 						  	stack size and priority.
	 * @param[in] parameters	Pass some parameters to the entryPoint that the
	 * 							function needs.
	 *
	 * @return 	A unique process ID for the process that it created.
	 * @exception The execute operation shall raise the InvalidState exception 
	 *            if upon entry the device's adminState attribute is either LOCKED 
	 *            or SHUTTING_DOWN or its operationalState attribute is DISABLED.
	 *            
	 *            The execute operation shall raise the InvalidFunction exception 
	 *            when the function indicated by the input name parameter does not 
	 *            exist for the device.
	 *            
	 *            The execute operation shall raise the CF InvalidFileName exception 
	 *            when the file name indicated by the input name parameter does not 
	 *            exist for the device.
	 *            
	 *            The execute operation shall raise the InvalidParameters exception 
	 *            when the input parameter ID or value attributes are not valid 
	 *            strings.
	 *            
	 *            The execute operation shall raise the InvalidOptions exception when 
	 *            the input options parameter does not comply with 
	 *            sections 3.1.3.3.3.3.6 STACK_SIZE_ID and 3.1.3.3.3.3.7 PRIORITY_ID.
	 *            
	 *            The execute operation shall raise the ExecuteFail exception when 
	 *            the operating system “execute” function for the device is not 
	 *            successful.
	 */
	CF::ExecutableDevice::ProcessID_Type
	execute(
		const char * name,
		const CF::Properties & options,
		const CF::Properties & parameters)
	throw (
		CF::ExecutableDevice::ExecuteFail,
		CF::InvalidFileName,
		CF::ExecutableDevice::InvalidOptions,
		CF::ExecutableDevice::InvalidParameters,
		CF::ExecutableDevice::InvalidFunction,
		CF::Device::InvalidState,
		CORBA::SystemException);

	/**
	 * @brief The terminate operation provides the mechanism for terminating the 
	 *        execution of a process/thread on a specific device that was started 
	 *        up with the execute operation.
	 *        
	 *        The terminate operation shall terminate the execution of the 
	 *        process/thread designated by the processId input parameter on the device.
	 *
	 * @param[in] processId	 Id of the process needs terminated.
	 * @exception The terminate operation shall raise the InvalidState exception 
	 *            if upon entry the device's adminState attribute is LOCKED or its 
	 *            operationalState attribute is DISABLED.
	 *            
	 *            The terminate operation shall raise the InvalidProcess exception 
	 *            when the process Id does not exist for the device.
	 */
	void
	terminate(
		CF::ExecutableDevice::ProcessID_Type processId)
	throw (
		CF::Device::InvalidState,
		CF::ExecutableDevice::InvalidProcess,
		CORBA::SystemException);

private:
#ifdef __SDS_OS_LINUX__
	PidMap m_pidMap;
#endif

	ExecutableDevice_servant(
		ExecutableDevice_servant & prm1);

	bool 
	KillProcess(pid_type pid);

	void 
	parseOptions(
		const CF::Properties & options,
		CORBA::ULong & stackSize,
		CORBA::ULong & priority,
		std::string & entryPoint,
		CF::Properties & invalidProperties);

	char **
	parseExecuteParams(
		int argc,
		const CF::Properties & parameters,
		CORBA::ULong ulStacksize,
		CORBA::ULong ulPriority,
		const std::string & entryPoint,
		CF::Properties & invalidProperties);
};
#endif // !defined(EA_823B4368_4B7C_47b0_BA48_2EC972AE19D1__INCLUDED_)
