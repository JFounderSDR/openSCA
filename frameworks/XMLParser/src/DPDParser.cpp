/***************************************************************************//**
* @file     DPDParser.cpp
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

#include "../include/DPDParser.h"
#include "../include/debug.h"

/**
 * class OPNESCA_PARSER_API DPDParser
 */
DPDParser::DPDParser(
    CF::File_ptr file) {
	DEBUG(4, DPDParser, "In constructor.");

	unsigned long fileSize = file->sizeOf();
	CF::OctetSequence_var fileData;

	file->read(fileData, fileSize);

	unsigned char * fileBuffer = fileData->get_buffer();

	TiXmlDocument XMLDoc;
	XMLDoc.Parse((const char *)fileBuffer);

	TiXmlElement * elem = XMLDoc.FirstChildElement("devicepkg");
	m_devPkg = new DevicePkg(elem);
}

DPDParser::~DPDParser() {
	delete m_devPkg;
}

DevicePkg *
DPDParser::getDevicePkg() {
	return m_devPkg;
}

HWDeviceRegistration::HWDeviceRegistration(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in constructor.");

	// parse tags in hwdeviceregistration, with exception of propertyfile,
	// deviceclass, childhwdevice
	parseElement(elem);

	m_propFile = new PropertyFile(elem->FirstChildElement("propertyfile"));
	m_devClass = new DeviceClass(elem->FirstChildElement("deviceclass"));

	constructChildHWDevice(elem->FirstChildElement("childhwdevice"));
}

HWDeviceRegistration::~HWDeviceRegistration() {
	for (int i = 0; i < m_childHWDevices.size(); i++) {
		delete m_childHWDevices[i];
		m_childHWDevices[i] = NULL;
	}

	delete m_propFile;
	m_propFile = NULL;
	delete m_devClass;
	m_devClass = NULL;
}

void
HWDeviceRegistration::constructChildHWDevice(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in constructChildHWDevice");

	// parse childhwdevice tag(s)
	for (; elem; elem = elem->NextSiblingElement("childhwdevice")) {
		// create child device object
		ChildHWDevice * cDevice;
		cDevice = new ChildHWDevice(elem);

		// push new child device onto vector
		m_childHWDevices.push_back(cDevice);
	}
}

std::vector <ChildHWDevice* >
HWDeviceRegistration::getChildHWDevice() {
	return m_childHWDevices;
}

std::string
HWDeviceRegistration::getDescription() {
	return m_description;
}

DeviceClass *
HWDeviceRegistration::getDeviceClass() {
	return m_devClass;
}

std::string
HWDeviceRegistration::getID() {
	return m_id;
}

std::string
HWDeviceRegistration::getManufacturer() {
	return m_manufacturer;
}

std::string
HWDeviceRegistration::getModelNumber() {
	return m_modelnumber;
}

std::string
HWDeviceRegistration::getName() {
	return m_name;
}

PropertyFile *
HWDeviceRegistration::getPropertyFile() {
	return m_propFile;
}

std::string
HWDeviceRegistration::getVersion() {
	return m_version;
}

void
HWDeviceRegistration::parseAttributeID(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseAttributeID");

	// verify attribute exists to prevent seg fault
	if (elem->Attribute("id")) {
		m_id = elem->Attribute("id");
	} else {
		DEBUG(4, HWDeviceRegistration,
		    "ERROR: Could not find attribute 'id' \
		    within hwdeviceregistration tag" );
		exit(-1);
	}
}

void
HWDeviceRegistration::parseAttributeName(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseAttributeName")

	// verify attribute exists to prevent seg fault
	if (elem->Attribute("name")) {
		m_name = elem->Attribute("name");
	} else {
		DEBUG(4, HWDeviceRegistration, 
			"ERROR: Could not find attribute 'name' \
			wtihin hwdeviceregistration tag" )
		exit(-1);
	}
}

void
HWDeviceRegistration::parseAttributes(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseAttributes");

	parseAttributeID(elem);
	parseAttributeVersion(elem);
	parseAttributeName(elem);
}

void
HWDeviceRegistration::parseAttributeVersion(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseAttributeVersion")

	// verify attribute exists to prevent seg fault
	if (elem->Attribute("version")) {
		m_version = elem->Attribute("version");
	} else {
		DEBUG (4, HWDeviceRegistration,
		    "ERROR: Could not find attribute 'version' \
		    within hwdeviceregistration tag" )
		exit(-1);
	}
}

