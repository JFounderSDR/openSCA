/***************************************************************************//**
* @file     DeviceManager_impl.cpp
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

#include "sys/time.h"
#ifdef __SDS_OS_LINUX__
#include "sys/utsname.h"
#endif
#ifdef __SDS_OS_VXWORKS__
#include <taskLib.h>
#endif

#include "DCDParser.h"
#include "SCDParser.h"
#include "FileSystem_impl.h"
#include "CFS.h"
#include "../include/DeviceManager_impl.h"

/**
 * The DeviceManager interface is used to manage a set of logical devices and
 * services. The interface for a DeviceManager is based upon its attributes, which
 * are: 1. Device Configuration Profile - a mapping of physical device locations
 * to meaningful labels (e.g., audio1, serial1, etc.), along with the devices and
 * services to be deployed.
 * 2. File System - the FileSystem associated with this device manager.
 * 3. Device Manager Identifier - the instance-unique identifier for this device
 * manager.
 * 4. Device Manager Label - the meaningful name given to this device manager.
 * 5. Registered Devices - a list of devices that have registered with this device
 * manager.
 * 6. Registered Services - a list of services that have registered with this
 * device manager.
 */
DeviceManager_impl::DeviceManager_impl(
    const char * dcdPrfl,
    const char * fsRoot,
    const char * sdrRoot) {
	DEBUG(1, DeviceManager_impl, "In DeviceManager constructor.")

	m_orbWrap = new openscaSupport::ORB_Wrap();

	if ((dcdPrfl != NULL) && (fsRoot != NULL)) {
		m_deviceConfigurationProfile = dcdPrfl;
		m_fsRoot = fsRoot;
		m_platformRoot = sdrRoot;
	} else {
		DEBUG(5, DeviceManager,"DeviceManager_impl with invalid input parameter.")
		exit(EXIT_FAILURE);
	}
}

/**
 *@brief The operation shall initialize the device manager, inculding
 *       create file system, get device manager's base information,
 *       get domain manager object reference.
 */
void
DeviceManager_impl::postConstructor()
throw(
    std::runtime_error,
    CORBA::SystemException) {
	DEBUG(5, DeviceManager_impl::postConstructor, "enter in...")
	activateFileSystems();

	if (CORBA::is_nil(m_fileSys.in())) {
		DEBUG(1, DeviceManager_impl, "m_fileSys is nil in postConstructor")
	}

	CF::File_var file;
	try {
		file = openprofileFile(m_fileSys.in(),
		                       m_deviceConfigurationProfile.c_str());
	} catch (CF::InvalidObjectReference& ex) {
		DEBUG(1, DeviceManager_impl,
		      "In postConstructor when open DCD.xml with invalid CF::File \
			Object reference")
		throw std::runtime_error(
		    "In Constructor when open DCD.xml with invalid CF::File \
			Object reference");

	} catch (CF::InvalidFileName& ex) {
		DEBUG(1, DeviceManager_impl,
		      "In postConstructor when open DCD.xml occur " << ex.msg)
		throw std::runtime_error("occure CF::InvalidFileName exception");
	} catch (CF::FileException& ex) {
		DEBUG(1, DeviceManager_impl,
		      "In postConstructor when open DCD.xml occur " << ex.msg)
		throw std::runtime_error("occure CF::FileException exception");
	}

	//parser DCD.xml file
	DCDParser dcdParser(file);
	try {
		file->close();
	} catch (CORBA::SystemException& se) {
		DEBUG(5, DeviceManager_impl::postConstructor,
		      "[DeviceManager_impl::postConstructor] \
		      dcd->close failed with CORBA::SystemException.")
		return;
	} catch (...) {
		DEBUG(5, App_impl, "[DeviceManager_impl::postConstructor] \
			dcd->close failed with Unknown Exception.")
		return;
	}

	m_identifier = dcdParser.getID();
	m_nodeName = dcdParser.getName();

	std::string devmgrsftpkg = dcdParser.getDeviceManagerSoftPkg();
	DEBUG(7, DeviceManager_impl, "devmgrsftpkg: " << devmgrsftpkg)

	//extract current path from path of dcd.xml,
	//such as /scaplatform/Nodes/main_node/DevMgr
	size_t found = m_deviceConfigurationProfile.find_last_of('/');
	std::string relativePath = m_deviceConfigurationProfile.substr(0, found);
	DEBUG(7, DeviceManager_impl, relativePath)

	std::string devMgrSftPkgFull = "";
	devMgrSftPkgFull.append(relativePath);
	devMgrSftPkgFull.append("/");
	devMgrSftPkgFull.append(devmgrsftpkg);

	CF::File_var devmgrfile;
	try {
		devmgrfile = m_fileSys->open(devMgrSftPkgFull.c_str(), true);
	} catch (CF::InvalidFileName& e) {
		DEBUG(5, DeviceManager, "occurred unkown \
			exception." << devMgrSftPkgFull << "with invalid name")
		throw std::runtime_error("occur CF::InvalidFileName Exception");
	} catch (CF::FileException& e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]when \
		      opening " << devMgrSftPkgFull << "Unkown exception occur");
		throw std::runtime_error("occur CF::FileException Exception");
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]when \
		      opening " << devMgrSftPkgFull << "Unknown exception occur")
		throw std::runtime_error("occur Unkown Exception");
	}

	DEBUG(7, DeviceManager_impl, "begin to parse devMgr.spd.xml")

	//parser device manager spd.xml
	SPDParser devmgrSpdPaser(devmgrfile);
	try {
		devmgrfile->close();
	} catch (const CORBA::Exception& e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]failed with CORBA::Exception")
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]failed to \
		      close " << devmgrsftpkg << "with unknown exception")
	}

	m_label = devmgrSpdPaser.getSoftPkgName();

	DEBUG(7, DeviceManager_impl, "begin to get DomainMgr reference")
	//parser domain manager throught by NamingService
	getDmnMgrref(dcdParser.getDomainManagerName());

	DEBUG(5, DeviceManager_impl::postConstructor, "leave...")
}

/**
 *@brief  create a CF::File object for specialed profile
 *
 *@note	  shall close this CF::File object after use
 *@param[in]	fs 		-file system ojbect reference
 *@param[in]	profile	-the file wait for opening
 *@returnval	CF::File reference of specialed file
 */
CF::File_var 
DeviceManager_impl::openprofileFile(
		CF::FileSystem_ptr fs, 
		const char* profile)
throw(
		CF::InvalidObjectReference,
		CF::InvalidFileName,
		CF::FileException,
		CORBA::SystemException)
{
	DEBUG(7, DeviceManager_impl, "entering openProfileFile")

	if (CORBA::is_nil (m_fileSys)) {
		DEBUG(5, DeviceManager, "[DeviceManager_impl] m_fileSys is nil")
		throw CF::InvalidObjectReference();
	}

	DEBUG(5, DeviceManager, "[DeviceManager_impl]get filesys ref.")
	if (!m_fileSys->exists(profile)) {
		DEBUG(5, DeviceManager, "do not exist in file system."<<profile)
		throw CF::FileException();
	}

	CF::File_var file;
	try {
		DEBUG(7, DeviceManager_impl, profile)
		file = m_fileSys->open(profile, true);
	} catch (CF::InvalidFileName& e) {
		DEBUG(5, DeviceManager,
				"[DeviceManager_impl::DeviceManager_impl]when opening" <<profile << "with invalid name")
		CF::InvalidFileName invalidFileName;
		invalidFileName.errorNumber = CF::CFEINVAL;
		invalidFileName.msg = CORBA::string_dup(profile);
		throw invalidFileName;
	} catch (CF::FileException& e) {
		DEBUG(5, DeviceManager,
				"[DeviceManager_impl::DeviceManager_impl]when opening " <<profile << "File exception occur")
		throw CF::FileException(e);
	} catch (...) {
		DEBUG(5, DeviceManager,
				"[DeviceManager_impl::DeviceManager_impl]when opening " <<profile << "Unkown exception occur")
		CF::FileException fileExc;
		fileExc.errorNumber = CF::CFENXIO;
		fileExc.msg = "open file failed with unkown exception";
		throw fileExc;
	}

	DEBUG(7, DeviceManager_impl, "leaving openProfileFile")
	return file._retn();
}

/**
 * @brief this routine launch all of devices and services described in DCD.xml
 *
 *	Launch DCD consite of two step. the first step is to launch Aggregate Device and obtain
 *	the reference of releted AggregateService from PRF.xml. The Attribute of AggregateService
 *	have id("AGGREGATE_SERVICE_IOR") and value("corbaloc://host:port/AggregateService")
 *	the second is to launch Child Device, if it have 'deployondevice', then deploy on its parent
 *	device.
 *
 * @param[in] dcdAbsPfl	   Absolute path of the dcd.xml path.
 *
 * @returnval NA
 */
void
DeviceManager_impl::launchDCD(
    const char * dcdAbsPfl)
