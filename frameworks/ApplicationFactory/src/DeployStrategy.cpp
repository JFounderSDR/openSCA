/***************************************************************************//**
* @file     DelpoyStrategy.cpp
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

#include "../include/DeployStrategy.h"
#include "SADParser.h"
#include "PRFParser.h"
#include "SCDParser.h"
#include "SPDParser.h"
#include "prop_helpers.h"
#include "utils.h"
#include "ConfigParser.h"
#include "DCDParser.h"

class DeployStrategy;
class BaseDeployStrategy;

DeployStrategy::DeployStrategy(
    std::vector<CF::Device_ptr> regedDevs,
    std::vector<SADComponentPlacement*> * sadCompPlacs) {
	DEBUG(7, DeployStrategy, "In DeployStrategy constructor.")

}

DeployStrategy::DeployStrategy( ) {
	DEBUG(7, DeployStrategy, "In default constructor.")
}

DeployStrategy::~DeployStrategy() {

}

/**
 * This class provides two kind of deploy Strategy. The first strategy is
 * implemented by createDepoyInfo function without device assignment, it consider
 * of OS and processor and allocation properties. Well the second strategy is
 * implemented by ceateDeployInfo with device assignement parameter, it consider of
 * os and processor simply.
 *
 * it mainly verify device capacity is suitable for component deploy dependences.
 */
BaseDeployStrategy::BaseDeployStrategy(
    std::vector<CF::Device_ptr> regedDevs,
    SADParser * sadPar,
    CF::FileManager_ptr fileMgr,
    std::vector<SADComponentPlacement *> *sadCompPlacs) {
	DEBUG(2, BaseDeployStrategy, "In constructor.")

	m_registeredDevices = regedDevs;
	m_sadCompPlaces = sadPar->getComponents();
	m_fileMgr = fileMgr;
	m_sadPar = sadPar;

	char path[1024];
    std::string exePath = get_exe_path(path, 1024);
  	ConfigParser configParser(exePath);
	m_sdrRoot = configParser.getValueById(CONSTANT::SDRROOT);
	DEBUG(2, BaseDeployStrategy, "finish constructor.")
}

BaseDeployStrategy::~BaseDeployStrategy() {
	for (unsigned int numComp = 0; numComp < m_allCompsInfo.size(); numComp++) {
		//delete m_allCompsInfo[numComp];
	}
}

BaseDeployStrategy::BaseDeployStrategy() {

}

std::vector<openscaSupport::ComponentInfo*>
BaseDeployStrategy::createDeployInfo() {
	DEBUG(2, ApplicationFactory,
	    "In createDeployInfo() with matching component num: " << 
	    m_sadCompPlaces->size())

	//loop to get every component info then match deploying device
	for (unsigned int numComp = 0; 
		numComp < m_sadCompPlaces->size(); numComp++) {
		DEBUG(7, DaseDeployStrategy, "In createDeployInfo round: " << numComp)

		bool hasAssigned = false;
		for ( unsigned int i = 0; i < m_allCompsInfo.size(); ++i) {
			if ( 0 == strcmp(m_allCompsInfo[i]->getIdentifier(),
			                 (*((*m_sadCompPlaces)[numComp]->
			                 getSADInstantiations()))[0]->getID()) ) {
				hasAssigned = true;
				break;
			}
		}

		if (hasAssigned)
			continue;

		openscaSupport::ComponentInfo * compInfo = 
						new openscaSupport::ComponentInfo;
		std::vector<PRFProperty * > matchingProps;

		std::string spdPath = "";
		SPDParser * spdParser = NULL;
		spdParser = getSpdParser((*m_sadCompPlaces)[numComp], spdPath);
		getCompInfo(compInfo, (*m_sadCompPlaces)[numComp], spdPath, spdParser);

		PRFParser * prfParser = NULL;
		prfParser = getPrfParser(compInfo);
		getPropertyFromPRF(compInfo, matchingProps, prfParser);

		//getCompInfo(compInfo, matchingProps, (*m_sadCompPlaces)[num_comp]);
		std::vector<std::string> affinityComponents = 
							compInfo->getAffinityComponents();

		//begin to assign component to candidate devices. The first thing is that
		//match operating system, then match processor, at last match matching properties.

		//loop to match device in registered devices
		bool foundDevToDeploy = false;
		for (unsigned int numDev = 0; 
			numDev < m_registeredDevices.size(); numDev++) {

			if ( !matchSpecificCompWithDev(compInfo, 
					m_registeredDevices[numDev], matchingProps) ) {
				continue;
			}

			if (0 == affinityComponents.size()) {
				compInfo->setAssignedDeviceId( 
					m_registeredDevices[numDev]->identifier() );

				m_allCompsInfo.push_back(compInfo);
				foundDevToDeploy = true;
				break;
			} 

			// execute here, indicate affinityComponents > 0
			if (deployAffinityComponents(
					affinityComponents, m_registeredDevices[numDev])) {
				compInfo->setAssignedDeviceId( 
					m_registeredDevices[numDev]->identifier() );

				m_allCompsInfo.push_back(compInfo);
				foundDevToDeploy = true;
				break;
			}
		}	//for (unsigned int numDev=0; numDev<m_registeredDevices.size(); numDev++)

		if ( !foundDevToDeploy ) {
			DEBUG(7, DaseDeployStrategy,
			    "[BaseDeployStrategy::createDeployInfo]Component:" <<
			    compInfo->getUsageName() << "don't found device to deploy.")

			throw CF::ApplicationFactory::CreateApplicationError();
		}

		DEBUG(7, BaseDeployStrategy, "found device to deploy succ")

		DEBUG(2, BaseDeployStrategy, "Component:" << 
			compInfo->getUsageName() << " has found device to deploy.")

		if (spdParser != NULL) {
			delete spdParser;
		}
		if (prfParser != NULL) {
			delete prfParser;
		}

	}//for (unsigned int numComp=0; numComp<m_sadCompPlaces->size(); numComp++)

	DEBUG(2, BaseDeployStrategy, "Leaving createDeployInfo().")

	return m_allCompsInfo;
}

