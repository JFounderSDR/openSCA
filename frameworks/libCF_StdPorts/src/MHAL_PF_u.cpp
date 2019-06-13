///////////////////////////////////////////////////////////
//  Copyright(c)2015-2020 Company Name.
//  All rights reserved.
//
//  File name: openscaSupport.h
//  Description: 
//
//	Version: 
//  Created on:      06-һ��-2016 14:21:55
//  Author: Open Team
///////////////////////////////////////////////////////////

#include <iostream>

#include "../include/MHAL_PF_u.h"
#include "../include/debug.h"

StandardInterfaces_i::MHAL_PF_u::MHAL_PF_u(const char* _portName) 
{
    portName = _portName;

    data_servant = new MHAL_PF::UsesPort(this);
    data_servant_var = data_servant->_this();
}

StandardInterfaces_i::MHAL_PF_u::MHAL_PF_u(const char* _name, const char* _domain) 
: portName(_name)
{
    openscaSupport::ORB_Wrap orb;

    data_servant = new MHAL_PF::UsesPort(this);
    data_servant_var = data_servant->_this();
}

StandardInterfaces_i::MHAL_PF_u::~MHAL_PF_u()
{

}

CORBA::Object_ptr StandardInterfaces_i::MHAL_PF_u::getPort(const char* _portName)
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

void StandardInterfaces_i::MHAL_PF_u::pushPacket(CORBA::UShort logicalDest,
									  const ::JTRS::OctetSequence & payload)
{
	//DEBUG(7,MHAL_PF_u::pushPacket,"in pushPacket")
	for(int i = 0; i < dest_ports.size(); ++i)
	{
		if(!CORBA::is_nil(dest_ports[i].port_obj))
		{
			dest_ports[i].port_obj->pushPacket( logicalDest, payload );
		}
	}
		
//	bool isLogicalDestExist = false;
//	unsigned int i = 0;
//	
//    for (i = 0; i < dest_ports.size(); ++i) 
//    {
//    	 DEBUG(7,MHAL_PF_u::pushPacket,"[StandardInterfaces_i::MHAL_PF_u] dest_ports size:" \
//    			 << dest_ports.size() <<"logicalDest is :"<<logicalDest)
//    	
//    	if(!CORBA::is_nil(dest_ports[i].port_obj))
//    	{
//    		MHAL::WF_MHALPacketConsumer::RxRouteSequence* rxSeq =
//    								dest_ports[i].port_obj->getRxRoutes();
//    		for(int j = 0; j < rxSeq->length(); j++)
//    		{
//    			if((*rxSeq)[j] == logicalDest)
//    			{
//    				isLogicalDestExist = true;
//    				break;
//    			}
//    		}
//    	}else{
//    	    DEBUG(5,MHAL_PF_u,"[StandardInterfaces_i::MHAL_PF_u] dest_ports[i].port_obj is null...")
//    	}
//    	
//    	if(isLogicalDestExist)
//    	{
//    		try
//    		{
//    			dest_ports[i].port_obj->pushPacket( logicalDest, payload );
//    		}
//    		catch(...)
//    		{
//    			DEBUG(5,MHAL_PF_u,"[StandardInterfaces_i::MHAL_PF_u] occur unknow exception...")
//    		}
//    		
//    		break;
//    	}
//    }
//    
//    if(!isLogicalDestExist)
//    {
//    	DEBUG(5,MHAL_PF_u,"[StandardInterfaces_i::MHAL_PF_u]"
//    			" logicalDest dosen't exist: " << logicalDest)
//    }
}

MHAL_PF::UsesPort::UsesPort(StandardInterfaces_i::MHAL_PF_u *_base) : base(_base)
{
	
}

MHAL_PF::UsesPort::~UsesPort()
{
	
}

void MHAL_PF::UsesPort::connectPort(CORBA::Object_ptr connection, const char* connectionID)
{
	MHAL::WF_MHALPacketConsumer_ptr p = MHAL::WF_MHALPacketConsumer::_narrow(connection);
	
	DEBUG(5,MHAL_PF::UsesPort,"In connectPort connectionID is connectionID")
	
    if (CORBA::is_nil(p)) 
    {
		std::cout << "Print port is not RealShort" << std::endl;
		return;
    }
    
    for (unsigned int i = 0; i < base->dest_ports.size(); ++i)
    {
		if (strcmp(base->dest_ports[i].getID(), connectionID) == 0) 
		{
			base->dest_ports[i].setPort(p);
			return;
		}
    }

    MHAL_PF::ConnectionInfo c(p, connectionID);
    base->dest_ports.push_back(c);
}

void MHAL_PF::UsesPort::disconnectPort(const char* connectionID)
{
	DEBUG(5,MHAL_PF::UsesPort,"In disconnectPort.")
	
    for (unsigned int i = 0; i < base->dest_ports.size(); ++i) 
    {
    	DEBUG(5,MHAL_PF::UsesPort,"getID() =" << base->dest_ports[i].getID());
    	DEBUG(5,MHAL_PF::UsesPort,"connectionID =" << connectionID);
    	
		if (strcmp(base->dest_ports[i].getID(), connectionID) == 0)
		{
			DEBUG(5,MHAL_PF::UsesPort,"start erase U Port")
			base->dest_ports.erase(base->dest_ports.begin() + i);
			return;
		}
    }

    DEBUG(5, StandardInterfaces, "Attempted to disconnect non-existent connection: " << connectionID);
}


MHAL_PF::ConnectionInfo::ConnectionInfo(MHAL::WF_MHALPacketConsumer_ptr _port,
									const char* _ID) : port_obj( _port), identifier(_ID) 
{
	
}
      
MHAL_PF::ConnectionInfo::ConnectionInfo(const ConnectionInfo & c) 
{
	port_obj = c.port_obj;
	identifier = c.identifier;
}
      
void MHAL_PF::ConnectionInfo::setPort(MHAL::WF_MHALPacketConsumer_ptr _port) 
{
	port_obj = _port; 
}
      
const char* MHAL_PF::ConnectionInfo::getID() 
{
	return identifier.c_str(); 
}





