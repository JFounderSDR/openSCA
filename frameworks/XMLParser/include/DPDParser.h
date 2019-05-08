/***************************************************************************//**
* @file     DPDParser.h
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

#if !defined(EA_FA757961_E1F9_4131_8FAD_D9080E67C02C__INCLUDED_)
#define EA_FA757961_E1F9_4131_8FAD_D9080E67C02C__INCLUDED_

#include <iostream>
#include <vector>

#include "tinyxml.h"
#include "debug.h"
#include "CFS.h"
#include "parser_helpers.h"
#include "DPDParser.h"

class DevicePkg;
class HWDeviceRegistration;
class DeviceClass;
class ChildHWDevice;
class DevicePkgRef;

/**
 * class OPNESCA_PARSER_API DPDParser
 */
class DPDParser {

  public:
	DPDParser(
	    CF::File_ptr file);

	~DPDParser();

	DevicePkg *
	getDevicePkg();

  private:
	/**
	 * no copying
	 */
	DevicePkg * m_devPkg;

	DPDParser();

	DPDParser(
	    const DPDParser & aDPDParser);
};

class HWDeviceRegistration {

  public:
	HWDeviceRegistration(
	    TiXmlElement * elem);

	~HWDeviceRegistration();

	std::vector <ChildHWDevice*>
	getChildHWDevice();

	std::string
	getDescription();

	DeviceClass *
	getDeviceClass();

	std::string
	getID();

	std::string
	getManufacturer();

	std::string
	getModelNumber();

	std::string
	getName();

	PropertyFile *
	getPropertyFile();

	std::string
	getVersion();

  protected:
	void
	constructChildHWDevice(
		TiXmlElement * elem);

	void
	parseAttributeID(
		TiXmlElement * elem);

	void
	parseAttributeName(
		TiXmlElement * elem);

	void
	parseAttributes(
		TiXmlElement * elem);

	void
	parseAttributeVersion(
		TiXmlElement * elem);

	void
	parseChildElements(
		TiXmlElement * elem);

	void
	parseDescription(
		TiXmlElement * elem);

	void
	parseElement(
		TiXmlElement * elem);
	
	void
	parseManufacturer(
		TiXmlElement * elem);

	void
	parseModelNumber(
		TiXmlElement * elem);

  private:
	std::vector <ChildHWDevice*> m_childHWDevices;
	std::string m_description;
	DeviceClass * m_devClass;
	/**
	 * no copying
	 */
	std::string m_id;
	std::string m_manufacturer;
	std::string m_modelnumber;
	std::string m_name;
	PropertyFile * m_propFile;
	std::string m_version;

	HWDeviceRegistration();
	/**
	 * no default constructor
	 */
	HWDeviceRegistration(
	    const HWDeviceRegistration & aHWDeviceRegistration);
};

class ChildHWDevice {

  public:
	ChildHWDevice(
	    TiXmlElement * elem);

	~ChildHWDevice();

	DevicePkgRef *
	getDevicePkgRef();

	HWDeviceRegistration *
	getHWDeviceRegistration();

  private:
	DevicePkgRef * m_devPkgRef;
	/**
	 * no copying
	 */
	HWDeviceRegistration * m_hwDeviceReg;

	ChildHWDevice();
	/**
	 * no default constructor
	 */
	ChildHWDevice(
	    const ChildHWDevice & aChildHWDevice);
};

/**
 * class OPNESCA_PARSER_API DevicePkg
 */
class DevicePkg {

  public:
	DevicePkg(
	    TiXmlElement * elem);

	~DevicePkg();

	std::string
	getAuthor();

	std::string
	getDescription();

	HWDeviceRegistration *
	getHWDeviceRegistration();

	std::string
	getID();

	std::string
	getName();

	std::string
	getTitle();

	std::string
	getVersion();

  protected:
	void
	parseAttributeID(
	    TiXmlElement * elem);

	void
	parseAttributeName(
	    TiXmlElement * elem);

	void
	parseAttributes(
	    TiXmlElement * elem);

	void
	parseAttributeVersion(
	    TiXmlElement * elem);

	void
	parseAuthor(
	    TiXmlElement * elem);

	void
	parseChildElements(
	    TiXmlElement * elem);

	void
	parseDescription(
	    TiXmlElement * elem);

	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseTitle(
	    TiXmlElement * elem);

  private:
	std::string m_author;
	std::string m_description;
	HWDeviceRegistration * m_hwDev;

	/**
	 * no copying
	 */
	std::string m_id;
	std::string m_name;
	std::string m_title;
	std::string m_version;

	DevicePkg();
	/**
	 * no default constructor
	 */
	DevicePkg(
	    const DevicePkg & aDevicePkg);
};

class  DeviceClass {
  public:
	DeviceClass(
	    TiXmlElement * elem);

	~DeviceClass();

	std::vector <std::string>
	getClass();

  protected:
	void
	parseElement(
	    TiXmlElement * elem);

  private:
	DeviceClass(); // no default constructor

	DeviceClass(
	    const DeviceClass & aDeviceClass); // no copying

	std::vector <std::string> m_deviceClass;
};

class DevicePkgRef {
  public:
	DevicePkgRef(
	    TiXmlElement * elem);

	~DevicePkgRef();

	std::string
	getType();

	std::string
	getLocalFile();
	
  protected:
	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseAttributes(
	    TiXmlElement * elem);

	void
	parseChildElements(
	    TiXmlElement * elem);

  private:
	DevicePkgRef(); // no default constructor

	DevicePkgRef(
	    const DevicePkgRef & aDevicePkgRef); // no copying

	std::string m_type;
	std::string m_localfile;

};

#endif // !defined(EA_FA757961_E1F9_4131_8FAD_D9080E67C02C__INCLUDED_)