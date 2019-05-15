/***************************************************************************//**
* @file     ApplicationFactory_impl.h
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

#if !defined(EA_5B42ED90_9A5D_42c6_934E_7DF3DF05CBB3__INCLUDED_)
#define EA_5B42ED90_9A5D_42c6_934E_7DF3DF05CBB3__INCLUDED_

#include "orbsvcs/CosEventCommS.h"

#include "DeployStrategy.h"
#include "ApplicationFactorySupport.h"
#include "SADParser.h"
#include "openscaSupport.h"
#include "CFS.h"
#include "Application_impl.h"
#include "utils.h"
#include "UsesConnectionInfo.h"
#include "Boost_utils.h"

class AppFactoryEventHandler;

/**
 * @brief The ApplicationFactory interface class provides an interface to request 
 *        the creation of a specific type of application in the domain.
 *        The ApplicationFactory interface class is designed using the Factory Design 
 *        Pattern. The software profile determines the type of application that is 
 *        created by the application factory.
 */
class ApplicationFactory_impl :
	public virtual POA_CF::ApplicationFactory {

  public:
	DeployStrategy * m_DelpoyStrategy;

	ApplicationFactory_impl(
	    const char * sftwpfl,
	    CF::DomainManager::ApplicationSequence * appSeqPtr);

	~ApplicationFactory_impl();

	/**
	 * @brief The create operation is used to create an application within the system 
	 *        domain. The create operation provides a client interface to request the 
	 *        creation of an application on client requested device(s) and/or the 
	 *        creation of an application in which the application factory determines 
	 *        the necessary device(s) required for instantiation of the application.
	 *        
	 * The create operation shall use the SPD implementation element to locate 
	 * candidate devices capable of loading and executing application software modules.
	 * 
	 * The create operation validates all component-device associations in the input 
	 * deviceAssignments parameter by verifying that the device indicated by the 
	 * assignedDeviceId element provides the necessary capacities and properties 
	 * required by the component indicated by the componentId element. Device 
	 * assignments should not be given for resources created via a resource factory
	 * since instantiation of these Resources is controlled by the creating 
	 * ResourceFactory.
	 * 
	 * The create operation shall perform the comparison of allocation properties of 
	 * the application to those of each candidate device, according to the allocation 
	 * property’s action element, for those application component properties whose 
	 * kindtype is allocation and whose action element is not external.
	 * 
	 * The create operation shall use the allocateCapacity operation to perform the 
	 * comparison of allocation properties of the application to those of each 
	 * candidate device for those application component properties whose kindtype is 
	 * allocation and whose action element is external
	 * 
	 * The create operation shall deallocate any capacity allocations on devices that 
	 * do not satisfy the application components allocation requirements or that are 
	 * not utilized due to an unsuccessful application creation.
	 * 
	 * The create operation shall load application modules onto devices that have been 
	 * granted successful capacity allocations and that satisfy the application 
	 * components allocation requirements.
	 *
	 * The create operation shall execute the application software modules as 
	 * specified in the application’s Software Assembly Descriptor (SAD) file. The 
	 * create operation shall use each software module’s SPD implementation code’s 
	 * stack size and priority elements, when specified, for the execute options 
	 * parameters.
	 * 
	 * The create operation shall include the mandatory execute parameters Naming 
	 * Context IOR, Name Binding, and Component Identifier, as described in this 
	 * section, in the parameters parameter of the ExecutableDevice::execute operation 
	 * when the CORBA instance’s componentinstantiation element of the SAD contains 
	 * a findcomponent element with a namingservice sub-element.
	 * 
	 * The execute parameter for the Naming Context IOR shall be a CF Properties 
	 * type with an id element set to "NAMING_CONTEXT_IOR" and a value element set to 
	 * the stringified IOR of the naming context to which the component will bind. 
	 * The create operation shall create any naming contexts that do not exist but 
	 * which are required for successful binding to the Naming Context IOR. The 
	 * structure of the naming context path shall be "/ DomainName / [optional
	 * naming context sequences]". In the naming context path, each "slash" (/) 
	 * represents a separate naming context.
	 *
	 * The Name Binding execute parameter shall be a CF Properties type with an id 
	 * element set to "NAME_BINDING" and a value element set to a string in the format 
	 * of "ComponentName_UniqueIdentifier". The ComponentName value is the SAD
	 * componentinstantiation findcomponent namingservice element’s name attribute. 
	 * The UniqueIdentifier is determined by the implementation. The Name Binding 
	 * parameter is used by the component to bind its object reference to the Naming 
	 * Context IOR parameter.
	 * 
	 * The Component Identifier execute parameter shall be a CF Properties type with 
	 * an id element set to "COMPONENT_IDENTIFIER" and a value element set to a string 
	 * in the format of “Component_Instantiation_Identifier: Application_Name”. The
	 * Component_Instantiation_Identifier is the componentinstantiation element id 
	 * attribute for the component in the application’s SAD file. The Application_Name 
	 * field shall be identical to the create operation’s input name parameter. 
	 * The Application_Name field provides a specific instance qualifier for executed 
	 * components.
	 * 
	 * The create operation shall pass the values of the “execparam” properties of 
	 * the componentinstantiation componentproperties element contained in the SAD, 
	 * as parameters to the execute operation. The create operation passes “execparam” 
	 * parameters values as string values.
	 * 
	 * Upon execution of a software module by the create operation, a Resource or a 
	 * ResourceFactory component shall register with the Naming Service. The create 
	 * operation uses "ComponentName_UniqueIdentifier" to retrieve the component’s 
	 * CORBA object reference from the Naming Context IOR.
	 * 
	 * The create operation obtains a resource in accordance with the SAD via the 
	 * CORBA Naming Service or a resource factory. The ResourceFactory object 
	 * reference is obtained by using the CORBA Naming Service. The create operation,
	 * when creating a resource from a resource factory, shall pass the 
	 * componentinstantiation componentresourcefactoryref element properties whose 
	 * kindtype element is factoryparam as the qualifiers parameter to the referenced
	 * ResourceFactory component’s createResource operation.
	 *
	 * The create operation shall, in order, initialize all application resources, 
	 * then establish connections for those resources, and finally configure the 
	 * application component indicated by the assemblycontroller element in the SAD. 
	 * The create operation connects the ports of the application resources with the 
	 * ports of other resources within the application as well as the devices and 
	 * services they use in accordance with the SAD.
	 * 
	 * The create operation shall establish connections for an application which are 
	 * specified in the SAD domainfinder element. The create operation obtains object 
	 * references to the required Port interfaces in via PortSupplier::getPort 
	 * operation. The create operation uses the SAD connectinterface element id 
	 * attribute as the unique identifier for a specific connection when provided. 
	 * The create operation creates a connection id when no SAD connectinterface 
	 * element id attribute is specified for a connection. For connections to an 
	 * event channel, the create operation shall connect a CosEventComm::PushConsumer 
	 * or CosEventComm::PushSupplier object to the event channel as specified in the 
	 * SAD's domainfinder element. The create operation shall create the specified 
	 * event channel if the event channel does not exist.
	 * 
	 * The create operation shall configure the application component indicated by the
	 * assemblycontroller element in the SAD if that component has properties with a 
	 * kindtype of “configure” and a mode of “readwrite” or “writeonly”. The create 
	 * operation shall use the union of the properties contained in the input 
	 * initConfiguration parameter of the create operation and the assembly 
	 * controller’s componentinstantiation element properties with a kindtype of
	 * “configure” and a mode of “readwrite” or “writeonly”. Values contained in the 
	 * input initConfiguration parameter shall have precedence over the values of the
	 * assembly controller’s componentinstantiation element properties when they 
	 * reference the same property.
	 * 
	 * The TestableObject::runTest operation (3.1.3.1.3.5.1), Resource::stop 
	 * operation (3.1.3.1.6.5.1), and Resource::start operation (3.1.3.1.6.5.1) are 
	 * not called at start-up.
	 * 
	 * The create operation shall return an Application object reference for the 
	 * created application when the application is successfully created.
	 *
	 * The create operation shall, upon successful application creation, write an
	 * ADMINISTRATIVE_EVENT log record.
	 * 
	 * The create operation shall, upon unsuccessful application creation, 
	 * write a FAILURE_ALARM log record.
	 * 
	 * The create operation shall send a DomainManagementObjectAddedEventType event 
	 * to the Outgoing Domain Management event channel upon successful creation of 
	 * an application. For this event:
	 * 		1. The producerId is the identifier attribute of the application factory.
	 * 		2. The sourceId is the identifier attribute of the created application.
	 * 		3. The sourceName is the name attribute of the created application.
	 * 		4. The sourceIOR is the object reference for the created application.
	 * 		5. The sourceCategory is “APPLICATION”.
	 *
	 * The following steps demonstrate one scenario of the behavior of an application 
	 * factory for the creation of an application:
	 * 		1. Client invokes the create operation.
	 * 		2. Evaluate the Domain Profile for available devices that meet the 
	 * 		   application’s memory and processor requirements, available dependent 
	 * 		   applications, and dependent libraries needed by the application. 
	 * 		   Create an instance of an Application, if the requested application can 
	 * 		   be created. Update the memory and processor utilization of the devices.
	 * 		3. Allocate the device(s) memory and processor utilization.
	 * 		4. Load the application software modules on the devices using the 
	 * 		   appropriate Device(s) interface provided the application software 
	 * 		   modules haven’t already been loaded.
	 * 		5. Execute the application software modules on the devices using the 
	 * 		   appropriate Device interface as indicated by the application’s 
	 * 		   software profile.
	 * 		6. Obtain the object reference (Resource or ResourceFactory) as described 
	 * 		   by the SAD.
	 * 		7. If the component obtained from the CORBA Naming Service is a resource 
	 * 		   factory as indicated by the SAD, then narrow the object reference to 
	 * 		   be a ResourceFactory component.
	 * 		8. If the component is a ResourceFactory, then create a resource using 
	 * 		   the ResourceFactory interface.
	 * 		9. If the components obtained from the Naming Services is a resource 
	 * 		   supporting the Resource interface as indicated by the SCDs, then 
	 * 		   narrow the components reference to Resource components.
	 * 		10. Initialize the resource.
	 * 		11. Get Port object references for the resources.
	 * 		12. Connect the ports that interconnect the resources’ ports together.
	 * 		13. Configure the assemblycontroller component using the Resource 
	 * 			interface.
	 * 		14. Return the Application object reference and log message.
	 * 		15. Generate an event to indicate the application has been added 
	 * 			to the domain.
	 *
	 * @param[in] name 					Name of the application created.
	 * @param[in] initConfiguration		Properties used to initialize the application.
	 * @param[in] deviceAssignments		A structure sequence that associates a 
	 * 									component with the device which the component 
	 * 									either uses, is loaded upon or on which it is 
	 * 									executed.
	 *
	 * @return 	The create operation returns a duplicated Application reference for 
	 *          the created application.
	 *
	 * @exception The create operation shall raise the CreateApplicationRequestError 
	 *            exception when the input CF DeviceAssignmentSequence parameter 
	 *            contains one (1) or more invalid application component to device 
	 *            assignment(s).
	 *            
	 *            The create operation shall raise the CreateApplicationError 
	 *            exception when the create request is valid but the application 
	 *            cannot be successfully instantiated due to internal processing 
	 *            error(s).
	 *            
	 *            The create operation shall raise the InvalidInitConfiguration 
	 *            exception when the input initConfiguration parameter is invalid. 
	 *            The InvalidInitConfiguration invalidProperties parameter shall 
	 *            identify the invalid properties.
	 */
	CF::Application_ptr
	create(
	    const char * name,
	    const CF::Properties & initConfiguration,
	    const CF::DeviceAssignmentSequence & deviceAssignments)
	throw (
	    CF::ApplicationFactory::InvalidInitConfiguration,
	    CF::ApplicationFactory::CreateApplicationRequestError,
	    CF::ApplicationFactory::CreateApplicationError,
	    CORBA::SystemException);

	/**
	 * @brief The operation shall return the unique identifier for an 
	 *        ApplicationFactory instance. The identifier shall be identical to the 
	 *        softwareassembly element id attribute of the application factory’s 
	 *        Software Assembly Descriptor file.
	 * 
	 * @return Identifier of the ApplicationFactory instance.
	 */
	char *
	identifier()
	{
		return  CORBA::string_dup(m_identifier.c_str());
	}

	/** 
	 * @brief The operation shall return the user-friendly name of the application 
	 *        instantiated by an application factory. The name attribute shall be 
	 *        identical to the softwareassembly element name attribute of the 
	 *        application’s Software Assembly Descriptor file.
	 *
	 * @return Name of the application instantiated by an application factory.
	 */
	char*
	name()
	{
		return  CORBA::string_dup( m_factoryName.c_str() );
	}

	/**
	 * @brief The operation returns the Profile Descriptor for the application that 
	 *        is created by the application factory.
	 *        The readonly softwareProfile attribute shall contain a profile element 
	 *        (Profile Descriptor) with a file reference to the application’s 
	 *        SAD file. Files referenced within the profile are obtained via
	 *        FileManager.
	 *
	 * @return Profile Descriptor for the application that is created by the 
	 *         application factory.
	 */
	char*
	softwareProfile()
	{
		return  CORBA::string_dup( m_softwareProfile.c_str() );
	}

	friend class AppFactoryEventHandler;
	/*	friend void AppFactoryEventHandler::disconnect_push_consumer();

		friend void AppFactoryEventHandler::push(const CORBA::Any& prm1)
				throw (CosEventComm::Disconnected, CORBA::SystemException);*/

  private:
	unsigned char m_instanceNum;
	std::string m_appNameWithInstanceNum;
	std::string m_identifier;
	std::string m_factoryName;
	std::string m_appName;
	SADParser * m_sadParser;
	std::string m_softwareProfile;
	CF::DomainManager::ApplicationSequence * m_appSeqPtr;
	std::vector <UsesConnectionInfo *> m_connectionsInfo;
	std::vector <openscaSupport::ComponentInfo *> m_deployCompsInfo;
	CF::DomainManager_ptr m_dmnMgr;
	CF::FileManager_var m_fileMgr;
	openscaSupport::ORB_Wrap * m_orbWrap;
	std::vector <CF::Device_ptr> m_registeredDevices;

	CF::Application::ComponentElementSequence * m_appNamingCtxs;
	CF::Application::ComponentElementSequence * m_appCompImpls;
	CF::Application::ComponentProcessIdSequence * m_appCompProcIds;

	CF::Resource_ptr m_assemblyController;

	void 
	postConstructor();

	bool 
	generateDeployInformation(
		DeployStrategy* deployStg,
		std::vector <SADComponentPlacement*> * sadComplaces,
		const CF::DeviceAssignmentSequence & deviceAssignments);

	bool 
	instantiateApplication(
		const CF::DeviceAssignmentSequence & deviceAssignments,
		CF::Application_var & appVar);

	bool 
	getObjectRefFromNamingService(
		const char * cosName,
		CORBA::Object_ptr & obj);

	bool 
	loadComponentCodeFile(
		CF::FileSystem_ptr fs,
		CF::Device_ptr device,
		const char * binaryFileName,
		CF::LoadableDevice::LoadType loadType);

	CF::ExecutableDevice::ProcessID_Type
	executeComponentProcess(
		CF::Device_ptr device,
		const char * binaryFileName,
		const CF::Properties & options,
		const CF::Properties & parameters);

	void
	getComponentExecOptions(
		openscaSupport::ComponentInfo * component,
		CF::Properties & options);

	void
	getComponentExecParameters(
		openscaSupport::ComponentInfo * component,
		CF::Properties & parameters,
		const char * fsroot);

	unsigned int 
	getFileSystemIndex(
		CF::FileManager::MountSequence_var mts,
		const char * fileName);

	/**
	 * @brief	The operation shall get uses port of a connection.
	 * @param[inout] usesPortName	Name of uses port.
	 * @param[inout] portPtr		Object reference of the uses port.
	 * @param[in]	 connect		Connection need established.
	 */
	void
	getUsesPort(
	    std::string & usesPortName,
	    CF::PPort_var & usesPort,
	    const Connection * connect);

	/**
	 * @brief	The operation shall get provides port of a connection.
	 * @param[inout] providesPortName	Name of provides port.
	 * @param[inout] providesObj		Object reference of the provides port.
	 * @param[in]	 connect			Connection need established.
	 */
	void
	getProvidesPort(
	    std::string & providName,
	    CORBA::Object_var & providesport,
	    const Connection * connect);

	/**
	 * @brief The operation check whether the port is provides port of MHAL Device.
	 *
	 * @param[in] portName	Name of the port.
	 *
	 * @return Whether the port is provides port of MHAL Device.
	 * @retval true		The port is provides port of MHAL Device.
	 * @retval false	The port is not provides port of MHAL Device.
	 */
	bool
	isMhalDevProvidesPort(
	    const std::string & portName);

	/**
	 * @brief The operation check whether the port is uses port of MHAL Device.
	 *
	 * @param[in] portName	Name of the port.
	 *
	 * @return Whether the port is uses port of MHAL Device.
	 * @retval true		The port is uses port of MHAL Device.
	 * @retval false	The port is not uses port of MHAL Device.
	 */
	bool
	isMhalDevUsesPort(
	    const std::string & portName);

	/**
	 * @brief	The operation shall get mhal device's provides port.
	 * @param[inout] providesObj		Object reference of the provides port.
	 * @param[in]	 connect			Connection need established.
	 * @param[inout] portNameId			Id of the provides port.
	 */
	void
	getMhalDevProvidesPort(
	    CORBA::Object_var & provideObj,
	    const Connection * connect,
	    const std::string & portNameId);

	/**
	 * @brief	The operation shall get mhal device's uses port.
	 * @param[inout] usesObj		Object reference of the uses port.
	 * @param[in]	 connect		Connection need established.
	 * @param[inout] portNameId		Id of the uses port.
	 */
	void
	getMhalDevUsesPort(
	    CORBA::Object_var & usesObj,
	    const Connection * connect,
	    const std::string & portNameId);

	/**
	 * @brief The operation shall create a Nameing Context used to bind application's
	 *        components instances. 
	 */
	void
	createAppNamingCtx();

	/**
	 * @brief	The operation shall establish connections between components 
	 *        	and devices.
	 */
	bool
	createConnections();

	void
	getRegisteredDevices();

	/**
	 * @The operation shall load and execute component's code.
	 *
	 * @param[in] pids Sequence of ComponentProcessId, the ComponentProcessIdType 
	 * 				   defines a type for associating a component with its process ID.
	 */
	void
	loadAndExecuteComps(
	    CF::Application::ComponentProcessIdSequence * pids);

	CF::Device_ptr
	find_device_from_id(
	    const char * deviceId);

	/**
	 * @brief	The operation shall initialize and configure propertise for the 
	 *        	component instance.
	 *
	 * @param[in] initConfigurations Properties used to configure the component.
	 */
	bool
	initializeAndConfigureRsrcComps(
	    const CF::Properties & initConfigurations);

	ApplicationFactory_impl();		// NO default constructor
	//No copying constructor
	ApplicationFactory_impl(
	    ApplicationFactory_impl & prm1);

	void updateInstanceNum();

	//@brief
	//convert UUID(DCE::233f-324lfs-32wefe:1) to id with instance num. the last num is instance num
	//@return
	//id with instance num
	std::string
	getIdentifierWithInstanceNum(
	    const std::string & scaid);

	bool
	isValidOfSCAId(
	    const std::string & scaid);

	void 
	lock();

	void
	unlock();
};
#endif // !defined(EA_5B42ED90_9A5D_42c6_934E_7DF3DF05CBB3__INCLUDED_)