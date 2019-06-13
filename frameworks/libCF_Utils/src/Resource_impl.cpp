/***************************************************************************//**
* @file     Resource_impl.cpp
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

#include "../include/Resource_impl.h"

class PropertySet_impl;
/**
 * The Resource interface provides a common API for the control and configuration
 * of a software component.
 * The Resource interface inherits from the LifeCycle, PropertySet, TestableObject,
 * and PortSupplier interfaces.
 */

Resource_impl::Resource_impl() {

}

Resource_impl::~Resource_impl() {

}

Resource_impl::Resource_impl(
    const char * uuid) {
	DEBUG(5, Resource, "In Resource constructor.")
	m_identifier = uuid;
}

char *
Resource_impl::identifier()
throw (CORBA::SystemException) {
	return CORBA::string_dup(m_identifier.c_str());
}

void
Resource_impl::start()
throw (
    CF::Resource::StartError,
    CORBA::SystemException) {

}


void
Resource_impl::stop()
throw (
    CF::Resource::StopError,
    CORBA::SystemException) {

}

/*
*
 * The LifeCycle interface defines the generic operations for initializing or
 * releasing instantiated component-specific data and/or processing elements.
 */
LifeCycle_impl::~LifeCycle_impl() {

}

void
LifeCycle_impl::initialize()
throw (
    CF::LifeCycle::InitializeError,
    CORBA::SystemException) {

}

void
LifeCycle_impl::releaseObject()
throw (
    CF::LifeCycle::ReleaseError,
    CORBA::SystemException) {

}

/**
 * The testable object interface provides a means to perform stand alone testing
 * of an SCA component. This function is useful for built in test (BIT) operations.
 */
TestableObject_impl::~TestableObject_impl() {

}

void
TestableObject_impl::runTest(
    CORBA::ULong TestID,
    CF::Properties & testValues)
throw (
    CF::UnknownProperties,
    CF::TestableObject::UnknownTest,
    CORBA::SystemException) {

}

/**
 * The PropertySet class defines configure and query operations to access
 * component properties/attributes.
 */
PropertySet_impl::PropertySet_impl() {
	init_config = false;
}

PropertySet_impl::~PropertySet_impl() {

}

void
PropertySet_impl::configure(
    const CF::Properties & configProperties)
throw (
    CF::PropertySet::PartialConfiguration,
    CF::PropertySet::InvalidConfiguration,
    CORBA::SystemException) {
	DEBUG(3, PropertySet, "In configure with config properties len: " <<
	      configProperties.length())

	if (configProperties.length() == 0) {
		DEBUG(7, PropertySet_impl, "the length of input param configProperties is zero")
		return;
	}

	if (init_config == false) {	//configure component firstly
		propSet.length( configProperties.length() );

		for (unsigned int i = 0; i < configProperties.length(); i++) {
			propSet[i] = configProperties[i];

			DEBUG(7, PropertySet_impl, " has configured property: " << propSet[i].id)
			if (strcmp(propSet[i].id, "DCE:os_name:1") == 0) {
				const char* msg = NULL;
				propSet[i].value >>= msg;
				DEBUG(7, PropertySet_impl, " has configured property value: " << msg)
			}
		}

		init_config = true;
	} else {	//has completed init configuration, just modefy configure property value
		//if length of configProperties isn't equal zero, varify configproperties and
		//configure
		CF::Properties invalidProps(0);
		CF::Properties validProps(0);
		bool _suc = false;

		validateForConfig(configProperties, validProps, invalidProps);

		if (invalidProps.length() == configProperties.length()) {
			DEBUG(2, PropertySet, "all configure properties invalid.")

			throw CF::PropertySet::InvalidConfiguration("", invalidProps);
		}
		//loop to configure propSet
		for (unsigned int i = 0; i < validProps.length(); i++) {
			for (unsigned int j = 0; j < propSet.length(); j++) {
				if (strcmp(validProps[i].id, propSet[j].id) == 0) {
					propSet[j] = validProps[i];
					break;
				}
			}
		}

		if (validProps.length() < configProperties.length()) {
			throw CF::PropertySet::PartialConfiguration(invalidProps);
		}
	}

	DEBUG(5, PropertySet, "leaving configure.")
}

CF::DataType
PropertySet_impl::getProperty(
    CORBA::String_var id) {
	DEBUG(5, PropertySet, "In getProperty.")

	for (unsigned int i = 0; i < propSet.length(); i++) {
		if (strcmp(propSet[i].id, id) == 0) {
			DEBUG(5, PropertySet, "found property by id.")
			return propSet[i];
		}
	}
	return  CF::DataType();
}

