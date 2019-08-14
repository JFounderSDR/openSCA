/***************************************************************************//**
* @file     MHAL_PF_p.cpp
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
#include "../include/MHAL_PF_p.h"
#include "../include/debug.h"

StandardInterfaces_i::MHAL_PF_p::MHAL_PF_p(
    const char * _name) :
	portName(_name) {
	data_servant = new MHAL_PF::providesPort(this);
	data_servant_var = data_servant->_this();

	m_buffCtrl = new CyclicBufferController();
	m_buffCtrl->initializeDataBuf();
}

StandardInterfaces_i::MHAL_PF_p::~MHAL_PF_p() {

}

CORBA::Object_ptr
StandardInterfaces_i::MHAL_PF_p::getPort(
    const char * _portName) {
	if (0 == strcmp(portName.c_str(), _portName)) {
		return CORBA::Object::_duplicate(data_servant_var);
	} else {
		return CORBA::Object::_nil();
	}
}

void
StandardInterfaces_i::MHAL_PF_p::getData(
    CORBA::UShort & LD,
    JTRS::OctetSequence & data) {
//	DEBUG(1, [MHAL_PF_p::getData], " enter...")

	char* recvData = m_buffCtrl->readData();
	if (!recvData)
		return;
	unsigned short payloadSize = 0;
	memcpy(&payloadSize, recvData, 2);
	//std::cout << "*************payloadSize: " << payloadSize << " portName: " << m_portName << std::endl;
	data.length(payloadSize);
	memcpy(data.get_buffer(), recvData + 2, payloadSize);

	LD = logicalDest;

//	DEBUG(1, [MHAL_PF_p::getData], " leave...")
}

void 
StandardInterfaces_i::MHAL_PF_p::connectSlot(
    	const slotType & slot)
{
	m_connection = m_signal.connect(slot);
}

void
StandardInterfaces_i::MHAL_PF_p::disconnectSlot()
{
	if (m_connection.connected()) {
		m_signal.disconnect_all_slots();
	}
}

//if input parameter is invalid, then return 0x00 as default velue
MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination
StandardInterfaces_i::MHAL_PF_p::getRxRoute(
    CORBA::UShort logicalDestination) {
	for (std::map<unsigned short, MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination>::iterator
	        iter = addrMaps.begin();
	        iter != addrMaps.end();
	        iter++) {
		if (logicalDestination == (CORBA::UShort)iter->first) {
			return iter->second;
		}
	}

	//default value of PD is 0x00
	return 0x00;
}

//suggest that call this setting during MHALDevice instantiation
void
StandardInterfaces_i::MHAL_PF_p::setMaxPayloadSize(
    CORBA::ULong maxSize) {
	maxPayloadSize = maxSize;
}

void
StandardInterfaces_i::MHAL_PF_p::setMinPyaloadSize(
    CORBA::ULong minSize) {
	minPayloadSize = minSize;
}

void
StandardInterfaces_i::MHAL_PF_p::setDesirePayloadSize(
    CORBA::ULong desireSize) {
	desirePayloadSize = desireSize;
}

void
StandardInterfaces_i::MHAL_PF_p::setMinTimeout(
    CORBA::ULong minTime) {
	minTimeout = minTime;
}

/****************************************************************************
 * 				Class ProvidesPort implemention
 ****************************************************************************/

MHAL_PF::providesPort::providesPort(
    StandardInterfaces_i::MHAL_PF_p * _base) :
	base(_base) {

}

MHAL_PF::providesPort::~providesPort() {

}

void
MHAL_PF::providesPort::pushPacket(
    CORBA::UShort logicalDest,
    const JTRS::OctetSequence & payload) {
	DEBUG(7, [MHAL_PF_p::pushPacket], " enter...")

	base->logicalDest = logicalDest;
	
	unsigned short sendLen = payload.length();
	char sendBuff[sendLen] = {};
	memcpy(sendBuff, payload.get_buffer(), sendLen);
	DEBUG(7, [MHAL_PF_p::pushPacket], " payload.length:" << payload.length())
	bool ret = (base->m_buffCtrl)->writeData(sendBuff, sendLen);
	if (!ret)
	{
		DEBUG(8, RealOctet, 
			"providesPort::writeData falied, portName is: " << base->portName)
		return;
	}
		
	base->m_signal();

	DEBUG(1, [MHAL_PF_p::pushPacket], " leave...")
}


void
MHAL_PF::providesPort::addTxRoute (
    CORBA::UShort logicalDest,
    MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination physicalDest ) {
	std::map<unsigned short, MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination>::iterator
	iter ;
	iter = base->addrMaps.find(logicalDest);

	//insert new map for LD and PD
	if (iter == base->addrMaps.end()) {
		base->addrMaps.insert(std::pair<unsigned short,
		                      MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination>(logicalDest,
		                              physicalDest));
	} else {	//update map for this LD
		base->addrMaps[logicalDest] = physicalDest;
	}
}

CORBA::ULong
MHAL_PF::providesPort::getMaxPayloadSize() {

	return base->maxPayloadSize;
}

CORBA::ULong
MHAL_PF::providesPort::getMinPayloadSize() {
	return base->minPayloadSize;
}

CORBA::ULong
MHAL_PF::providesPort::getDesiredPayloadSize() {
	return base->desirePayloadSize;
}

CORBA::ULong
MHAL_PF::providesPort::getMinOverrideTimeout() {
	return base->minTimeout;
}