SPDParser *
BaseDeployStrategy::getSpdParser(
    SADComponentPlacement *sadCompPlace,
    std::string & spdPath) {
	if (!sadCompPlace) {
		return NULL;
	}

	//parsing spd.xml
	CF::File_var spdfl;
	std::string spdrefid = sadCompPlace->getFileRefId();

	spdPath.append(m_sdrRoot);
	spdPath.append("/");
	spdPath.append(m_sadPar->getSPDById(spdrefid.c_str()));

	DEBUG(7, BaseDeployStrategy::getCompInfo, "spdPath is: " << spdPath)
	try {
		spdfl = m_fileMgr->open(spdPath.c_str(), true);
	} catch (CF::InvalidFileName & e) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo] m_fileMgr->open " <<
		      "failed with invalid file name:" << e.msg)
		CF::ApplicationFactory::CreateApplicationError();
	} catch (CF::FileException & e) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo] m_fileMgr->open "
		      "failed with CF::FileException.")
		CF::ApplicationFactory::CreateApplicationError();
	} catch (...) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo] m_fileMgr->open "
		      "failed with Unknown Exception.")
		CF::ApplicationFactory::CreateApplicationError();
	}

	//parsing component spd.xml
	SPDParser * spdParser = new SPDParser(spdfl);
	try {
		spdfl->close();
	} catch (CF::FileException & e) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo]\"spdfl->close(\" \
		failed with CF::FileException.")
		CF::ApplicationFactory::CreateApplicationError();
	} catch (...) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo]\"spdfl->close(\" \
		failed with Unknown Exception.")
		CF::ApplicationFactory::CreateApplicationError();
	}

	return spdParser;
}

PRFParser *
BaseDeployStrategy::getPrfParser(
    openscaSupport::ComponentInfo * compInfo) {

	std::string prfPath = compInfo->getImplPRFFile();

	//parsering spd.xml
	CF::File_var prffl;
	try {
		prffl = m_fileMgr->open(prfPath.c_str(), true);
	} catch (CF::InvalidFileName & e) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::getCompInfoFromPRF] \"m_fileMgr->open\" \
				failed with invalid file name:" << e.msg)
		CF::ApplicationFactory::CreateApplicationError();
	} catch (CF::FileException & e) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::getCompInfoFromPRF]\"m_fileMgr->open\" \
		failed with CF::FileException.")
		CF::ApplicationFactory::CreateApplicationError();
	} catch (...) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::getCompInfoFromPRF]\"m_fileMgr->open\" \
		failed with Unknown Exception.")
		CF::ApplicationFactory::CreateApplicationError();
	}

	DEBUG(7, BaseDeployStrategy::getCompInfo,
	      "In getCompInfoFromPRF parsing prf.xml")

	//parsering component spd.xml
	PRFParser * prfParser = new PRFParser(prffl);

	try {
		prffl->close();
	} catch (CF::FileException & e) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo]\"prffl->close(\" \
		failed with CF::FileException.")
		CF::ApplicationFactory::CreateApplicationError();
	} catch (...) {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo]\"prffl->close(\" \
		failed with Unknown Exception.")
		CF::ApplicationFactory::CreateApplicationError();
	}

	return prfParser;

}

