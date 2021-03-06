/***************************************************************************//**
* @file     ComplexLong_u.cpp
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

#include <iostream>
#include "../include/ComplexLong_u.h"
#include "../include/debug.h"

StandardInterfaces_i::ComplexLong_u::ComplexLong_u(
    const char * _portName):
    portName(_portName) {
    data_servant = new ComplexLong::UsesPort(this);
    data_servant_var = data_servant->_this();

    openscaSupport::ORB_Wrap orb;
    std::string objName(_portName);

    orb.bind_object_to_string((CORBA::Object_ptr)data_servant_var, objName.c_str());
}

StandardInterfaces_i::ComplexLong_u::ComplexLong_u(
    const char * _portName,
    const char * domainName):
    portName(_portName) {
    openscaSupport::ORB_Wrap orb;

    data_servant = new ComplexLong::UsesPort(this);
    data_servant_var = data_servant->_this();

    std::string objName;
    objName  = domainName;
    objName.append("/");
    objName.append(_portName);

    orb.bind_object_to_string((CORBA::Object_ptr)data_servant_var, objName.c_str());
}

StandardInterfaces_i::ComplexLong_u::~ComplexLong_u() {
#ifdef _DEBUG
    std::cout << "Function ~ComplexLong_u" << std::endl;
#endif
}

CORBA::Object_ptr
StandardInterfaces_i::ComplexLong_u::getPort(
    const char * _portName) {
#ifdef _DEBUG
    std::cout << "[StandardInterfaces_i::ComplexLong_u::getPort] _portName:" <<
              _portName << std::endl;
    std::cout << "[StandardInterfaces_i::ComplexLong_u::getPort] portName:" <<
              portName << std::endl;
#endif

    if (strcmp(_portName, portName.c_str()) == 0) {
        std::cout << "[StandardInterfaces_i::ComplexLong_u::getPort] _portName:" <<
                  _portName << std::endl;
        return CORBA::Object::_duplicate(data_servant_var);
    } else {
        return CORBA::Object::_nil();
    }
}

void
StandardInterfaces_i::ComplexLong_u::pushPacket(
    const JTRS::LongSequence & data_I,
    const JTRS::LongSequence & data_Q) {
#ifdef _DEBUG
    std::cout << "entering ComplexLong_u pushPacket dest_ports.size()= " <<
              dest_ports.size() << std::endl;
#endif

    for (unsigned int i = 0; i < dest_ports.size(); i++) {
        std::cout << "entering ComplexLong_u pushPacket Loop i=" << i << std::endl;

        dest_ports[i].port_obj->pushPacket(data_I, data_Q);
    }

    std::cout << "[StandardInterfaces_i::ComplexLong_u] leaving pushPacket " <<
              std::endl;
}

ComplexLong::UsesPort::UsesPort(
    StandardInterfaces_i::ComplexLong_u * _base):
    base(_base) {
#ifdef _DEBUG
    std::cout << "this is UsesPort construction" << std::endl;
#endif

}

ComplexLong::UsesPort::~UsesPort() {

}

void
ComplexLong::UsesPort::connectPort(
    CORBA::Object_ptr connection,
    const char * connectionID) {
    StandardInterfaces::ComplexLong_var p =
        StandardInterfaces::ComplexLong::_narrow(connection);

    if (CORBA::is_nil(p)) {
        std::cout << "[ComplexLong::UsesPort::connectPort] Port is not ComplexLong" <<
                  std::endl;
        return;
    }

    for (unsigned int i = 0; i < base->dest_ports.size(); i++) {
        if (strcmp(connectionID, base->dest_ports[i].getID()) == 0) {
            base->dest_ports[i].setPort(p);
            return;
        }
    }

    ComplexLong::ConnectionInfo c(p.in(), connectionID);
    base->dest_ports.push_back(c);

    std::cout <<
              "[ComplexLong::UsesPort::connectPort] leaving connectPort with connectionID" <<
              connectionID << std::endl;
}

void
ComplexLong::UsesPort::disconnectPort(
    const char * connectionID) {
    for (unsigned int i = 0; i < base->dest_ports.size(); i++) {
        if (strcmp(connectionID, base->dest_ports[i].getID()) == 0) {
            base->dest_ports.erase(base->dest_ports.begin() + i);
            return;
        }
    }

    DEBUG(5, ComplexLong::UsesPort::disconnectPort,
          "Attempted to disconnect non-existent connection: " << connectionID);
}

ComplexLong::ConnectionInfo::ConnectionInfo(
    StandardInterfaces::ComplexLong_ptr _ptr,
    const char * _ID) {
    port_obj = StandardInterfaces::ComplexLong::_duplicate(_ptr);

    identifier = _ID;
}

void
ComplexLong::ConnectionInfo::setPort(
    StandardInterfaces::ComplexLong_ptr _port) {
    port_obj = StandardInterfaces::ComplexLong::_duplicate(_port);
}

ComplexLong::ConnectionInfo::ConnectionInfo(
    const ConnectionInfo & c) {
    port_obj = c.port_obj;
    identifier = c.identifier;
}

const char *
ComplexLong::ConnectionInfo::getID() {
    return identifier.c_str();
}
