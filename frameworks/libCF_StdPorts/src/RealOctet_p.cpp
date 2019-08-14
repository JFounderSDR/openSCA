/***************************************************************************//**
* @file     RealOctet_p.cpp
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
#ifdef __SDS_OS_VXWORKS__
#include "tickLib.h"
#endif

#include "../include/RealOctet_p.h"
#include "../include/debug.h"

StandardInterfaces_i::RealOctet_p::RealOctet_p(
    const char * _name) :
	portName(_name) {
	data_servant = new RealOctet::providesPort(this);
	data_servant_var = data_servant->_this();

	m_buffCtrl = new CyclicBufferController();
	m_buffCtrl->initializeDataBuf();

	openscaSupport::ORB_Wrap orb;
	std::string objName(_name);

	orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var,
	                          objName.c_str());
}

StandardInterfaces_i::RealOctet_p::~RealOctet_p() {
	openscaSupport::ORB_Wrap orb;
	orb.unbind_string(portName.c_str());
}

CORBA::Object_ptr
StandardInterfaces_i::RealOctet_p::getPort(
    const char * _portName) {
	if (strcmp(portName.c_str(), _portName) == 0) {
		DEBUG(7, RealOctet,
		      "[StandardInterfaces_i::RealOctet_p] find port: " << _portName)
		return CORBA::Object::_duplicate(data_servant_var);
	} else {
		return CORBA::Object::_nil();
	}
}

void
StandardInterfaces_i::RealOctet_p::getData(
    JTRS::OctetSequence & data) {
	DEBUG(5, [RealOctet_p::getData], " enter...")
	char* recvData = m_buffCtrl->readData();
	if (!recvData)
		return;
	unsigned short payloadSize = 0;
	memcpy(&payloadSize, recvData, 2);
	data.length(payloadSize);
	memcpy(data.get_buffer(), recvData + 2, payloadSize);

	DEBUG(5, [RealOctet_p::getData], " leave...")
}

void 
StandardInterfaces_i::RealOctet_p::connectSlot(
    	const slotType & slot)
{
	m_signal.connect(slot);
}

void
StandardInterfaces_i::RealOctet_p::disconnectSlot()
{
	m_signal.disconnect_all_slots();
}

RealOctet::providesPort::providesPort(
    StandardInterfaces_i::RealOctet_p * _base) :
	base(_base) {

}

RealOctet::providesPort::~providesPort() {

}

void
RealOctet::providesPort::pushPacket(
    const JTRS::OctetSequence & data) {

	DEBUG(5, [RealOctet_p::pushPacket], " enter...")

	unsigned short sendLen = data.length();
	char sendBuff[sendLen] = {};
	memcpy(sendBuff, data.get_buffer(), sendLen);
	bool ret = (base->m_buffCtrl)->writeData(sendBuff, sendLen);
	if (!ret){
		DEBUG(8, RealOctet, 
			"providesPort::writeData falied, portName is: " << base->portName)
		return;
	}
	base->m_signal();

	DEBUG(5, [RealOctet_p::pushPacket], " leave...")
}

