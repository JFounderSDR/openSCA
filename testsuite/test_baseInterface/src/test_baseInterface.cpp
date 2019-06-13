/***************************************************************************//**
* @file     test_baseInterface.cpp
* @author   open Team
* @version  9
* @date     2019-05-22
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

#include "../include/test_baseInterface.h"

using namespace OpenSCATest;

BaseTest::BaseTest()
{
	m_namingServiceIorStr = "";
	m_orbVar = CORBA::ORB::_nil();
	m_poa = PortableServer::POA::_nil();
	m_poaManager = PortableServer::POAManager::_nil();
	m_namingContextVar = CosNaming::NamingContext::_nil();
	m_domainMgr = CF::DomainManager::_nil();
	m_deviceMgr = CF::DeviceManager::_nil();
	m_usePort = NULL;
	m_providePort = NULL;
}

BaseTest::~BaseTest()
{
	if(NULL != m_usePort){
		delete m_usePort;
	}
	
	if(NULL != m_providePort){
		delete m_providePort;
	}
}

/**
 * @brief The operation used for initialize orb, must be invoked before  
 * 		  connect with the target platform.
 *
 * @param[in] ip
 * @param[in] port
 */
void
BaseTest::initializeORB(
	const std::string ip,
	int port)
{
	TESTDEBUG(8, [test_baseInterface::initializeORB], " enter...")

	m_namingServiceIorStr = "NameService=corbaloc:iiop:";
	m_namingServiceIorStr += ip;
	m_namingServiceIorStr += ":";
	m_namingServiceIorStr += std::to_string(port);
	m_namingServiceIorStr += "/NameService";
	TESTDEBUG(5, [test_baseInterface::initializeORB],
		" m_namingServiceIorStr is " << m_namingServiceIorStr)

	int argc = 5;
	char** argv = new char * [5];
	argv[0] = "ace_main";
	argv[1] = "-ORBInitRef";
	argv[2] = (char *)m_namingServiceIorStr.c_str();
	argv[3] = "-ORBListenEndpoints";
	argv[4] = "iiop://:";

	try {
		m_orbVar = CORBA::ORB_init(argc, argv);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::initializeORB],
			" occure CORBA::SystemException when initialize ORB.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::initializeORB],
			" occure CORBA::Exception when initialize ORB.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::initializeORB],
			" occure unknown Exception when initialize ORB.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::initializeORB], " leave...")
}

/**
 * @brief The operation used for get naming service.Getting domain manager
 * 		  needs naming service support.
 */
void
BaseTest::getNamingService()
{
	TESTDEBUG(8, [test_baseInterface::getNamingService], " enter...")

	getPoa();
	getPoaManager();

	// resolve naming service context
	try {
		size_t pos = m_namingServiceIorStr.find("=");
		std::string objName = m_namingServiceIorStr.substr(pos + 1);
		TESTDEBUG(5, [test_baseInterface::getNamingService], "objName:" << objName)

		CORBA::Object_var objectVar = m_orbVar->string_to_object(objName.c_str());
		m_namingContextVar = CosNaming::NamingContext::_narrow(objectVar.in());

		TESTDEBUG(5, [test_baseInterface::getNamingService], "bine new context success.")
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getNamingService],
			" occure CORBA::SystemException when get namingService.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getNamingService],
			" occure CORBA::Exception when get namingService.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getNamingService],
			" occure unknown Exception when get namingService.")
		return;
	}

	if(CORBA::is_nil(m_namingContextVar)) {
		TESTDEBUG(0, [test_baseInterface::getNamingService],
			" m_namingContextVar is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getNamingService], " leave...")
}

void 
BaseTest::getPoa()
{
	TESTDEBUG(8, [test_baseInterface::getPoa], " enter...")

	try {
		CORBA::Object_var rootPoa =
			m_orbVar->resolve_initial_references("RootPOA");
		m_poa = PortableServer::POA::_narrow(rootPoa.in());

		TESTDEBUG(5, [test_baseInterface::getPoa], " resolve poa ok.")
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getPoa],
			" occure CORBA::SystemException when get poa.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getPoa],
			" occure CORBA::Exception when get poa.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getPoa],
			" occure unknown Exception when get poa.")
		return;
	}

	if(CORBA::is_nil(m_poa)) {
		TESTDEBUG(0, [test_baseInterface::getPoa], " m_poa is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getPoa], " leave...")
}

void 
BaseTest::getPoaManager()
{
	TESTDEBUG(8, [test_baseInterface::getPoaManager], " enter...")

	// resolve poa manager and activate poa.
	PortableServer::POAManager_var poaManager;
	try {
		m_poaManager = m_poa->the_POAManager();

		if(CORBA::is_nil(m_poaManager)) {
			TESTDEBUG(0, [test_baseInterface::getPoaManager],
				" m_poaManager is nil.")
			return;
		}

		m_poaManager->activate();
		TESTDEBUG(5, [test_baseInterface::getPoaManager],
			" m_poaManager->activate is ok.")
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getPoaManager],
			" occure CORBA::SystemException when m_poaManager->activate().")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getPoaManager],
			" occure CORBA::Exception when m_poaManager->activate().")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getPoaManager],
			" occure unknown Exception when m_poaManager->activate().")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getPoaManager], " leave...")
}

