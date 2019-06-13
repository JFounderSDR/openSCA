/***************************************************************************//**
* @file     ComplexDouble_p.h
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

#ifndef ComplexDouble_P_H
#define ComplexDouble_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "ComplexDoubleS.h"
#include "openscaSupport.h"

namespace ComplexDouble {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class ComplexDouble_p {
    friend class ComplexDouble::ProvidesPort;

  public:
    ComplexDouble_p(
        const char * _portName);

    ~ComplexDouble_p();

    CORBA::Object_ptr
    getPort(
        const char * _portName);

    void
    getData(
        PortTypes::DoubleSequence * & data_I,
        PortTypes::DoubleSequence * & data_Q);

    void
    bufferEmptied();

  private:
    ComplexDouble_p();

    ComplexDouble_p(
        const ComplexDouble_p & );

    std::string portName;
    //provides port
    ComplexDouble::ProvidesPort * data_servant;
    StandardInterfaces::ComplexDouble_var data_servant_var;
    // Buffer storage
    PortTypes::DoubleSequence data_in_I;
    PortTypes::DoubleSequence data_in_Q;

#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace ComplexDouble {
class ProvidesPort :
    public virtual POA_StandardInterfaces::ComplexDouble {
  public:
    ProvidesPort(
        StandardInterfaces_i::ComplexDouble_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const PortTypes::DoubleSequence & data_I,
        const PortTypes::DoubleSequence & data_Q);

  private:
    StandardInterfaces_i::ComplexDouble_p * base;
};
}

#endif /* ComplexDouble_P_H */