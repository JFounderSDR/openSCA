/***************************************************************************//**
* @file     RealFloat_p.h
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

#ifndef RealFloat_P_H
#define RealFloat_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include "RealFloatS.h"
#include "openscaSupport.h"

namespace RealFloat {
class ProvidesPort;
}

namespace StandardInterfaces_i {
class RealFloat_p {
    friend class RealFloat::ProvidesPort;

  public:
    RealFloat_p(
        const char * _portName);

    ~RealFloat_p();

    CORBA::Object_ptr
    getPort(
        const char * _portName);

    void
    getData(
        PortTypes::FloatSequence *& data);

    void
    bufferEmptied();

  private:
    RealFloat_p();

    RealFloat_p(
        const RealFloat_p & );

    std::string portName;
    //provides port
    RealFloat::ProvidesPort *data_servant;
    StandardInterfaces::RealFloat_var data_servant_var;
    // Buffer storage
    PortTypes::FloatSequence data_in;

#ifdef __SDS_OS_VXWORKS__
    // Semaphores for synchronization
    SEM_ID sem_data_ready;  // Ready to process data
    SEM_ID sem_ready_for_input; // Ready to receive more data
#endif
};
}

namespace RealFloat {
class ProvidesPort :
    public virtual POA_StandardInterfaces::RealFloat {
  public:
    ProvidesPort(
        StandardInterfaces_i::RealFloat_p * _base);

    ~ProvidesPort();

    void
    pushPacket (
        const PortTypes::FloatSequence & data);

  private:
    StandardInterfaces_i::RealFloat_p * base;
};
}

#endif /* RealFloat_P_H */