throw(std::runtime_error, CORBA::SystemException) {
	DEBUG(7, DeviceManager_impl, "Entering launchDCD")

	DCDParser dcdParser(dcdAbsPfl);
	//instantiate all components according to componentplacements in dcd.xml
	instantDCDComps();
	
	//create connections
	std::vector<Connection *> * connections = NULL;
	DEBUG(5, DeviceManager_impl, "_sadParser->getConnections")
	connections = dcdParser.getConnections();
	createConnections(connections);
	
	printf("\n********************************************************\n"
	       "* DeviceManager_impl finished all device.                 \n"
	       "********************************************************\n");

	if (CORBA::is_nil (m_dmnMgr)) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl] m_dmnMgr is nil")
		throw std::runtime_error("_demMgr is nil");
	}
	//register devicemanager to domainmanager
	DEBUG(1, DeviceManager_impl, "Registering DeviceManager to DomainManager")
	try {
		m_dmnMgr->registerDeviceManager(POA_CF::DeviceManager::_this());
	} catch (CF::InvalidObjectReference & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]registerDevmgr with invalid objectref.")
	} catch (CF::InvalidProfile & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]registerDevmgr with invalid profile.")
	} catch (CF::DomainManager::RegisterError & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]registerDevmgr with register error.")
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::DeviceManager_impl]registerDevmgr with unknown.")
	}
}

/**
 *@brief Instantiate every fileSystems in DCD.xml and
 *       register with FileManager.
 */
void
DeviceManager_impl::activateFileSystems() {
	//instantiate FileSystem and activate it, at last register FileSystem
	//ref with FileManager by DomainMgr
	FileSystem_impl * fsImpl = new FileSystem_impl(m_fsRoot.c_str());
	DEBUG(5, DeviceManager,
	      "[DeviceManager_impl]new FileSystem_impl finished.")

	m_fileSys = fsImpl->_this();
}

/**
 * @brief	The operation shall load and execute component's code.
 * @param[in] exeDevPtr    Executable device on which the component's code will be
 * 						   loaded and executed.
 * @param[in] spdImpls	   All alternatiove	implementations of the component,
 * 						   which are specificed in spd.xml file.
 * @param[in] devInstId	   Id of the device's instantation.
 * @param[in] devInstName  Name of the device's instantation.
 * @param[in] devInstSftfl Device's spd.xml file path.
 * @param[in] parentIOR	   IOR of the device's parent device.
 * @param[in] registryIOR  IOR of the registry component, which can be used by
 * 						   instantiating device to register itself with device
 * 						   manager.
 */
bool
DeviceManager_impl::loadAndExecuteComponent(
    CF::ExecutableDevice_ptr exeDevPtr,
    std::vector < SPDImplementation*> * spdImpls,
    const char * devInstId,
    const char * devInstName,
    const char * devInstSftfl,
    const char * parentIOR,
    const char * registryIOR) {
	if (exeDevPtr->_non_existent() || CORBA::is_nil(exeDevPtr)) {
		DEBUG(2, DeviceManager_impl::loadAndExecuteComponent,
		      "parent dev reference don't exsit");
		return false;
	}

	bool result = true;

	//searching for SPDImplementation corresponding to osname
	std::string codeFile;		//code file path
	std::string entryPoint;
	CORBA::ULong stackSize;
	CORBA::ULong priority;
	CF::LoadableDevice::LoadType loadType;

	//check what os and processor do aggregate device run on,
	//and match the device implementation with the aggregate device
	std::string aggSpdfl = exeDevPtr->softwareProfile();
	CF::File_var prfFile = CF::File::_nil();
	try {
		prfFile = openPRFProfilebySPDfl(m_fileSys.in(), aggSpdfl.c_str());
	} catch (std::runtime_error & ex) {
		DEBUG(2, DeviceManager_impl,
		      "In loadAndExecuteComponent call openPRFProfilebySPDfl\
		      failed with " << ex.what())
		result = false;
	} catch (...) {
		DEBUG(2, DeviceManager_impl,
		      "In loadAndExecuteComponent call openPRFProfilebySPDfl\
		      failed with unkown exception")
		result = false;
	}

	if (!result)
		return false;

	PRFParser prfFileParser(prfFile.in());
	closeProfileFile(prfFile.in());

	std::vector<PRFProperty*> * allocProps =
	    prfFileParser.getCapacityProperties();
	bool ifFindImpl = matchSPDImplementation(spdImpls, allocProps,
	                  codeFile, entryPoint, stackSize, priority, loadType);

	if (ifFindImpl == false) {
		DEBUG(1, DeviceManager_impl,"fail to match osname with \
			implid: " << (* spdImpls)[0]->getID())
		throw std::runtime_error("fail to search approprite Implement");
	}

	//get device's absolute code file path
	std::string devSpdPath =
	    m_platformRoot + "/" + CONSTANT::NODES + "/" + devInstSftfl;
	std::string relativeCodePath =
	    replaceFileNameofPath(devSpdPath.c_str(), codeFile.c_str());

	try {
		exeDevPtr->load(m_fileSys.in(), relativeCodePath.c_str(), loadType);
	} catch (CF::InvalidFileName & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with invalid file name.")
		result = false;
	} catch (CF::Device::InvalidState & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with invalid Device state")
		result = false;
	} catch (CF::LoadableDevice::InvalidLoadKind & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with invalid loadkind")
		result = false;
	} catch (CF::LoadableDevice::LoadFail & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code failed.")
		result = false;
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with unknown exception.")
		result = false;
	}

	if (!result)
		return false;

	//execute the device loaded
	CF::Properties options, params;

	getExecOptions(stackSize, priority, entryPoint, options);

	ExecParamsType execParams;
	execParams.clear();
	getExecParameters(execParams, devInstId, devInstName, devSpdPath.c_str(),
	                  parentIOR, registryIOR, params);

	try {
		exeDevPtr->execute(relativeCodePath.c_str(), options, params);
	} catch (CF::InvalidFileName & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with invalid filename.")
		result = false;
	} catch (CF::Device::InvalidState & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with invalid Device state")
		result = false;
	} catch (CF::ExecutableDevice::InvalidOptions & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with InvalidOptions")
		result = false;
	} catch (CF::ExecutableDevice::InvalidParameters & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with InvalidParameters.")
		result = false;
	} catch (CF::ExecutableDevice::ExecuteFail & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code failed.")
		result = false;
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with unknown exception.")
		result = false;
	}

	return result;
}

bool
DeviceManager_impl::
loadAndExecuteComponent(
    ExecutableDevice_servant * exeDevServant,
    std::vector <SPDImplementation*> * spdImpls,
    const char * devInstId,
    const char * devInstName,
    const char * devInstSftfl,
    const char * parentIOR,
    const char * registryIOR)
throw (std::runtime_error, CORBA::SystemException) {
	//searching for SPDImplementation corresponding to osname
	std::string 	codeFile;		//code file path
	std::string 	entryPoint;
	CORBA::ULong	stackSize;
	CORBA::ULong	priority;

	bool ifFindImpl = matchSPDImplementation(
	                      spdImpls, codeFile, entryPoint, stackSize, priority);

	if (ifFindImpl == false) {
		DEBUG(1, DeviceManager_impl,
		      "fail to match osname with implid: " << (*spdImpls)[0]->getID())
		return false;
	}

	bool result = true;

	//get device's code file path relative to fsroot
	std::string devSpdPath = m_platformRoot + "/" +
	                         CONSTANT::NODES + "/" + devInstSftfl;
	DEBUG(5, DeviceManager, "Test DeviceManager's devSpdPath : " << devSpdPath)
	std::string relativeCodePath =
	    replaceFileNameofPath(devSpdPath.c_str(), codeFile.c_str());
	DEBUG(5, DeviceManager, "Test DeviceManager's codeFile : " << codeFile)
	DEBUG(5, DeviceManager, "Test DeviceManager's relativeCodePath : " << relativeCodePath)
	try {
		exeDevServant->load(m_fileSys.in(), relativeCodePath.c_str(),
		                    CF::LoadableDevice::EXECUTABLE);
	} catch (CF::InvalidFileName & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with invalid file name.")
		result = true;
	} catch (CF::Device::InvalidState & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with invalid Device state")
		result = true;
	} catch (CF::LoadableDevice::InvalidLoadKind & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with invalid loadkind")
		result = true;
	} catch (CF::LoadableDevice::LoadFail & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code failed.")
		result = true;
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]load code with unknown exception.")
		result = true;
	}

	if (!result)
		return false;

	//execute the device loaded
	CF::Properties options, params;
	getExecOptions(stackSize, priority, entryPoint, options);

	std::string absDevSpdPath = m_fsRoot + "/" + devSpdPath;
	SPDParser exeDevSpd(absDevSpdPath);
	std::string prfName = exeDevSpd.getPRFFile();
	std::string absDevPrfPath =
	    replaceFileNameofPath(absDevSpdPath.c_str(), prfName.c_str());
	PRFParser exeDevPrf(absDevPrfPath);
	ExecParamsType execParams = exeDevPrf.getExecParams();

	getExecParameters(execParams, devInstId, devInstName, devSpdPath.c_str(),
	                  parentIOR, registryIOR, params);

	try {
		exeDevServant->execute(relativeCodePath.c_str(), options, params);
	} catch (CF::InvalidFileName & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with invalid filename.")
		result = true;
	} catch (CF::Device::InvalidState & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with invalid Device state")
		result = true;
	} catch (CF::ExecutableDevice::InvalidOptions & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with InvalidOptions")
		result = true;
	} catch (CF::ExecutableDevice::InvalidParameters & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with InvalidParameters.")
		result = true;
	} catch (CF::ExecutableDevice::ExecuteFail & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code failed.")
		result = true;
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantDCDComps]execute code with unknown exception.")
		result = true;
	}

	return result;
}

void
DeviceManager_impl::getExecOptions(
    CORBA::ULong stackSize,
    CORBA::ULong priority,
    const std::string & entryPoint,
    CF::Properties & options) {
	options.length(3);

	options[0].id = CORBA::string_dup("STACK_SIZE_ID");
	options[0].value <<= (CORBA::ULong)stackSize;

	options[1].id = CORBA::string_dup("PRIORITY_ID");
	options[1].value <<= (CORBA::ULong)priority;

	options[2].id = CORBA::string_dup("ENTRY_POINT");
	options[2].value <<= entryPoint.c_str();
}

