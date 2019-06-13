/***************************************************************************//**
* @file     test_communicationPorts.h
* @author   open Team
* @version  9
* @date     2019-05-22
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
#ifndef _TEST_APPLICATION_PORTS_H
#define _TEST_APPLICATION_PORTS_H

#include <boost/signals2/signal.hpp>
#include "CFS.h"
#include "PacketS.h"
#include "RealOctetS.h"
#include "PortTypesS.h"
#include "test_utils.h"

#define INFO_SIZE 1024

class CWave_Provide_port_i :
public virtual POA_StandardInterfaces::RealOctet
{
	
typedef boost::signals2::signal<void ()> signalDef;
typedef boost::signals2::signal<void ()>::slot_type slotType;

public :

	char m_dataBuf[INFO_SIZE];
	signalDef m_signal;
	boost::signals2::connection m_connection;

	CWave_Provide_port_i();

	virtual ~CWave_Provide_port_i();

	void
    connectSlot(
    	const slotType & slot);

    void
	disconnectSlot();

	/**
	 * @brief The operation used for send data.
	 *
	 * @param[in] data	  data sent
	 */
	virtual void
	pushPacket(const JTRS::OctetSequence & dataSeq);

	/**
	 * @brief The operation used for receive data.
	 *
	 * @param[in] data	  data is received
	 */
	void
	getData(
		JTRS::OctetSequence & data);
};

class CWave_Use_port_i :
public virtual POA_CF::PPort
{
public :
	char * m_portId;
	StandardInterfaces::RealOctet_var m_targetPort;

	CWave_Use_port_i();

	virtual ~CWave_Use_port_i();

	/**
	 * @brief The operation used for Uses Port to connect Provides port,
	 *        must be invoked before data transmission. 
	 *
	 * @param[in] connection  the provide port instance
	 * @param[in] connectId	  connect identification 
	 */
	virtual void
	connectPort(
		::CORBA::Object_ptr connection,
		const char * connectId);

	/**
	 * @brief The operation used for Uses Port to disconnect Provides port.
	 *
	 * @param[in] connectId	  connect identification 
	 */
	virtual void
	disconnectPort(
		const char * connectId);

	/**
	 * @brief The operation used for send data to Provides port.
	 *
	 * @param[in] data	  data sent
	 */
    void
    pushPacket(
        const JTRS::OctetSequence & data);
};

#endif // _TEST_APPLICATION_PORTS_H
