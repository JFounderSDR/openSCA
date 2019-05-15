/***************************************************************************//**
* @file     ApplicationFactory_impl.cpp
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
#include <sstream>
#include "../include/ApplicationFactory_impl.h"
#include "port_helpers.h"
#include "utils.h"
#include "Boost_utils.h"
#include "TimeDelay.h"
#include "ConfigParser.h"

#ifdef __SDS_OS_VXWORKS__
#include "taskLib.h"
extern SEM_ID semAppsMutex;
#endif

#define APP_NUMS_UPPER 16
bool isTimeout = false;

void handler() {
	isTimeout = true;
}

ApplicationFactory_impl::ApplicationFactory_impl(
    const char * sftwpfl,
    CF::DomainManager::ApplicationSequence * appSeqPtr)
	: m_instanceNum(0) {
		
	DEBUG(1, ApplicationFactory, "In ApplicationFactory constructor.")
	m_softwareProfile = sftwpfl;
	m_appSeqPtr = appSeqPtr;

	postConstructor();

	//get registered devices and component palcement from sad.xml
	getRegisteredDevices();

	DEBUG(5, ApplicationFactory_impl, "m_factoryName is " << m_factoryName)
	DEBUG(5, ApplicationFactory_impl, "m_identifier is " << m_identifier)
	DEBUG(5, ApplicationFactory, "Leaving ApplicationFactory constructor.")
}

void 
ApplicationFactory_impl::postConstructor()
{
	/*
	 * instantiate ORB_Wrap in order to resolve domain manager ref and
	 * file manager ref.
	 */
#ifdef __SDS_OS_VXWORKS__
	m_orbWrap = new openscaSupport::ORB_Wrap::ORB_Wrap();
#elif defined __SDS_OS_LINUX__
	m_orbWrap = new openscaSupport::ORB_Wrap();
#endif

	if ( !m_orbWrap ) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] instantiate ORB_Wrap failed.")
		exit(EXIT_FAILURE);
	}

	CORBA::Object_ptr dmnObj = CORBA::Object::_nil();
	try {
		dmnObj = m_orbWrap->get_object_from_string(
			"OpenSCA_Domain/Domain_Manager");
	} catch (...) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_orbWrap-> \
		    get_object_from_string failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	try {
		m_dmnMgr = CF::DomainManager::_narrow(dmnObj);
	} catch (...) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] CF::DomainManager::_narrow \
		    failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	try {
		m_fileMgr = m_dmnMgr->fileMgr();
	} catch (...) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_dmnMgr->fileMgr \
		    failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	//open sad.xml and parser it
	CF::File_var fl;
	try {
		fl = m_fileMgr->open(m_softwareProfile.c_str(), true);
	} catch (CF::InvalidFileName & e) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open \
		    failed with Invalid file name.")
		exit(EXIT_FAILURE);

	} catch (CF::File::IOException & e) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open \
		    failed with CF::File::IOException.")
		exit(EXIT_FAILURE);
	} catch (CF::FileException & e) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open \
		    failed with CF::FileException.")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open \
		    failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	m_sadParser = new SADParser( fl );

	try {
		fl->close();
	} catch (CF::InvalidFileName & e) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open \
		    failed with Invalid file name.")
		exit(EXIT_FAILURE);
	} catch (CF::File::IOException & e) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open\
		    failed with CF::File::IOException.")
		exit(EXIT_FAILURE);
	} catch (CF::FileException & e) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open\
		    failed with CF::FileException.")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl] m_fileMgr->open \
		    failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	if (m_sadParser) {
		DEBUG(5, ApplicationFactory_impl, "new SADParser...")
	}

	//initialize name and identifier of application
	m_factoryName = m_sadParser->getName();
	m_identifier = m_sadParser->getID();
}

ApplicationFactory_impl::~ApplicationFactory_impl() {
	DEBUG(3, ApplicationFactory, "In AapplicationFactory destrutor.")
	delete m_sadParser;
}

/**
 * The create operation is used to create an application within the system domain.
 *
 * The create operation provides a client interface to request the creation of an
 * application on client requested device(s) and/or the creation of an application
 * in which the application factory determines the necessary device(s) required
 * for instantiation of the application.
 * The following steps demonstrate one scenario of the behavior of an application
 * factory for the creation of an application:
 *  1. Client invokes the create operation.
 *  2. Evaluate the Domain Profile for available devices that meet the application's
 *  memory and processor requirements, available dependent applications, and dependent
 *  libraries needed by the application. Create an instance of an Application, if the
 *  requested application can be created. Update the memory and processor utilization
 *  of the devices.
 *  3. Allocate the device(s) memory and processor utilization.
 *  4. Load the application software modules on the devices using the appropriate
 *  Device(s) interface provided the application software modules haven't already
 *  been loaded.
 *  5. Execute the application software modules on the devices using the appropriate
 *  Device interface as indicated by the application's software profile.
 *  6. Obtain the object reference (Resource or ResourceFactory) as described by the SAD.
 *  7. If the component obtained from the CORBA Naming Service is a resource factory as
 *  indicated by the SAD, then narrow the object reference to be a ResourceFactory component.
 *  8. If the component is a ResourceFactory, then create a resource using the
 *  ResourceFactory interface.
 *  9. If the components obtained from the Naming Services is a resource supporting the
 *  Resource interface as indicated by the SCDs, then narrow the components reference to Resource
 *  components.
 *  10. Initialize the resource.
 *  11. Get Port object references for the resources.
 *  12. Connect the ports that interconnect the resources' ports together.
 *  13. Configure the assemblycontroller component using the Resource interface.
 *  14. Return the Application object reference and log message.
 *  15. Generate an event to indicate the application has been added to the domain.
 */
CF::Application_ptr
ApplicationFactory_impl::create(
    const char * name,
    const CF::Properties & initConfiguration,
    const CF::DeviceAssignmentSequence & deviceAssignments)
