/***************************************************************************//**
* @file     ApplicationFactorySupport.cpp
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

#include <iostream>
#include <stdlib.h>
#include "../include/ApplicationFactorySupport.h"
#include "../include/debug.h"

using namespace openscaSupport;

ComponentInfo::ComponentInfo() :
	m_isAssemblyController(false),
	m_isResource(false),
	m_isConfigurable(false) {
	m_assignedDeviceId = "";
}

void
ComponentInfo::setName(
    const char * name) {
	m_name = name;
}

void
ComponentInfo::setIdentifier(
    const char * identifier) {
	m_identifier = identifier;
}

void
ComponentInfo::setAssignedDeviceId(
    const char * assignedDeviceId) {
	m_assignedDeviceId = assignedDeviceId;
}

void
ComponentInfo::setOperatingSystem(
    const char * osName) {
	m_os = osName;
}

void
ComponentInfo::setProcessors(
    std::vector<std::string> processornames) {
	m_processors = processornames;
}

void
ComponentInfo::setLocalFileName(
    const char * localFileName) {
	m_localFileName = localFileName;
}

void
ComponentInfo::setImplPRFFile(
    const char * PRFFile) {
	m_implPRF = PRFFile;
}

void
ComponentInfo::setImplSPDFile(
    const char * SPDFile) {
	m_implSPD = SPDFile;
}

void
ComponentInfo::setImplId(
    const char * implId) {
	m_implId = implId;
}

void
ComponentInfo::setCodeType(
    CF::LoadableDevice::LoadType codeType) {
	m_codeType = codeType;
}

void
ComponentInfo::setEntryPoint(
    const char * entryPoint) {
	m_entryPoint = entryPoint;
}

void
ComponentInfo::setStackSize(
    unsigned long stackSize) {
	m_stackSize = stackSize;
}

void
ComponentInfo::setPriority(
    unsigned long prio) {
	m_priority = prio;
}

void
ComponentInfo::setNamingService(
    const bool isNamingService) {
	m_isNamingService = isNamingService;
}

void
ComponentInfo::setNamingServiceName(
    const char * namingServiceName) {
	m_namingServiceName = namingServiceName;
}

void
ComponentInfo::setUsageName(
    const char * usageName) {
	m_usageName = usageName;
}

void
ComponentInfo::setIsResource(
    bool isResource) {
	m_isResource = isResource;
}

void
ComponentInfo::setIsConfigurable(
    bool isConfigurable) {
	m_isConfigurable = isConfigurable;
}

void
ComponentInfo::setIsAssemblyController(
    bool isAssemblyController) {
	m_isAssemblyController = isAssemblyController;
}

void
ComponentInfo::setScaComplicant(
    bool scaComplicant) {
	m_scaComplicant = scaComplicant;
}

void
ComponentInfo::addProperty(
    CF::DataType * dt,
    CF::Properties & prop) {
	for (unsigned int i = 0; i < prop.length(); i++) {
		if (strcmp(dt->id, prop[i].id) == 0) {
			// Overwrite existing value
			prop[i].value = dt->value;
			return;
		}
	}

	// New id, add property at end
	prop.length(prop.length() + 1);
	prop[prop.length() - 1].id = dt->id;
	prop[prop.length() - 1].value = dt->value;
}

void
ComponentInfo::addFactoryParameter(
    CF::DataType * dt) {
	addProperty(dt, m_factoryParameters);
}

void 
ComponentInfo::addExecParameter(
	CF::DataType *dt)
{
	addProperty(dt, m_execParameters);
}

void
ComponentInfo::addAllocationCapacity(
    CF::DataType * dt) {
	addProperty(dt, m_allocationCapacities);
}

void
ComponentInfo::addAffinityCompinents(
    const std::vector<std::string> & affinityComponents) {
	m_affinityCompinents = affinityComponents;
}

void
ComponentInfo::addConfigureProperty(
    CF::DataType * dt) {
	addProperty(dt, m_configureProperties);
}

void
ComponentInfo::overrideProperty(
    const char * id,
    std::vector <std::string> values) {
	process_overrides( & m_allocationCapacities, id, values);
	process_overrides( & m_configureProperties, id, values);
	process_overrides( & m_factoryParameters, id, values);
	process_overrides( & m_execParameters, id, values); 
}

void
ComponentInfo::process_overrides(
    CF::Properties * props,
    const char * id,
    std::vector <std::string> values) {

	for (unsigned int i = 0; i < (*props).length(); ++i ) {
		if (strcmp(id, (*props)[i].id) != 0) {
			continue;
		}

		DEBUG(3, AppSup, "Found prop for " << id)
		CORBA::TypeCode_var tc = (*props)[i].value.type();

		switch (tc->kind()) {

		case CORBA::tk_double:
			(*props)[i].value <<= openscaSupport::strings_to_double(values);
			break;

		case CORBA::tk_ushort:
			(*props)[i].value <<= openscaSupport::strings_to_unsigned_short(values);
			break;

		case CORBA::tk_short:
			(*props)[i].value <<= openscaSupport::strings_to_short(values);
			break;

		case CORBA::tk_float:
			(*props)[i].value <<= openscaSupport::strings_to_float(values);
			break;

		case CORBA::tk_ulong:
			(*props)[i].value <<= openscaSupport::strings_to_unsigned_long(values);
			break;

		case CORBA::tk_long:
			(*props)[i].value <<= openscaSupport::strings_to_long(values);
			break;

		case CORBA::tk_string:
			(*props)[i].value <<= openscaSupport::strings_to_string(values);
			break;

		default:
			DEBUG(3, AppSup, "Property override from SAD, property has unknown type code = "
			      \
			      << tc->kind())
		}	//switch

	}	//for
}

void
ComponentInfo::setResourcePtr(
    CF::Resource_ptr rsc) {
	m_rsc = rsc;
}

const char *
ComponentInfo::getName() {
	return m_name.c_str();
}

const char *
ComponentInfo::getIdentifier() {
	return m_identifier.c_str();
}

const char *
ComponentInfo::getAssignedDeviceId() {
	return m_assignedDeviceId.c_str();
}

const char *
ComponentInfo::getImplId() {
	return m_implId.c_str();
}

CF::LoadableDevice::LoadType
ComponentInfo::getCodeType() {
	return m_codeType;
}

const char *
ComponentInfo::getOSName() {
	return m_os.c_str();
}
std::vector<std::string>
ComponentInfo::getProcessors() {
	return m_processors;
}

const char *
ComponentInfo::getLocalFileName() {
	return m_localFileName.c_str();
}

const char *
ComponentInfo::getImplSPDFile() {
	return m_implSPD.c_str();
}

const char *
ComponentInfo::getImplPRFFile() {
	return m_implPRF.c_str();
}

const char *
ComponentInfo::getEntryPoint() {
	return m_entryPoint.c_str();
}

unsigned long
ComponentInfo::getStackSize() {
	return m_stackSize;

}

unsigned long
ComponentInfo::getPriority() {
	return m_priority;
}

bool
ComponentInfo::isNamingService() {
	return m_isNamingService;
}

const char *
ComponentInfo::getUsageName() {
	return m_usageName.c_str();
}

const char *
ComponentInfo::getNamingServiceName() {
	return m_namingServiceName.c_str();
}

bool
ComponentInfo::isResource() {
	return m_isResource;
}

bool
ComponentInfo::isConfigurable() {
	return m_isConfigurable;
}

bool
ComponentInfo::isAssemblyController() {
	return m_isAssemblyController;
}

bool
ComponentInfo::isScaComplicant() {
	return m_scaComplicant;
}

CF::Properties
ComponentInfo::getConfigureProperties() {
	return m_configureProperties;
}

CF::Properties
ComponentInfo::getAllocationCapacities() {
	return m_allocationCapacities;
}

CF::Resource_ptr
ComponentInfo::getResourcePtr() {
	return CF::Resource::_duplicate(m_rsc);
}

std::vector<std::string>
ComponentInfo::getAffinityComponents() {
	return m_affinityCompinents;
}
