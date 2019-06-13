/***************************************************************************//**
* @file     RealShort_u.h
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

#ifndef REALSHORT_U_H
#define REALSHORT_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "RealShortS.h"
#include "openscaSupport.h"

// Forward declaration
namespace RealShort {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class RealShort_u {
    friend class RealShort::UsesPort;

  public:
    RealShort_u(
        const char * portName);

    RealShort_u(
        const char * portName,
        const char * domainName);

    ~RealShort_u();

    CORBA::Object_ptr
    getPort(
        const char * portName);

    void
    pushPacket(
        const PortTypes::ShortSequence & I);

  private:
    RealShort_u();

    RealShort_u(
        const RealShort_u & );

    std::string portName;
    // Uses port
    RealShort::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    std::vector <RealShort::ConnectionInfo> dest_ports;
};
}

namespace RealShort {
class UsesPort :
    public virtual POA_CF::PPort {
  public:
    UsesPort(
        StandardInterfaces_i::RealShort_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::RealShort_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::RealShort_ptr _port,
        const char * _ID) :
        port_obj( _port), identifier(_ID) { };

    ConnectionInfo(
        const ConnectionInfo & c)
    { port_obj = c.port_obj; identifier = c.identifier;};

    void
    setPort(
        StandardInterfaces::RealShort_ptr _port)
    {port_obj = _port; };

    const char *
    getID()
    {return identifier.c_str(); };

    StandardInterfaces::RealShort_var port_obj;

  private:
    ConnectionInfo();  // No default constructor

    std::string identifier;
};
}

#endif