bool
BaseDeployStrategy::getCompInfo(
    openscaSupport::ComponentInfo * compInfo,
    SADComponentPlacement * sadCompPlace,
    std::string & spdPath,
    SPDParser * spdParser) {

	DEBUG(5, BaseDeployStrategy::getCompInfo, "enter in ...")

	if ((!compInfo) || (!sadCompPlace)) {
		return false;
	}

	//parsing spd.xml
	compInfo->setImplSPDFile(spdPath.c_str());

	DEBUG(7, BaseDeployStrategy::getCompInfo, "spdPath is: " << spdPath)

	std::vector<SPDImplementation *> * spdImpls = 
							spdParser->getImplementations();
	//bool foundSpdImpl = false;
	SPDImplementation * spdImp = NULL;
	if (spdImpls->size() > 0) {
		spdImp = (*spdImpls)[0];
	} else {
		DEBUG(8, BaseDeployStrategy::getCompInfo,
		      " in CreateDeployInfo no implementation SPD.xml")
		CF::ApplicationFactory::CreateApplicationError();
	}

	std::vector<SADComponentInstantiation *> * sadCompInsts =
		sadCompPlace->getSADInstantiations();
	SADComponentInstantiation * sadCompInst = NULL;
	if (sadCompInsts->size() > 0) {
		sadCompInst = (*sadCompInsts)[0];
	} else {
		DEBUG(8, BaseDeployStrategy::getCompInfo,
		    " in CreateDeployInfo no SADComponentInstantiation")
		CF::ApplicationFactory::CreateApplicationError();	
	}

	//get absloute path for local code file
	size_t pos = spdPath.find_last_of("/");
	std::string absLocalFile = 
		replaceFileNameofPath(spdPath.c_str(), spdImp->getCodeFile());
	compInfo->setLocalFileName(absLocalFile.c_str());

	compInfo->setScaComplicant(sadCompPlace->isScaCompliant());

	//get component Info for os/processor/implprf and so on
	if (spdImp && sadCompInst) {
		//assume that every component placement have one instantiation
		setComponentInfo(compInfo, (*sadCompInsts)[0], spdImp);
	} else {
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		    "[BaseDeployStrategy::createDeployInfo] don't found " \
		    "implementation in spd.xml.")
		CF::ApplicationFactory::CreateApplicationError();
	}

	std::string assemblyCtrlRefId = m_sadPar->getAssemblyControllerRefId();

	if (strcmp(compInfo->getIdentifier(), assemblyCtrlRefId.c_str()) == 0) {
		compInfo->setIsAssemblyController( true );
		DEBUG(7, BaseDeployStrategy::getCompInfo,
		      "[BaseDeployStrategy::createDeployInfo]" << 
		      compInfo->getIdentifier() << " is setIsAssemblyController")
	} else {
		compInfo->setIsAssemblyController(false);
		DEBUG(7, BaseDeployStrategy::getCompInfo, compInfo->getIdentifier() <<
		    " isn't setIsAssemblyController")
	}

	DEBUG(7, DeployStrategy, "obtain info from scd.xml")
	//get component info for resource type in scd.xml
	std::string scdPath = replaceFileNameofPath(
							spdPath.c_str(), spdParser->getSCDFile());

	DEBUG(7, DeployStrategy, "obtain info from scd.xml")
	getCompInfoFromSCD(scdPath.c_str(), compInfo);

	std::string prfPath = replaceFileNameofPath(
							spdPath.c_str(), spdParser->getPRFFile());
	//get component info about properties in prf.xml
	compInfo->setImplPRFFile(prfPath.c_str());

	//parsering spd.xml
	CF::File_var prffl;
	if (!openProfileFile(m_fileMgr.in(), prfPath.c_str(), prffl)) 
		return false;

	DEBUG(7, BaseDeployStrategy::getCompInfo,
		"In getCompInfoFromPRF parsing prf.xml")
	//parsering component spd.xml
	PRFParser * prfParser = new PRFParser(prffl);
	closeProfileFile(prffl.in());

	DEBUG(5, BaseDeployStrategy::getCompInfo, "leave ...")
	return true;
}

bool
BaseDeployStrategy::matchSpecificCompWithDev(
    openscaSupport::ComponentInfo * compInfo,
    CF::Device_ptr dev,
    std::vector<PRFProperty*> & matchingProps) {
	DEBUG(5, BaseDeployStrategy::matchSpecificCompWithDev, "enter in ...")

	CF::LoadableDevice_ptr loadDev = CF::LoadableDevice::_narrow(dev);
	if (CORBA::is_nil(loadDev)) {
		return false;
	}

	if (loadDev->usageState() == CF::Device::BUSY)
		return false;
	if (loadDev->operationalState() == CF::Device::DISABLED)
		return false;
	if (loadDev->adminState() == CF::Device::LOCKED)
		return false;

	//check device's health state
	CF::Properties prop;
	prop.length(1);
	std::string propId = CONSTANT::HEALTH_PROP_ID;
	prop[0].id = CORBA::string_dup(propId.c_str());
	loadDev->query(prop);
	CORBA::Boolean bVal;
	prop[0].value >>= CORBA::Any::to_boolean(bVal);
	if ( !bVal )
		return false;

	DEBUG(7, BaseDeployStrategy, "component info-OS:" << 
		compInfo->getOSName())
	std::string osName(compInfo->getOSName());
	//compare os name
	if ( osName.empty() == false) {
		DEBUG(7, BaseDeployStrategy, "component os name not nil" )
		CF::ExecutableDevice_ptr exeDev =
		    CF::ExecutableDevice::_narrow (loadDev);
		if (!CORBA::is_nil( exeDev )) {
			if (!matchOSToDevice(exeDev, compInfo)) {
				DEBUG(7, BaseDeployStrategy, "match os to device failed")
				return false;
			}

			DEBUG(7, BaseDeployStrategy, "match os to device succ")
		}
	}

	DEBUG(7, BaseDeployStrategy,
	      "component proceessors size:" << compInfo->getProcessors().size())

	//compare processor type
	if (!matchProcessorToDevice(loadDev, compInfo)) {
		DEBUG(7, BaseDeployStrategy, "match processor to device failed")
		return false;
	}

	DEBUG(7, BaseDeployStrategy, "match processor to device successfully")

	//compare matching other properties to device except for os and processor
	if (matchingProps.size() > 0) {
		if ( !matchOtherPropsToDevice(loadDev, &matchingProps)) {
			return false;
		}
	}

	DEBUG(7, BaseDeployStrategy, "match otherprops to device successfully")
	DEBUG(7, DeployStrategy,
	    "In createDeployInfo assigned device id: " << loadDev->identifier())
	DEBUG(5, BaseDeployStrategy::matchSpecificCompWithDev, "leave ...")

	return true;
}

