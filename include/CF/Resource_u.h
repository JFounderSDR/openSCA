/***************************************************************************//**
* @file     Resource_u.h
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

#ifndef __RESOURCE_PORT_U_H__
#define __RESOURCE_PORT_U_H__

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "openscaSupport.h"
#include "CFS.h"

// Forward declaration
namespace Resource {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class Resource_u {
    friend class Resource::UsesPort;

  public:
    Resource_u(
        const char * portName);

    Resource_u(
        const char * portName,
        const char * domainName);

    ~Resource_u();

    CORBA::Object_ptr
    getPort(
        const char * portName);

    std::vector <CF::Resource_ptr>
    getProvidesPorts();

  private:
    Resource_u();

    Resource_u(
        const Resource_u & );

    std::string portName;
    // Uses port
    Resource::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    std::vector <Resource::ConnectionInfo> dest_ports;
};
}

namespace Resource {

class UsesPort :
    public virtual POA_CF::PPort {
  public:
    UsesPort(
        StandardInterfaces_i::Resource_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

    StandardInterfaces_i::Resource_u *
    getBasePort();

  private:
    StandardInterfaces_i::Resource_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        CF::Resource_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & c);

    void
    setPort(
        CF::Resource_ptr _port);

    const char *
    getID();

    CF::Resource_var port_obj;

  private:
    ConnectionInfo();  // No default constructor

    std::string identifier;
};
}

#endif //__RESOURCE_PORT_U_H__