void
BaseTest::getDomainManager()
{
	TESTDEBUG(8, [test_baseInterface::getDomainManager], " enter...")
	CORBA::Object_var objVar;
	try {
		// getting domainManager objects from namingServices.
		objVar = get_object_from_string(m_namingContextVar.in(), 
			"OpenSCA_Domain/Domain_Manager");
		m_domainMgr = CF::DomainManager::_narrow(objVar.in());
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getDomainManager],
			" occure CORBA::SystemException when get domainMgr.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getDomainManager],
			" occure CORBA::Exception when get domainMgr.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getDomainManager],
			" occure unknown Exception when get domainMgr.")
		return;
	}

	if (CORBA::is_nil(m_domainMgr)) {
		TESTDEBUG(0, [test_baseInterface::connectPlatform], 
			" domainMgr is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getDomainManager], " leave...")
}

void
BaseTest::getDeviceManager()
{
	TESTDEBUG(8, [test_baseInterface::getDeviceManager], " enter...")

	if(CORBA::is_nil(m_domainMgr)){
		TESTDEBUG(0, [test_baseInterface::getDeviceManager],
			" m_domainMgr is nil.")
		return;
	}

	CF::DomainManager::DeviceManagerSequence_var deviceMgrSeq;
	try{
		deviceMgrSeq = m_domainMgr->deviceManagers();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getDeviceManager],
			" occure CORBA::SystemException when get deviceMgrSeq.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getDeviceManager],
			" occure CORBA::Exception when get deviceMgrSeq.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getDeviceManager],
			" occure unknown Exception when get deviceMgrSeq.")
		return;
	}

	if(CORBA::is_nil(deviceMgrSeq)){
		TESTDEBUG(0, [test_baseInterface::getDeviceManager],
			" deviceMgrSeq is nil.")
		return;
	}

	CORBA::Short length = deviceMgrSeq->length();
	for(CORBA::Short i=0; i<length; ++i){
		if(0 == strcmp((*deviceMgrSeq)[i]->identifier(), DEVICE_MANAGER_ID)){
			m_deviceMgr = CF::DeviceManager::_duplicate((*deviceMgrSeq)[i].in());
		}
	}

	if(CORBA::is_nil(m_deviceMgr)){
		TESTDEBUG(0, [test_baseInterface::getDeviceManager],
			" m_deviceMgr is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getDeviceManager], "leave...")
}

/**
 * @brief The operation shall return object ref by string from 
 *        specified naming context.
 *
 * @param[in] nameContextPtr	Naming context on which the object bind.
 * @param[in] name	Name of the object context.
 *
 * @return Object reference bound with specific name. 
 */
CORBA::Object_ptr
BaseTest::get_object_from_string(
    const CosNaming::NamingContext_ptr nameContextPtr,
    const char * name) {
	TESTDEBUG(8, [test_baseInterface::get_object_from_string], " enter...")
	TESTDEBUG(5, [test_baseInterface::get_object_from_string], " name:" << name)

	CosNaming::Name_var cosName = string_to_CosName(name);
	CORBA::Object_var object = CORBA::Object::_nil();

	try {
		//resolve object by cos name from naming context
		object = nameContextPtr->resolve(cosName.in());
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::get_object_from_string],
			" occure CORBA::SystemException when nameContextPtr->resolve.")
		printCORBASystemException(e);
		return NULL;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::get_object_from_string],
			" occure CORBA::Exception when nameContextPtr->resolve.")
		printCORBAException(e);
		return NULL;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::get_object_from_string],
			" occure unknown Exception when nameContextPtr->resolve.")
		return NULL;
	}

	if(CORBA::is_nil(object)){
		TESTDEBUG(0, [test_baseInterface::get_object_from_string],
			" object is nil.")
		return NULL;
	}

	TESTDEBUG(8, [test_baseInterface::get_object_from_string], " leave...")
	return  object._retn();
}

/**
 * @brief The operation shall convert string to CosNaming::Name.
 *
 * @param[in] name	String to be transformed .
 *
 * @return get CosNaming::Name. 
 */
CosNaming::Name_var
BaseTest::string_to_CosName(
    const char * name) {
	TESTDEBUG(8, [test_baseInterface::string_to_CosName], " enter...")
	TESTDEBUG(5, [test_baseInterface::string_to_CosName], " name:" << name)

	CosNaming::Name_var cosName = new CosNaming::Name(10);
	//split input parameter naming path to mutli name
	size_t pos = 0;
	std::string fullName(name);
	unsigned int nameLength = 0;
	std::string tempName;
	do {
		pos = fullName.find_first_of( "/" );
		if (pos != std::string::npos) {
			tempName = fullName.substr(0, pos);
			fullName = fullName.substr(pos + 1);
			nameLength++;
			cosName->length(nameLength);
			(*cosName)[nameLength - 1].id = 
				CORBA::string_dup(tempName.c_str());

			TESTDEBUG(5, [test_baseInterface::string_to_CosName],
				"In string_to_CosName tempName is: " << tempName)
			TESTDEBUG(5, [test_baseInterface::string_to_CosName],
				"In string_to_CosName fullName is: " << fullName)
		} else {
			tempName = fullName;

			nameLength++;
			cosName->length(nameLength);
			(*cosName)[nameLength - 1].id = 
				CORBA::string_dup(tempName.c_str());

			TESTDEBUG(5, [test_baseInterface::string_to_CosName],
				" tempName:" << tempName)
		}
	} while (pos != std::string::npos);

	TESTDEBUG(8, [test_baseInterface::string_to_CosName], " leave...")
	return  cosName._retn();
}

