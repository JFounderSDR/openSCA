/***************************************************************************//**
* @file     RealShort_p.cpp
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
#include "../include/RealShort_u.h"
#include "../include/debug.h"

StandardInterfaces_i::RealShort_u::RealShort_u(
    const char * _portName) {
    portName = _portName;

    data_servant = new RealShort::UsesPort(this);
    data_servant_var = data_servant->_this();
}

StandardInterfaces_i::RealShort_u::RealShort_u(
    const char * _name,
    const char * _domain) :
    portName(_name) {
    openscaSupport::ORB_Wrap orb;

    data_servant = new RealShort::UsesPort(this);
    data_servant_var = data_servant->_this();

    std::string objName;
    objName = _domain;
    objName += "/";
    objName += _name;

    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var,
                              objName.c_str());
}

StandardInterfaces_i::RealShort_u::~RealShort_u() {

}

CORBA::Object_ptr
StandardInterfaces_i::RealShort_u::getPort(
    const char * _portName) {
    if (portName == _portName) {
        return CORBA::Object::_duplicate(data_servant_var);
    } else {
        return CORBA::Object::_nil();
    }
}

void
StandardInterfaces_i::RealShort_u::pushPacket(
    const PortTypes::ShortSequence & I) {
    for (unsigned int i = 0; i < dest_ports.size(); ++i) {
        dest_ports[i].port_obj->pushPacket(I);
    }
}

RealShort::UsesPort::UsesPort(
    StandardInterfaces_i::RealShort_u *  _base) :
    base(_base) {

}

RealShort::UsesPort::~UsesPort() {

}

void
RealShort::UsesPort::connectPort(
    CORBA::Object_ptr connection,
    const char * connectionID) {
    StandardInterfaces::RealShort_ptr p = StandardInterfaces::RealShort::_narrow(
            connection);
    if (CORBA::is_nil(p)) {
        std::cout << "Print port is not RealShort" << std::endl;
        return;
    }

    for (unsigned int i = 0; i < base->dest_ports.size(); ++i) {
        if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) {
            base->dest_ports[i].setPort(p);
            return;
        }
    }

    RealShort::ConnectionInfo c(p, connectionID);
    base->dest_ports.push_back(c);

}

void
RealShort::UsesPort::disconnectPort(
    const char * connectionID) {
    for (unsigned int i = 0; i < base->dest_ports.size(); ++i) {
        if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) {
            base->dest_ports.erase(base->dest_ports.begin() + i);
            return;
        }
    }

    DEBUG(5, StandardInterfaces,
          "Attempted to disconnect non-existent connection: " << connectionID);
}