void
HWDeviceRegistration::parseChildElements(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseChildElements")

	parseDescription(elem);
	parseManufacturer(elem);
	parseModelNumber(elem);
}

void
HWDeviceRegistration::parseDescription(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseDescription");

	TiXmlElement *descrip = elem->FirstChildElement("description");
	if (descrip) {
		m_description = descrip->GetText();
	} else {
		DEBUG(4, HWDeviceRegistration,
		    "ERROR: Could not find description tag in hwdeviceregistration")
		exit(-1);
	}
}

void
HWDeviceRegistration::parseElement(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseElement");

	// pull info from hwdeviceregistration tag
	parseAttributes(elem);

	// description, manufacturer, modelnumber tags
	parseChildElements(elem);
}

void
HWDeviceRegistration::parseManufacturer(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseManufacturer");

	TiXmlElement *manufac = elem->FirstChildElement("manufacturer");
	if (manufac) {
		m_manufacturer = manufac->GetText();
	} else {
		DEBUG(4, HWDeviceRegistration,
		    "ERROR: Could not find manufacturer tag in hwdeviceregistration" )
		exit(-1);
	}
}

void
HWDeviceRegistration::parseModelNumber(
    TiXmlElement * elem) {
	DEBUG(4, HWDeviceRegistration, "in parseModelNumber");

	TiXmlElement * modNum = elem->FirstChildElement("modelnumber");
	if (modNum) {
		m_modelnumber = modNum->GetText();
	} else {
		DEBUG(4, HWDeviceRegistration, 
			"ERROR: Could not find modelnumber \
			tag in hwdeviceregistration" )
		exit(-1);
	}
}

ChildHWDevice::ChildHWDevice(
    TiXmlElement * elem) {
	DEBUG(4, ChildHWDevice, "in constructor.");

	m_hwDeviceReg = new HWDeviceRegistration(
	    elem->FirstChildElement("hwdeviceregistration"));
	if (elem->FirstChildElement("devicepkgref")) {
		m_devPkgRef = new DevicePkgRef(
			elem->FirstChildElement("devicepkgref"));
	}
}

ChildHWDevice::ChildHWDevice() {

}

/**
 * no default constructor
 */
ChildHWDevice::ChildHWDevice(
    const ChildHWDevice & aChildHWDevice) {

}

ChildHWDevice::~ChildHWDevice() {
	delete m_hwDeviceReg;
}

DevicePkgRef *
ChildHWDevice::getDevicePkgRef() {
	return m_devPkgRef;
}

HWDeviceRegistration *
ChildHWDevice::getHWDeviceRegistration() {

	return m_hwDeviceReg;
}

/**
 * class OPNESCA_PARSER_API DevicePkg
 */
DevicePkg::DevicePkg(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "In constructor.");

	parseElement(elem); // parse elements within devicepkg
	m_hwDev = new HWDeviceRegistration(
	    elem->FirstChildElement("hwdeviceregistration"));
}

DevicePkg::DevicePkg() {

}

/**
 * no default constructor
 */
DevicePkg::DevicePkg(
    const DevicePkg & aDevicePkg) {

}

DevicePkg::~DevicePkg() {
	delete m_hwDev;
}

std::string
DevicePkg::getAuthor() {
	return m_author;
}

std::string
DevicePkg::getDescription() {
	return m_description;
}

HWDeviceRegistration *
DevicePkg::getHWDeviceRegistration() {
	return m_hwDev;
}

std::string
DevicePkg::getID() {
	return m_id;
}

std::string
DevicePkg::getName() {
	return m_name;
}

std::string
DevicePkg::getTitle() {
	return m_title;
}

std::string
DevicePkg::getVersion() {
	return m_version;
}

void
DevicePkg::parseAttributeID(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseAttributeID");

	if (elem->Attribute("id")) {
		m_id = elem->Attribute("id");
	} else {
		DEBUG(4, DevicePkg, 
			"ERROR: Could not find attrbute 'id' within devicepkg tag" )
		exit(-1);
	}
}

void
DevicePkg::parseAttributeName(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseAttributeName");

	if (elem->Attribute("name")) {
		m_name = elem->Attribute("name");
	} else {
		DEBUG(4, DevicePkg,
		    "ERROR: Could not find attribute 'name' within devicepkg tag" )
		exit(-1);
	}
}