/**
 * @brief The operation used for install new application software 
 * 		  in the domain.
 *
 * @param[in] appName   name of application.
 */
void
BaseTest::installApplication(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::installApplication], " enter...")

	if(CORBA::is_nil(m_domainMgr)){
		TESTDEBUG(0, [test_baseInterface::installApplication],
			"domainMgr is nil.")
		return;
	}

	CF::DomainManager::ApplicationFactorySequence_var appFactorys;
	appFactorys = m_domainMgr->applicationFactories();
	if(CORBA::is_nil(appFactorys)){
		TESTDEBUG(0, [test_baseInterface::installApplication],
			"appFactorys is nil.")
		return;
	}

	std::string profileFileName = PLATFORM_PACKAGE_NAME;
	profileFileName += "/Applications/";
	profileFileName += appName;
	profileFileName += "/";
	profileFileName += appName;
	profileFileName += SAD_XML_SUFFIX;
	TESTDEBUG(5, [test_baseInterface::installApplication],
		" profileFileName:" << profileFileName)

	try {
		bool existAppFact = false;
		CORBA::Short length = appFactorys->length();
		for(CORBA::Short i=0; i<length; ++i){
			CORBA::String_var factName = CORBA::string_dup((*appFactorys)[i]->name());
			TESTDEBUG(5, [test_baseInterface::installApplication],
				" factName:" << factName)

			if(0 == strcmp(factName.in(), appName.c_str())){
				existAppFact = true;
				break;
			}
		}
		if(!existAppFact){
			// create the context of the application in the domain manager.
			m_domainMgr->installApplication(profileFileName.c_str());
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::installApplication],
			" occure CORBA::SystemException when install application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::installApplication],
			" occure CORBA::Exception when install application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::installApplication],
			" occure unknown Exception when install application.")
		return;
	}

	createApplication(appName);

	TESTDEBUG(8, [test_baseInterface::installApplication], " leave...")
}

/**
 * @brief The operation used for create new application instance.
 * 		  
 * @param[in] appName   name of application.
 */
void
BaseTest::createApplication(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::createApplication], " enter...")

	CF::DomainManager::ApplicationFactorySequence_var appFactorys;
	CF::Properties initConfig;
	CF::DeviceAssignmentSequence devAssignment;
	try {
		appFactorys = m_domainMgr->applicationFactories();
		if(CORBA::is_nil(appFactorys)){
			TESTDEBUG(0, [test_baseInterface::createApplication],
				"appFactorys is nil.")
			return;
		}

		CORBA::Short length = appFactorys->length();
		for(CORBA::Short i=0; i<length; ++i){
			CORBA::String_var factName = CORBA::string_dup((*appFactorys)[i]->name());
			TESTDEBUG(5, [test_baseInterface::createApplication],
				" factName:" << factName)

			if(0 == strcmp(factName.in(), appName.c_str())){
				(*appFactorys)[i]->create(appName.c_str(), initConfig, devAssignment);
				break;
			}
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::createApplication],
			" occure CORBA::SystemException when create application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::createApplication],
			" occure CORBA::Exception when create application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::createApplication],
			" occure unknown Exception when create application.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::createApplication], " leave...")
}


/**
 * @brief The operation used for uninstall application software
 * 		  in the domain.
 *
 * @param[in] appName   name of application.
 */
void
BaseTest::uninstallApplication(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::uninstallApplication], " enter...")

	if(CORBA::is_nil(m_domainMgr)){
		TESTDEBUG(0, [test_baseInterface::uninstallApplication],
			" m_domainMgr is nil.")
		return;
	}

	releaseApplication(appName);

	CF::DomainManager::ApplicationFactorySequence_var appFactorys;
	appFactorys = m_domainMgr->applicationFactories();
	if(CORBA::is_nil(appFactorys)){
		TESTDEBUG(0, [test_baseInterface::uninstallApplication],
			"appFactorys is nil.")
		return;
	}

	try {
		CORBA::Short length = appFactorys->length();
		for(CORBA::Short i=0; i<length; ++i){
			CORBA::String_var factName = CORBA::string_dup((*appFactorys)[i]->name());
			TESTDEBUG(5, [test_baseInterface::uninstallApplication],
				" factName:" << factName)

			if(0 == strcmp(factName.in(), appName.c_str())){
				m_domainMgr->uninstallApplication(appName.c_str());
				break;
			}
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::uninstallApplication],
			" occure CORBA::SystemException when uninstall application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::uninstallApplication],
			" occure CORBA::Exception when uninstall application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::uninstallApplication],
			" occure unknown Exception when uninstall application.")
		return;
	}

	TESTDEBUG(0, [test_baseInterface::uninstallApplication], " uninstallApplication success...")
}

/**
 * @brief The operation used for release application resources.
 *
 * @param[in] appName   name of application.
 */