throw (
    CF::ApplicationFactory::InvalidInitConfiguration,
    CF::ApplicationFactory::CreateApplicationRequestError,
    CF::ApplicationFactory::CreateApplicationError,
    CORBA::SystemException) {

	DEBUG(1, ApplicationFactory, "In create.")

	lock();

	CF::Application_var appVar = CF::Application::_nil();
	m_appName = name;

	// increment applicaton instance number
	updateInstanceNum();
	DEBUG(5, ApplicationFactory_impl::create, "update instance number finished")
	// 
	char instanceNum[5];
	sprintf(instanceNum, "%d", (int)m_instanceNum);
	m_appNameWithInstanceNum = m_appName + ":" + instanceNum;

	DEBUG(5, ApplicationFactory_impl::create, 
		"m_appNameWithInstanceNum: " << m_appNameWithInstanceNum)

	std::vector <SADComponentPlacement*> * sadComplaces =
	    m_sadParser->getComponents();

	DEBUG(5, ApplicationFactory_impl::create, 
		"start create deploy strategy")
	//generate components deployment info in term of deviceAssignments.
	DeployStrategy * deployStg = new BaseDeployStrategy (
	    m_registeredDevices,
	    m_sadParser,
	    m_fileMgr,
	    sadComplaces);

	bool result = 
		generateDeployInformation(deployStg, sadComplaces, deviceAssignments);
	delete deployStg; //delete deploy strategy

	if (!result)
	{
		unlock();
		return appVar._retn();
	}

	try {
		//create application context
		createAppNamingCtx();

	} catch (...) {
		unlock();
		return appVar._retn();
	}

	//load and execute all components according to m_deployCompsInfo
	m_appCompProcIds = new CF::Application::ComponentProcessIdSequence (20);
	m_appCompProcIds->length (0);
	try {
		loadAndExecuteComps( m_appCompProcIds);
	} catch (...) {

		DEBUG(3, ApplicationFactory_impl,
		      "In Create. loadAndExecuteComps occur exception....")
		unlock();
		exit(-1);
	}

	sleep(1);

	//configure and initialize every resource component
	if ( !initializeAndConfigureRsrcComps(initConfiguration) ) {
		unlock();
		return appVar._retn();
	}

	//create all connections in term of SAD.xml
	if (!createConnections()) {
		DEBUG(0, ApplicationFactory::create, "create connection failed")
		unlock();
		return appVar._retn();
	} else {
		DEBUG(5, ApplicationFactory::create, "create connection successfully")
	}


		//extract appNamingCtx and m_appCompImpls from componentInfo sequence
	m_appCompImpls = new CF::Application::ComponentElementSequence(20);
	m_appNamingCtxs = new CF::Application::ComponentElementSequence(20);

	m_appNamingCtxs->length(m_deployCompsInfo.size());
	m_appCompImpls->length(m_deployCompsInfo.size());
	for (unsigned int numComp = 0; 
		numComp < m_deployCompsInfo.size(); numComp++) {

		(*m_appNamingCtxs)[numComp].componentId = CORBA::string_dup(
			m_deployCompsInfo[numComp]->getIdentifier());

		if (m_deployCompsInfo[numComp]->isNamingService()) {
			(*m_appNamingCtxs)[numComp].elementId = CORBA::string_dup(
				m_deployCompsInfo[numComp]->getNamingServiceName());
		}

		(*m_appCompImpls)[numComp].componentId = CORBA::string_dup(
			m_deployCompsInfo[numComp]->getIdentifier());

		(*m_appCompImpls)[numComp].elementId = CORBA::string_dup(
			m_deployCompsInfo[numComp]->getImplId());
	}

	/*
	 * Allocate space for device assignment
	 * TODO (assume maximum length of 10 - will make dynamic in later version)
	 */
	if (!instantiateApplication(deviceAssignments, appVar))
	{
		unlock();
		throw CF::ApplicationFactory::CreateApplicationError();
	}

	unlock();

	DEBUG(5, ApplicationFactory, "finish create application")
	return appVar._retn();
}

void
ApplicationFactory_impl::updateInstanceNum() {
	DEBUG(5, ApplicationFactory_impl::updateInstanceNum, "enter in...")

	std::vector<std::string> ids;
	std::vector<unsigned char> insNumsUsed;
	for (CORBA::ULong i = 0; i < m_appSeqPtr->length(); i++) {
		std::string id;
		if ( 0 == strcmp(m_appName.c_str(), (*m_appSeqPtr)[i]->name() ) ) {
			id = (*m_appSeqPtr)[i]->identifier();
			ids.push_back(id);
		}
	}

	for (int i = 0; i < ids.size(); i++) {
		std::string insStr = "0x";
		int pos = ids[i].find_last_of(":");
		insStr.append( ids[i].substr(pos + 1, ids[i].size()) );
		unsigned short insNum = 0;
		if (hexConvertToDec(insStr.c_str(), insNum)) {
			insNumsUsed.push_back((unsigned char)insNum);
		}
	}

	for (int i = 1; i < APP_NUMS_UPPER + 1; ++i) {
		bool hasUsed = false;
		for (int j = 0; j < insNumsUsed.size(); j++) {
			if ( (unsigned char)i == insNumsUsed[j] ) {
				hasUsed = true;
				break;
			}
		}

		if (hasUsed) {
			continue;
		} else {
			m_instanceNum = (unsigned char)i;
			DEBUG(5, ApplicationFactory_impl::updateInstanceNum, "leave...")
			return;
		}
	}

	DEBUG(5, ApplicationFactory_impl::updateInstanceNum, "leave...")
}

bool 
ApplicationFactory_impl::generateDeployInformation(
	DeployStrategy* deployStg,
	std::vector <SADComponentPlacement*> * sadComplaces,
	const CF::DeviceAssignmentSequence & deviceAssignments)
{
	if (deviceAssignments.length() == sadComplaces->size()) {

		try {
			m_deployCompsInfo = 
				deployStg->createDeployInfo(deviceAssignments);
		} catch (CF::ApplicationFactory::CreateApplicationError & e) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::create] \
			    deployStg->createDeployInfo(deviceAssignements) \
				failed with CF::ApplicationFactory::CreateApplicationError.")
			return false;
		} catch (CF::ApplicationFactory::CreateApplicationRequestError & e) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::create] \
			    deployStg->createDeployInfo(deviceAssignements) failed with \
			    CF::ApplicationFactory::CreateApplicationRequestError.")
			return false;
		} catch (...) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::create] \
			    deployStg->createDeployInfo(deviceAssignements) \
				failed with Unknown Exception.")
			return false;
		}

	} else if (deviceAssignments.length() == 0) {

		try {
			m_deployCompsInfo = deployStg->createDeployInfo();
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::create] " << "m_deployCompsInfo \
			    length is " << m_deployCompsInfo.size())
		} catch (CF::ApplicationFactory::CreateApplicationError & e) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::create] \
			    deployStg->createDeployInfo failed with \
			    CF::ApplicationFactory::CreateApplicationError.")
			return false;

		} catch (...) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::create] \
			    deployStg->createDeployInfo failed with Unknown Exception.")
			return false;
		}

	} else {
		DEBUG(1, ApplicationFactory,
		    "[ApplicationFactory_impl::create]The length of deviceassignments \
		    is wrong. its not zero but not num of all components.")
		return false;
	}

	return true;
}

