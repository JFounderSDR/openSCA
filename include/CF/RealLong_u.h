/***************************************************************************//**
* @file     RealLong_u.h
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

#ifndef REALLONG_U_H
#define REALLONG_U_H

#include <string>
#include <vector>

#include "PortTypesS.h"
#include "CFS.h"
#include "RealLongS.h"
#include "openscaSupport.h"

//Forward declaration
namespace RealLong {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class RealLong_u {
    friend class RealLong::UsesPort;

  public:
    RealLong_u(
        const char * _portName);

    RealLong_u(
        const char * _PortName,
        const char * domainName);

    ~RealLong_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const JTRS::LongSequence & data); //add data to RealLong_p

  private:
    RealLong_u();

    RealLong_u(
        const RealLong_u & );

    std::string portName;
    //Uses port
    RealLong::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //RealLong Resource buffer
    std::vector<RealLong::ConnectionInfo> dest_ports;
    //StandardInterfaces::RealLong_var _target;
};
}

namespace RealLong {
class UsesPort : public virtual POA_CF::PPort {

  public:
    UsesPort(
        StandardInterfaces_i::RealLong_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::RealLong_u *  base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::RealLong_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::RealLong_ptr _port);

    StandardInterfaces::RealLong_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* REALLONG_U_H */