void
BaseTest::releaseApplication(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::releaseApplication], " enter...")

	CF::DomainManager::ApplicationSequence_var apps;
	try {
		apps = m_domainMgr->applications();
		if(CORBA::is_nil(apps)){
			TESTDEBUG(0, [test_baseInterface::releaseApplication],
				" apps is nil.")
			return;
		}

		CORBA::Short length = apps->length();
		for(CORBA::Short i=0; i<length; ++i){
			CORBA::String_var uninstallApp =
				CORBA::string_dup((*apps)[i]->name());
			if(0 == strcmp(uninstallApp.in(), appName.c_str())){
				(*apps)[i]->releaseObject();
			}
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::releaseApplication],
			" occure CORBA::SystemException when release application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::releaseApplication],
			" occure CORBA::Exception when release application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::releaseApplication],
			" occure unknown Exception when release application.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::releaseApplication], " leave...")
}

/**
 * @brief The operation used for create the connection with the application
 *		  ports, initialize Uses port and Provides port.
 *
 * @param[in] appName     name of application.
 * @param[in] portNames   name of ports.
 */
void
BaseTest::connectApplication(
	const std::string appName,
	const std::vector<std::string> portNames)
{
	TESTDEBUG(8, [test_baseInterface::connectApplication], " enter...")

	if(portNames.size() < 2){
		TESTDEBUG(0, [test_baseInterface::connectApplication],
			" port size less than two.")
		return;
	}

	initializeUsePort();
	initializeProvidePort();

	CF::Application_var app = getAppByName(appName);
	if(CORBA::is_nil(app)){
		TESTDEBUG(0, [test_baseInterface::connectApplication],
			" app is nil.")
		return;
	}

	std::string usePort = appName + "/" + portNames[0];
	std::string providePort = appName + "/" + portNames[1];

	TESTDEBUG(5, [test_baseInterface::connectApplication],
		" usePort:" << usePort)
	TESTDEBUG(5, [test_baseInterface::connectApplication],
		" providePort:" << providePort)

	connectApplicationPorts(app, usePort, providePort);

	TESTDEBUG(8, [test_baseInterface::connectApplication], " leave...")
}

void
BaseTest::initializeUsePort()
{
	TESTDEBUG(8, [test_baseInterface::initializeUsePort], " enter...")

	if(m_usePort == NULL){
		m_usePort = new CWave_Use_port_i();
	}

	CORBA::Object_var object = m_usePort->_this();

	if(CORBA::is_nil(object)){
		TESTDEBUG(0, [test_baseInterface::initializeUsePort],
			" object is nil.")
		return;
	} else {
		m_use_port_v = CF::PPort::_narrow(object.in());

		if(CORBA::is_nil(m_use_port_v)){
			TESTDEBUG(0, [test_baseInterface::initializeUsePort],
				" m_use_port_v is nil.")
			return;
		}
	}

	TESTDEBUG(8, [test_baseInterface::initializeUsePort], " leave...")
}

void
BaseTest::initializeProvidePort()
{
	TESTDEBUG(8, [test_baseInterface::initializeProvidePort], " enter...")

	if(m_providePort == NULL){
		m_providePort = new CWave_Provide_port_i();
	}

	PortableServer::ObjectId_var waveProvidePort =
		PortableServer::string_to_ObjectId("wave_consumer_port");

	CORBA::Object_var object;
	try {
		m_poa->activate_object_with_id(waveProvidePort.in(), m_providePort);
		object = m_poa->servant_to_reference(m_providePort);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::initializeProvidePort],
			" occure CORBA::SystemException when activate_object_with_id.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::initializeProvidePort],
			" occure CORBA::Exception when activate_object_with_id.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::initializeProvidePort],
			" occure unknown Exception when activate_object_with_id.")
		return;
	}

	if(CORBA::is_nil(object)){
		TESTDEBUG(0, [test_baseInterface::initializeProvidePort],
			" object is nil.")
		return;
	}

	m_provide_port_v =
		StandardInterfaces::RealOctet::_narrow(object.in());
	if(CORBA::is_nil(m_provide_port_v)){
		TESTDEBUG(0, [test_baseInterface::initializeProvidePort],
			" m_providePort is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::initializeProvidePort], " leave...")
}

/*
 * @brief get all the applications in the domain manager.
 */
void
BaseTest::getAllApplications()
{
	TESTDEBUG(8, [test_baseInterface::getAllApplication], " enter...")

	if(CORBA::is_nil(m_domainMgr)){
		TESTDEBUG(0, [test_baseInterface::getAllApplication],
			" m_domainMgr is nil.")
		return;
	}

	try{
		m_appSeq = m_domainMgr->applications();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getAllApplications],
			" occure CORBA::SystemException when get applicationSequence.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getAllApplications],
			" occure CORBA::Exception when get applicationSequence.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getAllApplications],
			" occure unknown Exception when get applicationSequence.")
		return;
	}

	if(CORBA::is_nil(m_appSeq)){
		TESTDEBUG(0, [test_baseInterface::getAllApplication],
			" m_appSeq is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getAllApplication], " leave...")
}

/*
 * @brief get all the devices in the device manager.
 */
void
BaseTest::getAllDevices()
{
	TESTDEBUG(8, [test_baseInterface::getAllDevices], " enter...")

	if(CORBA::is_nil(m_deviceMgr)){
		TESTDEBUG(0, [test_baseInterface::getAllDevices],
			" m_deviceMgr is nil.")
		return;
	}

	try {
		m_devSeq = m_deviceMgr->registeredDevices();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getAllDevices],
			" occure CORBA::SystemException when get deviceSequence.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getAllDevices],
			" occure CORBA::Exception when get deviceSequence.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getAllDevices],
			" occure unknown Exception when get deviceSequence.")
		return;
	}

	if(CORBA::is_nil(m_devSeq)){
		TESTDEBUG(0, [test_baseInterface::getAllDevices],
			" deviceSeq is nil.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::getAllDevices], " leave...")
}

/*
 * @brief The operation used for obtain the application 
 * 		  instance by application name.
 *
 * @param[in] appName   name of application.
 * 
 * @return the application instance.
 */
CF::Application_ptr
BaseTest::getAppByName(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::getAppByName], " enter...")

	CF::Application_var appVar;

	if(CORBA::is_nil(m_appSeq)){
		TESTDEBUG(0, [test_baseInterface::getAppByName],
			" m_appSeq is nil.")
		return NULL;
	}

	try {
		CORBA::Short length = m_appSeq->length();
		for(CORBA::Short i=0; i<length; ++i){
			CORBA::String_var object =
				CORBA::string_dup((*m_appSeq)[i]->name());
			if(0 == strcmp(appName.c_str(), object)) {
				appVar =
					CF::Application::_duplicate((*m_appSeq)[i].in());
			}
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getAppByName],
			" occure CORBA::SystemException when get application.")
		printCORBASystemException(e);
		return NULL;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getAppByName],
			" occure CORBA::Exception when get application.")
		printCORBAException(e);
		return NULL;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getAppByName],
			" occure unknown Exception when get application.")
		return NULL;
	}

	if(CORBA::is_nil(appVar)) {
		TESTDEBUG(0, [test_baseInterface::getAppByName],
			" appVar is nil.")
		return NULL;
	}

	TESTDEBUG(8, [test_baseInterface::getAppByName], " leave...")
	return appVar._retn();
}

