/***************************************************************************//**
* @file     MHAL_PF_u.h
* @author   open Team
* @version  9
* @date     2017-03-14
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

#ifndef MHAL_PF_U_H
#define MHAL_PF_U_H

#include <string>
#include <vector>

#include "MHALInterfaceS.h"
#include "openscaSupport.h"
#include "CFS.h"

// Forward declaration
namespace MHAL_PF {
  class UsesPort;
  class ConnectionInfo;
}

namespace StandardInterfaces_i {

class MHAL_PF_u {
	friend class MHAL_PF::UsesPort;

public:
	MHAL_PF_u(
		const char * portName);
	MHAL_PF_u(
		const char * portName, 
		const char * domainName);
		
	~MHAL_PF_u();

	CORBA::Object_ptr 
	getPort(
		const char * portName);

	void 
	pushPacket(
		CORBA::UShort logicalDest,
		const ::JTRS::OctetSequence & payload);

private:
	MHAL_PF_u();
	MHAL_PF_u(
		const MHAL_PF_u &);

	std::string portName;

	// Uses port
	MHAL_PF::UsesPort * data_servant;
	CF::PPort_var data_servant_var;
	std::vector <MHAL_PF::ConnectionInfo> dest_ports;
};

}

namespace MHAL_PF {

  class UsesPort : public virtual POA_CF::PPort {
  public:
    UsesPort(
		StandardInterfaces_i::MHAL_PF_u * _base);
		
    ~UsesPort();

    void connectPort(
		CORBA::Object_ptr connection, 
		const char * connectionID);
		
    void 
	disconnectPort(
		const char * connectionID);

  private:
    StandardInterfaces_i::MHAL_PF_u *base;
  };


  class ConnectionInfo {
    public:
      ConnectionInfo(
		MHAL::WF_MHALPacketConsumer_ptr _port, 
		const char * _ID);
		
      ConnectionInfo(
		const ConnectionInfo & c);
      
      void 
	  setPort( 
		MHAL::WF_MHALPacketConsumer_ptr _port) ;
      
      const char * 
	  getID();

      MHAL::WF_MHALPacketConsumer_var port_obj;

    private:
      ConnectionInfo();  // No default constructor

      std::string identifier;
    };
}
#endif
