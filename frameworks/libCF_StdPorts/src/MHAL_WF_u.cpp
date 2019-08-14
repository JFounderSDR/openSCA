///////////////////////////////////////////////////////////
//  Copyright(c)2015-2020 Company Name.
//  All rights reserved.
//
//  File name: openscaSupport.h
//  Description: 
//
//	Version: 
//  Created on:      06-03-2016 14:21:55
//  Author: Open Team
///////////////////////////////////////////////////////////

#include <iostream>

#include "../include/debug.h"
#include "../include/MHAL_WF_u.h"

StandardInterfaces_i::MHAL_WF_u::MHAL_WF_u(const char* _portName) 
{
    portName = _portName;

    data_servant = new MHAL_WF::UsesPort(this);
    data_servant_var = data_servant->_this();
    
    openscaSupport::ORB_Wrap orb;
    std::string objName( _portName );

    try{
    	orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var, objName.c_str());
    }catch(...)
    {
    	std::cout << "mhal port bind failed." << std::endl;
    }
}

StandardInterfaces_i::MHAL_WF_u::MHAL_WF_u(const char* _name, const char* _domain) 
: portName(_name)
{
    openscaSupport::ORB_Wrap orb;

    data_servant = new MHAL_WF::UsesPort(this);
    data_servant_var = data_servant->_this();

//    std::string objName( _name );
    
//    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var, objName.c_str());
}

StandardInterfaces_i::MHAL_WF_u::~MHAL_WF_u()
{
	openscaSupport::ORB_Wrap orb;
	orb.unbind_string(portName.c_str());
}

CORBA::Object_ptr StandardInterfaces_i::MHAL_WF_u::getPort(const char* _portName)
{
    if (0 == strcmp(portName.c_str(), _portName))
    {
    	return CORBA::Object::_duplicate(data_servant_var);
    }
    else
    {	
    	return CORBA::Object::_nil();
    }
}

void StandardInterfaces_i::MHAL_WF_u::pushPacket(CORBA::UShort logicalDest,
									  const ::JTRS::OctetSequence & payload)
{
	DEBUG(7,MHAL_WF_u::pushPacket,"enter in ...")
	DEBUG(7,MHAL_WF_u::pushPacket,"dest_ports.size():" << dest_ports.size())
    for (unsigned int i = 0; i < dest_ports.size(); ++i) 
    {
        DEBUG(7,MHAL_WF_u,"in dest_ports loop")
		
		try
        {
			DEBUG(7,MHAL_WF_u,"p port is"<<dest_ports[i].getID())
					
			if(!CORBA::is_nil(dest_ports[i].port_obj))
			{	
				dest_ports[i].port_obj->pushPacket( logicalDest, payload );
			}
			else
			{
				DEBUG(5,MHAL_WF_u,"dest_ports[i].port_obj is null...")
			}
			
        }
        catch(...)
        {
        	DEBUG(5,MHAL_WF_u,"pushPacket occur unknow exception...")
        }
    }
}

void StandardInterfaces_i::MHAL_WF_u::setTxRoute(CORBA::UShort logicalDest)
{
	CORBA::UShort len = txRouteSeq.length();
	for(CORBA::UShort i = 0; i < len; i++)
	{
		if(txRouteSeq[i] == logicalDest)
			return;
	}
	//add new LD to txRouteSeq
	txRouteSeq.length(len+1);
	txRouteSeq[len] = logicalDest;
}

MHAL_WF::UsesPort::UsesPort(StandardInterfaces_i::MHAL_WF_u *_base) : base(_base)
{
	
}

MHAL_WF::UsesPort::~UsesPort()
{
	
}

void MHAL_WF::UsesPort::connectPort(CORBA::Object_ptr connection, const char* connectionID)
{
	DEBUG(5,MHAL_WF::UsesPort,"In connectPort.");
	
	MHAL::PF_MHALPacketConsumer_ptr p = MHAL::PF_MHALPacketConsumer::_narrow(connection);
    if (CORBA::is_nil(p)) 
    {
		std::cout << "[MHAL::UsesPort::connectPort]connection is nil" << std::endl;
		throw ;
    }
    
    for (unsigned int i = 0; i < base->dest_ports.size(); ++i)
    {
		if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) 
		{
			base->dest_ports[i].setPort(p);
			return;
		}
    }

    MHAL_WF::ConnectionInfo c(p, connectionID);
    
    base->dest_ports.push_back(c);
	
    DEBUG(5,MHAL_WF::UsesPort,"leave connectPort.");
}

void MHAL_WF::UsesPort::disconnectPort(const char* connectionID)
{
	DEBUG(5,MHAL_WF::UsesPort,"In disconnectPort.");
	
    for (unsigned int i = 0; i < base->dest_ports.size(); ++i) 
    {
    	DEBUG(5,MHAL_WF::UsesPort,"connectionID is "<< connectionID);
    	
		if (strcmp(base->dest_ports[i].getID(), connectionID) == 0)
		{
			DEBUG(5,MHAL_WF::UsesPort,"start erase u port")
			base->dest_ports.erase(base->dest_ports.begin() + i);
			return;
		}
    }

    DEBUG(5, StandardInterfaces, "Attempted to disconnect non-existent connection: " << connectionID);

}


MHAL_WF::ConnectionInfo::ConnectionInfo(MHAL::PF_MHALPacketConsumer_ptr _port,
									const char* _ID) 
 : port_obj( _port), identifier(_ID)
{
	 
}
 
 
MHAL_WF::ConnectionInfo::ConnectionInfo(const ConnectionInfo & c) 
 { 
	 port_obj = c.port_obj; 
	 identifier = c.identifier;
 }
      
void  MHAL_WF::ConnectionInfo::setPort(MHAL::PF_MHALPacketConsumer_ptr _port)
{ 
	port_obj = _port; 
}
      
const char*  MHAL_WF::ConnectionInfo::getID() 
{
	return identifier.c_str(); 
}


MHAL_WF::ConnectionInfo::ConnectionInfo()  // No default constructor
{
	
}