/*
 * @brief The operation used for obtain the device instance
 *		  by device name.
 *
 * @param[in] devName   name of device.
 * 
 * @return the device instance.
 */
CF::Device_var
BaseTest::getDevByName(
	const std::string devName)
{
	TESTDEBUG(8, [test_baseInterface::getDevByName], " enter...")

	CF::Device_var devVar;

	if(CORBA::is_nil(m_devSeq)){
		TESTDEBUG(0, [test_baseInterface::getDevByName],
			" m_devSeq is nil.")
		return NULL;
	}
	try {
		CORBA::Short length = m_devSeq->length();
		for(CORBA::Short i=0; i<length; ++i){
			CORBA::String_var object =
				CORBA::string_dup((*m_devSeq)[i]->label());
			if(0 == strcmp(devName.c_str(), object)) {
				devVar =
					CF::Device::_duplicate((*m_devSeq)[i].in());
			}
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getDevByName],
			" occure CORBA::SystemException when get device.")
		printCORBASystemException(e);
		return NULL;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getDevByName],
			" occure CORBA::Exception when get device.")
		printCORBAException(e);
		return NULL;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getDevByName],
			" occure unknown Exception when get device.")
		return NULL;
	}

	if(CORBA::is_nil(devVar)) {
		TESTDEBUG(0, [test_baseInterface::getDevByName],
			" devVar is nil.")
		return NULL;
	}

	TESTDEBUG(8, [test_baseInterface::getDevByName], " leave...")
	return devVar._retn();
}

void
BaseTest::connectApplicationPorts(
	CF::Application_ptr appPtr,
	const std::string usePort,
	const std::string providePort)
{
	TESTDEBUG(8, [test_baseInterface::connectApplicationPorts], " enter...")

	CF::Application_var app = CF::Application::_duplicate(appPtr);

	try{
		CORBA::Object_var usePortObject = app->getPort(usePort.c_str());
		if(CORBA::is_nil(usePortObject)){
			TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
				" usePortObject is nil.")
			return;
		}

		m_targetPort = CF::PPort::_narrow(usePortObject.in());
		if(CORBA::is_nil(m_targetPort)){
			TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
				" m_targetPort is nil.")
			return;
		}

		// U Port Connects External P Port
		m_targetPort->connectPort(m_provide_port_v.in(), "wave_consumer_port");

		CORBA::Object_var providePortObject = app->getPort(providePort.c_str());
		if(CORBA::is_nil(providePortObject)){
			TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
				" providePortObject is nil.")
			return;
		}

		if(NULL == m_usePort){
			TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
				" m_usePort is NULL.")
			return;
		}

		// P Port Connects External U Port
		m_usePort->connectPort(providePortObject.in(), "wave_consumer_port");

	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
			" occure CORBA::SystemException when connect application ports.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
			" occure CORBA::Exception when connect application ports.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::connectApplicationPorts],
			" occure unknown Exception when connect application ports.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::connectApplicationPorts], " leave...")
}


/**
 * @brief The operation used for disconnect application.
 */
bool
BaseTest::disconnectApplication()
{
	TESTDEBUG(8, [test_baseInterface::disconnectApplication], " enter...")

	if(CORBA::is_nil(m_targetPort)){
		TESTDEBUG(0, [test_baseInterface::disconnectApplication],
			" m_targetPort is nil.")
		return false;
	}

	m_targetPort->disconnectPort("wave_consumer_port");

	TESTDEBUG(8, [test_baseInterface::disconnectApplication], " leave...")

	return true;
}

