/***************************************************************************//**
* @file     ComplexFloat_u.h
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

#ifndef ComplexFloat_U_H
#define ComplexFloat_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "ComplexFloatS.h"
#include "openscaSupport.h"

//Forward declaration
namespace ComplexFloat {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class ComplexFloat_u {
    friend class ComplexFloat::UsesPort;

  public:
    ComplexFloat_u(
        const char * _portName);

    ComplexFloat_u(
        const char * _PortName,
        const char * domainName);

    ~ComplexFloat_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const PortTypes::FloatSequence & data_I,
        const PortTypes::FloatSequence & data_Q); //add data to ComplexFloat_p

  private:
    ComplexFloat_u();

    ComplexFloat_u(
        const ComplexFloat_u & );

    std::string portName;
    //Uses port
    ComplexFloat::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //ComplexFloat Resource buffer
    std::vector<ComplexFloat::ConnectionInfo> dest_ports;
    //StandardInterfaces::ComplexFloat_var _target;
};
}

namespace ComplexFloat {
class UsesPort : public virtual POA_CF::PPort {

  public:
    UsesPort(
        StandardInterfaces_i::ComplexFloat_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::ComplexFloat_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::ComplexFloat_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::ComplexFloat_ptr _port);

    StandardInterfaces::ComplexFloat_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* ComplexFloat_U_H */