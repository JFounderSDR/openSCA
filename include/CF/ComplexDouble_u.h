/***************************************************************************//**
* @file     ComplexDouble_u.h
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

#ifndef ComplexDouble_U_H
#define ComplexDouble_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "ComplexDoubleS.h"
#include "openscaSupport.h"

//Forward declaration
namespace ComplexDouble {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class ComplexDouble_u {
    friend class ComplexDouble::UsesPort;

  public:
    ComplexDouble_u(
        const char * _portName);

    ComplexDouble_u(
        const char * _PortName,
        const char * domainName);

    ~ComplexDouble_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const PortTypes::DoubleSequence & data_I,
        const PortTypes::DoubleSequence & data_Q); //add data to ComplexDouble_p

  private:
    ComplexDouble_u();

    ComplexDouble_u(
        const ComplexDouble_u & );

    std::string portName;

    //Uses port
    ComplexDouble::UsesPort * data_servant;
    CF::PPort_var data_servant_var;
    //ComplexDouble Resource buffer
    std::vector<ComplexDouble::ConnectionInfo> dest_ports;
    //StandardInterfaces::ComplexDouble_var _target;
};
}

namespace ComplexDouble {
class UsesPort :
    public virtual POA_CF::PPort {

  public:
    UsesPort(
        StandardInterfaces_i::ComplexDouble_u *_base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::ComplexDouble_u * base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::ComplexDouble_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo &);

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::ComplexDouble_ptr _port);

    StandardInterfaces::ComplexDouble_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* ComplexDouble_U_H */