/**
 * @brief The operation shall be called when a component is deployed successfully, 
 *        and the component has a affinity component, they should be deployed on 
 *        same deviceor one device's affinity device.
 *
 * @param[in] affinityComponents Affinity components need deployed.
 * @param[in] dev				 Device on which the component deployed.
 *
 * @return Result of deploying the affinity component.
 * @retval true		Deploy successfully.
 * @retval false 	Deploy failed.
 */
bool
BaseDeployStrategy::deployAffinityComponents(
    const std::vector<std::string> & affinityComponents,
    CF::Device_ptr dev) {
	DEBUG(5, BaseDeployStrategy::deployAffinityComponents, "enter in ...")

	openscaSupport::ComponentInfo * compInfo = 
					new openscaSupport::ComponentInfo;
	std::vector<PRFProperty*> matchingProps;

	bool findComp = false;
	std::vector <SADComponentInstantiation*> sadIns;
	sadIns.clear();

	for (unsigned int i = 0; i < m_sadCompPlaces->size(); i++) {
		sadIns = *((*m_sadCompPlaces)[i]->getSADInstantiations());
		if (sadIns.size() < 1) {
			continue;
		}

		if ( 0 == strcmp(affinityComponents[0].c_str(), 
						sadIns[0]->getUsageName()) ) {

			std::string spdPath = "";
			SPDParser * spdParser = NULL;
			spdParser = getSpdParser((*m_sadCompPlaces)[i], spdPath);

			getCompInfo(compInfo, (*m_sadCompPlaces)[i], spdPath, spdParser);

			PRFParser * prfParser = NULL;
			prfParser = getPrfParser(compInfo);
			getPropertyFromPRF(compInfo, matchingProps, prfParser);

			//getCompInfo(compInfo, matchingProps, (*m_sadCompPlaces)[i]);
			findComp = true;
			break;
		}
	}

	if (!findComp) {
		//delete compInfo;
		return false;
	}

	//Firstly, match current device
	if ( matchSpecificCompWithDev(compInfo, dev, matchingProps) ) {
		compInfo->setAssignedDeviceId( dev->identifier() );
		m_allCompsInfo.push_back(compInfo);

		DEBUG(5, BaseDeployStrategy::deployAffinityComponents, "leave ...")

		return true;
	}

	std::string spdPath = dev->softwareProfile();
	CF::File_var spdfl;
	if(!openProfileFile(m_fileMgr.in(), spdPath.c_str(), spdfl))
		return false;

	//parsing component spd.xml
	SPDParser spdParser( spdfl );
	closeProfileFile(spdfl);

	std::string prfPath = replaceFileNameofPath(
							spdPath.c_str(), spdParser.getPRFFile());
	CF::File_var prffl;
	if(!openProfileFile(m_fileMgr.in(), prfPath.c_str(), prffl))
		return false;

	PRFParser prfParser(prffl);
	closeProfileFile(prffl);

	std::vector <PRFProperty *> configProps = 
	        *(prfParser.getConfigureProperties());
	std::string affinityDevName = "";
	for (int i = 0; i < configProps.size(); ++i) {
		if ( 0 == strcmp("affinity_component", configProps[i]->getName()) ) {
			affinityDevName = (configProps[i]->getValue())[0];
			break;
		}
	}

	if ("" == affinityDevName) {
		//delete compInfo;
		return false;
	}

	bool findDev = false;
	CF::Device_ptr affinityDev;

	for (unsigned int i = 0; i < m_registeredDevices.size(); i++) {
		if (CORBA::is_nil(m_registeredDevices[i])) {
			continue;
		}

		if ( 0 == strcmp(affinityDevName.c_str(), 
						m_registeredDevices[i]->label()) ) {
			affinityDev = m_registeredDevices[i];
			findDev = true;
			break;
		}
	}

	if (!findDev) {
		DEBUG(5, BaseDeployStrategy::deployAffinityComponents,
		      "match affinity component failed.")
		//delete compInfo;
		return false;
	}

	/**
	 * if component can't match current device and the current device has affinity device,
	 * then try to match affinity device.
	 */
	if ( matchSpecificCompWithDev(compInfo, affinityDev, matchingProps) ) {
			compInfo->setAssignedDeviceId( affinityDev->identifier() );
		m_allCompsInfo.push_back(compInfo);

		DEBUG(5, BaseDeployStrategy::deployAffinityComponents, "leave ...")

		return true;
	} else {
		//delete compInfo;
		return false;
	}
}

/**
 * @brief The operation shall match all properties component need with properties
 *        the device can provides, if match successfully, then the component can 
 *        deploy on this device, otherwise can not.
 *
 * @param[in] registeredDevice	Device need matched with the component.
 * @parma[in] matchProps		Properties the component needs.
 *
 * @return Result of matching properties.
 * @retval Match successfully.
 * @retval Match failed.
 */
