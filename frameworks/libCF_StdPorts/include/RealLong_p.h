/***************************************************************************//**
* @file     RealLong_p.h
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

#ifndef REALLONG_P_H
#define REALLONG_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "RealLongS.h"
#include "openscaSupport.h"

namespace RealLong {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class RealLong_p {
    friend class RealLong::ProvidesPort;

  public:
    RealLong_p(
        const char * _portName);

    ~RealLong_p();

    CORBA::Object_ptr
    getPort(
        const char * _portName);

    void
    getData(
        JTRS::LongSequence *& data);

    void
    bufferEmptied();

  private:
    RealLong_p();

    RealLong_p(
        const RealLong_p & );

    std::string portName;
    //provides port
    RealLong::ProvidesPort * data_servant;
    StandardInterfaces::RealLong_var data_servant_var;
    // Buffer storage
    JTRS::LongSequence data_in;
#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace RealLong {
class ProvidesPort :
    public virtual POA_StandardInterfaces::RealLong {
  public:
    ProvidesPort(
        StandardInterfaces_i::RealLong_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const JTRS::LongSequence & data);

  private:
    StandardInterfaces_i::RealLong_p * base;
};
}

#endif /* REALLONG_P_H */