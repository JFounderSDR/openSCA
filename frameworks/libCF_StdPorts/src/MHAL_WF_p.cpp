/***************************************************************************//**
* @file     MHAL_WF_p.cpp
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
#include "../include/MHAL_WF_p.h"
#include "../include/debug.h"

StandardInterfaces_i::MHAL_WF_p::MHAL_WF_p(
    const char * _name) :
	portName(_name) {
	data_servant = new MHAL_WF::providesPort(this);
	data_servant_var = data_servant->_this();

	m_buffCtrl = new CyclicBufferController();
	m_buffCtrl->initializeDataBuf();

	openscaSupport::ORB_Wrap orb;
	std::string objName( _name );

	orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var,
	                          objName.c_str());
}

StandardInterfaces_i::MHAL_WF_p::~MHAL_WF_p() {

	openscaSupport::ORB_Wrap orb;
	orb.unbind_string(portName.c_str());
}

CORBA::Object_ptr
StandardInterfaces_i::MHAL_WF_p::getPort(
    const char * _portName) {
	if (0 == strcmp(portName.c_str(), _portName))
		return CORBA::Object::_duplicate(data_servant_var);
	else
		return CORBA::Object::_nil();
}

void
StandardInterfaces_i::MHAL_WF_p::getData(
    CORBA::UShort & LD,
    JTRS::OctetSequence & data) {
//	DEBUG(1, [MHAL_WF_p::getData], " enter...")

	char* recvData = m_buffCtrl->readData();
	if (!recvData)
		return;
	unsigned short payloadSize = 0;
	memcpy(&payloadSize, recvData, 2);
	//std::cout << "*************payloadSize: " << payloadSize << " portName: " << m_portName << std::endl;
	data.length(payloadSize);
	memcpy(data.get_buffer(), recvData + 2, payloadSize);

	LD = logicalDest;

//	DEBUG(1, [MHAL_WF_p::getData], " leave...")
}

//add RX LD to route sequence for component. if it do exit, dont't anything,
//otherwise add it route sequence at end
void
StandardInterfaces_i::MHAL_WF_p::setRxRoute(
    CORBA::UShort logicalDest) {
	CORBA::UShort len = rxRouteSeq.length();

	for (CORBA::UShort i = 0; i < len; i++) {
		if (rxRouteSeq[i] == logicalDest)
			return;
	}
	//add new LD to rxRouteSeq
	rxRouteSeq.length(len + 1);
	rxRouteSeq[len] = logicalDest;
}

//suggest that call this setting during MHALDevice instantiation
void
StandardInterfaces_i::MHAL_WF_p::setMaxPayloadSize(
    CORBA::ULong maxSize) {
	maxPayloadSize = maxSize;
}

void
StandardInterfaces_i::MHAL_WF_p::setMinPyaloadSize(
    CORBA::ULong minSize) {
	minPayloadSize = minSize;
}

void
StandardInterfaces_i::MHAL_WF_p::setDesirePayloadSize(
    CORBA::ULong desireSize) {
	desirePayloadSize = desireSize;
}

void
StandardInterfaces_i::MHAL_WF_p::setMinTimeout(
    CORBA::ULong minTime) {
	minTimeout = minTime;
}

void 
StandardInterfaces_i::MHAL_WF_p::connectSlot(
    	const slotType & slot)
{
	m_connection = m_signal.connect(slot);
}

void
StandardInterfaces_i::MHAL_WF_p::disconnectSlot()
{
	if (m_connection.connected()) {
		m_signal.disconnect_all_slots();
	}
}

/****************************************************************************
 * 				Class ProvidesPort implemention
 ****************************************************************************/
MHAL_WF::providesPort::providesPort(
    StandardInterfaces_i::MHAL_WF_p * _base)
	: base(_base) {

}

MHAL_WF::providesPort::~providesPort() {

}

void
MHAL_WF::providesPort::pushPacket(
    CORBA::UShort logicalDest,
    const JTRS::OctetSequence & payload) {
	DEBUG(3, [MHAL_WF_p::pushPacket], " enter...")

	base->logicalDest = logicalDest;

	unsigned short sendLen = payload.length();
	DEBUG(3, [MHAL_WF_p::pushPacket], " sendLen:" << sendLen)
	char sendBuff[sendLen] = {};
	memcpy(sendBuff, payload.get_buffer(), sendLen);
	bool ret = (base->m_buffCtrl)->writeData(sendBuff, sendLen);
	DEBUG(3, [MHAL_WF_p::pushPacket], " ret:" << ret)
	if (!ret)
	{
		DEBUG(8, RealOctet,
			"providesPort::writeData falied, portName is: " << base->portName)
		return;
	}
		
	base->m_signal();

	DEBUG(3, [MHAL_WF_p::pushPacket], " leave...")
}

MHAL::WF_MHALPacketConsumer::RxRouteSequence *
MHAL_WF::providesPort::getRxRoutes () {
	return &base->rxRouteSeq;
}

CORBA::ULong
MHAL_WF::providesPort::getMaxPayloadSize() {
	return base->maxPayloadSize;
}


CORBA::ULong
MHAL_WF::providesPort::getMinPayloadSize() {
	return base->minPayloadSize;
}

CORBA::ULong
MHAL_WF::providesPort::getDesiredPayloadSize() {
	return base->desirePayloadSize;
}

CORBA::ULong
MHAL_WF::providesPort::getMinOverrideTimeout() {
	return base->minTimeout;
}