bool 
ApplicationFactory_impl::instantiateApplication(
	const CF::DeviceAssignmentSequence & deviceAssignments,
	CF::Application_var & appVar)
{
	CF::DeviceAssignmentSequence * assignedDevs = NULL;
		//default deployment strategy
	if (deviceAssignments.length() == 0) {
		CORBA::ULong deployCompsInfoSize = m_deployCompsInfo.size();
		assignedDevs = new CF::DeviceAssignmentSequence(deployCompsInfoSize);
		assignedDevs->length(deployCompsInfoSize);

		DEBUG(7, ApplicationFactory,
			"deviceAssignedmentSequence length is: " << assignedDevs->length())

		for (unsigned int i = 0; i < deployCompsInfoSize; i++) {

			(*assignedDevs)[i].componentId = CORBA::string_dup(
				m_deployCompsInfo[i]->getIdentifier());
			DEBUG(7, ApplicationFactory,
				"deviceAssignedmentSequence compId is: " << (*assignedDevs)[i].componentId)

			(*assignedDevs)[i].assignedDeviceId = CORBA::string_dup(
				m_deployCompsInfo[i]->getAssignedDeviceId());
			DEBUG(7, ApplicationFactory,
				"deviceAssignedmentSequence deviceId is: " << (*assignedDevs)[i].assignedDeviceId)
		}
	} else {
			// external deployment strategy
		assignedDevs = new CF::DeviceAssignmentSequence(deviceAssignments);
	}

	if (m_assemblyController == NULL) {
		DEBUG(1, ApplicationFactory,
			"[ApplicationFactory_impl::create] Can't found assemblyController.")
		return false;
	}

	Application_impl * application = NULL;
	try {
		std::string appId = getIdentifierWithInstanceNum(m_identifier);
		application = new Application_impl (
		    appId.c_str(),
		    m_appName.c_str(),
		    m_appNameWithInstanceNum.c_str(),
		    m_softwareProfile.c_str(),
		    assignedDevs,
		    m_appCompImpls,
		    m_appNamingCtxs,
		    m_appCompProcIds,
		    m_connectionsInfo,
		    CF::Resource::_duplicate (m_assemblyController),
		    m_appSeqPtr);
	} catch (...) {

		DEBUG(1, ApplicationFactory_impl::create,
		      "exception occur when create application")
		return false;
	}

	// Add a reference to the new application to the ApplicationSequence 
	// in DomainManager
	try {
		appVar = CF::Application::_duplicate(application->_this());
		int oldLength = m_appSeqPtr->length();
		m_appSeqPtr->length(oldLength + 1);

		(*m_appSeqPtr)[oldLength] = 
			CF::Application::_duplicate(application->_this());

	} catch (...) {
		return false;
	}

	return true;
}

/*
 * @brief	Convert UUID(DCE::233f-324lfs-32wefe:1) to id with instance num. 
 *        	The last num is instance num
 * @return  id with instance num
 */
std::string
ApplicationFactory_impl::getIdentifierWithInstanceNum(
    const std::string & scaid) {
	std::string id = scaid;
	//check if scaid is valid
	if (isValidOfSCAId(scaid) == false) {
		DEBUG(3, ApplicationFactory_impl,
		    "In getIdentifierWithInstanceNum application id is invalid.")
		return id;
	}

	size_t pos = scaid.find_last_of(':');
	std::string str = scaid.substr(0, pos + 1);

	char temp[64];
	sprintf(temp, "%x", (int) m_instanceNum);
	str.append(temp);
	return str;
}

bool
ApplicationFactory_impl::isValidOfSCAId(
    const std::string & scaid) {
	std::string id = scaid;
	unsigned int len = scaid.size();

	size_t pos = scaid.find_last_of(':');
	std::string str = scaid.substr(pos + 1, scaid.size() - pos);
	int num = atoi(str.c_str());

	if ((num >= 0) && (len >= 42))
		return true;
	else
		return false;
}

bool
ApplicationFactory_impl::initializeAndConfigureRsrcComps(
    const CF::Properties & initConfigurations) {
	DEBUG(3, ApplicationFactory_impl, "In initializeAndConfigureRsrcComps.")

	m_assemblyController = CF::Resource::_nil();

	//loop to initialize and configure every component
	for (unsigned int numComp = 0; 
		numComp < m_deployCompsInfo.size(); numComp++) {
		if (!(m_deployCompsInfo[numComp]->isScaComplicant()))
			continue;

		std::string compNamingName = "";
		DEBUG(1, ApplicationFactory,
		      "[ApplicationFactory_impl::initializeAndConfigureRsrcComps] \
		      in loop" << "deployCompsInfor size is:" << m_deployCompsInfo.size())
		//check if this component is type of Resource, if not bypass it
		if (!m_deployCompsInfo[numComp]->isResource())
			continue;

		compNamingName = m_deployCompsInfo[numComp]->getUsageName();

		DEBUG(7, ApplicationFactory,
		    "In initializeAndConfigureRsrcComps with compNamingName: " << compNamingName)
		std::string cosName = "OpenSCA_Domain/Applications";
		cosName.append("/");
		cosName.append(m_appNameWithInstanceNum);
		cosName.append("/");
		cosName.append(compNamingName);

		CORBA::Object_ptr obj = CORBA::Object::_nil();
		
		if (!getObjectRefFromNamingService(cosName.c_str(), obj))
			return false;

		CF::Resource_ptr src = CF::Resource::_nil();
		try {
			src = CF::Resource::_narrow(obj);

		} catch (...) {
			DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
			    "CF::Resource::_narrow failed with Unknown Exception.")
			return false;
		}

		//store the pointer to this resource into component Info
		m_deployCompsInfo[numComp]->setResourcePtr(src);

		DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
		    "begin to check AssCon")
		if (m_deployCompsInfo[numComp]->isAssemblyController()) {
			//modefied by victor 20161107
			m_assemblyController = CF::Resource::_duplicate(src);

			DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
			    "has setted AssCon")
			try {
				m_assemblyController->initialize();
			} catch (...) {
				DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
				    "m_assemblyController->initialize failed with Unknown Exception.")
			}

			try {
				m_assemblyController->configure(initConfigurations);
			} catch (...) {
				DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
				    "m_assemblyController->configure failed with Unknown Exception.")
				throw CF::ApplicationFactory::InvalidInitConfiguration();
			}

		} else {/*if(m_deployCompsInfo[numComp]->isConfigurable())*/
			try {
				src->initialize();
			} catch (...) {
				DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
				    "m_assemblyController->initialize failed with Unknown Exception.")
			}

			try {
				src->configure(initConfigurations);
			} catch (...) {
				DEBUG(1, ApplicationFactory::initializeAndConfigureRsrcComps,
				    "m_assemblyController->configure failed with Unknown Exception.")
				throw CF::ApplicationFactory::InvalidInitConfiguration();
			}
		}
	}	//for (unsigned int numComp=0; numComp<m_deployCompsInfo.size(); numComp++)

	return true;
}

