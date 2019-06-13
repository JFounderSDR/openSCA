/***************************************************************************//**
* @file     MHAL_WF_p.h
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

#ifndef MHAL_WF_P_H
#define MHAL_WF_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include <vector>
#include <map>

#include <boost/signals2/signal.hpp>

#include "MHALInterfaceS.h"
#include "CyclicBufferController.h"
#include "openscaSupport.h"

namespace MHAL_WF {
class providesPort;
}

namespace StandardInterfaces_i {
class MHAL_WF_p
{
    typedef boost::signals2::signal<void ()> signalDef;
    typedef boost::signals2::signal<void ()>::slot_type slotType;
    friend class MHAL_WF::providesPort;

  public:
    MHAL_WF_p(
        const char * portName);

    ~MHAL_WF_p();

    CORBA::Object_ptr
    getPort(const char * portName);

    void
    getData(
        CORBA::UShort & LD,
        JTRS::OctetSequence & data);

    void 
    connectSlot(
        const slotType & slot);

    void
	disconnectSlot();

    //add RX LD to route sequence for component
    void
    setRxRoute(
        CORBA::UShort logicalDest);

    void
    setMaxPayloadSize(
        CORBA::ULong maxSize);

    void
    setMinPyaloadSize(
        CORBA::ULong minSize);

    void
    setDesirePayloadSize(
        CORBA::ULong desireSize);

    void
    setMinTimeout(
        CORBA::ULong minTime);

  private:
    MHAL_WF_p();

    MHAL_WF_p(
        const MHAL_WF_p &);

    std::string portName;
    // Provides port
    MHAL_WF::providesPort * data_servant;
    MHAL::WF_MHALPacketConsumer_var data_servant_var;
    // Buffer storage
    JTRS::OctetSequence data_in;
    CORBA::UShort logicalDest;

    signalDef m_signal;
    boost::signals2::connection m_connection;
    CyclicBufferController* m_buffCtrl;

    //route sequence to store LD list
    MHAL::WF_MHALPacketConsumer::RxRouteSequence rxRouteSeq;
    CORBA::ULong maxPayloadSize;
    CORBA::ULong minPayloadSize;
    CORBA::ULong desirePayloadSize;
    CORBA::ULong minTimeout;
};

}

namespace MHAL_WF {
class providesPort :
    public POA_MHAL::WF_MHALPacketConsumer {
  public:
    providesPort(
        StandardInterfaces_i::MHAL_WF_p * _base);

    ~providesPort();

    void pushPacket (
        CORBA::UShort logicalDest,
        const JTRS::OctetSequence &  payload);

    MHAL::WF_MHALPacketConsumer::RxRouteSequence *
    getRxRoutes ();

    CORBA::ULong
    getMaxPayloadSize();

    CORBA::ULong
    getMinPayloadSize();

    CORBA::ULong
    getDesiredPayloadSize();

    CORBA::ULong
    getMinOverrideTimeout();

  private:
    StandardInterfaces_i::MHAL_WF_p * base;
};
}


#endif
