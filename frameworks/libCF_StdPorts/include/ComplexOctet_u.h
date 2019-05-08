/***************************************************************************//**
* @file     ComplexOctet_u.h
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

#ifndef COMPLEXCHAR_U_H
#define COMPLEXCHAR_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "ComplexOctetS.h"
#include "openscaSupport.h"

//Forward declaration
namespace ComplexOctet {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class ComplexOctet_u {
    friend class ComplexOctet::UsesPort;

  public:
    ComplexOctet_u(
        const char * _portName);

    ComplexOctet_u(
        const char * _PortName,
        const char * domainName);

    ~ComplexOctet_u();

    CORBA::Object_ptr
    getPort(const char * _PortName);

    void
    pushPacket(
        const JTRS::OctetSequence & data_I,
        const JTRS::OctetSequence &  data_Q); //add data to ComplexOctet_p

  private:
    ComplexOctet_u();

    ComplexOctet_u(
        const ComplexOctet_u & );

    std::string portName;
    //Uses port
    ComplexOctet::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //ComplexOctet Resource buffer
    std::vector<ComplexOctet::ConnectionInfo> dest_ports;
    //StandardInterfaces::ComplexOctet_var _target;
};
}

namespace ComplexOctet {
class UsesPort : public virtual POA_CF::PPort {
  public:
    UsesPort(
        StandardInterfaces_i::ComplexOctet_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::ComplexOctet_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::ComplexOctet_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::ComplexOctet_ptr _port);

    StandardInterfaces::ComplexOctet_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* ComplexOctet_U_H */