bool 
ApplicationFactory_impl::getObjectRefFromNamingService(
	const char * cosName,
	CORBA::Object_ptr & obj)
{
	sMsSleep(SDS_SLEEP);
	int count = 10;
	while (count) {
		try {
			obj = m_orbWrap->get_object_from_string(cosName);
		} catch (...) {
			DEBUG(1, ApplicationFactory_impl::getObjectRefFromNamingService,
				"m_orbWrap->get_object_from_string failed with Unknown Exception.")
			sMsSleep(SDS_SLEEP);
			count--;
			continue;
		}
		if (CORBA::is_nil(obj)) {
			sMsSleep(SDS_SLEEP);
			count--;
		} else {
			break;
		}
	}

	if (0 == count) {
		DEBUG(5, ApplicationFactory_impl::getObjectRefFromNamingService,
			"get object failed with name: " << cosName)
		return false;
	}

	return true;
}

void
ApplicationFactory_impl::createAppNamingCtx() {
	// create naming context for this application
	CORBA::Object_var objAppsCtx;
	try {

		objAppsCtx = m_orbWrap->get_object_from_string(
		                 "OpenSCA_Domain/Applications");

	} catch (CORBA::SystemException & ex) {
		DEBUG(1, ApplicationFactory::createAppNamingCtx,
		    "[ApplicationFactory::create] get_object_from_string " \
		    " threw CORBA::SystemException")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(1, ApplicationFactory::createAppNamingCtx,
		      "[ApplicationFactory::create] get_object_from_string" \
		      " threw Unknown Exception")
		exit(EXIT_FAILURE);
	}

	CosNaming::NamingContext_var AppsContext = 
						CosNaming::NamingContext::_nil();
	try {
		AppsContext = CosNaming::NamingContext::_narrow(objAppsCtx);
	} catch (...) {
		DEBUG(1, ApplicationFactory::createAppNamingCtx,
		    "[ApplicationFactory::create] \
		    CosNaming::NamingContext::_narrow threw Unknown Exception")
		exit(EXIT_FAILURE);
	}

	unsigned short appCount = 0;
	std::string appContextName("");
	CORBA::Object_var objAppContext;

	bool foundEmpty = false;

	do {
		appContextName = "";
		appContextName.append(m_appNameWithInstanceNum.c_str());

		std::string tempAppContext("OpenSCA_Domain/Applications/");
		tempAppContext.append(appContextName.c_str());

		CosNaming::Name_var cosName = m_orbWrap->string_to_CosName(
		                                  tempAppContext.c_str());

		DEBUG(7, ApplicationFactory::createAppNamingCtx,
		      "In createAppNamingCtx will call to bind_new_context_with_string")

		m_orbWrap->bind_new_context_with_string(tempAppContext.c_str());

		try {
			objAppContext = m_orbWrap->naming_cntx->resolve(cosName);
		} catch (const CosNaming::NamingContext::NotFound &) {
			foundEmpty = true;
			sMsSleep(5);
		}
	} while (foundEmpty);

	//create component port naming context by call bind_new_context_with_string
	std::string appNaming = "OpenSCA_Domain/" + m_appNameWithInstanceNum;
	if (false == m_orbWrap->bind_new_context_with_string(appNaming.c_str())) {
		throw CF::LifeCycle::InitializeError();
	}

	DEBUG(7, ApplicationFactory, "leaving createAppNamingCtx ")
}

bool
ApplicationFactory_impl::createConnections() {
	DEBUG(3, ApplicationFactory_impl, "In createConnections.")

	//clear old connection info from local variable: connectionsinfo
	m_connectionsInfo.clear();

	std::vector <Connection *> * connections = NULL;

	if (m_sadParser) {
		DEBUG(5, ApplicationFactory_impl, "m_sadParser -> getConnections")

		connections = m_sadParser->getConnections();

		if (!connections) {
			DEBUG(5, ApplicationFactory_impl,"connections from sad.xml is null")
			return false;
		}
	} else {
		DEBUG(5, ApplicationFactory_impl, "m_sadParser is null exception")
		return false;
	}

	DEBUG(5, ApplicationFactory_impl,
	    "total connections is " << connections->size())

	//loop to establish connections
	for (unsigned int numCont = 0; numCont < connections->size();
	        numCont++) {

		Connection * connect = (*connections)[numCont];

		std::string connectId = connect->getID();

		DEBUG(5, ApplicationFactory_impl,
		    "Creating connection start: " << connectId)

		if ((connect->getExternalUsesPorts()).size() >= 2 || 
			(connect->getExternalProvidePorts()).size() >= 2) {
			continue;
		}

		//get provides port info for id and ref
		std::string providName = "";

		//CF::PPort_ptr providPort = CF::PPort::_nil();
		CORBA::Object_var providesObjRef = CORBA::Object::_nil();

		try {
			getProvidesPort(providName, providesObjRef, connect);
		} catch (...) {
			DEBUG(5, ApplicationFactory_impl,
			    "call getProvidesPort occur unknow exception...")
			return false;
		}

		//get uses port info for id and ref
		std::string usesName = "";
		CF::PPort_var usesPort = CF::PPort::_nil();

		try {
			getUsesPort(usesName, usesPort, connect);
		} catch (...) {
			DEBUG(5, ApplicationFactory_impl,
			    "call getUsesPort occur unknow exception...")
			return false;
		}

		// Create connection
		try {
			if (CORBA::is_nil(usesPort)) {
				DEBUG(5, ApplicationFactory_impl::createConnections,
				    "uses port null: " << usesName)
				continue;
			}

			if (CORBA::is_nil(providesObjRef)) {
				DEBUG(5, ApplicationFactory_impl::createConnections,
				    "provides port null: " << providName)
				continue;
			}
			DEBUG(5, ApplicationFactory_impl,
			    "usesport connect providesport start")
			usesPort->connectPort(providesObjRef, connect->getID());
			DEBUG(5, ApplicationFactory_impl,
			    "usesport connect providesport finished")
		} catch (...) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory::createConnections] usesPort->connectPort \
				failed with Unknown Exception for connection ID " << connect->getID())
			return false;
		}

		DEBUG(5, ApplicationFactory_impl,
		      "Creating connection finisged: " << connectId)
		//modfied by victor at 20170819
		m_connectionsInfo.push_back(
		    new UsesConnectionInfo(usesPort, connect->getID()));
	}//for (unsigned int numCont=0; numCont<connections->size(); numCont++)

	return true;
}

