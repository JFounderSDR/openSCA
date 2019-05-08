/***************************************************************************//**
* @file     ApplicationFactorySupport.h
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

// Base class to contain data for the components required to
// create an application

#if !defined(_APPLICATION_FACTORY_SUPPORT_H)
#define _APPLICATION_FACTORY_SUPPORT_H

#include <iostream>
#include <vector>
#include "debug.h"
#include "CFS.h"
#include "prop_helpers.h"

namespace openscaSupport{
/**
 * @brief The class used to store component's information, these cmponents
 *        are portion of an application.
 */
class ComponentInfo {
public:
	ComponentInfo ();

	void
	setName(
		const char * name);

	void
	setIdentifier(
		const char * identifier);

	/**
	 * @brief The operation shall set which device the component deployed on.
	 *
	 * @param[in] assignedDeviceId	Id of the device which the component deploy on. 
	 */
	void
	setAssignedDeviceId(
		const char * assignedDeviceId);

	void
	setOperatingSystem(
		const char * osName);

	void
	setProcessors(
		std::vector<std::string> processornames);

	void
	setImplId(
		const char * implId);

	void
	setCodeType(
		CF::LoadableDevice::LoadType codeType);

	void
	setLocalFileName(
		const char * localFileName);

	void
	setImplPRFFile(
		const char * PRFFile);

	void
	setImplSPDFile(
		const char * SPDFile);

	void
	setEntryPoint(
		const char * entryPoint);

	void
	setNamingService(
		const bool isNamingService);

	void
	setNamingServiceName(
		const char * NamingServiceName);

	void
	setUsageName(
		const char * usageName);

	void
	setIsResource(
		bool isResource);

	void
	setIsConfigurable(
		bool isConfigurable);

	void
	setIsAssemblyController(
		bool isAssemblyController);

	/**
	 * @brief The operation set the flag of whether the component is 
	 *        complicant with SCA.
	 *
	 * @param[in] scaComplicant 	Flag of whether the component is 
	 *       	 					complicant with SCA, optional value are
	 *       	 					true and false.
	 */
	void
	setScaComplicant(
		bool scaComplicant);

	void
	setStackSize(
		unsigned long stackSize);

	void
	setPriority(
		unsigned long prio);

	void
	setDeployedOnResourceFactory(
		bool deployedOnResourceFactory);

	void
	setDeployedOnExecutableDevice(
		bool deployedOnExecutableDevice);

	void
	setPID(
		CF::ExecutableDevice::ProcessID_Type pid);

	void
	setDeployedOnLoadableDevice(
		bool deployedOnLoadableDevice);

	void
	addFactoryParameter(
		CF::DataType * dt);

	void 
	addExecParameter(
		CF::DataType *dt);

	void
	addAllocationCapacity(
		CF::DataType * dt);

	void
	addConfigureProperty(
		CF::DataType * dt);

	void
	overrideProperty(
		const char * id,
		std::vector <std::string> values);

	void
	addOption(
		CF::DataType * dt);

	void
	addAffinityCompinents(
		const std::vector<std::string> & affinityComponents);

	void
	setResourcePtr(
		CF::Resource_ptr);

	void
	setDevicePtr(
		CF::Device_ptr);

	const char *
	getName();

	const char *
	getIdentifier();

	const char *
	getAssignedDeviceId();

	const char *
	getOSName();

	std::vector<std::string>
	getProcessors();

	const char *
	getImplId();

	CF::LoadableDevice::LoadType
	getCodeType();

	const char *
	getLocalFileName();

	const char *
	getImplSPDFile();

	const char *
	getImplPRFFile();

	const char *
	getEntryPoint();

	unsigned long
	getStackSize();

	unsigned long
	getPriority();

	bool
	isNamingService();

	const char *
	getUsageName();

	const char *
	getNamingServiceName();

	bool
	isResource();

	bool
	isConfigurable();

	bool
	isAssemblyController();

	bool
	isScaComplicant();

	bool
	getDeployedOnResourceFactory();

	bool
	getDeployedOnExecutableDevice();

	CF::ExecutableDevice::ProcessID_Type
	getPID();

	bool
	getDeployedOnLoadableDevice();

	CF::Properties
	getConfigureProperties();

	CF::Properties
	getAllocationCapacities();

	CF::Resource_ptr
	getResourcePtr();

	CF::Device_ptr
	getDevicePtr();

	std::vector<std::string>
	getAffinityComponents();

private:
	ComponentInfo
	(const ComponentInfo &);

	void
	process_overrides(
		CF::Properties * props,
		const char * id,
		std::vector <std::string> values);

	bool m_isAssemblyController;
	bool m_isResource;
	bool m_isConfigurable;
	bool m_isNamingService;
	bool m_deployedOnResourceFactory;
	bool m_deployedOnLoadableDevice;
	bool m_deployedOnExecutableDevice;
	bool m_scaComplicant;
	// Component name from SPD File
	std::string m_name;
	// Device to deploy component on from DAS.
	std::string m_assignedDeviceId;
	std::string m_os;
	std::vector<std::string> m_processors;

	// The implementation stuff should be vectorized to support more than
	// one implementation. The implemenation parser may not be consistent
	// how it returns values.
	// Implementation ID from SPD File
	std::string m_implId;
	// Implementation code type from SPD File
	CF::LoadableDevice::LoadType m_codeType;
	// Implementation local file name from SPD File
	std::string m_localFileName;
	// PRF path for specific implementation
	std::string m_implPRF;
	std::string m_implSPD;
	// Implementation entry point from SPD File
	std::string m_entryPoint;
	std::string m_usageName;
	std::string m_identifier;
	std::string m_namingServiceName;

	// PJB    CF::LoadableDevice::LoadType codeType;
	//    std::vector <SPDUsesDevice *>* usesDevices;

	void
	addProperty(
		CF::DataType * dt,
		CF::Properties & prop);

	CF::Properties m_allocationCapacities;
	CF::Properties m_configureProperties;
	CF::Properties m_factoryParameters;
	CF::Properties m_execParameters;
	CORBA::ULong m_stackSize;
	CORBA::ULong m_priority;

	//chang PID to pid, otherwise cause error: expected an identifier
	CF::ExecutableDevice::ProcessID_Type m_pid;
	CF::Resource_var m_rsc;
	CF::Device_var m_devicePtr;
	std::vector<std::string> m_affinityCompinents;
};

}
#endif	//_APPLICATION_FACTORY_SUPPORT_H