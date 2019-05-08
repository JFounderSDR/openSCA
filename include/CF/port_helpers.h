/***************************************************************************//**
* @file     port_helpers.h
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

#if !defined(EA_47A605A4_1F6B_49a5_BF73_9CAEEEB6F29C__INCLUDED_)
#define EA_47A605A4_1F6B_49a5_BF73_9CAEEEB6F29C__INCLUDED_

#include "parser_helpers.h"

class FindBy;
class ProvidesPort;
class Port;
class UsesPort;
class ExternalPort;
class ComponentSupportedInterface;

/**
* this class is designed to parse connection element for DCD and SAD.
*/
class Connection {

  public:
	Connection(
	    TiXmlElement * connection);

	Connection(
	    const Connection & _conn);

	~Connection();

	ComponentSupportedInterface *
	getComponentSupportedInterface() const;

	FindBy *
	getFindBy() const;

	const char *
	getID();

	ProvidesPort *
	getProvidesPort() const;

	UsesPort *
	getUsesPort() const;

	std::vector<UsesPort* >
	getExternalUsesPorts();

	std::vector<ProvidesPort*>
	getExternalProvidePorts();

	bool
	isComponentSupportedInterface();

	bool
	isFindBy();

	bool
	isProvidesPort();

  protected:
	ComponentSupportedInterface * m_componentSupportedInterface;
	std::string m_connectionId;
	FindBy * m_findBy;
	bool m_ifComponentSupportedInterface;
	bool m_ifFindBy;
	bool m_ifProvidesPort;
	bool m_ifUsesPort;
	ProvidesPort * m_providesPort;
	UsesPort * m_usesPort;
	bool m_ifExternalUseConnect;
	bool m_ifExternalProvideConnect;
	std::vector<UsesPort *> m_externalUsesPorts;
	std::vector<ProvidesPort *> m_externalProvidesPorts;

	void
	parseElement(
	    TiXmlElement * elem);

  private:
	Connection();
};

class FindBy {

  public:
	FindBy(
	    TiXmlElement * element);

	FindBy(
	    const FindBy & _fb);

	~FindBy();

	const char *
	getFindByDomainFinderName();

	const char *
	getFindByDomainFinderType();

	const char *
	getFindByNamingServiceName();

	const char *
	getFindByStringifiedObjectRef();

	bool
	isFindByDomainFinder();

	bool
	isFindByNamingService();

	bool
	isFindByStringifiedObjectRef();

  private:
	std::string m_findByDomainFinderName;
	std::string m_findByDomainFinderType;
	std::string m_findByNamingService;
	std::string m_findByStringifiedObjectRef;
	bool m_ifFindByDomainFinder;
	/**
	* No default constructor
	*/
	bool m_ifFindByNamingService;
	bool m_ifFindByStringifiedObjectRef;

	FindBy();
	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseFindByDomainFinder(
	    TiXmlElement * elem);

	void
	parseFindByNamingService(
	    TiXmlElement * elem);

	void
	parseFindByStringifiedObjectRef(
	    TiXmlElement * elem);
};

class Port {

  public:
	Port(
	    TiXmlElement * prm1);

	Port();

	virtual ~Port();

	const char *
	getComponentInstantiationRefID();

	const char *
	getDeviceThatLoadedThisComponentRef();

	const char *
	getDeviceUsedByThisComponentRefID();

	const char *
	getDeviceUsedByThisComponentRefUsesRefID();

	FindBy *
	getFindBy() const;

	bool
	isComponentInstantiationRef() const;

	bool
	isDeviceThatLoadedThisComponentRef() const;

	bool
	isDeviceUsedByThisComponentRef() const;

	bool
	isFindBy() const;

  protected:
	std::string m_componentInstantiationRefId;
	std::string m_deviceThatLoadedThisComponentRefId;
	std::string m_deviceUsedByThisComponentRefId;
	std::string m_deviceUsedByThisComponentRefUsesRefId;
	FindBy * m_findBy;
	bool m_ifComponentInstantiationRef;
	bool m_ifDeviceThatLoadedThisComponentRef;
	bool m_ifDeviceUsedByThisComponentRef;
	bool m_ifFindBy;

	void
	parseComponentInstantiationRef(
	    TiXmlElement * elem);

	void
	parseDeviceThatLoadedThisComponentRef(
	    TiXmlElement * elem);

	void
	parseDeviceUsedByThisComponentRef(
	    TiXmlElement * elem);

	void
	parseFindBy(
	    TiXmlElement * elem);

	void
	parsePort(
	    TiXmlElement * elem);

  private:
	Port(
	    const Port & prm1);

};


class ProvidesPort : public Port {

  public:
	ProvidesPort(
	    TiXmlElement * element);

	ProvidesPort(
	    const ProvidesPort & _pp);

	~ProvidesPort();

	const char *
	getID();

  private:
	/**
	* No default constructor
	*/
	std::string m_identifier;

	ProvidesPort();

	void
	parseID(
	    TiXmlElement * _elem);
};

class UsesPort :
	public Port {
  public:
	UsesPort(
	    TiXmlElement * prm1);

	UsesPort(
	    const UsesPort & prm1);

	~UsesPort();

	const char *
	getID();

  private:
	std::string m_identifier;

	UsesPort();

	void
	parseID(
	    TiXmlElement * prm1);

};

class ExternalPort {

  public:
	ExternalPort(
	    TiXmlElement * elem);

	~ExternalPort();

	const char *
	getComponentInstantiationRefId();

	const char *
	getProvidesIdentifier();

	const char *
	getSupportedIdentifier();

	const char *
	getUsesIdentifier();

	bool
	isProvidesIdentifier();

	bool
	isSupportedIdentifier();

	bool
	isUsesIdentifier();

  protected:
	std::string m_componentInstantiationRefId;
	bool m_ifProvidesIdentifier;
	bool m_ifSupportedIdentifier;
	bool m_ifUsesIdentifier;
	std::string m_providesIdentifier;
	TiXmlElement * m_root;
	std::string m_supportedIdentifier;
	std::string m_usesIdentifier;

	void
	parseComponentInstantiationRefId(
	    TiXmlElement * elem);

	void
	parseElement(
	    TiXmlElement * elem);

	void
	parseProvidesIdentifier(
	    TiXmlElement * elem);

	void
	parseSupportedIdentifier(
	    TiXmlElement * elem);

	void
	parseUsesIdentifier(
	    TiXmlElement * elem);

  private:
	ExternalPort();
	/**
	 * No default constructor
	 */
	ExternalPort(
	    const ExternalPort & _EP);
};

#endif // !defined(EA_47A605A4_1F6B_49a5_BF73_9CAEEEB6F29C__INCLUDED_)