bool 
BaseDeployStrategy::matchOtherPropsToDevice(
    const CF::Device_ptr registeredDevice,
    const std::vector<PRFProperty*> * matchProps) {
	DEBUG(4, BaseDeployStrategy,
	    "In matchOtherPropsToDevice with properties length: " << 
	    matchProps->size())

	for (unsigned int numProp = 0; numProp < matchProps->size(); numProp++) {
		CF::DataType * dataType = (*matchProps)[numProp]->getDataType();
		std::string action = (*matchProps)[numProp]->getAction();
		std::string propId = (*matchProps)[numProp]->getID();
		CF::Properties queryProps;
		queryProps.length(1);

		queryProps[0].id = CORBA::string_dup((*matchProps)[numProp]->getID());
		try {
			DEBUG(5, matchOtherPropsToDevice, "query start...")
			if (registeredDevice) {
				registeredDevice->query(queryProps);
			}

			DEBUG(5, matchOtherPropsToDevice, "query no exception")
		} catch (CF::UnknownProperties & e) {
			DEBUG(7, DaseDeployStrategy::matchOtherPropsToDevice, 
			      "registeredDevice->query failed with unknown properties.")
			return false;
		} catch (CORBA::SystemException & e) {
			DEBUG(7, DaseDeployStrategy::matchOtherPropsToDevice,
			      "registeredDevice->query failed with SystemException.")
			return false;
		} catch (...) {
			DEBUG(7, DaseDeployStrategy::matchOtherPropsToDevice,
			      "registeredDevice->query failed with unknown exception.")
			return false;
		}

		//get value from query props
		CORBA::Any devPropValAny = queryProps[0].value;
		if (matchSinglePropToDevice((*matchProps)[numProp], devPropValAny))
			continue;
		else
			return false;
		
	}	//for (unsigned int numProp=0; numProp<matchProps->size(), numProp++)

	DEBUG(5, BaseDeployStrategy, "Leaving matchOtherPropsToDevice.")
	return true;
}

bool 
BaseDeployStrategy::matchSinglePropToDevice(
	PRFProperty * prop,
	CORBA::Any devPropValAny)
{
	if (prop->isDouble()) {	// the type of value is Double
		CORBA::Double doubleVal = openscaSupport::strings_to_double(
			prop->getValue());
		CORBA::Double devPropVal;
	
		if ( !(devPropValAny >>= devPropVal) ) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice],
				"matchVal >>= devPropVal any to double failed.")
			return false;
		}

		if (isPropMatched(devPropVal, doubleVal, prop))
			return true;
		else
			return false;
	} else if (prop->isFloat()) {	// the type of value is Float
		CORBA::Float floatVal = openscaSupport::strings_to_float(
			prop->getValue());
		CORBA::Float devPropVal;
		if ( !(devPropValAny >>= devPropVal) ) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
				"matchVal >>= devPropVal any to float failed.")
			return false;
		}

		if (isPropMatched(devPropVal, floatVal, prop))
			return true;
		else
			return false;
	} else if (prop->isULong()) {	// the type of value is ULong
		CORBA::ULong ulongVal = openscaSupport::strings_to_unsigned_long(
			prop->getValue());
		CORBA::ULong devPropVal;
		if ( !(devPropValAny >>= devPropVal) ) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
				"matchVal >>= devPropVal any to ULong failed.")
			return false;
		}

		if (isPropMatched(devPropVal, ulongVal, prop))
			return true;
		else
			return false;
	} else if (prop->isLong()) { // the type of value is Long
		CORBA::Long longVal = openscaSupport::strings_to_long(
			prop->getValue());
		CORBA::Long devPropVal;
		if (!(devPropValAny >>= devPropVal)) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
				"matchVal >>= devPropVal any to ULong failed.")
			return false;
		}

		if (isPropMatched(devPropVal, longVal, prop))
			return true;
		else
			return false;
	} else if (prop->isUShort()) {	// the type of value is UShort
		CORBA::UShort ushortVal =
		openscaSupport::strings_to_unsigned_short(
			prop->getValue());
		CORBA::UShort devPropVal;
		if (!(devPropValAny >>= devPropVal)) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
				"matchVal >>= devPropVal any to UShort failed.")
			return false;
		}

		if (isPropMatched(devPropVal, ushortVal, prop))
			return true;
		else
			return false;
	} else if (prop->isShort()) { // the type of value is Short
		CORBA::Short shortVal = openscaSupport::strings_to_short(
			prop->getValue());
		CORBA::Short devPropVal;
		if (!(devPropValAny >>= devPropVal)) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
				"matchVal >>= devPropVal any to Short failed.")
			return false;
		}

		if (isPropMatched(devPropVal, shortVal, prop))
			return true;
		else
			return false;
	} else if (prop->isString()) {	//Type for String
		CORBA::String_var stringVal = openscaSupport::strings_to_string(
			prop->getValue());
		const char* devPropVal;
		if (!(devPropValAny >>= devPropVal)) {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
				"matchVal >>= devPropVal any to String failed.")
			return false;
		}

		if (prop->isEqual()) {
			if (strcmp(devPropVal, stringVal.in()) == 0) {
				return true;
			} else {
				DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
					"Property with vaule =" << devPropVal << 
					" failed to match with:" << stringVal.in())
				return false;
			}
		} else {
			DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice, "Property with \
				id=" << prop->getID() << "and type=String: has \
				unknown value type.")
			return false;
		}
	} else {
		DEBUG(7, DaseDeployStrategy::matchSinglePropToDevice,
			"Property with id=" << prop->getID() << " has unknown Data Type")
		return false;
	}	
}