void
DeviceManager_impl::getExecParameters(
    ExecParamsType execParams,
    const char * devInstId,
    const char * devInstName,
    const char * devSpdPath,
    const char * parentIOR,
    const char * registryIOR,
    CF::Properties & params) {
	params.length(7 + execParams.size());
	int count = 0;
	for (ExecParamsType::iterator iter = execParams.begin(); 
		iter != execParams.end(); iter++){

		CF::DataType execParam;
		execParam.id = CORBA::string_dup((iter->first).c_str());
		execParam.value <<= iter->second;
		params[count] = execParam;
		++count;
	}

	CF::DataType devId;
	devId.id = CORBA::string_dup("-ID");
	devId.value <<= devInstId;
	params[count + 0] = devId;

	CF::DataType devName;
	devName.id = CORBA::string_dup("-LABEL");
	devName.value <<= devInstName;
	params[count + 1] = devName;

	CF::DataType devSftfl;
	devSftfl.id = CORBA::string_dup("-SFTFL");
	devSftfl.value <<= devSpdPath;
	params[count + 2] = devSftfl;

	CF::DataType node;
	node.id = CORBA::string_dup("-NODENAME");
	node.value <<= m_nodeName;
	params[count + 3] = node;

	CF::DataType devMgrName;
	devMgrName.id = CORBA::string_dup("-DEVMGRNAME");
	devMgrName.value <<= this->m_label;
	params[count + 4] = devMgrName;

	CF::DataType parentIor;
	parentIor.id = CORBA::string_dup("-COMPOSITE_DEVICE_IOR");
	parentIor.value <<= parentIOR;
	params[count + 5] = parentIor;

	CF::DataType registryIor;
	registryIor.id = CORBA::string_dup("-COMPONENT_REGISTRY_IOR");
	registryIor.value <<= registryIOR;
	params[count + 6] = registryIor;
}

bool
DeviceManager_impl::matchSPDImplementation(
    std::vector <SPDImplementation*> * spdImpls,
    std::string & codeFile,
    std::string & entryPoint,
    CORBA::ULong & stackSize,
    CORBA::ULong & priority) {
	for (unsigned int i = 0; i < spdImpls->size(); i++) {
		OSAttributes osattri = (* spdImpls)[i]->getOperatingSystem();

		struct utsname sysInfo;
		if (uname(&sysInfo) == -1) {
			DEBUG(1, DeviceManager_impl, "call unname() failed in matchSPDImplementation")
			throw std::runtime_error("when call unname() failed");
		}
		std::string _osName = sysInfo.sysname;

		if ( strcmp(osattri.getOSName(), _osName.c_str()) != 0 )
			continue;

		// if (strcmp(osattri.getOSName(), "VxWorks") != 0)
		// 	continue;

		codeFile = (* spdImpls)[i]->getCodeFile();
		DEBUG(7, DeviceManager_impl,"matchSPDImplementation with codeFile \
			is: " << codeFile)

		entryPoint = (* spdImpls)[i]->getEntryPoint();
		DEBUG(7, DeviceManager_impl, "In matchSPDImplementation with entryPoint \
			is: " << entryPoint)

		stackSize = (* spdImpls)[i]->getStackSize();
		DEBUG(7, DeviceManager_impl, "In matchSPDImplementation with stackSize \
			is: " << stackSize)

		priority = (* spdImpls)[i]->getPriority();
		DEBUG(7, DeviceManager_impl, "In matchSPDImplementation with priority \
			is: " << priority)

		return true;
	}

	return false;
}

bool
DeviceManager_impl::matchSPDImplementation(
    std::vector <SPDImplementation*> * spdImpls,
    std::vector<PRFProperty*> * allocProps,
    std::string & codeFile,
    std::string & entryPoint,
    CORBA::ULong & stackSize,
    CORBA::ULong & priority,
    CF::LoadableDevice::LoadType & loadType) {
	std::string aggOSName;
	std::string aggProcessorName;

	for (int i = 0; i < allocProps->size(); ++i) {
		if (strcmp((* allocProps)[i]->getID(), "DCE:os_name:1") == 0) {
			std::vector<std::string> values = (* allocProps)[i]->getValue();
			aggOSName = values[0];
		}

		if (strcmp((*allocProps)[i]->getID(), "DCE:processor_name:1") == 0) {
			std::vector<std::string> values = (* allocProps)[i]->getValue();
			aggProcessorName = values[0];
		}
	}

	for (unsigned int i = 0; i < spdImpls->size(); i++) {
		OSAttributes osattri = (* spdImpls)[i]->getOperatingSystem();
		if (strcmp(osattri.getOSName(), aggOSName.c_str()) != 0)
			continue;
		std::vector<std::string> processors =
		    (* spdImpls)[i]->getProcessors();
		if (strcmp(processors[0].c_str(), aggProcessorName.c_str()) != 0)
			continue;

		codeFile = (* spdImpls)[i]->getCodeFile();
		entryPoint = (* spdImpls)[i]->getEntryPoint();
		DEBUG(7, DeviceManager_impl, "In matchSPDImplementation with entryPoint \
			is: " << entryPoint)

		stackSize = (* spdImpls)[i]->getStackSize();
		DEBUG(7, DeviceManager_impl, "In matchSPDImplementation with stackSize \
			is: " << stackSize)

		priority = (* spdImpls)[i]->getPriority();
		DEBUG(7, DeviceManager_impl, "In matchSPDImplementation with priority \
			is: " << priority)

		loadType = (* spdImpls)[i]->getCodeType();

		return true;
	}

	return false;
}

bool
DeviceManager_impl::initAndConfigComp(
    PRFParser & prfParser,
    const char * devName,
    CF::Device_var & devRef) {
	DEBUG(5, DeviceManager_impl::initAndConfigComp, "enter in ...")

	//get configrable and allocation properties
	CF::Properties allProps;
	allProps.length(0);
	std::vector<PRFProperty*> * confProps = prfParser.getProperties();
	allProps.length(confProps->size());

	DEBUG(7, DeviceManager_impl, " configure property length \
		is: " << confProps->size())

	for (unsigned int i = 0; i < confProps->size(); i++) {
		allProps[i] = * ((*confProps)[i]->getDataType());

		DEBUG(7, DeviceManager_impl, "confiure property id\
			: " << allProps[i].id)

		if (strcmp(allProps[i].id, "DCE:os_name:1") == 0) {
			const char * msg = NULL;
			allProps[i].value >>= msg;
			const char * msg2 = NULL;
			(*((*confProps)[i]->getDataType())).value >>= msg2;
			DEBUG(7, DeviceManager_impl, "confiure property value msg2\
				: " << msg2)
		}
	}

	DEBUG(5, instantDCDcomps, "start call compplaces[num_comp_plac]");
	CF::Device_var devVar;
	std::string cosName = "OpenSCA_Domain/" + m_nodeName + "/" + m_label;
	cosName.append("/");
	cosName.append(devName);

	DEBUG(7, [DeviceManager_impl::instantDCDComps], "wait bine object...")

	//get device bound with NamingService
	bool result =
	    getComponentObjRefFromNamingService(cosName.c_str(), devVar);
	if (!result)
		return false;

	if (!devVar->_is_a("IDL:CF/Device:1.0")) {
		DEBUG(5, DeviceManager, "[DeviceManager::initAndConfigComp] \
				device reference is not equal to IDL:CF/Device:1.0")
		return false;
	}

	devRef = CF::Device::_duplicate(devVar.in());
	//initialize device
	DEBUG(3, DeviceManager_impl, "initialize device:" << devName)
	try {
		devVar->initialize();
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DeviceManager, "[DeviceManager::instantDCDComps] \
				devVar->initialize failed with CORBA::SystemException")
		return false;
	} catch (...) {
		DEBUG(5, DeviceManager, "[DeviceManager::post_constructor] \
				devVar->initialize failed with Unknown Exception")
		return false;
	}

	//configure device with configureable and allocation properties
	DEBUG(3, DeviceManager_impl,
	      "In instantDCDComps configure device: " << devName)
	try {
		
		devVar->configure(allProps);

		DEBUG(7, DeviceManager_impl, "call devVar->configure finished")
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DeviceManager, "[DeviceManager::instantDCDComps] \
				devVar->configure failed with CORBA::SystemException")
		return false;
	} catch (...) {
		DEBUG(5, DeviceManager, "[DeviceManager::instantDCDComps] \
				devVar->configure failed with Unknown Exception")
		return false;
	}

	DEBUG(5, DeviceManager_impl::initAndConfigComp, "leaving ...")

	return true;
}

bool
DeviceManager_impl::getComponentObjRefFromNamingService(
    const char* namingContext,
    CF::Device_var & devVar) {
	CORBA::Object_var obj = CORBA::Object::_nil();
	int count = 0;
	while (count < 5) {
		sMsSleep(SDS_SLEEP);
		try {
			DEBUG(5, instantDCDcomps, "start get_object_from_string");
			obj = m_orbWrap->get_object_from_string(namingContext);
			if (obj->_non_existent() && CORBA::is_nil(obj)) {
				DEBUG(5, instantDCDcomps,
				      "[initAndConfigComp::get_object_from_string] obj is not exist.");
			} else {
				DEBUG(5, instantDCDcomps,
				      "[initAndConfigComp::get_object_from_string] obj is exist.");

				devVar = CF::Device::_narrow(obj.in());
				return true;
			}
		} catch (...) {
			DEBUG(5, DeviceManager,
			      "[DeviceManager_impl::instantDCDComps]obtain device by \
			      NamingService failed.")
		}
		++count;
	}

	return false;
}

