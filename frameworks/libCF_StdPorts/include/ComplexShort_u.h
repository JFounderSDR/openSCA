/***************************************************************************//**
* @file     ComplexShort_u.h
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

#ifndef COMPLEXSHORT_U_H
#define COMPLEXSHORT_U_H

#include <string>
#include <vector>
#include "PortTypesS.h"
#include "CFS.h"
#include "ComplexShortS.h"
#include "openscaSupport.h"

//Forward declaration
namespace ComplexShort {
class UsesPort;
class ConnectionInfo;
}

namespace StandardInterfaces_i {

class ComplexShort_u {
    friend class ComplexShort::UsesPort;

  public:
    ComplexShort_u(
        const char * _portName);

    ComplexShort_u(
        const char * _PortName,
        const char * domainName);

    ~ComplexShort_u();

    CORBA::Object_ptr
    getPort(
        const char * _PortName);

    void
    pushPacket(
        const JTRS::ShortSequence & data_I,
        const JTRS::ShortSequence & data_Q); //add data to ComplexShort_p

  private:
    ComplexShort_u();

    ComplexShort_u(
        const ComplexShort_u & );

    std::string portName;
    //Uses port
    ComplexShort::UsesPort *data_servant;
    CF::PPort_var data_servant_var;
    //ComplexShort Resource buffer
    std::vector<ComplexShort::ConnectionInfo> dest_ports;
    //StandardInterfaces::ComplexShort_var _target;
};
}

namespace ComplexShort {
class UsesPort :
    public virtual POA_CF::PPort {

  public:
    UsesPort(
        StandardInterfaces_i::ComplexShort_u * _base);

    ~UsesPort();

    void
    connectPort(
        CORBA::Object_ptr connection,
        const char * connectionID);

    void
    disconnectPort(
        const char * connectionID);

  private:
    StandardInterfaces_i::ComplexShort_u *base;
};

class ConnectionInfo {
  public:
    ConnectionInfo(
        StandardInterfaces::ComplexShort_ptr _port,
        const char * _ID);

    ConnectionInfo(
        const ConnectionInfo & );

    const char *
    getID();

    void
    setPort(
        StandardInterfaces::ComplexShort_ptr _port);

    StandardInterfaces::ComplexShort_var port_obj;

  private:
    ConnectionInfo();  //No default constructor

    std::string identifier;
};
}

#endif /* ComplexShort_U_H */