void
ApplicationFactory_impl::getProvidesPort(
    std::string & providName,
    CORBA::Object_var & providesport,
    const Connection * connect) {
	DEBUG(3, ApplicationFactory_impl, "In getProvidesPort.")

	if (!connect) {
		DEBUG(3, ApplicationFactory_impl, "connect is nil")
		return;
	}

	ProvidesPort * providPort = connect->getProvidesPort();

	if (providPort == NULL) {
		DEBUG(3, ApplicationFactory_impl,
		      "while create connection: failed to get provides port.")

		//mask occure exception in VX6.9
		throw CF::ApplicationFactory::CreateApplicationError();
	}

	CF::Resource_var providComp = CF::Resource::_nil();
	CORBA::Object_var provideObj = CORBA::Object::_nil();

	if (providPort->isFindBy()) {
		providName = providPort->getFindBy()->getFindByNamingServiceName();
		DEBUG(3, ApplicationFactory_impl, " has got providName.")
		if (isMhalDevProvidesPort(providName)) {
			getMhalDevProvidesPort(provideObj, connect, providName);
			if (!CORBA::is_nil(provideObj)) {
				providesport = provideObj;
			} else {
				DEBUG(5, ApplicationFactory_impl::getProvidesPort,
					"get provides port failed.")
			}
			return;
		}

		//get full port name in NamingService
		std::string compPortFindbyName = "";
		compPortFindbyName.append("OpenSCA_Domain/");
		compPortFindbyName.append(m_appNameWithInstanceNum);
		compPortFindbyName.append("/");
		compPortFindbyName.append(providName);

		DEBUG(3, ApplicationFactory_impl, "begin to resovle port naming")

		bool result = getObjectRefFromNamingService(
						compPortFindbyName.c_str(), provideObj);
		if (result)
			providesport = provideObj;

	} else if (providPort->isComponentInstantiationRef()) {
		std::string compId = providPort->getComponentInstantiationRefID();
		providName = providPort->getID();

		bool foundComp = false;

		for (unsigned int i = 0; i < m_deployCompsInfo.size(); i++) {
			if (0 == strcmp(compId.c_str(), 
					m_deployCompsInfo[i]->getIdentifier())) {
				foundComp = true;
				providComp = CF::Resource::_duplicate(
								m_deployCompsInfo[i]->getResourcePtr());
				break;
			}
		}
		if (!foundComp) {
			DEBUG(1, ApplicationFactory,
			    "[ApplicationFactory_impl::getProvidesPort]" << "Can't found \
			    component by ComponentInstantiationRef")
			return;
		}

		try {
			provideObj = providComp->getPort(providName.c_str());
		} catch (...) {
			DEBUG(1, ApplicationFactory::getProvidesPort,
			    "providComp->getPort" << " in connection: " << providPort->getID())
		}
		if (!CORBA::is_nil(provideObj)) {
			providesport = provideObj;
		} else {
			DEBUG(1, ApplicationFactory::getProvidesPort, "narrow port failed.")
		}
	} else {
		DEBUG(1, ApplicationFactory::getProvidesPort,
		    "Can't found provides port in connection: " << providPort->getID())

		throw CF::ApplicationFactory::CreateApplicationError();
	}

	DEBUG(3, ApplicationFactory_impl, "leave getProvidesPort.")
}

bool
ApplicationFactory_impl::isMhalDevProvidesPort(
    const std::string & portName) {
	DEBUG(5, ApplicationFactory_impl::isMhalDevProvidesPort, "enter in ...")

	if ((strcmp(portName.c_str(), "MHAL_Device/mhal_srio_data_in") == 0) || 
		(strcmp(portName.c_str(), "MHAL_Device/mhal_eth_data_in") == 0) || 
		(strcmp(portName.c_str(), "MHAL_Device/mhal_axi_data_in") == 0)) {
		DEBUG(5, ApplicationFactory_impl::isMhalDevProvidesPort,
		      " this port is mhal port, leave ...")
		return true;
	} else {
		DEBUG(5, ApplicationFactory_impl::isMhalDevProvidesPort,
		      "this port isn't mhal port, leave ...")
		return false;
	}
}

bool
ApplicationFactory_impl::isMhalDevUsesPort(
    const std::string & portName) {
	DEBUG(5, ApplicationFactory_impl::isMhalDevUsesPort, "enter in ...")

	if ((strcmp(portName.c_str(), "MHAL_Device/mhal_srio_data_out") == 0) || 
		(strcmp(portName.c_str(), "MHAL_Device/mhal_eth_data_out") == 0) || 
		(strcmp(portName.c_str(), "MHAL_Device/mhal_axi_data_out") == 0)) {
		DEBUG(5, ApplicationFactory_impl::isMhalDevUsesPort,
		    " this port is mhal port, leave ...")
		return true;
	} else {
		DEBUG(5, ApplicationFactory_impl::isMhalDevUsesPort,
		    "this port isn't mhal port, leave ...")
		return false;
	}
}

void
ApplicationFactory_impl::getMhalDevProvidesPort(
    CORBA::Object_var & provideObj,
    const Connection * connect,
    const std::string & portNameId) {
	DEBUG(5, ApplicationFactory_impl::getMhalDevProvidesPort, "enter in ...")
	
	UsesPort* usesPort = connect->getUsesPort();
	std::string compId = usesPort->getComponentInstantiationRefID();
	bool foundComp = false;
	std::string assignedDevId = "";
	for(unsigned int i = 0; i < m_deployCompsInfo.size(); ++i)
	{
		if( 0 == strcmp(compId.c_str(), m_deployCompsInfo[i]->getIdentifier()) )
		{
			foundComp = true;
			assignedDevId = m_deployCompsInfo[i]->getAssignedDeviceId();
			break;
		}
	}
	
	if(!foundComp)
	{
		DEBUG(5, ApplicationFactory_impl::getMhalDevProvidesPort,
			"don't find the component, id is: " << compId)
		return;
	}
	
	bool findAssignedDev = false;
	CF::AggregateDevice_var aggrDev = CF::AggregateDevice::_nil();
	
	for(int i = 0; i < m_registeredDevices.size(); ++i)
	{
		if( 0 == strcmp(m_registeredDevices[i]->identifier(), 
						assignedDevId.c_str()) )
		{
			findAssignedDev = true;
			aggrDev = CF::AggregateDevice::_duplicate(
						m_registeredDevices[i]->compositeDevice());
			DEBUG(5, ApplicationFactory_impl::getMhalDevProvidesPort, 
					"parent dev id: " << m_registeredDevices[i]->identifier())
			break;
		}
	}
	
	if((!findAssignedDev) || (CORBA::is_nil(aggrDev)))
		return;

	CF::DeviceSequence_var deviceSeq;
	deviceSeq = aggrDev->devices();

	for(CORBA::ULong i = 0; i < deviceSeq->length(); i++)
	{
		if( 0 == strcmp("MHAL_Device", (*deviceSeq)[i]->label()) )
		{
			provideObj = (*deviceSeq)[i]->getPort(portNameId.c_str());
		}
	}
	
	DEBUG(5, ApplicationFactory_impl::getMhalDevProvidesPort, "leave ...")
}

