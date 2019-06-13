/***************************************************************************//**
* @file     RealOctet_p.h
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

#ifndef REALOCTET_P_H
#define REALOCTET_P_H

#include <semaphore.h>
#include <pthread.h>
#ifdef __SDS_OS_VXWORKS__
#include <semLib.h>
#endif

#include <string>

#include <boost/signals2/signal.hpp>

#include "utils.h"
#include "Boost_utils.h"
#include "RealOctetS.h"
#include "openscaSupport.h"
#include "CyclicBufferController.h"

namespace RealOctet {
  class providesPort;
}

namespace StandardInterfaces_i {

/**
 * @brief The class is the encapsulation of componet's provides port,
 *        providing two operations for component to send or receive data.
 */
class RealOctet_p {
  typedef boost::signals2::signal<void ()> signalDef;
  typedef boost::signals2::signal<void ()>::slot_type slotType;
  friend class RealOctet::providesPort;

  public:
    RealOctet_p(
      const char * portName);

    ~RealOctet_p();

    CORBA::Object_ptr
    getPort(
      const char * portName);

    /**
     * @brief The operation shall receive data the send form the uses port
     *        who connect with this porvides port.
     * @param[inout] data   Data received.
     */
    void
    getData(
      JTRS::OctetSequence & data);

    void 
    connectSlot(
    	const slotType & slot);

    void
	disconnectSlot();

private:
  RealOctet_p();

  RealOctet_p(
    const RealOctet_p & );

  std::string portName;
  // Provides port
  RealOctet::providesPort * data_servant;
  StandardInterfaces::RealOctet_var data_servant_var;
  // Buffer storage
  JTRS::OctetSequence data_in;

  signalDef m_signal;

  CyclicBufferController* m_buffCtrl;
};

}

namespace RealOctet {
class providesPort :
public POA_StandardInterfaces::RealOctet 
{
public:
    providesPort(
    	StandardInterfaces_i::RealOctet_p * _base);

    ~providesPort();

    /**
     * @brief  The operation is called by uses port to send data to 
     *         this provides port.
     *
     * @param[in] data  Date sent.
     */
    void
    pushPacket(
      const JTRS::OctetSequence & data);

private:
    StandardInterfaces_i::RealOctet_p * base;
  };
}
#endif
