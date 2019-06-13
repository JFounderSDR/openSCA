/***************************************************************************//**
* @file     ComplexOctet_u.cpp
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
#include "../include/ComplexOctet_u.h"
#include "../include/debug.h"

StandardInterfaces_i::ComplexOctet_u::ComplexOctet_u(
    const char * _portName):
    portName(_portName) {
    data_servant = new ComplexOctet::UsesPort(this);
    data_servant_var = data_servant->_this();

    openscaSupport::ORB_Wrap orb;
    std::string objName(_portName);

    orb.bind_object_to_string((CORBA::Object_ptr)data_servant_var, objName.c_str());
}

StandardInterfaces_i::ComplexOctet_u::ComplexOctet_u(
    const char * _portName,
    const char * domainName):
    portName(_portName) {
    openscaSupport::ORB_Wrap orb;

    data_servant = new ComplexOctet::UsesPort(this);
    data_servant_var = data_servant->_this();

    std::string objName;
    objName  = domainName;
    objName.append("/");
    objName.append(_portName);

    std::cout << "[StandardInterfaces_i::ComplexOctet_u::ComplexOctet_u] objName = "
              << objName << std::endl;

    orb.bind_object_to_string((CORBA::Object_ptr)data_servant_var, objName.c_str());
}

StandardInterfaces_i::ComplexOctet_u::~ComplexOctet_u() {
#ifdef _DEBUG
    std::cout << "Function ~ComplexOctet_u" << std::endl;
#endif
}

CORBA::Object_ptr
StandardInterfaces_i::ComplexOctet_u::getPort(
    const char * _portName) {
#ifdef _DEBUG
    std::cout << "[StandardInterfaces_i::ComplexOctet_u::getPort] _portName:" <<
              _portName << std::endl;
    std::cout << "[StandardInterfaces_i::ComplexOctet_u::getPort] portName:" <<
              portName << std::endl;
#endif

    if (strcmp(_portName, portName.c_str()) == 0) {
        std::cout << "[StandardInterfaces_i::ComplexOctet_u::getPort] _portName:" <<
                  _portName << std::endl;
        return CORBA::Object::_duplicate(data_servant_var);
    } else {
        return CORBA::Object::_nil();
    }
}

void
StandardInterfaces_i::ComplexOctet_u::pushPacket(
    const JTRS::OctetSequence & data_I,
    const JTRS::OctetSequence & data_Q) {
#ifdef _DEBUG
    std::cout << "entering ComplexOctet_u pushPacket dest_ports.size()= " <<
              dest_ports.size() << std::endl;
#endif

    for (unsigned int i = 0; i < dest_ports.size(); i++) {
        std::cout << "entering ComplexOctet_u pushPacket Loop i=" << i << std::endl;

        dest_ports[i].port_obj->pushPacket(data_I, data_Q);
    }

    std::cout << "[StandardInterfaces_i::ComplexOctet_u] leaving pushPacket " <<
              std::endl;
}

ComplexOctet::UsesPort::UsesPort(
    StandardInterfaces_i::ComplexOctet_u *_base):
    base(_base) {
#ifdef _DEBUG
    std::cout << "this is UsesPort construction" << std::endl;
#endif

}

ComplexOctet::UsesPort::~UsesPort() {

}

void
ComplexOctet::UsesPort::connectPort(
    CORBA::Object_ptr connection,
    const char * connectionID) {
    StandardInterfaces::ComplexOctet_var p =
        StandardInterfaces::ComplexOctet::_narrow(connection);

    if (CORBA::is_nil(p)) {
        std::cout << "[ComplexOctet::UsesPort::connectPort] Port is not ComplexOctet" <<
                  std::endl;
        return;
    }

    for (unsigned int i = 0; i < base->dest_ports.size(); i++) {
        if (strcmp(connectionID, base->dest_ports[i].getID()) == 0) {
            base->dest_ports[i].setPort(p);
            return;
        }
    }

    ComplexOctet::ConnectionInfo c(p.in(), connectionID);
    base->dest_ports.push_back(c);

    std::cout <<
              "[ComplexOctet::UsesPort::connectPort] leaving connectPort with connectionID" <<
              connectionID << std::endl;
}

void
ComplexOctet::UsesPort::disconnectPort(
    const char * connectionID) {
    for (unsigned int i = 0; i < base->dest_ports.size(); i++) {
        if (strcmp(connectionID, base->dest_ports[i].getID()) == 0) {
            base->dest_ports.erase(base->dest_ports.begin() + i);
            return;
        }
    }

    DEBUG(5, ComplexOctet::UsesPort::disconnectPort,
          "Attempted to disconnect non-existent connection: " << connectionID);
}

ComplexOctet::ConnectionInfo::ConnectionInfo(
    StandardInterfaces::ComplexOctet_ptr _ptr,
    const char * _ID) {
    port_obj = StandardInterfaces::ComplexOctet::_duplicate(_ptr);

    identifier = _ID;
}

void
ComplexOctet::ConnectionInfo::setPort(
    StandardInterfaces::ComplexOctet_ptr _port) {
    port_obj = StandardInterfaces::ComplexOctet::_duplicate(_port);
}

ComplexOctet::ConnectionInfo::ConnectionInfo(
    const ConnectionInfo & c) {
    port_obj = c.port_obj;
    identifier = c.identifier;
}

const char *
ComplexOctet::ConnectionInfo::getID() {
    return identifier.c_str();
}
