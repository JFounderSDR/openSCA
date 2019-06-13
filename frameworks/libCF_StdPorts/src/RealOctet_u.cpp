///////////////////////////////////////////////////////////
//  Copyright(c)2015-2020 Company Name.
//  All rights reserved.
//
//  File name: openscaSupport.h
//  Description:
//
//  Version:
//  Created on:      06-02-2016 14:21:55
//  Author: Open Team
///////////////////////////////////////////////////////////

#include <iostream>

#include "../include/debug.h"
#include "../include/RealOctet_u.h"

StandardInterfaces_i::RealOctet_u::RealOctet_u(const char *_portName)
{
    portName = _portName;
    data_servant = new RealOctet::UsesPort(this);
    data_servant_var = data_servant->_this();

    openscaSupport::ORB_Wrap orb;
    std::string objName( _portName );

    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var, objName.c_str());
}

StandardInterfaces_i::RealOctet_u::RealOctet_u(const char *_name, const char *_domain) : portName(_name)
{
    openscaSupport::ORB_Wrap orb;

    data_servant = new RealOctet::UsesPort(this);
    data_servant_var = data_servant->_this();

    std::string objName;
    objName = _domain;
    objName += "/";
    objName += _name;

    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var, objName.c_str());
}

StandardInterfaces_i::RealOctet_u::~RealOctet_u()
{
	openscaSupport::ORB_Wrap orb;
	orb.unbind_string(portName.c_str());
}

CORBA::Object_ptr StandardInterfaces_i::RealOctet_u::getPort(const char *_portName)
{
	DEBUG(7, StandardInterfaces_i::RealOctet_u::getPort, "entering...")
	DEBUG(7, StandardInterfaces_i::RealOctet_u::getPort, "_port_name: " << _portName )
    DEBUG(7, StandardInterfaces_i::RealOctet_u::getPort, "port_name: " << portName )

    if (strcmp(portName.c_str(), _portName) == 0)
    {
        DEBUG(7, StandardInterfaces_i::RealOctet_u::getPort, "find port: " << _portName )
        return CORBA::Object::_duplicate(data_servant_var);
    }
    else
    {
        return CORBA::Object::_nil();
    }
}

void 
StandardInterfaces_i::RealOctet_u::pushPacket(
		const JTRS::OctetSequence &data)
{
	static int count = 0;
	++count;
	DEBUG(7,RealOctet_u,"pushPacket entering...")

	for (unsigned int i = 0; i < dest_ports.size(); ++i) {
		DEBUG(7, RealOctet_u, " in pushPacket loop")
		DEBUG(7, RealOctet_u, "P id is " << dest_ports[i].getID());

		try {
			if (!CORBA::is_nil(dest_ports[i].port_obj)) {
				dest_ports[i].port_obj->pushPacket(data);
			} else {
				DEBUG(5, RealOctet_u, "dest_ports[i].port_obj is null...")
			}
		} catch (CORBA::SystemException & e) {
			std::cout << "CORBA::SystemException type: " << e.completed() << std::endl;
			std::cout << "CORBA::SystemException minor: " << e.minor() << std::endl;
			std::cout << "CORBA::SystemException info: " << e._info() << std::endl;
			std::cout << "CORBA::SystemException name: " << e._name() << std::endl;
			std::cout << "CORBA::SystemException id: " << e._rep_id() << std::endl;
		} catch (CORBA::Exception & e) {
			std::cout << "CORBA::Exception info: " << e._info() << std::endl;
			std::cout << "CORBA::Exception name: " << e._name() << std::endl;
			std::cout << "CORBA::Exception id: " << e._rep_id() << std::endl;
		}
		catch (...) {
			DEBUG(5, RealOctet_u, "P Port occur Unknow exception...")
		    std::cout<<"P Port occur Unknow exception......"<<std::endl;		
		}

	}
	DEBUG(7,RealOctet_u,"pushPacket leaving...")
}

RealOctet::UsesPort::UsesPort(StandardInterfaces_i::RealOctet_u *_base) : base(_base)
{

}

RealOctet::UsesPort::~UsesPort()
{

}

void RealOctet::UsesPort::connectPort(CORBA::Object_ptr connection, const char *connectionID)
{
	DEBUG(7, RealOctet::UsesPort::connectPort, "entering...")
    StandardInterfaces::RealOctet_var p = StandardInterfaces::RealOctet::_narrow(connection);

//	connection->_non_existent();
	
    if (CORBA::is_nil(p)) {
		DEBUG(7, StandardInterfaces_i::RealOctet_u::getPort,
				"port is not RealOctet")
		return;
	}

	for (unsigned int i = 0; i < base->dest_ports.size(); ++i) {
		if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) {
			base->dest_ports[i].setPort(p);
			return;
		}
	}

    RealOctet::ConnectionInfo c(p.in(), connectionID);
    base->dest_ports.push_back(c);

    DEBUG(7, StandardInterfaces_i::RealOctet_u::connectPort,
    		"connectPort end with connectionID: " << connectionID)
}

void RealOctet::UsesPort::disconnectPort(const char *connectionID)
{

	DEBUG(5,"RealOctet::UsersPort","enter disconnectPort...")
	
    for (unsigned int i = 0; i < base->dest_ports.size(); ++i)
    {
    	DEBUG(5,"RealOctet::UsersPort","In erase loop and getID() ="\
    			<<base->dest_ports[i].getID());
    	
    	DEBUG(5,"RealOctet::UsersPort","In erase loop and connectionID ="\
    			<<connectionID);
    			
        if (strcmp(base->dest_ports[i].getID(), connectionID) == 0)
        {
            base->dest_ports.erase(base->dest_ports.begin() + i);
            return;
        }
    }

    DEBUG(5, RealOctet::UsesPort::disconnectPort, "Attempted to disconnect non-existent connection: " << connectionID);

}


RealOctet::ConnectionInfo::ConnectionInfo(StandardInterfaces::RealOctet_ptr _port, const char *_ID)
{
    port_obj = StandardInterfaces::RealOctet::_duplicate(_port);

    identifier = _ID;
}


RealOctet::ConnectionInfo::ConnectionInfo(const ConnectionInfo &c)
{
    port_obj = c.port_obj;
    identifier = c.identifier;
}

void RealOctet::ConnectionInfo::setPort(StandardInterfaces::RealOctet_ptr _port)
{
    port_obj = StandardInterfaces::RealOctet::_duplicate(_port);
}

const char *RealOctet::ConnectionInfo::getID()
{
    return identifier.c_str();
}

//void StandardInterfaces_i::RealOctet_u::bufferEmptied() 
//{   
//#ifdef __SDS_OS_VXWORKS__
//    semGive(base->sem_data_ready);
//#elif defined __SDS_OS_LINUX__
//    postSemaphore("sem_data_ready");
//#endif    
//}
