/***************************************************************************//**
* @file     ComplexLong_p.h
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

#ifndef ComplexLong_P_H
#define ComplexLong_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "ComplexLongS.h"
#include "openscaSupport.h"

namespace ComplexLong {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class ComplexLong_p {
    friend class ComplexLong::ProvidesPort;

  public:
    ComplexLong_p(
        const char * _portName);

    ~ComplexLong_p();

    CORBA::Object_ptr
    getPort(
        const char * _portName);

    void
    getData(
        JTRS::LongSequence * & data_I,
        JTRS::LongSequence * & data_Q);

    void
    bufferEmptied();

  private:
    ComplexLong_p();

    ComplexLong_p(
        const ComplexLong_p & );

    std::string portName;
    //provides port
    ComplexLong::ProvidesPort * data_servant;
    StandardInterfaces::ComplexLong_var data_servant_var;
    // Buffer storage
    JTRS::LongSequence data_in_I;
    JTRS::LongSequence data_in_Q;

#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace ComplexLong {
class ProvidesPort :
    public virtual POA_StandardInterfaces::ComplexLong {
  public:
    ProvidesPort(
        StandardInterfaces_i::ComplexLong_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const JTRS::LongSequence & data_I,
        const JTRS::LongSequence & data_Q);

  private:
    StandardInterfaces_i::ComplexLong_p * base;
};
}

#endif /* ComplexLong_P_H */