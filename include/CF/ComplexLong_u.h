/***************************************************************************//**
* @file     ComplexLong_u.h
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

#ifndef ComplexLong_U_H
#define ComplexLong_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "ComplexLongS.h"
#include "openscaSupport.h"

//Forward declaration
namespace ComplexLong {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {
class ComplexLong_u {
    friend class ComplexLong::UsesPort;

  public:
    ComplexLong_u(
        const char * _portName);

    ComplexLong_u(
        const char * _PortName,
        const char * domainName);

    ~ComplexLong_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const JTRS::LongSequence & data_I,
        const JTRS::LongSequence & data_Q); //add data to ComplexLong_p

  private:
    ComplexLong_u();

    ComplexLong_u(
        const ComplexLong_u & );

    std::string portName;
    //Uses port
    ComplexLong::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //ComplexLong Resource buffer
    std::vector<ComplexLong::ConnectionInfo> dest_ports;
    //StandardInterfaces::ComplexLong_var _target;
};
}

namespace ComplexLong {
class UsesPort :
    public virtual POA_CF::PPort {
  public:
    UsesPort(
        StandardInterfaces_i::ComplexLong_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::ComplexLong_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::ComplexLong_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::ComplexLong_ptr _port);

    StandardInterfaces::ComplexLong_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* ComplexLong_U_H */