template <class T>
bool
BaseDeployStrategy::isPropMatched(
	T devProp, 
	T compProp, 
	PRFProperty* prop)
{
	if (prop->isEqual()) {
		if (compProp == devProp) {
			return true;
		} else {
			DEBUG(7, DaseDeployStrategy::isPropMatched,
				"match Property: " << prop->getID() << "failed.")
			return false;
		}
	} else if (prop->isGreaterThanOrEqual()) {
		if (devProp >= compProp) {
			return true;
		} else {
			DEBUG(7, DaseDeployStrategy::isPropMatched,
				"match Property: " << prop->getID() << "failed.")
			return false;
		}
	} else if (prop->isGreaterThan()) {
		if (devProp > compProp) {
			return true;
		} else {
			DEBUG(7, DaseDeployStrategy::isPropMatched,
				"match Property: " << prop->getID() << "failed.")
			return false;
		}
	} else if (prop->isLessThanOrEqual()) {
		if (devProp <= compProp) {
			return true;
		} else {
			DEBUG(7, DaseDeployStrategy::isPropMatched,
				"match Property: " << prop->getID() << "failed.")
			return false;
		}
	} else if (prop->isLessThan()) {
		if (devProp < compProp) {
			return true;
		} else {
			DEBUG(7, DaseDeployStrategy::isPropMatched,
				"match Property: " << prop->getID() << "failed.")
			return false;
		}
	} else if (prop->isNotEqual()) {
		if (devProp != compProp) {
			return true;
		} else {
			DEBUG(7, DaseDeployStrategy::isPropMatched,
				"match Property: " << prop->getID() << "failed.")
			return false;
		}
	} else {
		DEBUG(7, DaseDeployStrategy::isPropMatched,
			"Property with id=" << prop->getID() << 
			"and type=double: has a wrong action.")
		return false;
	}
}

bool
BaseDeployStrategy::matchOSToDevice(
    const CF::Device_ptr registeredDevice,
    openscaSupport::ComponentInfo * compInfo) {
	DEBUG(4, BaseDeployStrategy, "In matchOSToDevice.")

	CF::Properties props;
	props.length(1);
	props[0].id = CORBA::string_dup("DCE:os_name:1");

	try {
		if (registeredDevice != NULL) {
			DEBUG(5, BaseDeployStrategy::matchOSToDevice, 
				"registeredDevice query start...")

			registeredDevice->query(props);

			DEBUG(5, BaseDeployStrategy::matchOSToDevice, 
				"registeredDevice query end...")
		}
	} catch (CF::UnknownProperties & ex) {
		DEBUG(3, BaseDeployStrategy::matchOSToDevice,
		    "In matchOSToDeivice occure UnknownProperties excetpion")
		return false;
	} catch (...) {
		DEBUG(3, BaseDeployStrategy::matchOSToDevice, 
			"In matchOSToDeivice occure Unknown excetpion")
		return false;
	}

	DEBUG(7, BaseDeployStrategy::matchOSToDevice, 
		"In matchOSToDevice begin to extract osName")

	std::string str = "any ok";

	CORBA::Any aany;
	aany <<= str.c_str();
	const char* msg;
	aany >>= msg;
	DEBUG(7, DaseDeployStrategy, "msg is: " << msg)
	DEBUG(7, DaseDeployStrategy, "begin to extract osName")
	const char* osName = NULL;
	//CORBA::String_var osName;
	try {
		props[0].value >>= osName;
	} catch (...) {
		DEBUG(7, BaseDeployStrategy, "extract string failed")
		return false;
	}

	DEBUG(7, BaseDeployStrategy::matchOSToDevice,
	    "compInfo->getOSName() is :" << compInfo->getOSName() << 
	    "  osName is :" << osName)

	if ( strcmp(osName, compInfo->getOSName()) == 0) {
		DEBUG(7, BaseDeployStrategy::matchOSToDevice, 
			"In matchOSToDevice return true")
		return true;
	} else {
		DEBUG(7, BaseDeployStrategy::matchOSToDevice, 
			"In matchOSToDevice return false")
		return false;
	}
}

bool
BaseDeployStrategy::matchProcessorToDevice(
    const CF::Device_ptr registeredDevice,
    openscaSupport::ComponentInfo * compInfo) {
	DEBUG(5, BaseDeployStrategy, "In matchProcessorToDevice.")

	CF::Properties props;
	props.length(1);
	props[0].id = CORBA::string_dup("DCE:processor_name:1");

	try {
		registeredDevice->query(props);
	} catch (CF::UnknownProperties & ex) {
		DEBUG(3, BaseDeployStrategy::matchProcessorToDevice,
		    "In matchProcessorToDevice occure UnknownProperties excetpion")
		return false;
	} catch (...) {
		DEBUG(3, BaseDeployStrategy::matchProcessorToDevice,
		    "In matchProcessorToDevice occure Unknown excetpion")
		return false;
	}

	const char * processorName;
	props[0].value >>= processorName;
	bool foundProcessor = false;

	int size = compInfo->getProcessors().size();
	for (unsigned int i = 0; i < size; i++) {
		DEBUG(7, BaseDeployStrategy::matchProcessorToDevice,
		    "comInfo processor is: " << compInfo->getProcessors()[i])
		if (0 == strcmp(processorName, 
				compInfo->getProcessors()[i].c_str())) {
			foundProcessor = true;
			break;
		}
	}

	if (foundProcessor) {
		return true;
	} else {
		DEBUG(2, BaseDeployStrategy, "don't find processor: " << processorName)
		return false;
	}

}

