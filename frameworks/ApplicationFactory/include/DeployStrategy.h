/***************************************************************************//**
* @file     DelpoyStrategy.h
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

#if !defined(EA_20547E25_3072_4f99_98B1_6200B5DA024B__INCLUDED_)
#define EA_20547E25_3072_4f99_98B1_6200B5DA024B__INCLUDED_

#include <iostream>
#include <vector>

#include "SADParser.h"
#include "PRFParser.h"
#include "SPDParser.h"
#include "CFS.h"
#include "openscaSupport.h"
#include "ApplicationFactorySupport.h"

/**
 * @brief The class used to describe the strategies of deploying componets,
 *        strategies are include dynamic allocation and static allocation.
 */
class DeployStrategy 
{
public:

	DeployStrategy();

	DeployStrategy(
		std::vector<CF::Device_ptr> regedDevs,
		std::vector<SADComponentPlacement*> * sadCompPlacs);

	virtual ~DeployStrategy();

	/**
	 * @brief The function is designed to create Deployment relation between 
	 * components and devices without device assignment.
	 */
	virtual std::vector<openscaSupport::ComponentInfo*>
	createDeployInfo() = 0;

	/**
	 * @brief The function is designed to create component deployment relations 
	 *        with devices according to Device Assignment Sequence.
	 */
	virtual std::vector<openscaSupport::ComponentInfo*>
	createDeployInfo(CF::DeviceAssignmentSequence devAssigSeq) = 0;

protected:
	std::vector < CF::Device_ptr> m_registeredDevices;
	std::vector <SADComponentPlacement*> * m_sadCompPlaces;
	SADParser * m_sadPar;

};

/**
 * @brief This class provides two kind of deploy Strategy. The first strategy is
 *        implemented by createDepoyInfo function without device assignment, it 
 *        consider of OS and processor and allocation properties. 
 *        well the second strategy is implemented by ceateDeployInfo with device 
 *        assignement other one without device assignments. It mainly verify device 
 *        capacity is suitable for component deploy dependences.
 */
class BaseDeployStrategy :
public virtual DeployStrategy {
public:
	BaseDeployStrategy(
		std::vector<CF::Device_ptr> regedDevs,
		SADParser * sadPar,
		CF::FileManager_ptr fileMgr,
		std::vector<SADComponentPlacement*> * sadCompPlacs);

	virtual ~BaseDeployStrategy();

	/**
	 * @brief The function is designed to create Deployment relation between 
	 *        components and devices without device assignedment.
	 */
	std::vector<openscaSupport::ComponentInfo*>
	createDeployInfo();
	/**
	 * @brief The function is designed to create component deployment relations 
	 *        with devices according to Device Assignment Sequence.
	 */
	std::vector<openscaSupport::ComponentInfo*>
	createDeployInfo(CF::DeviceAssignmentSequence devAssigSeq);

protected:
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
	matchOtherPropsToDevice(
		const CF::Device_ptr registeredDevice,
		const std::vector<PRFProperty*> * matchProps);

	bool 
	matchSinglePropToDevice(
		PRFProperty * prop,
		CORBA::Any devPropValAny);

	template <class T>
	bool
	isPropMatched(
		T devProp, 
		T compProp, 
		PRFProperty * prop);

	void 
	setComponentInfo(
		openscaSupport::ComponentInfo * compInfo,
		SADComponentInstantiation * sadCompInst,
		SPDImplementation * spdImp);

	bool
	matchOSToDevice(
		const CF::Device_ptr registeredDevice,
		openscaSupport::ComponentInfo * compInfo);

	bool
	matchProcessorToDevice(
		const CF::Device_ptr registeredDevice,
		openscaSupport::ComponentInfo * compInfo);

	void
	getPropertyFromPRF(
		openscaSupport::ComponentInfo * compinfo,
		std::vector<PRFProperty*> & matchingProps,
		PRFParser * _prfParser);

	void
	getCompInfoFromSCD(
		const char * _scdflPath,
		openscaSupport::ComponentInfo * compinfo);

	void
	getDevCapsFromDPD(
		const char * dpdprfl,
		std::vector<PRFProperty*> * capacityProps);

	SPDParser *
	getSpdParser(
		SADComponentPlacement * sadCompPlace,
		std::string & spd_path);

	PRFParser *
	getPrfParser(
		openscaSupport::ComponentInfo * compInfo);

	bool
	getCompInfo(
		openscaSupport::ComponentInfo * compInfo,
		SADComponentPlacement * sadCompPlace,
		std::string & spd_path,
		SPDParser * spdParser);

	bool
	matchSpecificCompWithDev(
		openscaSupport::ComponentInfo * compInfo,
		CF::Device_ptr dev,
		std::vector<PRFProperty*> & matchingProps);

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
	deployAffinityComponents(
		const std::vector<std::string> & affinityComponents,
		CF::Device_ptr dev);

private:
	CF::FileManager_var m_fileMgr;
	std::vector<openscaSupport::ComponentInfo*> m_allCompsInfo;
	std::string m_sdrRoot;

	//No default constructor
	BaseDeployStrategy();

	//No copying constructor
	BaseDeployStrategy(
		BaseDeployStrategy & baseDS);
};
#endif // !defined(EA_20547E25_3072_4f99_98B1_6200B5DA024B__INCLUDED_)
