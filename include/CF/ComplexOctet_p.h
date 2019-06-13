/***************************************************************************//**
* @file     ComplexOctet_p.h
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

#ifndef ComplexOctet_P_H
#define ComplexOctet_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "ComplexOctetS.h"
#include "openscaSupport.h"

namespace ComplexOctet {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class ComplexOctet_p {
    friend class ComplexOctet::ProvidesPort;

  public:
    ComplexOctet_p(
        const char * _portName);

    ~ComplexOctet_p();

    CORBA::Object_ptr
    getPort(const char * _portName);

    void
    getData(
        JTRS::OctetSequence * & data_I,
        JTRS::OctetSequence * & data_Q);

    void
    bufferEmptied();

  private:
    ComplexOctet_p();

    ComplexOctet_p(
        const ComplexOctet_p & );

    std::string portName;
    //provides port
    ComplexOctet::ProvidesPort *data_servant;
    StandardInterfaces::ComplexOctet_var data_servant_var;
    // Buffer storage
    JTRS::OctetSequence data_in_I;
    JTRS::OctetSequence data_in_Q;
#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace ComplexOctet {
class ProvidesPort :
    public virtual POA_StandardInterfaces::ComplexOctet {
  public:
    ProvidesPort(
        StandardInterfaces_i::ComplexOctet_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const JTRS::OctetSequence & data_I,
        const JTRS::OctetSequence & data_Q);

  private:
    StandardInterfaces_i::ComplexOctet_p * base;
};
}

#endif /* ComplexOctet_P_H */