bool
DeviceManager_impl::initAndConfigComp(
    PRFParser & prfParser,
    const char * devName,
    CF::Device_var & devRef,
    CF::Device_ptr parentDev) {
	DEBUG(5, DeviceManager_impl::initAndConfigComp, "enter in ...")

	//get configrable and allocation properties
	CF::Properties allProps;
	allProps.length(0);
	std::vector<PRFProperty*> * confProps = prfParser.getProperties();
	allProps.length(confProps->size());

	DEBUG(7, DeviceManager_impl, " configure property length is\
		: " << confProps->size())

	for (unsigned int i = 0; i < confProps->size(); i++) {
		allProps[i] = *((*confProps)[i]->getDataType());

		DEBUG(7, DeviceManager_impl, "confiure property id: " << allProps[i].id)
		if (strcmp(allProps[i].id, "DCE:os_name:1") == 0) {
			const char * msg = NULL;
			allProps[i].value >>= msg;
			const char * msg2 = NULL;
			(*((*confProps)[i]->getDataType())).value >>= msg2;
			DEBUG(7, DeviceManager_impl, "confiure property value msg2: " << msg2)
		}
	}

	DEBUG(5, instantDCDcomps, "start call compplaces[num_comp_plac]");
	bool result =
	    getChildDevObjRefFromParentDev(devName, parentDev, devRef);

	if (!result)
		return false;

	if (CORBA::is_nil(devRef)) {
		DEBUG(5, DeviceManager, "[DeviceManager_impl::get child device failed.")
		return false;
	}

	if (!devRef->_is_a("IDL:CF/Device:1.0")) {
		DEBUG(5, DeviceManager, "[DeviceManager::initAndConfigComp] \
				device reference is not equal to IDL:CF/Device:1.0")
		return false;
	}

	//initialize device
	DEBUG(3, DeviceManager_impl, "initialize device:" << devName)
	try {
		devRef->initialize();
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DeviceManager, "[DeviceManager::instantDCDComps] \
				 _dev->initialize failed with CORBA::SystemException")
		return false;
	} catch (...) {
		DEBUG(5, DeviceManager, "[DeviceManager::post_constructor] \
				_dev->initialize failed with Unknown Exception")
		return false;
	}

	//configure device with configureable and allocation properties
	DEBUG(3, DeviceManager_impl, "In instantDCDComps configure device: " << devName)
	try {
		devRef->configure(allProps);

		DEBUG(7, DeviceManager_impl, "call _dev->configure finished")
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::instantDCDComps] \
				dev->configure failed with CORBA::SystemException")
		return false;
	} catch (...) {
		DEBUG(5, DeviceManager, "[DeviceManager::instantDCDComps] \
				dev->configure failed with Unknown Exception")
		return false;
	}

	DEBUG(5, DeviceManager_impl::initAndConfigComp, "leaving ...")

	return true;
}

bool
DeviceManager_impl::getChildDevObjRefFromParentDev(
    const char * chidDevName,
    CF::Device_ptr parentDev,
    CF::Device_var & childDev) {

	int count = 0;
	while (count < 5) {
		sMsSleep(SDS_SLEEP);
		try {
			CF::DeviceSequence_var deviceSeq =
			    parentDev->compositeDevice()->devices();
			bool findDev = false;
			for (CORBA::ULong i = 0; i < deviceSeq->length(); i++) {
				if (0 == strcmp(chidDevName, deviceSeq[i]->label())) {
					childDev = CF::Device::_duplicate(deviceSeq[i]);
					return true;
				}
			}

			if (!findDev) {
				DEBUG(5, DeviceManager,
				      "[DeviceManager_impl::find child device failed.")
				sMsSleep(SDS_SLEEP);
			}
		} catch (...) {
			DEBUG(5, DeviceManager,
			      "[DeviceManager_impl::instantDCDComps]get MHAL device failed.")
		}
		++count;
	}
	return false;
}

bool
DeviceManager_impl::instantGeneralComp(
    DCDComponentPlacement & cp,
    DCDParser * dcdp) {
	DEBUG(5, DeviceManager_impl::instantGeneralComp, "enter in...")

	std::string devInstId = cp.getInstantiationId();
	std::string devInstName = cp.getUsageName();
	std::string devInstSftfl = dcdp->getFileNameFromRefId(cp.getFileRefId());
	int pos = devInstSftfl.find_first_of("/");
	devInstSftfl = m_nodeName + devInstSftfl.substr(pos);

	//extract absolute spd path
	std::string absSpdPath = m_platformRoot + "/" + CONSTANT::NODES +
	                         "/" + devInstSftfl;

	CF::File_var spdFile = CF::File::_nil();
	bool result =
	    openProfileFile(m_fileSys.in(), absSpdPath.c_str(), spdFile);
	if (!result)
		return false;

	//parsering spd.xml
	SPDParser spdParser(spdFile);
	closeProfileFile(spdFile.in());

	std::string absPrfPath =
	    replaceFileNameofPath(absSpdPath.c_str(), spdParser.getPRFFile());
	//get PRF file and parser prf.xml
	CF::File_var prfFile = CF::File::_nil();
	result = openProfileFile(m_fileSys.in(), absPrfPath.c_str(), prfFile);
	if (!result)
		return false;

	//parsing prf.xml
	PRFParser prfParser(prfFile);
	closeProfileFile(prfFile.in());

	std::string absScdPath =
	    replaceFileNameofPath(absSpdPath.c_str(), spdParser.getSCDFile());
	//get PRF file and parser prf.xml
	CF::File_var scdFile = CF::File::_nil();
	result = openProfileFile(m_fileSys.in(), absScdPath.c_str(), scdFile);
	if (!result)
		return false;

	//parsing SCD.xml
	SCDParser scdParser(scdFile);
	closeProfileFile(scdFile.in());

	//load code file into memory
	std::vector<SPDImplementation*> * spdImpls =
	    spdParser.getImplementations();
	ExecutableDevice_servant * exDevice = new ExecutableDevice_servant();


	result = loadAndExecuteComponent(exDevice, spdImpls, devInstId.c_str(),
	                                 devInstName.c_str(), devInstSftfl.c_str());
	delete exDevice;

	if (!result)
		return false;

	CF::Device_var devVar = CF::Device::_nil();
	result = initAndConfigComp(prfParser, devInstName.c_str(), devVar);
	if (!result)
		return false;

	//registering device with deviceManager
	DEBUG(3, DeviceManager_impl, "registering device:" << devInstName)

	if (devVar->_non_existent() && CORBA::is_nil(devVar)) {
		DEBUG(1, DeviceManager,
		      "[DeviceManager::instantDCDComps] registering device reference is not existent ")
		return false;
	}

	try {
		registerDevice(CF::Device::_duplicate(devVar));
	} catch (CF::InvalidObjectReference & _ex) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::instantDCDComps] While registering Device: " << _ex.msg)
		throw std::runtime_error("invalid object reference.");
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::instantDCDComps] While registering Device: Unknown Exception")
		throw std::runtime_error("Unknown Exception");
	}

	InstantedCompInfoType instantedCompInfo;
	instantedCompInfo.id = devInstId;
	instantedCompInfo.name = devInstName;
	instantedCompInfo.compIOR = m_orbWrap->object_to_ior(devVar.in());
	instantedCompInfo.compType = Device;
	m_instantedCompInfos.push_back(instantedCompInfo);

	DEBUG(2, DeviceManager_impl, "instantGeneralComp " << " success.")
	DEBUG(5, DeviceManager_impl::instantGeneralComp, "leaving...")
}

/**
 *@brief open PRF CF::File, must close it after used
 *
 *@param[in]
 *@returnval
 */
CF::File_ptr
DeviceManager_impl::openPRFProfilebySPDfl(
    CF::FileSystem_ptr fileSys,
    const char * absSpdfl)
throw (std::runtime_error, CORBA::SystemException) {
	DEBUG(5, DeviceManager_impl::openPRFProfilebySPDfl, "enter in...")

	CF::File_var spdFile = CF::File::_nil();
	try {
		spdFile = openprofileFile(fileSys, absSpdfl);
	} catch (CF::InvalidObjectReference & ex) {
		DEBUG(3, DeviceManager_impl, "In instantDCDComps call openProfileFile \
			failed with " << ex.msg)
		throw std::runtime_error("occur CF::InvalidObjectReference Exception");
	} catch (CF::InvalidFileName & ex) {
		DEBUG(3, DeviceManager_impl, "In instantDCDComps call openProfileFile \
			failed with " << ex.msg)
		throw std::runtime_error("occur CF::InvalidFileName Exception");
	} catch (CORBA::SystemException & ex) {
		//completed() can tell user where occurs error during calling.
		DEBUG(3, DeviceManager_impl,"In instantDCDComps call openProfileFile \
			failed with system exception: " << ex.completed())
		throw std::runtime_error("occur Unkown Exception");
	}

	//parsering spd.xml
	SPDParser spdParser(spdFile);

	//close spd.xml
	try {
		spdFile->close();
	} catch (CF::FileException & e) {
		DEBUG(5, DeviceManager,"[DeviceManager_impl::instantGeneralComp]close \
			spd.xml file with FileException:"<< e.msg)
		throw std::runtime_error("occur CF::FileException");
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::instantGeneralComp]close spd.xml file with unknown Exception:")
		throw std::runtime_error("occur Unkown Exception");
	}

	//extract relative path from SPD.XML
	std::string absPrfPath = "";
	std::string absSpdPath = absSpdfl;
	size_t find = absSpdPath.find_last_of("/");

	std::string prfl = absSpdPath.substr(0, find);
	prfl.append("/");
	absPrfPath = prfl.append(spdParser.getPRFFile());

	//get PRF file and parser prf.xml
	CF::File_var prfFile = CF::File::_nil();
	try {
		prfFile = openprofileFile(m_fileSys.in(), absPrfPath.c_str());
	} catch (CF::InvalidObjectReference & ex) {
		DEBUG(3, DeviceManager_impl,"In instantDCDComps call openProfileFile \
			failed with " << ex.msg)
		throw std::runtime_error("occur CF::InvalidObjectReference Exception");
	} catch (CF::InvalidFileName & ex) {
		DEBUG(3, DeviceManager_impl, "In instantDCDComps call openProfileFile \
			failed with " << ex.msg)
		throw std::runtime_error("occur CF::InvalidFileName Exception");
	} catch (CORBA::SystemException & ex) {
		DEBUG(3, DeviceManager_impl,"In instantDCDComps call openProfileFile \
			failed with system exception: " << ex.completed())
		throw std::runtime_error("occur Unkown Exception");
	}

	DEBUG(5, DeviceManager_impl::openPRFProfilebySPDfl, "leaving...")
	return prfFile._retn();
}

