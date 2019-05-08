/***************************************************************************//**
* @file     RealDouble_u.h
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

#ifndef RealDouble_U_H
#define RealDouble_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "RealDoubleS.h"
#include "openscaSupport.h"

//Forward declaration
namespace RealDouble {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class RealDouble_u {
    friend class RealDouble::UsesPort;

  public:
    RealDouble_u(
        const char * _portName);

    RealDouble_u(
        const char * _PortName,
        const char * domainName);

    ~RealDouble_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const PortTypes::DoubleSequence & data); //add data to RealDouble_p

  private:
    RealDouble_u();

    RealDouble_u(
        const RealDouble_u & );

    std::string portName;
    //Uses port
    RealDouble::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //RealDouble Resource buffer
    std::vector<RealDouble::ConnectionInfo> dest_ports;
    //StandardInterfaces::RealDouble_var _target;
};
}

namespace RealDouble {
class UsesPort :
    public virtual POA_CF::PPort {
  public:
    UsesPort(
        StandardInterfaces_i::RealDouble_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::RealDouble_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::RealDouble_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::RealDouble_ptr _port);

    StandardInterfaces::RealDouble_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* RealDouble_U_H */