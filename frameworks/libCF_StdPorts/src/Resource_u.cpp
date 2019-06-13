/***************************************************************************//**
* @file     Resource_u.cpp
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
#include "../include/debug.h"
#include "../include/Resource_u.h"

StandardInterfaces_i::Resource_u::Resource_u(
    const char * _portName) {
    portName = _portName;
    data_servant = new Resource::UsesPort(this);
    data_servant_var = data_servant->_this();

    openscaSupport::ORB_Wrap orb;
    std::string objName( _portName );

    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var,
                              objName.c_str());
}

StandardInterfaces_i::Resource_u::Resource_u(
    const char * _name,
    const char * _domain) :
    portName(_name) {
    openscaSupport::ORB_Wrap orb;

    data_servant = new Resource::UsesPort(this);
    data_servant_var = data_servant->_this();

    std::string objName;
    objName = _domain;
    objName += "/";
    objName += _name;

    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var,
                              objName.c_str());
}

StandardInterfaces_i::Resource_u::~Resource_u() {
    openscaSupport::ORB_Wrap orb;
    orb.unbind_string(portName.c_str());
}

CORBA::Object_ptr
StandardInterfaces_i::Resource_u::getPort(
    const char * _portName) {
    DEBUG(7, StandardInterfaces_i::Resource_u::getPort, "entering...")
    DEBUG(7, StandardInterfaces_i::Resource_u::getPort,
          "_port_name: " << _portName )
    DEBUG(7, StandardInterfaces_i::Resource_u::getPort, "port_name: " << portName )

    if (strcmp(portName.c_str(), _portName) == 0) {
        DEBUG(7, StandardInterfaces_i::Resource_u::getPort, "find port: " << _portName )
        return CORBA::Object::_duplicate(data_servant_var);
    } else {
        return CORBA::Object::_nil();
    }
}

std::vector <CF::Resource_ptr>
StandardInterfaces_i::Resource_u::getProvidesPorts() {
    std::vector <CF::Resource_ptr> resVec;
    for (int i = 0; i < dest_ports.size(); i++) {
        CF::Resource_ptr res;
        res = CF::Resource::_narrow(dest_ports[i].port_obj);
        if (!CORBA::is_nil(res)) {
            resVec.push_back(res);
        }
    }

    return resVec;
}

Resource::UsesPort::UsesPort(
    StandardInterfaces_i::Resource_u * _base) :
    base(_base) {

}

Resource::UsesPort::~UsesPort() {

}

void
Resource::UsesPort::connectPort(
    CORBA::Object_ptr connection,
    const char * connectionID) {
    DEBUG(7, Resource::UsesPort::connectPort, "entering...")
    CF::Resource_var p = CF::Resource::_narrow(connection);

    if (CORBA::is_nil(p)) {
        DEBUG(7, Resource::UsesPort::connectPort, "port is not Resource")
        return;
    }

    for (unsigned int i = 0; i < base->dest_ports.size(); ++i) {
        if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) {
            base->dest_ports[i].setPort(p);
            return;
        }
    }

    Resource::ConnectionInfo c(p.in(), connectionID);
    base->dest_ports.push_back(c);

    DEBUG(7, StandardInterfaces_i::Resource_u::getPort,
          "connectPort end with connectionID: " << connectionID)
}

void
Resource::UsesPort::disconnectPort(
    const char * connectionID) {
    DEBUG(5, "Resource::UsersPort", "enter disconnectPort...")

    for (unsigned int i = 0; i < base->dest_ports.size(); ++i) {
        DEBUG(5, "Resource::UsersPort", "In erase loop and getID() ="\
              << base->dest_ports[i].getID());

        DEBUG(5, "Resource::UsersPort", "In erase loop and connectionID ="\
              << connectionID);

        if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) {
            base->dest_ports.erase(base->dest_ports.begin() + i);
            return;
        }
    }

    DEBUG(5, Resource::UsesPort::disconnectPort,
          "Attempted to disconnect non-existent connection: " << connectionID);
}

StandardInterfaces_i::Resource_u *
Resource::UsesPort::getBasePort() {
    return base;
}

Resource::ConnectionInfo::ConnectionInfo(
    CF::Resource_ptr _port,
    const char * _ID) {
    port_obj = CF::Resource::_duplicate(_port);

    identifier = _ID;
}

Resource::ConnectionInfo::ConnectionInfo(
    const ConnectionInfo & c) {
    port_obj = c.port_obj;
    identifier = c.identifier;
}

void
Resource::ConnectionInfo::setPort(
    CF::Resource_ptr _port) {
    port_obj = CF::Resource::_duplicate(_port);
}

const char *
Resource::ConnectionInfo::getID() {
    return identifier.c_str();
}