/**
 * @brief instantiate a compositepartof component, include procedure of load,execute,
 *		  and register
 *
 * @attention	now only support to instantiate component kind type of Device,
 *				except Service
 * @param[in]	dcp	-DCDComponentPlacement
 * @retval		NA
 */
bool
DeviceManager_impl::instantCompositepartComp(
    DCDComponentPlacement & dcp,
    DCDParser * dcdp) {
	std::string devInstId = dcp.getInstantiationId();
	std::string devInstName = dcp.getUsageName();
	std::string devInstSftfl = dcdp->getFileNameFromRefId(dcp.getFileRefId());
	int pos = devInstSftfl.find_first_of("/");
	devInstSftfl = m_nodeName + devInstSftfl.substr(pos);

	//extract absolute spd path
	std::string absSpdPath = m_platformRoot + "/" + CONSTANT::NODES +
	                         "/" + devInstSftfl;

	CF::File_var spdFile = CF::File::_nil();
	bool result =
	    openProfileFile(m_fileSys.in(), absSpdPath.c_str(), spdFile);
	if (!result)
		return false;

	//parsering spd.xml
	SPDParser spdParser(spdFile);
	closeProfileFile(spdFile.in());

	std::string absPrfPath =
	    replaceFileNameofPath(absSpdPath.c_str(), spdParser.getPRFFile());

	//get PRF file and parser prf.xml
	CF::File_var prfFile = CF::File::_nil();
	result = openProfileFile(m_fileSys.in(), absPrfPath.c_str(), prfFile);
	if (!result)
		return false;

	//parsing prf.xml
	PRFParser prfParser(prfFile);
	closeProfileFile(prfFile.in());

	std::string absScdPath =
	    replaceFileNameofPath(absSpdPath.c_str(), spdParser.getSCDFile());

	//get PRF file and parser prf.xml
	CF::File_var scdFile = CF::File::_nil();
	result = openProfileFile(m_fileSys.in(), absScdPath.c_str(), scdFile);
	if (!result)
		return false;

	//parsing SCD.xml
	SCDParser scdParser(scdFile);
	closeProfileFile(scdFile.in());

	//----------------------------------------------------------------------------------
	//search parent component of this component. if this component is deployondevice,
	//the parent will load and execute this component. if not deployondevice, load this
	//component on the same platform with devicemanager.
	//----------------------------------------------------------------------------------

	//search the parent of this component
	std::string parentIOR;
	bool findParent = false;
	for (int i = 0; i < m_instantedCompInfos.size(); ++i) {
		if (strcmp(dcp.getCompositePartOfDeviceID(),
		           m_instantedCompInfos[i].id.c_str()) == 0) {
			parentIOR = m_instantedCompInfos[i].compIOR;
			findParent = true;
		}
	}

	if (!findParent) {
		DEBUG(1, DeviceManager_impl, "In instantCompositepartComp can't \
				find parent device, it maybe parent device failed to \
				instantiate")
		return false;
	}

	std::vector<SPDImplementation*> * spdImpls =
	    spdParser.getImplementations();
	CF::ExecutableDevice_var exDev = CF::ExecutableDevice::_nil();
	if (dcp.isDeployOn()) {	//parent device load child device
		try {
			CORBA::Object_var obj =
			    m_orbWrap->ior_to_object(parentIOR.c_str());
			exDev = CF::ExecutableDevice::_narrow(obj.in());
		} catch (...) {
			DEBUG(1, DeviceManager_impl,
			      "In instantCompositepartComp resolve parentIOR failed")
			return false;
		}
		result = loadAndExecuteComponent(exDev, spdImpls, devInstId.c_str(),
		                                 devInstName.c_str(), devInstSftfl.c_str(),
		                                 parentIOR.c_str(), "");
	} else {		//run on cpu with DeviceManager
		ExecutableDevice_servant * exDevice = new ExecutableDevice_servant();
		result = loadAndExecuteComponent(exDevice, spdImpls, devInstId.c_str(),
		                                 devInstName.c_str(), devInstSftfl.c_str(),
		                                 parentIOR.c_str(), "");
		delete exDevice;
	}

	if (!result)
		return false;

	CF::Device_var devVar = CF::Device::_nil();
	if (0 == strcmp("MHAL_Device", devInstName.c_str())) {
		result = initAndConfigComp(prfParser, devInstName.c_str(),
		                           devVar, exDev.in());
	} else {
		result = initAndConfigComp(prfParser, devInstName.c_str(), devVar);
	}

	if (!result)
		return false;

	//registering device with deviceManager
	DEBUG(3, DeviceManager_impl, "registering device:" << devInstName)

	if (devVar->_non_existent() && CORBA::is_nil(devVar)) {
		DEBUG(1, DeviceManager,
		      "[DeviceManager::instantCompositepartComp] registering device \
		      reference is not existent ")
		return false;
	}

	try {
		registerDevice(CF::Device::_duplicate(devVar));
	} catch (CF::InvalidObjectReference & _ex) {
		DEBUG(5, DeviceManager, "[DeviceManager::instantCompositepartComp] While\
		 registering Device: " << _ex.msg)
		return false;
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::instantCompositepartComp] While registering \
		      Device: Unknown Exception")
		return false;
	}

	InstantedCompInfoType instantedCompInfo;
	instantedCompInfo.id = devInstId;
	instantedCompInfo.name = devInstName;
	instantedCompInfo.compIOR = m_orbWrap->object_to_ior(devVar.in());
	instantedCompInfo.compType = Device;
	m_instantedCompInfos.push_back(instantedCompInfo);

	DEBUG(2, DeviceManager_impl, "instantCompositepartComp success.")
}

/**
 *@brief  instantiate all components in partitioning section of dcd.xml
 *
 *	the progress of instantiate DCDComps consiste of following step:
 *	1.parsering spd.xml and prf.xml
 *	2.load binary code.
 *	3.excute code loaded.
 *	4.configure configurable and allocation properties.
 *	5.register device with devicemanager.
 */
void
DeviceManager_impl::instantDCDComps()
throw (std::runtime_error, CORBA::SystemException) {
	DEBUG(3, DeviceManager_impl, "In instantDCDComps.")

	CF::File_var dcd = CF::File::_nil();
	try {
		dcd = openprofileFile(m_fileSys.in(),
		                       m_deviceConfigurationProfile.c_str());
	} catch (CF::InvalidObjectReference & ex) {
		DEBUG(3, DeviceManager_impl, "In instantDCDComps call openProfileFile \
			failed with " << ex.msg)
		throw std::runtime_error("occur CF::InvalidObjectReference Exception");
	} catch (CF::InvalidFileName & ex) {
		DEBUG(3, DeviceManager_impl, "In instantDCDComps call openProfileFile \
			failed with " << ex.msg)
		throw std::runtime_error("occur CF::InvalidFileName Exception");
	} catch (CORBA::SystemException & ex) {
		DEBUG(3, DeviceManager_impl, "In instantDCDComps call openProfileFile \
			failed with " << ex.completed())
		throw std::runtime_error("occur Unkown Exception");
	}

	std::string contextNaming = "OpenSCA_Domain/" + m_nodeName;
	if (m_orbWrap->bind_new_context_with_string(contextNaming.c_str()) == false)
		throw CF::LifeCycle::InitializeError();

	contextNaming += "/" + m_label;
	if (m_orbWrap->bind_new_context_with_string(contextNaming.c_str()) == false)
		throw CF::LifeCycle::InitializeError();

	//-----------------------------------------------------------------------------------
	//launch general components without compositepartof or deployondevice attribute,
	//include load, execute, configure, initialize those devices
	//-----------------------------------------------------------------------------------
	DCDParser dcdParser(dcd.in());
	std::vector<DCDComponentPlacement*> compPlaces =
	    *(dcdParser.getComponentPlacements());
	for (unsigned int num_comp_plac(0); num_comp_plac < compPlaces.size();
	        ++num_comp_plac) {
		try {
			instantGeneralComp(*compPlaces[num_comp_plac], &dcdParser);
		} catch (std::runtime_error & ex) {
			DEBUG(1, DeviceManager_impl, "when call instantGeneralComp occur \
				exception " << ex.what())
			throw std::runtime_error(ex);
		} catch (CORBA::SystemException & ex) {
			DEBUG(1, DeviceManager_impl, "when call instantGeneralComp occur \
				unkown exception " << ex.completed())
			throw std::runtime_error(
			    "instantGeneralComp occur unkown exception");
		}
	}

	//-----------------------------------------------------------------------------------
	//launch compositepartof components, and those components maybe consiste of deployondevice
	//component.
	//include load, execute, configure, initialize those devices
	//-----------------------------------------------------------------------------------
	std::vector<unsigned int> compositeCompPlacesIndex;
	std::vector<DCDComponentPlacement*> aggrCompPlaces =
	    *(dcdParser.getCompositepartofComponents());
	for (unsigned int num_comp_plac(0); num_comp_plac < aggrCompPlaces.size();
	        ++num_comp_plac) {
		bool hasinstanted = false;
		//if current device is composite, and has been instanted.
		for (unsigned int k = 0; k < compositeCompPlacesIndex.size(); k++) {
			if (num_comp_plac == compositeCompPlacesIndex[k]) {
				hasinstanted = true;
				break;
			}
		}

		if (hasinstanted) {
			continue;
		}

		//check if composite device hasn't been instanted.
		for (unsigned int i = num_comp_plac + 1; i < aggrCompPlaces.size();
		        ++i) {
			if (0 != strcmp(
			            aggrCompPlaces[num_comp_plac]->getCompositePartOfDeviceID(),
			            aggrCompPlaces[i]->getInstantiationId())) {
				continue;
			}

			instantCompositepartComp(
			             *(aggrCompPlaces[i]), &dcdParser);

			compositeCompPlacesIndex.push_back(i);
		}

		instantCompositepartComp(
		             *(aggrCompPlaces[num_comp_plac]), & dcdParser);
	}
}