void
ApplicationFactory_impl::getUsesPort(
    std::string & usesPortName,
    CF::PPort_var & usesPortObj,
    const Connection * connect) {

	DEBUG(3, ApplicationFactory_impl, "In getUsesPort.")

	UsesPort * usesPort = connect->getUsesPort();
	if (usesPort == NULL) {
		DEBUG(3, ApplicationFactory_impl,
		      "while create connection: failed to get uses port.")

		//mask occure exception in VX6.9
		throw CF::ApplicationFactory::CreateApplicationError();
	}

	CF::Resource_var usesPortComp = CF::Resource::_nil();
	CORBA::Object_var obj = CORBA::Object::_nil();

	int count = 0;
	if (usesPort->isFindBy()) {
		usesPortName = usesPort->getFindBy()->getFindByNamingServiceName();
		if (isMhalDevUsesPort(usesPortName)) {
			std::string usesPortNameId = usesPort->getID();
			getMhalDevUsesPort(obj, connect, usesPortName);
			if (!CORBA::is_nil(obj)) {
				usesPortObj = CF::PPort::_narrow(obj);
			} else {
				DEBUG(5, ApplicationFactory_impl::getUsesPort,
					"get uses port failed.")
			}
			return;
		}

		//assume that component findby is 
		//"DomainName1/appname/componentname" in naming service
		std::string compFindbyName = "";
		compFindbyName.append("OpenSCA_Domain/");
		compFindbyName.append(m_appNameWithInstanceNum);
		compFindbyName.append("/");
		compFindbyName.append(usesPortName);

		bool result = 
			getObjectRefFromNamingService(compFindbyName.c_str(), obj);
		if (!result)
			return;

		try {
			usesPortObj = CF::PPort::_narrow(obj);
		} catch (...) {
			DEBUG(1, ApplicationFactory,
			      "[ApplicationFactory_impl::getUsesPort]" << "CF::Resource::_narrow \
			      failed with Unknown Exception.")
			exit(EXIT_FAILURE);
		}

	} else if (usesPort->isComponentInstantiationRef()) {
		std::string compId = usesPort->getComponentInstantiationRefID();
		usesPortName = usesPort->getID();
		bool foundComp = false;
		for (unsigned int i = 0; i < m_deployCompsInfo.size(); i++) {
			if (0 == strcmp(compId.c_str(), 
					m_deployCompsInfo[i]->getIdentifier())) {
				foundComp = true;
				usesPortComp = CF::Resource::_duplicate(
								m_deployCompsInfo[i]->getResourcePtr());
				break;
			}
		}
		if (!foundComp) {
			DEBUG(1, ApplicationFactory::getUsesPort,
			    "Can't found uses port: " << usesPortName << "by ComponentInstantiationRef")
			return;
		}

		try {
			obj = usesPortComp->getPort(usesPortName.c_str());
		} catch (...) {
			DEBUG(1, ApplicationFactory::getUsesPort,
			    "providComp->getPort " << usesPortName)
		}

		if (!CORBA::is_nil(obj)) {
			usesPortObj = CF::PPort::_narrow(obj);
		} else {
			DEBUG(1, ApplicationFactory::getUsesPort, "narrow port failed.")
		}
	} else {
		DEBUG(1, ApplicationFactory::getUsesPort,
		    "Can't found uses port: " << usesPortName)

		throw CF::ApplicationFactory::CreateApplicationError();
	}

	DEBUG(3, ApplicationFactory_impl, "leave getUsesPort.")
}

/**
 * @brief This function used to get MHAL_Device's uses port. Through Connection,
 * 		  can get the aggregate device which component is deployed on, and MHAL_Device will
 * 		  be a child device of the aggregate device.
 */
void
ApplicationFactory_impl::getMhalDevUsesPort(
    CORBA::Object_var & usesObj,
    const Connection * connect,
    const std::string & portNameId) {
	
	DEBUG(5, ApplicationFactory_impl::getMhalDevUsesPort, "enter in ...")
	
	ProvidesPort* providesPort = connect->getProvidesPort();
	std::string compId = providesPort->getComponentInstantiationRefID();
	bool foundComp = false;
	std::string assignedDevId = "";
	CORBA::ULong deployCompsInfoSize = m_deployCompsInfo.size();
	for(unsigned int i = 0; i < deployCompsInfoSize; i++)
	{
		if( 0 == strcmp(compId.c_str(), 
			m_deployCompsInfo[i]->getIdentifier()) )
		{
			foundComp = true;
			assignedDevId = m_deployCompsInfo[i]->getAssignedDeviceId();
		}
	}
	
	if(!foundComp)
		return;
	
	bool findAssignedDev = false;
	CF::AggregateDevice_var aggrDev = CF::AggregateDevice::_nil();
	CORBA::ULong registeredDevSize = m_registeredDevices.size();
	for(int j = 0; j < registeredDevSize; j++)
	{
		if( 0 == strcmp(m_registeredDevices[j]->identifier(), 
					assignedDevId.c_str()) )
		{
			findAssignedDev = true;
			aggrDev = CF::AggregateDevice::_duplicate(
						m_registeredDevices[j]->compositeDevice());
			break;
		}
	}
	
	if((!findAssignedDev) || (CORBA::is_nil(aggrDev)))
		return;
	
	CF::DeviceSequence_var deviceSeq;
	deviceSeq = aggrDev->devices();
	for(CORBA::ULong i = 0; i < deviceSeq->length(); i++)
	{
		if( 0 == strcmp("MHAL_Device", (*deviceSeq)[i]->label()) )
		{
			usesObj = (*deviceSeq)[i]->getPort(portNameId.c_str());

			return;
		}
	}
	
	DEBUG(5, ApplicationFactory_impl::getMhalDevUsesPort, "leave ...")
}

void
ApplicationFactory_impl::getRegisteredDevices() {
	DEBUG(3, ApplicationFactory, "In getRegisteredDevices.")

	CF::DomainManager::DeviceManagerSequence_var devMgrs;
	try {
		devMgrs = m_dmnMgr->deviceManagers();
	} catch (CORBA::SystemException & e) {
		DEBUG(1, ApplicationFactory::getRegisteredDevices,
			"m_dmnMgr->deviceManagers failed with CORBA::SystemException.")
	} catch (...) {
		DEBUG(1, ApplicationFactory::getRegisteredDevices,
			"m_dmnMgr->deviceManagers failed with Unknown Exception.")
		exit(EXIT_FAILURE);
	}

	for (unsigned int numDevMgr = 0; numDevMgr < devMgrs->length();
	        numDevMgr++) {
		CF::DeviceSequence_var devSeq =
		    devMgrs[numDevMgr]->registeredDevices();

		for (unsigned int numDev = 0; numDev < devSeq->length(); numDev++) {
			m_registeredDevices.push_back(
			    CF::Device::_duplicate(devSeq[numDev]));

			DEBUG(5, ApplicationFactory::getRegisteredDevices,
			    "In getRegisteredDevices numDev: " << numDev)
			DEBUG(5, ApplicationFactory::getRegisteredDevices,
			    "In getRegisteredDevices identifier: " << devSeq[numDev]->identifier())
		}
	}

	DEBUG(5, ApplicationFactory, "Leaving getRegisteredDevices.")
}

