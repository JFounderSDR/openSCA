/***************************************************************************//**
* @file     RealOctet_u.h
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

#ifndef REALOCTET_U_H
#define REALOCTET_U_H

#include <string>
#include <vector>
#include "utils.h"
#include "Boost_utils.h"
#include "PortTypesS.h"
#include "CFS.h"
#include "RealOctetS.h"
#include "openscaSupport.h"

// Forward declaration
namespace RealOctet {
  class UsesPort;
  class ConnectionInfo;
}

namespace StandardInterfaces_i {

  class RealOctet_u {
    friend class RealOctet::UsesPort;

  public:
    RealOctet_u(
		const char * portName);
    RealOctet_u(
		const char * portName, 
		const char * domainName);
    ~RealOctet_u();

    CORBA::Object_ptr 
	getPort(
		const char * portName);

    void 
	pushPacket(
		const JTRS::OctetSequence & data);
    void 
	bufferEmptied();
	
  private:
    RealOctet_u();
    RealOctet_u(
		const RealOctet_u &);

    std::string portName;

    // Uses port
    RealOctet::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    std::vector <RealOctet::ConnectionInfo> dest_ports;
  };
}

namespace RealOctet {

  class UsesPort : public virtual POA_CF::PPort {
  public:
    UsesPort(
		StandardInterfaces_i::RealOctet_u * _base);
    ~UsesPort();

    void 
	connectPort(
		CORBA::Object_ptr connection, 
		const char * connectionID);
    void 
	disconnectPort(
		const char * connectionID);

  private:
    StandardInterfaces_i::RealOctet_u * base;
  };


  class ConnectionInfo {
    public:
      ConnectionInfo(
		StandardInterfaces::RealOctet_ptr _port, 
		const char * _ID);
      ConnectionInfo(
		const ConnectionInfo & c);
      
      void 
	  setPort(
		StandardInterfaces::RealOctet_ptr _port);
      
      const char * 
	  getID();

      StandardInterfaces::RealOctet_var port_obj;

    private:
      ConnectionInfo();  // No default constructor

      std::string identifier;
    };
}

#endif