void
DeviceManager_impl::createConnections(
    std::vector <Connection *> * connections) {
	DEBUG(3, DeviceManager_impl, "In createConnections.")

	//clear old connection info from local variable: connectionsinfo
	m_connectionsInfo.clear();

	if (!connections) {
		DEBUG(5, DeviceManager_impl, "connections from sad.xml is null")
		throw "connections from sad.xml is null";
	}

	DEBUG(5, DeviceManager_impl, "total connections is " << connections->size())

	//loop to establish connections
	for (unsigned int numCont = 0; numCont < connections->size();
	        numCont++) {

		Connection* connect = (*connections)[numCont];

		std::string connectId = connect->getID();

		DEBUG(5, DeviceManager_impl, "Creating connection: " << connectId)

		if ((connect->getExternalUsesPorts()).size() >= 2
		        || (connect->getExternalProvidePorts()).size() >= 2) {
			continue;
		}

		//get provides port info for id and ref
		std::string providName = "";

		//CF::PPort_ptr provid_port = CF::PPort::_nil();
		CORBA::Object_var providesObjRef = CORBA::Object::_nil();

		try {
			getProvidesPort(providName, providesObjRef, connect);
		} catch (...) {
			DEBUG(5, DeviceManager_impl,
			      "call getProvidesPort occur unknow exception...")
		}

		//get uses port info for id and ref
		std::string usesName = "";

		CF::PPort_var usesPort = CF::PPort::_nil();

		try {
			getUsesPort(usesName, usesPort, connect);
		} catch (...) {
			DEBUG(5, DeviceManager_impl,
			      "call getUsesPort occur unknow exception...")
		}

		// Create connection
		try {
			if (CORBA::is_nil(usesPort) || CORBA::is_nil(providesObjRef)) {
				continue;
			}

			usesPort->connectPort(providesObjRef, connect->getID());
		} catch (...) {
			DEBUG(1, DeviceManager_impl,"[DeviceManager_impl::createConnections] \"usesPort->connectPort\" \
					failed with Unknown Exception for connection ID " << connect->getID())
			exit(1);
		}
		//modfied by victor at 20170819
		m_connectionsInfo.push_back(
		    new UsesConnectionInfo(usesPort, connect->getID()));

		// Output ConnectionID
		DEBUG(3, DeviceManager_impl, "Creating Connection " << connect->getID());
	}//for (unsigned int numCont=0; numCont<connections->size(); numCont++)
}

void
DeviceManager_impl::getUsesPort(
    std::string & usesPortName,
    CF::PPort_var & portPtr,
    const Connection * connect) {
	DEBUG(3, DeviceManager_impl, "In getUsesPort.")

	UsesPort* usesPort = connect->getUsesPort();
	if (usesPort == NULL) {
		DEBUG(3, DeviceManager_impl,
		      "while create connection: failed to get uses port.")
	}

	//usesport_id = usesPort->getID();
	usesPortName = usesPort->getFindBy()->getFindByNamingServiceName();

	CF::Resource_ptr usesportDev = CF::Resource::_nil();
	if (usesPort->isFindBy()) {
		//assume that component findby is "DomainName1/appname/componentname"
		//in naming service.
		std::string compFindbyName = "";
		compFindbyName.append("OpenSCA_Domain/");
		compFindbyName.append(m_nodeName);
		compFindbyName.append("/");

		FindBy* findby = usesPort->getFindBy();
		compFindbyName.append(findby->getFindByNamingServiceName());

		CORBA::Object_ptr usesObj = CORBA::Object::_nil();

		bool getPort = false;
		int count = 0;
		while (count < 5) {
			++count;
			try {
				usesObj = m_orbWrap->get_object_from_string(compFindbyName.c_str());
			} catch (...) {
				DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getUsesPort\
					]" << "m_orbWrap->get_object_from_string\" failed with Unknown Exception.")
				sleep(1);
				continue;
			}

			//portPtr = usesObj;
			try {
				portPtr = CF::PPort::_narrow(usesObj);
			} catch (...) {
				DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getUsesPort\
					]"<< "CF::Resource::_narrow\" failed with Unknown Exception.")
				exit(EXIT_FAILURE);
			}
		}

		if (!getPort)
			exit(EXIT_FAILURE);

	} else if (usesPort->isComponentInstantiationRef()) {
		std::string devId = usesPort->getComponentInstantiationRefID();

		bool foundDev = false;

		for (unsigned int i = 0; i < m_registeredDevices.length(); i++) {
			if (strcmp(devId.c_str(), m_registeredDevices[i]->identifier())
			        == 0) {
				foundDev = true;
				usesportDev = m_registeredDevices[i];
				break;
			}
		}
		if (!foundDev) {
			DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getUsesPort]" << "\
				Can't found uses port: " << usesPortName << "by ComponentInstantiationRef")
			return;
		}

		//get uses port from component ref by port_id
		//portPtr = CF::PPort::_nil();
		CORBA::Object_ptr objPtr = CORBA::Object::_nil();
		try {
			objPtr = usesportDev->getPort(usesPortName.c_str());
		} catch (...) {
			DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getUsesPort\
				]" << "\"providesDev->getPort\" " << usesPortName)
		}

		if (!CORBA::is_nil(objPtr)) {
			portPtr = CF::PPort::_narrow(objPtr);
		} else {
			DEBUG(1, DeviceManager_impl,"[DeviceManager_impl::getUsesPort\
				]" << "narrow port failed.")
		}

	} else {
		DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getUsesPort\
			]"  << "Can't found uses port: " << usesPortName)
	}
}

void
DeviceManager_impl::getProvidesPort(
    std::string & providesPortName,
    CORBA::Object_var & providesObj,
    const Connection * connect) {
	DEBUG(3, DeviceManager_impl, "In getProvidesPort.")

	if (!connect) {
		DEBUG(3, DeviceManager_impl, "connect is nil")
		return;
	}

	ProvidesPort * providesPort = connect->getProvidesPort();
	if (providesPort == NULL) {
		DEBUG(3, DeviceManager_impl,
		      "while create connection: failed to get provides port.")
	}

	DEBUG(3, DeviceManager_impl, "begin to get findbynaming.")
	providesPortName = providesPort->getFindBy()->getFindByNamingServiceName();

	DEBUG(3, DeviceManager_impl, " has got providesPortName.")
	CF::Resource_ptr providesDev = CF::Resource::_nil();
	if (providesPort->isFindBy()) {
		//assume that component findby is "OpenSCA_Domain/componentname" in
		//naming service
		std::string compFindbyName = "OpenSCA_Domain/" + m_nodeName + "/";

		FindBy* findby = providesPort->getFindBy();
		compFindbyName.append(findby->getFindByNamingServiceName());

		DEBUG(3, DeviceManager_impl, "begin to resovle port naming")
		CORBA::Object_ptr providesPtr = CORBA::Object::_nil();

		bool getPort = false;
		int count = 0;
		while (count < 5) {
			++count;
			try {
				providesPtr = m_orbWrap->
				              get_object_from_string(compFindbyName.c_str());
			} catch (...) {
				DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getProvidesPort\
					]" <<"m_orbWrap->get_object_from_string failed with " << compFindbyName.c_str())
				sleep(1);
				continue;
			}
			providesObj = providesPtr;
			getPort = true;
			break;
		}

		if (!getPort)
			exit(EXIT_FAILURE);

	} else if (providesPort->isComponentInstantiationRef()) {
		std::string devId = providesPort->getComponentInstantiationRefID();

		bool foundDev = false;

		for (unsigned int i = 0; i < m_registeredDevices.length(); i++) {
			if (0 == strcmp(devId.c_str(),
			                m_registeredDevices[i]->identifier())) {
				foundDev = true;
				providesDev = m_registeredDevices[i];
				break;
			}
		}
		if (!foundDev) {
			DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getProvidesPort\
				]" << "Can't found component by ComponentInstantiationRef")
			return;
		}

		CORBA::Object_ptr objPtr = CORBA::Object::_nil();
		try {
			objPtr = providesDev->getPort(providesPortName.c_str());
		} catch (...) {
			DEBUG(1, DeviceManager_impl,"[DeviceManager_impl::getProvidesPort\
				]" << "providesDev->getPort" << " in connection: " << providesPort->getID())
		}
		if (!CORBA::is_nil(objPtr)) {
			providesObj = objPtr;
		} else {
			DEBUG(1, DeviceManager_impl, "[DeviceManager_impl::getProvidesPort\
				]" << "narrow port failed.")
		}

	} else {
		DEBUG(1, DeviceManager_impl,"[DeviceManager_impl::createConnections\
			]" <<"Can't found provides port in connection: " << providesPort->getID())
	}
}