/**
 * @brief The operation used for start application. Open the 
 *	      sending and receiving threads.
 *
 * @param[in] appName     name of application.
 */
void
BaseTest::startApplication(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::startApplication], " enter...")

	CF::Application_var app = getAppByName(appName);
	if(CORBA::is_nil(app)){
		TESTDEBUG(0, [test_baseInterface::startApplication],
			" app is nil.")
		return;
	}

	try{
		app->start();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::startApplication],
			" occure CORBA::SystemException when start application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::startApplication],
			" occure CORBA::Exception when start application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::startApplication],
			" occure unknown Exception when start application.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::startApplication], " leave...")
}

/**
 * @brief The operation used for stop application. Destroy the 
 *	      sending and receiving data threads.
 *
 * @param[in] appName     name of application.
 */
void
BaseTest::stopApplication(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::stopApplication], " enter...")

	CF::Application_var app = getAppByName(appName);
	if(CORBA::is_nil(app)){
		TESTDEBUG(0, [test_baseInterface::stopApplication],
			" app is nil.")
		return;
	}

	if(app->_non_existent()){
		TESTDEBUG(5, [test_baseInterface::stopApplication],
			" app is not exist.")
	}else{
		TESTDEBUG(5, [test_baseInterface::stopApplication],
			" app is exist.")
	}

	try{
		app->stop();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::stopApplication],
			" occure CORBA::SystemException when stop application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::stopApplication],
			" occure CORBA::Exception when stop application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::stopApplication],
			" occure unknown Exception when stop application.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::stopApplication], " leave...")
}

/**
 * @brief The operation used for print all applications
 *		  name and id in the domain manager.
 */
void
BaseTest::printAllAppsNameAndId()
{
	TESTDEBUG(8, [test_baseInterface::printAllAppsNameAndId], " enter...")

	if(CORBA::is_nil(m_appSeq)){
		TESTDEBUG(0, [test_baseInterface::printAllAppsNameAndId],
			" appSeq is nil.")
		return;
	}

	CORBA::Short length = m_appSeq->length();
	for(CORBA::Short i=0; i<length; ++i){
		std::string appId = (*m_appSeq)[i]->identifier();
		TESTDEBUG(0, [test_baseInterface::printAllAppsNameAndId],
			" appId:" << appId)

		std::string appName = (*m_appSeq)[i]->name();
		TESTDEBUG(0, [test_baseInterface::printAllAppsNameAndId],
			" appName:" << appName)
	}

	TESTDEBUG(8, [test_baseInterface::printAppsNameAndId], " leave...")
}

/**
 * @brief The operation used for print all devices
 *		  name and id in the device manager.
 */
void
BaseTest::printAllDevsNameAndId()
{
	TESTDEBUG(8, [test_baseInterface::printAllDevsNameAndId], " enter...")

	if(CORBA::is_nil(m_devSeq)){
		TESTDEBUG(0, [test_baseInterface::printAllDevsNameAndId],
			" devSeq is nil.")
		return;
	}

	CORBA::Short length = m_devSeq->length();
	for(CORBA::Short i=0; i<length; ++i){
		std::string devId = (*m_devSeq)[i]->identifier();
		TESTDEBUG(0, [test_baseInterface::printAllDevsNameAndId],
			" devId:" << devId)

		std::string devName = (*m_devSeq)[i]->label();
		TESTDEBUG(0, [test_baseInterface::printAllDevsNameAndId],
			" devName:" << devName)
	}

	TESTDEBUG(8, [test_baseInterface::printAllDevsNameAndId], " leave...")
}

/**
 * @brief The operation used for obtain application
 *		  all properties.
 *
 * @param[in] appName     name of application.
 *
 * @return application properties. 
 */
CF::Properties
BaseTest::getAppAllProperties(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::getAppAllProperties],
		" enter...")

	CF::Application_var app = getAppByName(appName);
	if(CORBA::is_nil(app)){
		TESTDEBUG(0, [test_baseInterface::getAppAllProperties],
			" app is nil.")
		return 0;
	}

	CF::Properties props;
	try {
		app->query(props);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getAppAllProperties],
			" occure CORBA::SystemException when get properties.")
		printCORBASystemException(e);
		return 0;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getAppAllProperties],
			" occure CORBA::Exception when get properties.")
		printCORBAException(e);
		return 0;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getAppAllProperties],
			" occure unknown Exception when get properties.")
		return 0;
	}

	TESTDEBUG(8, [test_baseInterface::getAppAllProperties],
		" leave...")

	return props;
}

/**
 * @brief The operation used for obtain device
 *		  all properties.
 *
 * @param[in] devName     name of device.
 *
 * @return device properties. 
 */
CF::Properties
BaseTest::getDevAllProperties(
	const std::string devName)
{
	TESTDEBUG(8, [test_baseInterface::getDevAllProperties],
		" enter...")

	CF::Device_var dev = getDevByName(devName);
	if(CORBA::is_nil(dev)){
		TESTDEBUG(0, [test_baseInterface::getDevAllProperties],
			" dev is nil.")
		return 0;
	}

	CF::Properties props;
	try {
		dev->query(props);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::getDevAllProperties],
			" occure CORBA::SystemException when get properties.")
		printCORBASystemException(e);
		return 0;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::getDevAllProperties],
			" occure CORBA::Exception when get properties.")
		printCORBAException(e);
		return 0;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::getDevAllProperties],
			" occure unknown Exception when get properties.")
		return 0;
	}

	TESTDEBUG(8, [test_baseInterface::getDevAllProperties],
		" leave...")

	return props;
}