void
PropertySet_impl::query(
    CF::Properties & configProperties)
throw (
    CF::UnknownProperties,
    CORBA::SystemException) {
	DEBUG(5, PropertySet, "In query.")

	for (int i = 0; i < configProperties.length(); i++) {
		configProperties[i].value = CORBA::Any();
	}

	if (0 == configProperties.length()) {
		configProperties = propSet;
		return;
	}

	CF::Properties validProps;
	CF::Properties invalidProps;

	validProps.length(0);
	invalidProps.length(0);

	//varify configProperties
	validateForQuery(configProperties, validProps, invalidProps);

	DEBUG(5, PropertySet_impl::PropertySet,
	      "configProperties.length() = " << configProperties.length())
	DEBUG(5, PropertySet_impl::PropertySet,
	      "validProps.length() = " << validProps.length())
	DEBUG(5, PropertySet_impl::PropertySet,
	      "invalidProps.length() = " << invalidProps.length())

	for (unsigned int i = 0; i < validProps.length(); i++) {
		DEBUG(5, PropertySet_impl::PropertySet, "enter for query")

		for (unsigned int j = 0; j < configProperties.length(); j++) {
			if (strcmp(validProps[i].id, configProperties[j].id) == 0) {
				configProperties[j].value = validProps[i].value;
				if (strcmp(validProps[i].id, "DCE:os_name:1") == 0) {
					const char* msg = NULL;
					validProps[i].value >>= msg;
					DEBUG(2, PropertySet, "In query msg is: " << msg)
				}
				break;
			}
		}
	}

	if (invalidProps.length() > 0) {
		DEBUG(2, PropertySet, "there's unknown properties, throwing exception.")
		return;
	}

	DEBUG(5, PropertySet, "Leaving query...")
}

//compare input parameter props with propSet, if some properties has been in
//propSet, so they are valid and otherwise.
void
PropertySet_impl::validateForConfig(
    CF::Properties props,
    CF::Properties & validProps,
    CF::Properties & invalidProps) {
	DEBUG(2, PropertySet, "In validateForConfig.")

	unsigned int valid_cnt(0);
	unsigned int invalid_cnt(0);

	bool _suc = false;
	for (unsigned int i = 0; i < props.length(); i++) {
		_suc = false;
		for (unsigned int j = 0; j < propSet.length(); j++) {
			if (0 == strcmp(propSet[j].id, props[i].id)) {
				valid_cnt++;
				validProps.length(valid_cnt);
				validProps[valid_cnt - 1] = props[i];
				_suc = true;
				break;
			}
		}

		if (!_suc) {
			invalid_cnt++;
			invalidProps.length(invalid_cnt);
			invalidProps[invalid_cnt - 1].value = props[i].value;
		}
	}
}

void
PropertySet_impl::validateForQuery(
    CF::Properties props,
    CF::Properties & validProps,
    CF::Properties & invalidProps) {
	DEBUG(2, PropertySet, "In validateForQuery.")

	unsigned int valid_cnt(0);
	unsigned int invalid_cnt(0);

	bool _suc = false;
	for (unsigned int i = 0; i < props.length(); i++) {
		DEBUG(2, PropertySet, "In validateForQuery in loop one props id: " <<
		      props[i].id)
		_suc = false;
		for (unsigned int j = 0; j < propSet.length(); j++) {
			DEBUG(2, PropertySet, "In validateForQuery in loop two propSet id: " <<
			      propSet[j].id)
			if (strcmp(propSet[j].id, props[i].id) == 0) {
				valid_cnt++;
				validProps.length(valid_cnt);

				//only for query
				validProps[valid_cnt - 1] = propSet[j];
				DEBUG(2, PropertySet, "In validateForQuery in loop two propSet id: " <<
				      propSet[j].id)
				DEBUG(2, PropertySet, "In validateForQuery in loop two validProps id: " <<
				      validProps[valid_cnt - 1].id)

				_suc = true;
				break;
			}
		}

		if (!_suc) {
			invalid_cnt++;
			invalidProps.length(invalid_cnt);
			invalidProps[invalid_cnt - 1] = props[i];
		}
	}
}

/**
 * This interface provides the getPort operation for those components that provide
 * ports.
*/
PortSupplier_impl::~PortSupplier_impl() {

}


CORBA::Object_ptr
PortSupplier_impl::getPort(
    const char * prm1)
throw (
    CF::PortSupplier::UnknownPort,
    CORBA::SystemException) {
	return  NULL;
}
