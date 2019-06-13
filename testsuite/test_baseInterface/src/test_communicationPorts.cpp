/***************************************************************************//**
* @file     test_communicationPorts.cpp
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
#include "../include/test_communicationPorts.h"

CWave_Use_port_i::CWave_Use_port_i()
{
	m_portId = NULL;
	m_targetPort = NULL;
}

CWave_Use_port_i::~CWave_Use_port_i()
{
	delete m_portId;
	CORBA::release(m_targetPort);
}

/**
 * @brief The operation used for Uses Port to connect Provides port,
 *        must be invoked before data transmission. 
 *
 * @param[in] connection  the provide port instance
 * @param[in] connectId	  connect identification 
 */
void
CWave_Use_port_i::connectPort(
	::CORBA::Object_ptr connection,
	const char * connectId)
{
	TESTDEBUG(8, [CWave_Use_port_i::connectPort], "enter...")

	try {
		m_portId = CORBA::string_dup(connectId);
		CORBA::Object_var obj = CORBA::Object::_duplicate(connection);
		m_targetPort =
			StandardInterfaces::RealOctet::_narrow(obj.in());

		if(CORBA::is_nil(m_targetPort)){
			TESTDEBUG(8, [CWave_Use_port_i::connectPort],
				" m_targetPort is nil.");
			return;
		}
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [CWave_Use_port_i::connectPort],
			" occure CORBA::SystemException when pushPacket.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [CWave_Use_port_i::connectPort],
			" occure CORBA::Exception when pushPacket.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [CWave_Use_port_i::connectPort],
			" occure unknown Exception when pushPacket.")
		return;
	}

	TESTDEBUG(8, [CWave_Use_port_i::connectPort], "leave...")
}

/**
 * @brief The operation used for Uses Port to disconnect Provides port.
 *
 * @param[in] connectId	  connect identification 
 */
void
CWave_Use_port_i::disconnectPort(
	const char * connectId)
{
	TESTDEBUG(8, [CWave_Use_port_i::disconnectPort], "enter...")

	if(0 == strcmp(m_portId, connectId)){
		m_portId = NULL;
		m_targetPort = NULL;
	}

	TESTDEBUG(8, [CWave_Use_port_i::disconnectPort], "leave...")
}

/**
 * @brief The operation used for send data to Provides port.
 *
 * @param[in] data	  data sent
 */
void
CWave_Use_port_i::pushPacket(
	const JTRS::OctetSequence & dataSeq)
{
	TESTDEBUG(8, [CWave_Use_port_i::pushPacket], "enter...");

	if(CORBA::is_nil(m_targetPort)){
		TESTDEBUG(8, [CWave_Use_port_i::pushPacket],
			" m_targetPort is nil.");
		return;
	}

	if(m_targetPort->_non_existent()){
		TESTDEBUG(8, [CWave_Use_port_i::pushPacket],
			" m_targetPort non exist.");
	}else{
		TESTDEBUG(8, [CWave_Use_port_i::pushPacket],
			" m_targetPort exist.");
	}

	try {
		m_targetPort->pushPacket(dataSeq);
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [CWave_Use_port_i::pushPacket],
			" occure CORBA::SystemException when pushPacket.")
		printCORBASystemException(e);
		return;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [CWave_Use_port_i::pushPacket],
			" occure CORBA::Exception when pushPacket.")
		printCORBAException(e);
		return;
	} catch (...) {
		TESTDEBUG(0, [CWave_Use_port_i::pushPacket],
			" occure unknown Exception when pushPacket.")
		return;
	}

	TESTDEBUG(8, [CWave_Use_port_i::pushPacket], "leave...");
}

CWave_Provide_port_i::CWave_Provide_port_i()
{

}

CWave_Provide_port_i::~CWave_Provide_port_i()
{

}

void
CWave_Provide_port_i::connectSlot(
	const slotType & slot)
{
	TESTDEBUG(8, [CWave_Provide_port_i::connectSlot], "enter...");

	m_signal.connect(slot);

	TESTDEBUG(8, [CWave_Provide_port_i::connectSlot], "leave...");
}

void
CWave_Provide_port_i::disconnectSlot()
{
	TESTDEBUG(8, [CWave_Provide_port_i::disconnectSlot], "enter...");

	if (m_connection.connected()) {
		m_signal.disconnect_all_slots();
	}

	TESTDEBUG(8, [CWave_Provide_port_i::disconnectSlot], "leave...");
}

/**
 * @brief The operation used for send data.
 *
 * @param[in] data	  data sent
 */
void
CWave_Provide_port_i::pushPacket(
    const JTRS::OctetSequence & data)
{
	TESTDEBUG(8, [CWave_Provide_port_i::pushPacket], " enter...")

	unsigned short sendLen = data.length();
	memcpy(m_dataBuf, data.get_buffer(), sendLen);
	m_signal();
	TESTDEBUG(8, [CWave_Provide_port_i::pushPacket], " leave...")
}

/**
 * @brief The operation used for receive data.
 *
 * @param[in] data	  data is received
 */
void
CWave_Provide_port_i::getData(
	JTRS::OctetSequence & data)
{
	TESTDEBUG(8, [CWave_Provide_port_i::getData], " enter...")

	data.length(INFO_SIZE);
	memcpy(data.get_buffer(), m_dataBuf, INFO_SIZE);

	TESTDEBUG(8, [CWave_Provide_port_i::getData], " leave...")
}
