/***************************************************************************//**
* @file     RealFloat_u.h
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

#ifndef RealFloat_U_H
#define RealFloat_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "RealFloatS.h"
#include "openscaSupport.h"

//Forward declaration
namespace RealFloat {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {
class RealFloat_u {
    friend class RealFloat::UsesPort;

  public:
    RealFloat_u(
        const char * _portName);

    RealFloat_u(
        const char * _PortName,
        const char * domainName);

    ~RealFloat_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const PortTypes::FloatSequence & data); //add data to RealFloat_p

  private:
    RealFloat_u();

    RealFloat_u(
        const RealFloat_u & );

    std::string portName;
    //Uses port
    RealFloat::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //RealFloat Resource buffer
    std::vector<RealFloat::ConnectionInfo> dest_ports;
    //StandardInterfaces::RealFloat_var _target;
};
}

namespace RealFloat {
class UsesPort : public virtual POA_CF::PPort {

  public:
    UsesPort(
        StandardInterfaces_i::RealFloat_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::RealFloat_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::RealFloat_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::RealFloat_ptr _port);

    StandardInterfaces::RealFloat_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* RealFloat_U_H */