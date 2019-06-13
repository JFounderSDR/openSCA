/***************************************************************************//**
* @file     RealLong_u.cpp
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
#include "../include/RealLong_u.h"
#include "../include/debug.h"

StandardInterfaces_i::RealLong_u::RealLong_u(
    const char * _portName):
    portName(_portName) {
    data_servant = new RealLong::UsesPort(this);
    data_servant_var = data_servant->_this();

    openscaSupport::ORB_Wrap orb;
    std::string objName(_portName);

    orb.bind_object_to_string((CORBA::Object_ptr)data_servant_var, objName.c_str());
}

StandardInterfaces_i::RealLong_u::RealLong_u(
    const char * _portName,
    const char * domainName):
    portName(_portName) {
    openscaSupport::ORB_Wrap orb;

    data_servant = new RealLong::UsesPort(this);
    data_servant_var = data_servant->_this();

    std::string objName;
    objName  = domainName;
    objName.append("/");
    objName.append(_portName);

    std::cout << "[StandardInterfaces_i::RealLong_u::RealLong_u] objName = " <<
              objName << std::endl;

    orb.bind_object_to_string((CORBA::Object_ptr)data_servant_var, objName.c_str());
}

StandardInterfaces_i::RealLong_u::~RealLong_u() {
#ifdef _DEBUG
    std::cout << "Function ~RealLong_u" << std::endl;
#endif
}

CORBA::Object_ptr
StandardInterfaces_i::RealLong_u::getPort(
    const char * _portName) {
#ifdef _DEBUG
    std::cout << "[StandardInterfaces_i::RealLong_u::getPort] _portName:" <<
              _portName << std::endl;
    std::cout << "[StandardInterfaces_i::RealLong_u::getPort] portName:" << portName
              << std::endl;
#endif

    if (strcmp(_portName, portName.c_str()) == 0) {
        std::cout << "[StandardInterfaces_i::RealLong_u::getPort] _portName:" <<
                  _portName << std::endl;
        return CORBA::Object::_duplicate(data_servant_var);
    } else {
        return CORBA::Object::_nil();
    }
}

void
StandardInterfaces_i::RealLong_u::pushPacket(
    const JTRS::LongSequence & data) {
#ifdef _DEBUG
    std::cout << "entering RealLong_u pushPacket dest_ports.size()= " <<
              dest_ports.size() << std::endl;
#endif

    for (unsigned int i = 0; i < dest_ports.size(); i++) {
        std::cout << "entering RealLong_u pushPacket Loop i=" << i << std::endl;

        dest_ports[i].port_obj->pushPacket(data);
    }

    std::cout << "[StandardInterfaces_i::RealLong_u] leaving pushPacket " <<
              std::endl;
}

RealLong::UsesPort::UsesPort(
    StandardInterfaces_i::RealLong_u * _base):
    base(_base) {
#ifdef _DEBUG
    std::cout << "this is UsesPort construction" << std::endl;
#endif

}

RealLong::UsesPort::~UsesPort() {

}

void
RealLong::UsesPort::connectPort(
    CORBA::Object_ptr connection,
    const char * connectionID) {
    StandardInterfaces::RealLong_var p = StandardInterfaces::RealLong::_narrow(
            connection);

    if (CORBA::is_nil(p)) {
        std::cout << "[RealLong::UsesPort::connectPort] Port is not RealLong" <<
                  std::endl;
        return;
    }

    for (unsigned int i = 0; i < base->dest_ports.size(); i++) {
        if (strcmp(connectionID, base->dest_ports[i].getID()) == 0) {
            base->dest_ports[i].setPort(p);
            return;
        }
    }

    RealLong::ConnectionInfo c(p.in(), connectionID);
    base->dest_ports.push_back(c);

    std::cout <<
              "[RealLong::UsesPort::connectPort] leaving connectPort with connectionID" <<
              connectionID << std::endl;
}

void
RealLong::UsesPort::disconnectPort(
    const char * connectionID) {
    for (unsigned int i = 0; i < base->dest_ports.size(); i++) {
        if (strcmp(connectionID, base->dest_ports[i].getID()) == 0) {
            base->dest_ports.erase(base->dest_ports.begin() + i);
            return;
        }
    }

    DEBUG(5, RealLong::UsesPort::disconnectPort,
          "Attempted to disconnect non-existent connection: " << connectionID);
}

RealLong::ConnectionInfo::ConnectionInfo(
    StandardInterfaces::RealLong_ptr _ptr,
    const char * _ID) {
    port_obj = StandardInterfaces::RealLong::_duplicate(_ptr);

    identifier = _ID;
}

void
RealLong::ConnectionInfo::setPort(
    StandardInterfaces::RealLong_ptr _port) {
    port_obj = StandardInterfaces::RealLong::_duplicate(_port);
}

RealLong::ConnectionInfo::ConnectionInfo(
    const ConnectionInfo & c) {
    port_obj = c.port_obj;
    identifier = c.identifier;
}

const char *
RealLong::ConnectionInfo::getID() {
    return identifier.c_str();
}