DeviceManager_impl::~DeviceManager_impl() {
	delete m_orbWrap;
}

void
DeviceManager_impl::getDmnMgrref(
    const char * dmnMgrName) {
	DEBUG(5, DeviceManager_impl::getDmnMgrref, "dmnMgrName is :" << dmnMgrName)

	if (dmnMgrName == NULL) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::getDmnMgrref] invalid input parameter")
		return;
	}

	DEBUG(7, DeviceManager, "In getDmnMgrref")

	std::string cosName = "OpenSCA_Domain";
	cosName.append("/");
	cosName.append(dmnMgrName);

	DEBUG(7, DeviceManager_impl,
	      "In getDmnMgrref will call to m_orbWrap->get_object_from_string")
	CORBA::Object_ptr _obj =
	    m_orbWrap->get_object_from_string(cosName.c_str());

	if (CORBA::is_nil(_obj)) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::getDmnMgrref]fail to obtain dominmanager ref.")
		return;
	}
	try {
		m_dmnMgr = CF::DomainManager::_narrow(_obj);
	} catch (CORBA::Exception & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::getDmnMgrref]failed to narrow ref with")
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::getDmnMgrref]failed to narrow ref with\
			unknown exception")
	}

	DEBUG(7, DeviceManager_impl, "leaving getDmnMgrref.")
}

char *
DeviceManager_impl::deviceConfigurationProfile()
throw (CORBA::SystemException) {
	return CORBA::string_dup(m_deviceConfigurationProfile.c_str());
}

CF::FileSystem_ptr DeviceManager_impl::fileSys()
throw (CORBA::SystemException) {
	return m_fileSys._retn();
}

char *
DeviceManager_impl::getComponentImplementationId(
    const char * componentInstantiationId)
throw (CORBA::SystemException) {
	return NULL;
}

char *
DeviceManager_impl::identifier()
throw (CORBA::SystemException) {
	return CORBA::string_dup(m_identifier.c_str());
}

char *
DeviceManager_impl::label()
throw (CORBA::SystemException) {
	return CORBA::string_dup(m_label.c_str());
}

/**
 * The registerDevice operation provides the mechanism to register a device with a
 * device manager.
 * The registerDevice operation shall add the input registeringDevice to the
 * DeviceManager registeredDevices attribute when the input registeringDevice
 * does not already exist in the registeredDevices attribute. The registeringDevice
 * is ignored when duplicated.The registerDevice operation shall register the
 * registeringDevice with the domain manager when the device manager has already
 * registered to the domain manager and the registeringDevice has been successfully
 * added to the DeviceManager registeredDevices attribute.
 * The registerDevice operation shall write a FAILURE_ALARM log record to a domain
 * manager's log, upon unsuccessful registration of a device to theDeviceManager
 * registeredDevices attribute.
 */
void
DeviceManager_impl::registerDevice(
    CF::Device_ptr registeringDevice)
throw (
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	DEBUG(3, DeviceManager, "In registerDevice.")

	if (CORBA::is_nil(registeringDevice)) {
		DEBUG(3, DeviceManager,
		      "In registerDevice and registeringDevice is nil")

		throw CF::InvalidObjectReference("[DeviceManager::registerDevice] \
		        Cannot register Device. registeringDevice is a nil reference.");
	}

	// Register the device with the Device manager, unless it is already registered.
	if (!deviceIsRegistered(registeringDevice)) {
		DEBUG(3, DeviceManager_impl::registerDevice,
		      "device id: " << registeringDevice->identifier())
		CORBA::ULong size = m_registeredDevices.length();
		m_registeredDevices.length(size + 1);
		m_registeredDevices[size] = registeringDevice;
	}

	DEBUG(3, DeviceManager, " leaving registerDevice.")
}

CF::DeviceSequence *
DeviceManager_impl::registeredDevices()
throw (
    CORBA::SystemException) {
	CF::DeviceSequence_var regedDevs;
	try {
		regedDevs = new CF::DeviceSequence(m_registeredDevices);
	} catch (CORBA::SystemException & e) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::registeredDevices]CORBA::SystemException")
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager_impl::registeredDevices]Unknown Exception")
	}

	return regedDevs._retn();
}

/**
 * The registerService operation provides the mechanism to register a service with
 * a device manager.
 * The registerService operation shall add the input registeringService to the
 * DeviceManager registeredServices attribute when the input registeringService does
 * not already exist in the registeredServices attribute. The registeringService is
 * ignored when duplicated. The registerService operation shall register the
 * registeringService with the domain manager when the device manager has already
 * registered to the domain manager and the registeringService has been successfully
 * added to the DeviceManager's registeredServices attribute.
 * The registerService operation shall write a FAILURE_ALARM log record, upon
 * unsuccessful registration of a service to the DeviceManager registeredServices
 * attribute.
 */
void
DeviceManager_impl::registerService(
    CORBA::Object_ptr registeringService,
    const char * name)
throw (
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	//This release does not support services
	if (CORBA::is_nil(registeringService)) {
		//writeLogRecord(FAILURE_ALARM,invalid reference input parameter.);
		throw (CF::InvalidObjectReference(
		           "Cannot register Device. registeringDevice is a nil reference."));
		return;
	}

	//The registerService operation shall add the input registeringService
	//to the DeviceManagers registeredServices attribute when the input
	//registeringService does not already exist in the registeredServices
	//attribute. The registeringService is ignored when duplicated.
	if (!serviceIsRegistered(name)) {
		CORBA::ULong size = m_registeredServices.length();
		m_registeredServices.length(size + 1);
		m_registeredServices[size].serviceObject =
		    CORBA::Object::_duplicate(registeringService);
		m_registeredServices[size].serviceName = CORBA::string_dup(name);
	}

	//The registerService operation shall register the registeringService
	//with the DomainManager when the DeviceManager has already registered
	//to the DomainManager and the registeringService has been successfully
	//added to the DeviceManagers registeredServices attribute.
	if (m_adminState == DEVMGR_REGISTERED) {
		try {
			m_dmnMgr->registerService(registeringService,
			                          POA_CF::DeviceManager::_this(), name);
		} catch (CORBA::SystemException & se) {
			std::cout << "[DeviceManager::registerService] \
				dmnMgr->registerService failed with \
				CORBA::SystemException" << std::endl;
			exit(EXIT_FAILURE);
		} catch (...) {
			std::cout << "[DeviceManager::registerService] \
				dmnMgr->registerService failed with \
				Unknown Exception" << std::endl;
			exit(EXIT_FAILURE);
		}
	}
}

CF::DeviceManager::ServiceSequence *
DeviceManager_impl::registeredServices()
throw (
    CORBA::SystemException) {
	CF::DeviceManager::ServiceSequence_var regedServs;

	try {
		regedServs = new CF::DeviceManager::ServiceSequence(
		    m_registeredServices);
	} catch (CORBA::SystemException & e) {
		std::cout << "[DeviceManager_impl::registeredServices] \
			CORBA::SystemException" << std::endl;
	} catch (...) {
		std::cout << "[DeviceManager_impl::registeredServices] \
			Unknown Exception" << std::endl;
	}
	return regedServs._retn();
}

/**
 * @brief The shutdown operation provides the mechanism to terminate a device manager.
 * The shutdown operation shall unregister the device manager from the domain
 * manager. The shutdown operation shall perform releaseObject on all of the device
 * manager's registered devices (DeviceManager registeredDevices attribute).
 * The shutdown operation shall cause the device manager to be unavailable (i.e.
 * released from the CORBA environment and its process terminated on the OS), when
 * all of the device manager's registered devices are unregistered from the
 * device manager.
 */