/**
 * @brief The operation used for print the  
 *		  applicaton all properties.
 *
 * @param[in] appName     name of application.
 */
void
BaseTest::printAppAllProperties(
	const std::string appName)
{
	TESTDEBUG(8, [test_baseInterface::printAppAllProperties],
		" enter...")

	CF::Properties props = getAppAllProperties(appName);

	CORBA::Short length = props.length();
	TESTDEBUG(8, [test_baseInterface::printAppAllProperties],
		" length:" << length)
	for(CORBA::Short i=0; i<length; ++i){
		std::string propId = CORBA::string_dup(props[i].id);
		TESTDEBUG(0, [test_baseInterface::printAppAllProperties],
			" propId:" << propId)
		printAppPropertyValue(props[i]);
	}

	TESTDEBUG(8, [test_baseInterface::printAppAllProperties],
		" leave...")
}

/**
 * @brief The operation used for print the 
 *		  device all properties.
 *
 * @param[in] devName     name of device.
 */
void
BaseTest::printDevAllProperties(
	const std::string devName)
{
	TESTDEBUG(8, [test_baseInterface::printDevAllProperties],
		" enter...")

	CF::Properties props = getDevAllProperties(devName);

	CORBA::Short length = props.length();
	TESTDEBUG(8, [test_baseInterface::printDevAllProperties],
		" length:" << length)
	for(CORBA::Short i=0; i<length; ++i){
		std::string propId = CORBA::string_dup(props[i].id);
		TESTDEBUG(0, [test_baseInterface::printDevAllProperties],
			" propId:" << propId)
		printDevPropertyValue(props[i]);
	}

	TESTDEBUG(8, [test_baseInterface::printDevAllProperties],
		" leave...")
}

void 
BaseTest::printAppPropertyValue(
	CF::DataType & prop)
{
	if(0 == strcmp(prop.id, CONNECTION) || 
		0 == strcmp(prop.id, START_STATUS)){
		CORBA::Boolean propValueBool;
		prop.value >>= CORBA::Any::to_boolean(propValueBool);
		TESTDEBUG(0, [test_baseInterface::printAppPropertyValue],
			" propValueBool:" << propValueBool)

	} else if(0 == strcmp(prop.id, BUSINESS_TYPE)){
		const char * propValueStr = NULL;
		prop.value >>= propValueStr;
		TESTDEBUG(0, [test_baseInterface::printAppPropertyValue],
			" propValueStr:" << propValueStr)

	} else if(0 == strcmp(prop.id, BLOCK_ERROR_RATE)){
		CORBA::Float propValueFloat;
		prop.value >>= propValueFloat;
		TESTDEBUG(0, [test_baseInterface::printAppPropertyValue],
			" propValueFloat:" << propValueFloat)

	} else if(0 == strcmp(prop.id, LOCAL_LD) ||
		0 == strcmp(prop.id, TARGET_LD)){
		CORBA::UShort propValueUshort;
		prop.value >>= propValueUshort;
		TESTDEBUG(0, [test_baseInterface::printAppPropertyValue],
			" propValueUshort:" << propValueUshort)
	}
}

void 
BaseTest::printDevPropertyValue(
	CF::DataType & prop)
{
	if(0 == strcmp(prop.id, IS_BOARD) || 
		0 == strcmp(prop.id, HEALTH_STATE)){
		CORBA::Boolean propValueBool;
		prop.value >>= CORBA::Any::to_boolean(propValueBool);
		TESTDEBUG(0, [test_baseInterface::printDevPropertyValue],
			" propValueBool:" << propValueBool)
	} 
}

/**
 * @brief The operation used for obtain the application
 *		  special property value by property id.
 *
 * @param[in] appName     name of application.
 * @param[in] propId      id of property.
 */
void
BaseTest::getAppSpecialPropertyValue(
	const std::string appName,
	const std::string propId)
{
	TESTDEBUG(8, [test_baseInterface::getAppSpecialPropertyValue],
		" enter...")

	CF::Properties props = getAppAllProperties(appName);
	CORBA::Short length = props.length();
	TESTDEBUG(5, [test_baseInterface::getAppSpecialPropertyValue],
		" length:" << length)

	for(CORBA::Short i=0; i<length; ++i){
		if(0 == strcmp(props[i].id, propId.c_str())){
			printAppPropertyValue(props[i]);
		}
	}

	TESTDEBUG(8, [test_baseInterface::getAppSpecialPropertyValue],
		" leave...")
}

/**
 * @brief The operation used for obtain the device special
 *		  property value by property id.
 *
 * @param[in] devName     name of device.
 * @param[in] propId      id of property.
 */