void
ApplicationFactory_impl::loadAndExecuteComps(
    CF::Application::ComponentProcessIdSequence * pids) {
	DEBUG(3, ApplicationFactory, "In loadAndExecuteComps.")
	DEBUG(3, ApplicationFactory_impl,
	    "m_deployCompsInfo size:" << m_deployCompsInfo.size())

    char openScaPath[64];
    getConfigFilePathFromSHM(openScaPath, sizeof(openScaPath));
  	ConfigParser configParser(openScaPath);
	std::string fsroot = configParser.getValueById(CONSTANT::FSROOT);

	for (unsigned int numComp = 0; numComp < m_deployCompsInfo.size();
	        numComp++) {
		openscaSupport::ComponentInfo * component = m_deployCompsInfo[numComp];

		DEBUG(1, ApplicationFactory_impl,
		    "Component: " << component->getUsageName() << 
		    "Assigned device: " << component->getAssignedDeviceId())

		CF::Device_ptr device;
		try {
			device = find_device_from_id(component->getAssignedDeviceId());
		} catch (...) {
			DEBUG(1, ApplicationFactory::loadAndExecuteComps,
			    "find_device_from_id failed with Unknown Exception")
			throw CF::ApplicationFactory::CreateApplicationError();
		}

		DEBUG(1, ApplicationFactory_impl,
		    "Host is " << device->label () << " Local file name \
		    is: " << component->getLocalFileName())

		// Now we have a pointer to the required device
		// Get allocation properties
		try {
			device->allocateCapacity(component->getAllocationCapacities());
		} catch (...) {
			DEBUG(1, ApplicationFactory::loadAndExecuteComps,
			    "device->allocateCapacity failed with Unknown Exception")
			throw CF::ApplicationFactory::CreateApplicationError();
		}

		// now that capacity has been allocated, need to execute the component.
		// check devices until an executable device has been found, set up
		// the pointer to the device, and then execute. this assumes that
		// only a single GPP is being used.

		/// \TODO Validate that the intended device supports the LoadableDevice interface

		CF::FileManager::MountSequence_var mts;
		try {
			mts = m_fileMgr->getMounts();
		} catch (...) {
			DEBUG(1, ApplicationFactory,
				"[ApplicationFactory::loadAndExecuteComponents] \
				fileMgr->getMounts failed with Unknown Exception")
			throw CF::ApplicationFactory::CreateApplicationError();
		}
		
		std::string compLocalFile = component->getLocalFileName();
		DEBUG(1, ApplicationFactory_impl, "loading " << compLocalFile)

		unsigned int mtsIdx = getFileSystemIndex(mts, compLocalFile.c_str());
		if (-1 == mtsIdx)
			return;

		std::string binaryFileName = component->getLocalFileName();
		CF::LoadableDevice::LoadType loadType = component->getCodeType();
		
		bool result = loadComponentCodeFile(mts[mtsIdx].fs, device, 
					binaryFileName.c_str(), loadType);
		if (!result)
			return;

		DEBUG(7, ApplicationFactory,
		      "In loadAndExecuteComponents will call excute")
		// Execute when necessary
		if ((loadType == CF::LoadableDevice::EXECUTABLE) || 
			(loadType == CF::LoadableDevice::SHARED_LIBRARY) &&
			(0 != strcmp(component->getEntryPoint(), ""))) {
			/// \TODO: Validate that the intended device supports 
			/// the LoadableDevice interface

			DEBUG(1, ApplicationFactory_impl, "executing: " << binaryFileName)

			//parse options such as stack size / priority / entry point
			CF::Properties options;
			getComponentExecOptions(component, options);

			//parse input parameters such as -APP_NAME / -ID / -DEBUG / -LABEL
			CF::Properties parameters;
			getComponentExecParameters(component, parameters, fsroot.c_str());

			CF::ExecutableDevice::ProcessID_Type tempPid;
			tempPid = executeComponentProcess(device, binaryFileName.c_str(), options, parameters);

			if (tempPid < 0) {
				DEBUG(1, ApplicationFactory::loadAndExecuteComps,
					"tempPid is less than zero.")
				throw CF::ApplicationFactory::CreateApplicationError();
			} else {
				pids->length(pids->length() + 1);
				(*pids)[pids->length() - 1].processId = tempPid;
				(*pids)[pids->length() - 1].componentId = CORBA::string_dup(
					component->getIdentifier());
			}
		}
	}//for (unsigned int numComp=0; numComp<m_deployCompsInfo.size (); numComp++)
}

unsigned int 
ApplicationFactory_impl::getFileSystemIndex(
	CF::FileManager::MountSequence_var mts,
	const char * fileName)
{
	unsigned int index = -1;

	for (unsigned int i = 0; i < mts->length(); i++) {
		try {
			if (mts[i].fs->exists(fileName))
				index = i;
				break;
		} catch (CF::InvalidFileName & _ex) {
			DEBUG(1, ApplicationFactory::getFileSystemIndex,
				"when searching for FileSys \
				containing " << fileName << " occure \
				InvalidFileName exception")
		} catch (CF::FileException & _ex) {
			DEBUG(1, ApplicationFactory::getFileSystemIndex,
				"Searching for FileSys \
				containing " << fileName << " occure \
				FileExcetpion")
		} catch (...) {
			DEBUG(1, ApplicationFactory::getFileSystemIndex,
				"Searching for FileSys \
				containing" << fileName << " Unknown Exception")
		}
	}

	return index;
}

bool 
ApplicationFactory_impl::loadComponentCodeFile(
	CF::FileSystem_ptr fs,
	CF::Device_ptr device,
	const char * binaryFileName,
	CF::LoadableDevice::LoadType loadType)
{
	CF::LoadableDevice_var loadabledev;
	try {
		loadabledev = CF::LoadableDevice::_narrow(device);
	} catch (...) {
		DEBUG(1, ApplicationFactory::loadComponentCodeFile,
			"CF::LoadableDevice::_narrow failed with Unknown Exception")
		return false;
	}

	if (CORBA::is_nil(loadabledev)) {
		DEBUG(1, ApplicationFactory::loadComponentCodeFile,
			"loadabledev is nil.")
		return false;
	}

	try {
		loadabledev->load(fs, binaryFileName, loadType);
	} catch (CF::InvalidFileName & _ex) {
		DEBUG(1, ApplicationFactory::loadComponentCodeFile,
			"While loading binaryfile with exception: " << _ex.msg)
		return false;
	} catch (CF::Device::InvalidState & _ex) {
		DEBUG(1, ApplicationFactory::loadComponentCodeFile,
			"While loading binaryfile with exception: " << _ex.msg)
		return false;
	} catch (...) {
		DEBUG(1, ApplicationFactory::loadComponentCodeFile,
			"While loading binaryfile with  Unknown Exception")
		return false;
	}

	return true;
}

