/***************************************************************************//**
* @file     MHAL_PF_p.h
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

#ifndef MHAL_PF_P_H
#define MHAL_PF_P_H

#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>
#include <vector>
#include <map>

#include <boost/signals2/signal.hpp>

#include "MHALInterfaceS.h"
#include "openscaSupport.h"
#include "CyclicBufferController.h"

namespace MHAL_PF {
class providesPort;
}

namespace StandardInterfaces_i {
class MHAL_PF_p 
{
  typedef boost::signals2::signal<void ()> signalDef;
  typedef boost::signals2::signal<void ()>::slot_type slotType;
  friend class MHAL_PF::providesPort;

  public:

	MHAL_PF_p(
	    const char * portName);

	~MHAL_PF_p();

	CORBA::Object_ptr
	getPort(
	    const char * portName);

	void
	getData(
	    CORBA::UShort & LD,
	    JTRS::OctetSequence & data);

	void 
    connectSlot(
    	const slotType & slot);

	void
	disconnectSlot();

	MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination
	getRxRoute(
	    CORBA::UShort logicalDestination);

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
	MHAL_PF_p();

	MHAL_PF_p(
	    const MHAL_PF_p & );

	std::string portName;
	// Provides port
	MHAL_PF::providesPort * data_servant;
	MHAL:: PF_MHALPacketConsumer_var data_servant_var;
	// Buffer storage
	JTRS::OctetSequence data_in;
	CORBA::UShort logicalDest;

	signalDef m_signal;
	boost::signals2::connection m_connection;
  	CyclicBufferController* m_buffCtrl;

	//port properties for constriant
	std::map<unsigned short, MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination>
	addrMaps;		//map for LD and PD
	CORBA::ULong maxPayloadSize;
	CORBA::ULong minPayloadSize;
	CORBA::ULong desirePayloadSize;
	CORBA::ULong minTimeout;
};

}

namespace MHAL_PF {

class providesPort :
public POA_MHAL::PF_MHALPacketConsumer {
  public:
	providesPort(
	    StandardInterfaces_i::MHAL_PF_p * _base);

	~providesPort();

	void
	pushPacket (
	    CORBA::UShort logicalDest,
	    const JTRS::OctetSequence & payload);

	void
	addTxRoute (
	    unsigned short logicalDest,
	    MHAL::PF_MHALPacketConsumer::MHALPhysicalDestination physicalDest );

	CORBA::ULong
	getMaxPayloadSize();

	CORBA::ULong
	getMinPayloadSize();

	CORBA::ULong
	getDesiredPayloadSize();

	CORBA::ULong
	getMinOverrideTimeout();

  private:
	StandardInterfaces_i::MHAL_PF_p * base;
};

}

#endif