void
BaseTest::getDevSpecialPropertyValue(
	const std::string devName,
	const std::string propId)
{
	TESTDEBUG(8, [test_baseInterface::getDevSpecialPropertyValue],
		" enter...")

	CF::Properties props = getDevAllProperties(devName);
	CORBA::Short length = props.length();
	TESTDEBUG(5, [test_baseInterface::getDevSpecialPropertyValue],
		" length:" << length)

	for(CORBA::Short i=0; i<length; ++i){
		if(0 == strcmp(props[i].id, propId.c_str())){
			printDevPropertyValue(props[i]);
		}
	}

	TESTDEBUG(8, [test_baseInterface::getDevSpecialPropertyValue],
		" leave...")
}

/**
 * @brief The operation used for configure application 
 * 		  property value by id.
 *
 * @param[in] appName     name of application.
 * @param[in] propId   	  id of property.
 * @param[in] propValue   value of property.
 * @param[in] valueType   type of property value.
 */
void
BaseTest::configureAppPropertyValueById(
	const std::string appName,
	const std::string propId,
	const std::string propValue,
	const std::string valueType)
{
	TESTDEBUG(8, [test_baseInterface::configureAppPropertyValueById],
		" enter...")

	CF::Application_var app = getAppByName(appName);
	if(CORBA::is_nil(app)){
		TESTDEBUG(0, [test_baseInterface::configureAppPropertyValueById],
			" app is nil.")
		return;
	}

	CF::Properties props = getCFProperties(propId, propValue, valueType);

	try {
		app->configure(props);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::configureAppPropertyValueById],
			" occure CORBA::SystemException when configure application.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::configureAppPropertyValueById],
			" occure CORBA::Exception when configure application.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::configureAppPropertyValueById],
			" occure unknown Exception when configure application.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::configureAppPropertyValueById],
		" leave...")
}

/**
 * @brief The operation used for configure device
 * 		  property value by id.
 *
 * @param[in] devName     name of device.
 * @param[in] propId   	  id of property.
 * @param[in] propValue   value of property.
 * @param[in] valueType   type of property value.
 */
void
BaseTest::configureDevPropertyValueById(
	const std::string devName,
	const std::string propId,
	const std::string propValue,
	const std::string valueType)
{
	TESTDEBUG(8, [test_baseInterface::configureDevPropertyValueById],
		" enter...")

	CF::Device_var dev = getDevByName(devName);
	if(CORBA::is_nil(dev)){
		TESTDEBUG(0, [test_baseInterface::configureDevPropertyValueById],
			" dev is nil.")
		return;
	}

	CF::Properties props = getCFProperties(propId, propValue, valueType);

	try {
		dev->configure(props);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_baseInterface::configureDevPropertyValueById],
			" occure CORBA::SystemException when configure device.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_baseInterface::configureDevPropertyValueById],
			" occure CORBA::Exception when configure device.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [test_baseInterface::configureDevPropertyValueById],
			" occure unknown Exception when configure device.")
		return;
	}

	TESTDEBUG(8, [test_baseInterface::configureDevPropertyValueById],
		" leave...")
}

/*
 *	@brief The operation used for obtain CF::Properties by 
 * 		   property id, value, type.
 * 
 *  @param[in] propId      id of property.
 *	@param[in] propValue   value of property.
 *	@param[in] valueType   type of value.
 *
 *  @return the CF::Properties.
 */
CF::Properties
BaseTest::getCFProperties(
	const std::string propId,
	const std::string propValue,
	const std::string valueType)
{
	TESTDEBUG(8, [test_baseInterface::getCFProperties],
		" enter...")

	initializeDataTypeMap();

	std::vector<std::string> value;
	value.push_back(propValue);

	CF::Properties props;
	props.length(1);
	props[0].id = CORBA::string_dup(propId.c_str());
	switch (m_dataTypeMap[valueType]) {
		case charType:
			props[0].value <<=
				CORBA::Any::from_char(openscaSupport::strings_to_char(value));
			break;
		case stringType:
			props[0].value <<= openscaSupport::strings_to_string(value);
			break;
		case shortType:
			props[0].value <<= openscaSupport::strings_to_short(value);
			break;
		case ushortType:
			props[0].value <<= openscaSupport::strings_to_unsigned_short(value);
			break;
		case longType:
			props[0].value <<= openscaSupport::strings_to_long(value);
			break;
		case ulongType:
			props[0].value <<= openscaSupport::strings_to_unsigned_long(value);
			break;
		case octetType:
			props[0].value <<=
				CORBA::Any::from_octet(openscaSupport::strings_to_octet(value));
			break;
		case booleanType:
			props[0].value <<=
				CORBA::Any::from_boolean(openscaSupport::strings_to_boolean(value));	
			break;
		case floatType:
			props[0].value <<= openscaSupport::strings_to_float(value);
			break;
		case doubleType:
			props[0].value <<= openscaSupport::strings_to_double(value);
			break;
		default:
			break;
	}

	TESTDEBUG(8, [test_baseInterface::getCFProperties],
		" leave...")
	return props;
}

void
BaseTest::initializeDataTypeMap()
{
	m_dataTypeMap["char"] = charType;
	m_dataTypeMap["string"] = stringType;
	m_dataTypeMap["short"] = shortType;
	m_dataTypeMap["ushort"] = ushortType;
	m_dataTypeMap["long"] = longType;
	m_dataTypeMap["ulong"] = ulongType;
	m_dataTypeMap["octet"] = octetType;
	m_dataTypeMap["boolean"] = booleanType;
	m_dataTypeMap["float"] = floatType;
	m_dataTypeMap["double"] = doubleType;
}
