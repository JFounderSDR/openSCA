/***************************************************************************//**
* @file     ComplexShort_p.h
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

#ifndef ComplexShort_P_H
#define ComplexShort_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "ComplexShortS.h"
#include "openscaSupport.h"

namespace ComplexShort {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class ComplexShort_p {
    friend class ComplexShort::ProvidesPort;

  public:
    ComplexShort_p(
        const char * _portName);

    ~ComplexShort_p();

    CORBA::Object_ptr
    getPort(const char * _portName);

    void
    getData(
        JTRS::ShortSequence * & data_I,
        JTRS::ShortSequence * & data_Q);

    void
    bufferEmptied();

  private:
    ComplexShort_p();

    ComplexShort_p(
        const ComplexShort_p & );

    std::string portName;
    //provides port
    ComplexShort::ProvidesPort *data_servant;
    StandardInterfaces::ComplexShort_var data_servant_var;
    // Buffer storage
    JTRS::ShortSequence data_in_I;
    JTRS::ShortSequence data_in_Q;

#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace ComplexShort {
class ProvidesPort :
    public virtual POA_StandardInterfaces::ComplexShort {
  public:
    ProvidesPort(
        StandardInterfaces_i::ComplexShort_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const JTRS::ShortSequence & data_I,
        const JTRS::ShortSequence & data_Q);

  private:
    StandardInterfaces_i::ComplexShort_p * base;
};
}

#endif /* ComplexShort_P_H */