void 
DeviceManager_impl::shutdown()
throw (CORBA::SystemException) {
	m_adminState = DEVMGR_SHUTTING_DOWN;

	//The shutdown operation shall unregister the DeviceManager
	//from the DomainManager.
	try {
		m_dmnMgr->unregisterDeviceManager(
		    POA_CF::DeviceManager::_this()); ///\bug This looks wrong.
	} catch (CF::InvalidObjectReference & ior) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::shutdown] dmnMgr->unregisterDeviceManager\
			    failed with CF::InvalidObjectReference")
		exit(EXIT_FAILURE);
	} catch (CORBA::SystemException & se) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::shutdown] dmnMgr->unregisterDeviceManager\
			    failed with CORBA::SystemException")
		exit(EXIT_FAILURE);
	} catch (...) {
		DEBUG(5, DeviceManager,
		      "[DeviceManager::shutdown] dmnMgr->unregisterDeviceManager\
			    failed with Unknown Exception")
		exit(EXIT_FAILURE);
	}

	//The shutdown operation shall perform releaseObject on all
	//of the DeviceManagers registered
	//Devices (DeviceManagers registeredDevices attribute).
	for (int i = m_registeredDevices.length() - 1; i >= 0; i--) {
		//Important Note: It is necessary to manage the lenght of
		//the m_registeredDevices sequence otherwise, some elements
		//in the sequence will be null. m_registeredDevices[i]->label ();
		CF::Device_var tempDev =
		    CF::Device::_duplicate(m_registeredDevices[i]);
		//m_registeredDevices[i]->releaseObject();
		unregisterDevice (m_registeredDevices[i]);
		try {
			tempDev->releaseObject();
		} catch (CORBA::SystemException & se) {
			DEBUG(5, DeviceManager,
			      "[DeviceManager::shutdown] tempDev->releaseObject \
			    failed with CORBA::SystemException")
			exit(EXIT_FAILURE);
		} catch (...) {
			DEBUG(5, DeviceManager,
			      "[DeviceManager::shutdown] tempDev->releaseObject \
			    failed with Unknown Exception")
			exit(EXIT_FAILURE);
		}
	}

	std::string contextNaming = "OpenSCA_Domain/" + m_nodeName + "/" + m_label;
	CORBA::Object_ptr obj =
	    m_orbWrap->get_object_from_string(contextNaming.c_str());
	CosNaming::NamingContext_ptr nc = CosNaming::NamingContext::_nil();

	try {
		nc = CosNaming::NamingContext::_narrow(obj);
	} catch (CosNaming::NamingContext::InvalidName & ex) {
		std::cerr << "[DeviceManager::releaseObject]"<< " occure InvalidName Exception" << std::endl;
		throw CF::LifeCycle::ReleaseError();
	} catch (...) {
		std::cerr << "[DeviceManager::releaseObject]"<< " occure Unknown Exception" << std::endl;
		throw CF::LifeCycle::ReleaseError();
	}

	try {
		m_orbWrap->destory_context(nc);
	} catch (CosNaming::NamingContext::NotEmpty) {
		std::cerr << "[DeviceManager::releaseObject] \
			NamingContext to be destroy is not empty" << std::endl;
		throw CF::LifeCycle::ReleaseError();
	} catch (...) {
		std::cerr << "[DeviceManager::releaseObject] \
			Unknown Exception" << std::endl;
		throw CF::LifeCycle::ReleaseError();
	}

	//ubind name from domain
	try {
		m_orbWrap->unbind_string(contextNaming.c_str());
	} catch (...) {
		std::cerr << "[DeviceManager::releaseObject] \
			unbing_string with Unknown  Exception" << std::endl;
		throw CF::LifeCycle::ReleaseError();
	}
}

/**
 * The unregisterDevice operation unregisters a device from a device manager.
 */
void
DeviceManager_impl::unregisterDevice(
    CF::Device_ptr registeredDevice)
throw (
    CF::InvalidObjectReference,
    CORBA::SystemException) {
	bool deviceFound = false;
	if (CORBA::is_nil(registeredDevice)) {
		//|| !deviceIsRegistered(registeredDevice) )
		//The unregisterDevice operation shall write a FAILURE_ALARM
		//log record, when it cannot successfully remove a registeredDevice
		//from the DeviceManagers registeredDevices.

		//The unregisterDevice operation shall raise the CF
		//InvalidObjectReference when the input registeredDevice is a nil
		//CORBA object reference or does not exist in the DeviceManagers
		//registeredDevices attribute.
		/*writeLogRecord(FAILURE_ALARM,invalid reference input parameter.); */
		throw (CF::InvalidObjectReference(
		           "Cannot unregister Device. registeringDevice is a nil reference."));
		return;
	}

	//The unregisterDevice operation shall remove the input registeredDevice from the
	//DeviceManagers registeredDevices attribute.

	//Look for registeredDevice in m_registeredDevices
	for (unsigned int i = 0; i < m_registeredDevices.length(); i++) {
		if (0 != strcmp(m_registeredDevices[i]->identifier(),
		                registeredDevice->identifier())) {
			continue;
		}

		//when the appropiater device is found, remove it from
		//the m_registeredDevices sequence
		deviceFound = true;
		if (m_adminState == DEVMGR_REGISTERED) {
			try {
				m_dmnMgr->unregisterDevice(
				    CF::Device::_duplicate(registeredDevice));
			} catch (CORBA::SystemException & se) {
				DEBUG(5, DeviceManager,
				      "[DeviceManager::unregisterDevice] dmnMgr->\
				      unregisterDevice failed with CORBA::SystemException")
				exit(EXIT_FAILURE);
			} catch (...) {

				DEBUG(5, DeviceManager,
				      "[DeviceManager::unregisterDevice] dmnMgr->\
				      unregisterDevice failed with Unknown Exception")
				exit(EXIT_FAILURE);
			}
			CORBA::release(registeredDevice);
		}

		for (unsigned int j = i; j < m_registeredDevices.length() - 1; j++) {
			//The unregisterDevice operation shall unregister the input
			//registeredDevice from the DomainManager when the input
			//registeredDevice is registered with the DeviceManager and
			//the DeviceManager is not shutting down.
			m_registeredDevices[j] = m_registeredDevices[j + 1];
		}
		//m_registeredDevices[m_registeredDevices.length() - 1] = 0;
		m_registeredDevices.length(m_registeredDevices.length() - 1);
		break;
	}

	if (!deviceFound) {
		/*writeLogRecord(FAILURE_ALARM,invalid reference input parameter.) */
		throw (CF::InvalidObjectReference(
		           "Cannot unregister Device. egisteringDevice was not registered."));
		return;
	}
}


/**
 * The unregisterService operation unregisters a service from a device manager.
 * The unregisterService operation shall remove the input registered service
 * specified by the input name parameter from the DeviceManager::registeredServices
 * attribute. The unregisterService operation shall unregister the input unregistering
 * service from the domain manager when the device manager is not in the SHUTTING_DOWN
 * state. The unregisterService operation shall write a FAILURE_ALARM log record, when
 * it cannot successfully remove a registeredService from the DeviceManager registeredServices
 * attribute.
 */
void
DeviceManager_impl::unregisterService(
    CORBA::Object_ptr registeredService,
    const char * name)
throw (CF::InvalidObjectReference, CORBA::SystemException) {
	if (CORBA::is_nil(registeredService)) {
		/*writeLogRecord(FAILURE_ALARM,invalid reference input parameter.) */
		throw (CF::InvalidObjectReference(
		           "Cannot unregister Service. registeringService is a nil reference."));
		return;
	}

	//The unregisterService operation shall remove the input registeredService
	//from the DeviceManagers registeredServices attribute. The
	//unregisterService operation shall unregister the input registeredService
	//from the DomainManager when the input registeredService is
	//registered with the DeviceManager and the DeviceManager is not in the
	//shutting down state.

	//Look for registeredService in m_registeredServices
	for (unsigned int i = 0; i < m_registeredServices.length(); i++) {
		if (0 != strcmp(m_registeredServices[i].serviceName, name)) {
			continue;
		}

		//when the appropiater device is found, remove it from the
		//m_registeredDevices sequence
		if (m_adminState == DEVMGR_REGISTERED) {
			try {
				m_dmnMgr->unregisterService(registeredService, name);
			} catch (CORBA::SystemException& se) {
				DEBUG(5, DeviceManager,
				      "[DeviceManager::unregisterService] dmnMgr->\
				      unregisterService failed with CORBA::SystemException")
				exit(EXIT_FAILURE);
			} catch (...) {
				DEBUG(5, DeviceManager,
				      "[DeviceManager::unregisterService] dmnMgr->\
				      unregisterService failed with Unknown Exception")
				exit(EXIT_FAILURE);
			}
		}

		for (unsigned int j = i; j < m_registeredServices.length() - 1; j++) {
			CORBA::release(registeredService);
			m_registeredServices[j] = m_registeredServices[j + 1];
		}
		m_registeredServices.length(m_registeredServices.length() - 1);
		return;
	}

	//If it didn't find registeredDevice, then throw an exception
	/*writeLogRecord(FAILURE_ALARM,invalid reference input parameter.);*/
	throw (CF::InvalidObjectReference(
	           "Cannot unregister Service.registeringService was not registered."));
}

/**
 * @brief The operation shall check whether the device is registered.
 */
bool
DeviceManager_impl::deviceIsRegistered(
    CF::Device_ptr registeredDevice) {
	DEBUG(5, DeviceManager_impl::deviceIsRegistered, "enter in...")

	//Look for registeredDevice in m_registeredDevices
	for (unsigned int i = 0; i < m_registeredDevices.length(); i++) {
		if (0 == strcmp(m_registeredDevices[i]->identifier(),
		                registeredDevice->identifier())) {
			DEBUG(5, DeviceManager_impl::deviceIsRegistered, "leave...")
			return true;
		}
	}

	DEBUG(5, DeviceManager_impl::deviceIsRegistered, "leave...")
	return false;
}

bool
DeviceManager_impl::serviceIsRegistered(
    const char * name) {
	DEBUG(5, DeviceManager_impl::serviceIsRegistered, "enter in...")

	//Look for registeredDevice in m_registeredDevices
	for (unsigned int i = 0; i < m_registeredServices.length(); i++) {
		if (0 == strcmp(m_registeredServices[i].serviceName, name)) {
			DEBUG(5, DeviceManager_impl::serviceIsRegistered, " true leave...")
			return true;
		}
	}

	DEBUG(5, DeviceManager_impl::serviceIsRegistered, "false leave...")
	return false;
}
