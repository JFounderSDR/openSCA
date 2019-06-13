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
#include "../include/RealShort_p.h"
#include "../include/debug.h"

StandardInterfaces_i::RealShort_p::RealShort_p(
    const char * _name) :
    portName(_name) {
    data_servant = new RealShort::providesPort(this);
    data_servant_var = data_servant->_this();
#ifdef __SDS_OS_VXWORKS__
    sem_ready_for_input = semBCreate(SEM_Q_FIFO , SEM_FULL);
    sem_data_ready = semBCreate(SEM_Q_FIFO , SEM_FULL);
#endif
}

StandardInterfaces_i::RealShort_p::~RealShort_p() {

}

CORBA::Object_ptr
StandardInterfaces_i::RealShort_p::getPort(
    const char * _portName) {
    if (portName == _portName)
        return CORBA::Object::_duplicate(data_servant_var);
    else
        return CORBA::Object::_nil();
}

void
StandardInterfaces_i::RealShort_p::getData(
    PortTypes::ShortSequence * & data) {
#ifdef __SDS_OS_VXWORKS__
    semTake(sem_data_ready, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
    sds_lock("realshort_data_ready");
#endif
    data = & data_in;
}

RealShort::providesPort::providesPort(
    StandardInterfaces_i::RealShort_p * _base) :
    base(_base) {

}

RealShort::providesPort::~providesPort() {

}

void
RealShort::providesPort::pushPacket(
    const PortTypes::ShortSequence & data) {
#ifdef __SDS_OS_VXWORKS__
    semTake(base->sem_ready_for_input, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
    sds_lock("realshort_ready_for_input");
#endif
    base->data_in = data;

#ifdef __SDS_OS_VXWORKS__
    semGive(base->sem_data_ready);
#elif defined __SDS_OS_LINUX__
    sds_unlock("realshort_data_ready");
#endif
}