void
BaseDeployStrategy::getDevCapsFromDPD(
    const char * dpdprfl,
    std::vector<PRFProperty*> * capacityProps) {
	DEBUG(4, BaseDeployStrategy, "In getDevCapsFromDPD.")
}

//get component info such as resource type in scd.xml
void
BaseDeployStrategy::getCompInfoFromSCD(
    const char * scdflPath,
    openscaSupport::ComponentInfo * compinfo) {
	DEBUG(4, BaseDeployStrategy::getCompInfoFromSCD,
	      "In getCompInfoFromSCD with SCD path: " << scdflPath)

	CF::File_var scdfl;
	scdfl = m_fileMgr->open( scdflPath, true );
	//parsering scd.xml
	if (!openProfileFile(m_fileMgr.in(), scdflPath, scdfl))
		return;

	//parsering component scd.xml
	SCDParser scdParser( scdfl );
	closeProfileFile(scdfl);

	compinfo->setIsResource( scdParser.isResource() );

	DEBUG(4, BaseDeployStrategy::getCompInfoFromSCD,
	    "In getCompInfoFromSCD component isResource " << scdParser.isResource())
}

//get component info about properties in prf.xml or implpri.xml
void
BaseDeployStrategy::getPropertyFromPRF(
    openscaSupport::ComponentInfo * compinfo,
    std::vector<PRFProperty *> & matchingProps,
    PRFParser * prfParser) {
	DEBUG(7, BaseDeployStrategy::getPropertyFromPRF, "In getPropertyFromPRF.")

	//extract properties from prf.xml
	DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
	    "In getPropertyFromPRF storing factory parameters in componentinfo")
	
	std::vector<PRFProperty *> * factoryProp = 
				prfParser->getFactoryParamProperties();
	unsigned int factoryPropSize = factoryProp->size();
	for (unsigned int i = 0; i < factoryPropSize; i++) {
		DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
		    "adding factory parameter: " << (*factoryProp)[i]->getName());
		compinfo->addFactoryParameter((*factoryProp)[i]->getDataType());
	}

	DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
	    "In getPropertyFromPRF storing exec parameters in componentinfo")
	
	std::vector<PRFProperty *> * execProp = prfParser->getExecParamProperties();
	unsigned int execPropSize = execProp->size();
	for (unsigned int i = 0; i < execPropSize; i++) {
		DEBUG(8, BaseDeployStrategy::getPropertyFromPRF, 
			"adding exec parameter: " << (*execProp)[i]->getName() );
		compinfo->addExecParameter((*execProp)[i]->getDataType());
	}

	DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
	    "In getPropertyFromPRF storing configure parameters in componentinfo")
	
	std::vector<PRFProperty *> * configProp = 
					prfParser->getConfigureProperties();
	unsigned int configPropSize = configProp->size();
	for (unsigned int i = 0; i < configPropSize; i++) {
		DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
		    "adding configure property: " << (*configProp)[i]->getName() );

		compinfo->addConfigureProperty((*configProp)[i]->getDataType());
		if (0 == strcmp((*configProp)[i]->getName(), "affinity_component")) {
			compinfo->addAffinityCompinents((*configProp)[i]->getValue());
		}
	}

	DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
	    "In getPropertyFromPRF storing capacity parameters in componentinfo")
	
	std::vector<PRFProperty *> * capacityProp = 
					prfParser->getCapacityProperties();
	unsigned int capacityPropSize = capacityProp->size();
	for (unsigned int i = 0; i < capacityPropSize; i++) {
		DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
		    "adding allocation property: " << (*capacityProp)[i]->getName() );
		compinfo->addAllocationCapacity((*capacityProp)[i]->getDataType());
	}

	//get matching props intend to match device deploying on
	matchingProps = *(prfParser->getMatchingProperties());
	if (matchingProps.size() > 0) {
		DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
		    "In getPropertyFromPRF matchingProps size is: " << 
		    matchingProps.size())
	} else {
		DEBUG(8, BaseDeployStrategy::getPropertyFromPRF,
		    "In getPropertyFromPRF matchingProps size is zero ")
	}
}

/**
 * this function is designed to create component deployment relations with devices
 * according to Device Assignment Sequence.
 */
