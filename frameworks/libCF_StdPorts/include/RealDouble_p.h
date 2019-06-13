/***************************************************************************//**
* @file     RealDouble_p.h
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

#ifndef RealDouble_P_H
#define RealDouble_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "RealDoubleS.h"
#include "openscaSupport.h"

namespace RealDouble {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class RealDouble_p {
    friend class RealDouble::ProvidesPort;

  public:
    RealDouble_p(
        const char * _portName);

    ~RealDouble_p();

    CORBA::Object_ptr
    getPort(const char * _portName);

    void
    getData(
        PortTypes::DoubleSequence * & data);

    void
    bufferEmptied();

  private:
    RealDouble_p();

    RealDouble_p(
        const RealDouble_p &);

    std::string portName;
    //provides port
    RealDouble::ProvidesPort * data_servant;
    StandardInterfaces::RealDouble_var data_servant_var;
    // Buffer storage
    PortTypes::DoubleSequence data_in;
#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace RealDouble {
class ProvidesPort :
    public virtual POA_StandardInterfaces::RealDouble {
  public:
    ProvidesPort(
        StandardInterfaces_i::RealDouble_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const PortTypes::DoubleSequence & data);

  private:
    StandardInterfaces_i::RealDouble_p * base;
};
}

#endif /* RealDouble_P_H */