void 
ApplicationFactory_impl::getComponentExecOptions(
	openscaSupport::ComponentInfo * component,
	CF::Properties & options)
{
	options.length(3);

	CF::DataType stkSizeDt;
	stkSizeDt.id = CORBA::string_dup("STACK_SIZE_ID");
	CORBA::ULong stkSize = component->getStackSize();
	stkSizeDt.value <<= stkSize;
	options[0] = stkSizeDt;
	DEBUG(1, ApplicationFactory_impl::getComponentExecOptions,
		"In loadAndExecuteComp stack size: " << stkSize)

	CF::DataType prioDt;
	prioDt.id = CORBA::string_dup("PRIORITY_ID");
	CORBA::ULong prio = component->getPriority();
	prioDt.value <<= prio;
	options[1] = prioDt;
	DEBUG(1, ApplicationFactory_impl::getComponentExecOptions,
		"In loadAndExecuteComp priority: " << prio)

	CF::DataType entryPointDt;
	entryPointDt.id = CORBA::string_dup("ENTRY_POINT");
	std::string entryPoint = component->getEntryPoint();
	entryPointDt.value <<= entryPoint.c_str();
	options[2] = entryPointDt;
	DEBUG(1, ApplicationFactory_impl::getComponentExecOptions,
		"In loadAndExecuteComp netry_point: " << entryPoint)
}

void
ApplicationFactory_impl::getComponentExecParameters(
	openscaSupport::ComponentInfo * component,
	CF::Properties & parameters,
	const char * fsroot)
{
	parameters.length(6);

	CF::DataType appNameDt;
	appNameDt.id = CORBA::string_dup("-APP_NAME");
	appNameDt.value <<= m_appNameWithInstanceNum.c_str();
	parameters[0] = appNameDt;

	CF::DataType debugDt;
	debugDt.id = CORBA::string_dup("-DEBUG");
	debugDt.value <<= "8";
	parameters[1] = debugDt;

	CF::DataType idDt;
	idDt.id = CORBA::string_dup("-ID");
	idDt.value <<= component->getIdentifier();
	parameters[2] = idDt;
	DEBUG(1, ApplicationFactory_impl::getComponentExecParameters,
		"In loadAndExecuteComp comp id: " << component->getIdentifier())

	CF::DataType cosNamingDt;
	cosNamingDt.id = CORBA::string_dup("-COS_NAMING");
	cosNamingDt.value <<= component->getNamingServiceName();
	parameters[3] = cosNamingDt;
	DEBUG(1, ApplicationFactory_impl::getComponentExecParameters,
		"In loadAndExecuteComp comp name: " << component->getNamingServiceName())

	CF::DataType spdFileDt;
	spdFileDt.id = CORBA::string_dup("-SFTFL");
	spdFileDt.value <<= component->getImplSPDFile();
	parameters[4] = spdFileDt;

	//ConfigParser configParser("opensca.conf");
	//std::string fsroot = configParser.getValueById(CONSTANT::FSROOT);
	CF::DataType fsrootDt;
	fsrootDt.id = CORBA::string_dup("-FSROOT");
	fsrootDt.value <<= fsroot;
	parameters[5] = fsrootDt;
}

CF::ExecutableDevice::ProcessID_Type
ApplicationFactory_impl::executeComponentProcess(
	CF::Device_ptr device,
	const char * binaryFileName,
	const CF::Properties & options,
	const CF::Properties & parameters)
{
	CF::ExecutableDevice::ProcessID_Type pid = -1;
	CF::ExecutableDevice_var execdev;
	try {
		execdev = CF::ExecutableDevice::_narrow(device);
	} catch (...) {
		DEBUG(1, ApplicationFactory,
			"[ApplicationFactory::loadAndExecuteComponents] \
			CF::ExecutableDevice::_narrow failed with Unknown Exception")
		return pid;
	}

	if (CORBA::is_nil(execdev)) {
		DEBUG(7, ApplicationFactory_impl,
			"component is assigned to device that is only Loadable")
		return pid;
	}

	try {
		pid = execdev->execute(binaryFileName, options, parameters);
	} catch (CF::InvalidFileName & _ex) {
		DEBUG(1, ApplicationFactory,
			"[ApplicationFactory::create] CF::InvalidFileName when calling \
			'execute' on a device: " << _ex.msg)
		return pid;
	} catch (CF::Device::InvalidState & _ex) {
		DEBUG(1, ApplicationFactory,
			"[ApplicationFactory::create] CF::InvalidState when \
			calling 'execute' on a device: " << _ex.msg)
		return pid;
	} catch (...) {
		DEBUG(1, ApplicationFactory,
			"[ApplicationFactory::create] Unknown Exception when \
			calling 'execute' on a device: Unknown Exception")
		return pid;
	}

	return pid;
	// NOTE: The PID returned by execute is not handled
	// An exception shall be thrown when PID = -1
}

CF::Device_ptr
ApplicationFactory_impl::find_device_from_id(
    const char * deviceId) {
	DEBUG(5, ApplicationFactory_impl::find_device_from_id, "enter in ...")

	for (unsigned int i = 0; i < m_registeredDevices.size(); i++) {
		if (strcmp(m_registeredDevices[i]->identifier(), deviceId) == 0) {
			DEBUG(5, ApplicationFactory_impl::find_device_from_id,
			      "leaving ...")
			// NOTE: This is DANGEROUS!!
			return CF::Device::_duplicate(m_registeredDevices[i]); 
		}
	}

	std::cerr << "Device not found, this should never happen." << std::endl;
	exit(EXIT_FAILURE);
}

void 
ApplicationFactory_impl::lock()
{
#ifdef __SDS_OS_VXWORKS__
	semTake(semAppsMutex, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
	sds_lock(BOOST_CONSTANT::APP_MUTEX_CND);
#endif
}

void
ApplicationFactory_impl::unlock()
{
#ifdef __SDS_OS_VXWORKS__
	semGive(semAppsMutex);
#elif defined __SDS_OS_LINUX__
	sds_unlock(BOOST_CONSTANT::APP_MUTEX_CND);
#endif
}
