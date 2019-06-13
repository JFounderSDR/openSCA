/***************************************************************************//**
* @file     ComplexFloat_p.h
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

#ifndef ComplexFloat_P_H
#define ComplexFloat_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "ComplexFloatS.h"
#include "openscaSupport.h"

namespace ComplexFloat {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class ComplexFloat_p {
    friend class ComplexFloat::ProvidesPort;

  public:
    ComplexFloat_p(
        const char * _portName);

    ~ComplexFloat_p();

    CORBA::Object_ptr
    getPort(
        const char * _portName);

    void
    getData(
        PortTypes::FloatSequence * & data_I,
        PortTypes::FloatSequence * & data_Q);

    void
    bufferEmptied();

  private:
    ComplexFloat_p();

    ComplexFloat_p(
        const ComplexFloat_p &);

    std::string portName;
    //provides port
    ComplexFloat::ProvidesPort * data_servant;
    StandardInterfaces::ComplexFloat_var data_servant_var;
    // Buffer storage
    PortTypes::FloatSequence data_in_I;
    PortTypes::FloatSequence data_in_Q;

#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace ComplexFloat {
class ProvidesPort :
    public virtual POA_StandardInterfaces::ComplexFloat {
  public:
    ProvidesPort(
        StandardInterfaces_i::ComplexFloat_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const PortTypes::FloatSequence & data_I,
        const PortTypes::FloatSequence & data_Q);

  private:
    StandardInterfaces_i::ComplexFloat_p * base;
};
}

#endif /* ComplexFloat_P_H */