std::vector<openscaSupport::ComponentInfo*>
BaseDeployStrategy::createDeployInfo(
    CF::DeviceAssignmentSequence devAssigSeq) {

	DEBUG(2, BaseDeployStrategy, "In createDeployInfo(devAssigSeq).")

	//loop to get every component info thru match deploying device
	for (unsigned int numComp = 0; numComp < m_sadCompPlaces->size(); numComp++) 
	{
		openscaSupport::ComponentInfo * compInfo = 
					new openscaSupport::ComponentInfo;

		std::vector<SADComponentInstantiation*> * sadCompInsts =
		    (*m_sadCompPlaces)[numComp]->getSADInstantiations();

		std::string assemblyCtrlRefId = m_sadPar->getAssemblyControllerRefId();
		if (strcmp(compInfo->getIdentifier(), assemblyCtrlRefId.c_str()) == 0) {
			compInfo->setIsAssemblyController( true );
			DEBUG(7, BaseDeployStrategy::createDeployInfo,
			    compInfo->getIdentifier() << " is setIsAssemblyController")
		} else {
			compInfo->setIsAssemblyController( false );
			DEBUG(7, BaseDeployStrategy::createDeployInfo,
			    compInfo->getIdentifier() << " isn't setIsAssemblyController")
		}

		//parsering spd.xml
		std::string spdrefid = (*m_sadCompPlaces)[numComp]->getFileRefId();
		std::string spdPath = 
			m_sdrRoot + "/" + m_sadPar->getSPDById( spdrefid.c_str());
		DEBUG(7, DeployStrategy, "spdPath is: " << spdPath)

		CF::File_var spdfl;
		if (!openProfileFile(m_fileMgr.in(), spdPath.c_str(), spdfl))
			return m_allCompsInfo;

		//parsering component spd.xml
		SPDParser spdParser( spdfl );
		closeProfileFile(spdfl.in());

		std::vector <SPDImplementation*> * spdImpls =
		    spdParser.getImplementations();

		//get absloute path for local code file
		size_t pos = spdPath.find_last_of("/");
		std::string absLocalFile = 
			replaceFileNameofPath(spdPath.c_str(), (*spdImpls)[0]->getCodeFile());
		compInfo->setLocalFileName(absLocalFile.c_str());

		compInfo->setScaComplicant((*m_sadCompPlaces)[numComp]->isScaCompliant());

		//get component Info for os/processor/implprf and so on
		if ( ((*spdImpls)[0]) && ((*sadCompInsts)[0])) {
			//assume that every component placement have one instantiation
			setComponentInfo(compInfo, (*sadCompInsts)[0], (*spdImpls)[0]);
		} else {
			DEBUG(7, BaseDeployStrategy,
			    "[BaseDeployStrategy::createDeployInfo] don't found \
				implementation in spd.xml.")
			exit(1);
		}

		//get component info for resource type in scd.xml
		//extract common path from full SPD path
		DEBUG(7, DeployStrategy, "obtain info from scd.xml")
		//get component info for resource type in scd.xml
		std::string scdPath = 
			replaceFileNameofPath(spdPath.c_str(), spdParser.getSCDFile());
		getCompInfoFromSCD(scdPath.c_str(), compInfo);

		//get component info about properties in prf.xml
		std::string prfPath = spdParser.getPRFFile();

		//in order to store the identifier of devices assigned
		std::vector <std::string> assignedDevices;

		//extract the matching relation between component and device from
		//input parameter devAssigSeq into compinfo
		bool foundCompDev = false;
		for (unsigned int numCompDev = 0; numCompDev < devAssigSeq.length();
		        numCompDev++) {
			if (strcmp(compInfo->getIdentifier(),
			           devAssigSeq[numCompDev].componentId) == 0) {
				compInfo->setAssignedDeviceId(
					devAssigSeq[numCompDev].assignedDeviceId);
				foundCompDev =  true;
				break;
			}
		}
		if (!foundCompDev) {
			DEBUG(7, BaseDeployStrategy::createDeployInfo,
			    "can't find component: " <<
			    compInfo->getIdentifier() << " in deviceAssignments.")

			throw CF::ApplicationFactory::CreateApplicationRequestError();
		}

		m_allCompsInfo.push_back(compInfo);

		DEBUG(2, BaseDeployStrategy, "Component:" << 
			compInfo->getUsageName() << "has found device to deploy.")

	}	//for (unsigned int numComp=0; numComp<m_sadCompPlaces->size(); numComp++)

	DEBUG(2, BaseDeployStrategy, "Leaving createDeployInfo().")

	return m_allCompsInfo;
}

void 
BaseDeployStrategy::setComponentInfo(
	openscaSupport::ComponentInfo * compInfo,
	SADComponentInstantiation * sadCompInst,
	SPDImplementation * spdImp)
{
	if ((!compInfo) || (!sadCompInst) || (!spdImp))
	{
		DEBUG(1, BaseDeployStrategy::setComponentInfo,
			"invalid input parameter")
		return;
	}

	compInfo->setIdentifier( sadCompInst->getID());
	compInfo->setUsageName( sadCompInst->getUsageName());
	compInfo->setNamingService( sadCompInst->isNamingService());
	compInfo->setNamingServiceName(sadCompInst->getFindByNamingServiceName());

	compInfo->setCodeType(spdImp->getCodeType());
	compInfo->setImplId(spdImp->getID());
	compInfo->setEntryPoint(spdImp->getEntryPoint());
			//intend to match device deploying on
	compInfo->setOperatingSystem(spdImp->getOperatingSystem().getOSName());
	compInfo->setProcessors(spdImp->getProcessors());
	compInfo->setStackSize( spdImp->getStackSize() );
	compInfo->setPriority( spdImp->getPriority() );
}
