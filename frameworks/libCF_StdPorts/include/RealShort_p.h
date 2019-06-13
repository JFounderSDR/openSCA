/***************************************************************************//**
* @file     RealShort_p.h
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

#ifndef REALSHORT_P_H
#define REALSHORT_P_H

#include <string>
#include "RealShortS.h"
#include "openscaSupport.h"

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

namespace RealShort {
class providesPort;
}

namespace StandardInterfaces_i {
class RealShort_p {
    friend class RealShort::providesPort;

  public:
    RealShort_p(
        const char * portName);

    ~RealShort_p();

    CORBA::Object_ptr
    getPort(
        const char * portName);

    void
    getData(
        PortTypes::ShortSequence * & data);

#ifdef __SDS_OS_VXWORKS__
    void
    bufferEmptied() { semGive(sem_ready_for_input); };
#elif defined __SDS_OS_LINUX__
    void
    bufferEmptied() { sds_unlock("realshort_ready_for_input"); };
#endif

  private:
    RealShort_p();

    RealShort_p(
        const RealShort_p & );

    std::string portName;
    // Provides port
    RealShort::providesPort * data_servant;
    StandardInterfaces::RealShort_var data_servant_var;
    // Buffer storage
    PortTypes::ShortSequence data_in;

#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};

}

namespace RealShort {
class providesPort :
    public POA_StandardInterfaces::RealShort {
  public:
    providesPort(
        StandardInterfaces_i::RealShort_p * _base);

    ~providesPort();

    void
    pushPacket(
        const PortTypes::ShortSequence & data);

  private:
    StandardInterfaces_i::RealShort_p * base;
};
}

#endif