/***************************************************************************//**
* @file     ComplexDouble_p.cpp
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
#include "../include/ComplexDouble_p.h"
#include "../include/debug.h"

StandardInterfaces_i::ComplexDouble_p::ComplexDouble_p(
    const char * _portName):
    portName(_portName) {
    data_servant = new ComplexDouble::ProvidesPort(this);
    data_servant_var = data_servant->_this();

    openscaSupport::ORB_Wrap orb;
    std::string objName(_portName);

    orb.bind_object_to_string((CORBA::Object_ptr) data_servant_var,
                              objName.c_str());

#ifdef __SDS_OS_VXWORKS__
    sem_ready_for_input = semBCreate(SEM_Q_PRIORITY, SEM_FULL);
    sem_data_ready = semBCreate(SEM_Q_PRIORITY, SEM_EMPTY);
#endif
}

StandardInterfaces_i::ComplexDouble_p::~ComplexDouble_p() {
#ifdef _DEBUG
    std::cout << "this is Class ComplexDouble_p destructor" << std::endl;
#endif
}

CORBA::Object_ptr
StandardInterfaces_i::ComplexDouble_p::getPort(
    const char * _portName) {
    if (strcmp(_portName, portName.c_str()) == 0) {
        std::cout << "[StandardInterfaces_i::ComplexDouble_p] find port:  " << _portName
                  << std::endl;
        return CORBA::Object::_duplicate(data_servant_var);
    } else {
        return CORBA::Object::_nil();
    }
}

void
StandardInterfaces_i::ComplexDouble_p::getData(
    PortTypes::DoubleSequence * & data_I,
    PortTypes::DoubleSequence * & data_Q) {
    std::cout <<
              "[StandardInterfaces_i::ComplexDouble_p::getData] entering in getData" <<
              std::endl;

#ifdef __SDS_OS_VXWORKS__
    semTake(sem_data_ready, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
    sds_lock("complexdouble_data_ready");
#endif

    data_I = &data_in_I;
    data_Q = &data_in_Q;

    std::cout << "[StandardInterfaces_i::ComplexDouble_p::getData] leaving getData"
              << std::endl;
}

void
StandardInterfaces_i::ComplexDouble_p::bufferEmptied() {
#ifdef __SDS_OS_VXWORKS__
    semGive(sem_ready_for_input);
#elif defined __SDS_OS_LINUX__
    sds_unlock("complexdouble_ready_for_input");
#endif
}

ComplexDouble::ProvidesPort::ProvidesPort(
    StandardInterfaces_i::ComplexDouble_p * _base):
    base(_base) {
#ifdef _DEBUG
    std::cout << "this is Class ProvidesPort construction" << std::endl;
#endif
}

ComplexDouble::ProvidesPort::~ProvidesPort() {
#ifdef _DEBUG
    std::cout << "this is Class ProvidesPort destruction" << std::endl;
#endif
}

void
ComplexDouble::ProvidesPort::pushPacket(
    const PortTypes::DoubleSequence & data_I,
    const PortTypes::DoubleSequence & data_Q) {
    std::cout << "[ComplexDouble::providesPort::pushPacket] entering in pushPacket"
              << std::endl;
#ifdef __SDS_OS_VXWORKS__
    semTake(base->sem_ready_for_input, WAIT_FOREVER);
#elif defined __SDS_OS_LINUX__
    sds_lock("complexdouble_ready_for_input");
#endif
    std::cout << "[ComplexDouble::providesPort::pushPacket] have get sem" <<
              std::endl;

    base->data_in_I = data_I;
    base->data_in_Q = data_Q;

#ifdef __SDS_OS_VXWORKS__
    semGive(base->sem_data_ready);
#elif defined __SDS_OS_LINUX__
    sds_unlock("complexdouble_data_ready");
#endif
    std::cout <<
              "[ComplexDouble::providesPort::pushPacket] leaving pushPacket and give sem" <<
              std::endl;
}