void
DevicePkg::parseAttributes(
    TiXmlElement * elem) {
	parseAttributeID(elem);
	parseAttributeName(elem);
	parseAttributeVersion(elem);
}

void
DevicePkg::parseAttributeVersion(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseAttributeVersion");

	if (elem->Attribute("version")) {
		m_version = elem->Attribute("version");
	} else {
		DEBUG(4, DevicePkg,
		    "ERROR: Could not find attribute 'version' within devicepkg tag" )
		exit(-1);
	}
}

void
DevicePkg::parseAuthor(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseAuthor");

	TiXmlElement * auth = elem->FirstChildElement("author");
	if (auth) {
		m_author = auth->GetText();
	} else {
		DEBUG(4, DevicePkg,
		    "ERROR: Could not find 'author' element within devicepkg tag" )
		exit(-1);
	}
}

void
DevicePkg::parseChildElements(
    TiXmlElement * elem) {
	parseAuthor(elem);
	parseTitle(elem);
	parseDescription(elem);
}

void
DevicePkg::parseDescription(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseDescription");

	TiXmlElement * descrip = elem->FirstChildElement("description");
	if (descrip) {
		m_description = descrip->GetText();
	} else {
		DEBUG(4, DevicePkg,
		    "ERROR: Could not find 'description' element within devicepkg tag")
	}
}

void
DevicePkg::parseElement(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseElement");
	// get attributes from devicepkg
	parseAttributes(elem);

	// parse info from author, title and description tags
	parseChildElements(elem);
}

void
DevicePkg::parseTitle(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkg, "in parseTitle");

	TiXmlElement * titleElem = elem->FirstChildElement("title");
	if (titleElem) {
		m_title = titleElem->GetText();
	} else {
		DEBUG(4, DevicePkg,
		    "ERROR: Could not find 'title' element within devicepkg tag" )
		exit(-1);
	}
}

/**
* class OPNESCA_PARSER_API DevicePkgRer
*/
DevicePkgRef::DevicePkgRef(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkgRef, "In constructor.");
	parseElement(elem);
}

DevicePkgRef::~DevicePkgRef() {
}

void
DevicePkgRef::parseElement(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkgRef, "in parseElement");

	parseAttributes(elem); // store type from devicepkgref tag
	parseChildElements(elem);
}

void
DevicePkgRef::parseAttributes(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkgRef, "in parseAttributes");

	if (elem->Attribute("type")) {
		m_type = elem->Attribute("type");
	} else {
		DEBUG(4, DevicePkgRef,
		    "ERROR: Could not find 'type' attribute in devicepkgref tag" )
		exit(EXIT_FAILURE);
	}
}

void
DevicePkgRef::parseChildElements(
    TiXmlElement * elem) {
	DEBUG(4, DevicePkgRef, "in parseChildElements");

	TiXmlElement * local = elem->FirstChildElement("localfile");
	if (local) {
		m_localfile = local->Attribute("name");
	} else {
		DEBUG(4, DevicePkgRef,
		    "ERROR: Could not find 'name' attribute in localfile tag")
		exit(EXIT_FAILURE);
	}
}

std::string
DevicePkgRef::getType() {
	return m_type;
}

std::string
DevicePkgRef::getLocalFile() {
	return m_localfile;
}

DeviceClass::DeviceClass(
    TiXmlElement * elem) {
	DEBUG(4, DeviceClass, "In constructor.")
	parseElement(elem);
}

DeviceClass::~DeviceClass() {
}

void
DeviceClass::parseElement(
    TiXmlElement * elem) {
	DEBUG(4, DeviceClass, "in parseElement")

	TiXmlElement * classType =
	    elem->FirstChildElement("class"); // set link to class tags

	if (classType) {
		DEBUG(4, DeviceClass, "Found class")
		// there may be one or more class tags, loop through and append them all
		for (; classType; classType = classType->NextSiblingElement("class")) {
			m_deviceClass.push_back(classType->GetText());
		}
	} else {
		DEBUG(4, DeviceClass,
		    "ERROR: Could not find a 'class' element in deviceclass tag, \
		    must have at least one class designation" )
		exit(-1);
	}

}

std::vector <std::string>
DeviceClass::getClass() {
	return m_deviceClass;
}
