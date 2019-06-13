/***************************************************************************//**
* @file     MHAL_WF_u.h
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

#ifndef MHAL_WF_U_H
#define MHAL_WF_U_H

#include <string>
#include <vector>

#include "MHALInterfaceS.h"
#include "CFS.h"
#include "openscaSupport.h"

// Forward declaration
namespace MHAL_WF {
  class UsesPort;
  class ConnectionInfo;
}

namespace StandardInterfaces_i {

  class MHAL_WF_u {
    friend class MHAL_WF::UsesPort;

  public:
    MHAL_WF_u(
		const char * portName);
    MHAL_WF_u(
		const char * portName, 
		const char * domainName);
    ~MHAL_WF_u();

    CORBA::Object_ptr getPort(
		const char * portName);

    void 
	pushPacket(
		CORBA::UShort logicalDest,
		const ::JTRS::OctetSequence & payload);
		
    //add TX LD to route sequence for component
    void 
	setTxRoute(
		CORBA::UShort logicalDest);
    
  private:
    MHAL_WF_u();
    MHAL_WF_u(
		const MHAL_WF_u &);

    std::string portName;
    CORBA::UShort logicalDest;
    // Uses port
    MHAL_WF::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    std::vector <MHAL_WF::ConnectionInfo> dest_ports;
    CORBA::UShortSeq txRouteSeq;
  };
}

namespace MHAL_WF {

  class UsesPort : public virtual POA_CF::PPort {
  public:
    UsesPort(
		StandardInterfaces_i::MHAL_WF_u * _base);
    ~UsesPort();

    void 
	connectPort(
		CORBA::Object_ptr connection, 
		const char * connectionID);
		
    void 
	disconnectPort(
		const char * connectionID);

  private:
    StandardInterfaces_i::MHAL_WF_u * base;
  };


  class ConnectionInfo {
    public:
      ConnectionInfo(
		MHAL::PF_MHALPacketConsumer_ptr _port, 
		const char * _ID);
		
      ConnectionInfo(
		const ConnectionInfo & c) ;
      
      void 
	  setPort(
		MHAL::PF_MHALPacketConsumer_ptr _port) ;
      
      const char * 
	  getID() ;

      MHAL::PF_MHALPacketConsumer_var port_obj;

    private:
      ConnectionInfo();  // No default constructor

      std::string identifier;
    };
}

#endif
