/***************************************************************************//**
* @file     test_appCommunication.cpp
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
#ifndef _TEST_APP_COMMUNICATION_H
#define _TEST_APP_COMMUNICATION_H

#include "test_utils.h"
#include "test_baseInterface.h"
#include "test_communicationPorts.h"
#include <semaphore.h>
#include <pthread.h>

sem_t g_sem;

/**
 * @brief The operation used for send data.
 *
 * @param[in] baseTestObject	base test object
 * @param[in] dataSeq 	data sent
 */
bool
sendData(
	OpenSCATest::BaseTest * baseTestObject,
	JTRS::OctetSequence & dataSeq);

/**
 * @brief The operation used for notify the receiving thread 
 *		  to receive data.
 */
void
receiveDateNotice();

/**
 * @brief The operation used for keep the receiving data listening.
 *
 * @param[in] baseTestObject	base test object
 */
void
connectSlot(
	OpenSCATest::BaseTest * baseTestObject);

/**
 * @brief The operation used for receive data after receiveDateNotice is invoked.
 *
 * @param[in] p		base test object
 */
void *
receiveData(
	void * p);

/**
 * @brief The operation used for uninstall application.
 *
 * @param[in] baseTestObject	base test object
 * @param[in] appName 	application name
 */
void 
uninstallApplication(
	OpenSCATest::BaseTest * baseTestObject,
	const std::string appName);

#define   CONNECT_PLATFORM_IP   	("192.168.1.84")
#define   CONNECT_PLATFORM_PORT 	8010
#define   APP_NAME 					("MsgTransApp")
#define   UPORT_NAME 				("external_data_out")
#define   PPORT_NAME 				("external_data_in")
#define   TRANSFER_DATA_MAX_LEN		8000
#define   SENDSEQ_LENGTH 			1024

int main(int argc, char * argv[])
{
	OpenSCATest::BaseTest * baseTestObject = new OpenSCATest::BaseTest();

	// initialize ORB
	baseTestObject->initializeORB(CONNECT_PLATFORM_IP, CONNECT_PLATFORM_PORT);
	baseTestObject->getNamingService();
	baseTestObject->getDomainManager();

	// install application
	baseTestObject->installApplication(APP_NAME);

	baseTestObject->getAllApplications();
	
	// connection application
	std::vector<std::string> portNames;
	portNames.push_back(UPORT_NAME);
	portNames.push_back(PPORT_NAME);
	baseTestObject->connectApplication(APP_NAME, portNames);

	// start up application
	baseTestObject->startApplication(APP_NAME);

	sem_init(&g_sem, 0, 0);
	pthread_t g_recvThread = 0;
	int recvTid = pthread_create(&g_recvThread, NULL, receiveData, (void *)baseTestObject);
	TESTDEBUG(5, [test_appCommiunication::main], " receiveThread ID:" << recvTid)
	if(0 != recvTid)
	{
		TESTDEBUG(0, [test_appCommiunication::main],
				" create receiveData thread failed.")
		return 0;
	}

	connectSlot(baseTestObject);

	// send data
	JTRS::OctetSequence sendSeq;
	sendSeq.length(SENDSEQ_LENGTH);
	std::string sendStr = "[*****Hello JFounder!*****]";
	memcpy(sendSeq.get_buffer(), sendStr.c_str(), sendStr.length());

	bool flag = sendData(baseTestObject, sendSeq);
	if(!flag){
		TESTDEBUG(0, [test_appCommiunication::main], 
			" send data is failed.")
		exit(EXIT_FAILURE);
	}
	
	try{
		baseTestObject->m_orbVar->run();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_appCommiunication::main],
			" occure CORBA::SystemException when m_orbVar->run.")
		printCORBASystemException(e);
		return 0;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_appCommiunication::main],
			" occure CORBA::Exception when m_orbVar->run.")
		printCORBAException(e);
		return 0;
	} catch (...) {
		TESTDEBUG(0, [test_appCommiunication::main],
			" occure unknown Exception when m_orbVar->run.")
		return 0;
	}

	try{
		baseTestObject->m_orbVar->destroy();
	} catch (const CORBA::SystemException & e) {
		TESTDEBUG(0, [test_appCommiunication::main],
			" occure CORBA::SystemException when m_orbVar->destory.")
		printCORBASystemException(e);
		return 0;
	} catch (const CORBA::Exception & e) {
		TESTDEBUG(0, [test_appCommiunication::main],
			" occure CORBA::Exception when m_orbVar->destory.")
		printCORBAException(e);
		return 0;
	} catch (...) {
		TESTDEBUG(0, [test_appCommiunication::main],
			" occure unknown Exception when m_orbVar->destory.")
		return 0;
	}

	delete baseTestObject;

	return 0;
}

/**
 * @brief The operation used for send data.
 *
 * @param[in] baseTestObject	base test object
 * @param[in] dataSeq 	data sent
 */
bool
sendData(
	OpenSCATest::BaseTest * baseTestObject,
	JTRS::OctetSequence & dataSeq)
{
	TESTDEBUG(8, [test_appCommiunication::sendData], " enter...")

	if(CORBA::is_nil(baseTestObject->m_usePort)){
		TESTDEBUG(0, [test_appCommiunication::sendData],
			" baseTestObject->m_usePort is nil.")
		exit(EXIT_FAILURE);
	}
	baseTestObject->m_usePort->pushPacket(dataSeq);
	TESTDEBUG(0, [test_appCommiunication::sendData], 
		" send data:" << dataSeq.get_buffer())

	return true;
}

/**
 * @brief The operation used for notify the receiving thread 
 *		  to receive data.
 */
void
receiveDateNotice()
{
	sem_post(&g_sem);
}

/**
 * @brief The operation used for keep the receiving data listening.
 *
 * @param[in] baseTestObject	base test object
 */
void
connectSlot(
	OpenSCATest::BaseTest * baseTestObject)
{
	TESTDEBUG(8, [test_appCommiunication::connectSlot], " enter...")

	if(NULL == baseTestObject->m_providePort){
		TESTDEBUG(0, [test_appCommiunication::connectSlot], 
			" baseTestObject->m_providePort is NULL.")
		return;
	}

	try {
		baseTestObject->m_providePort->connectSlot(
			boost::bind(&receiveDateNotice));
	} catch(...) {
		TESTDEBUG(0, [test_appCommiunication::connectSlot], 
			" connectSlot is exceptio")
		exit(EXIT_FAILURE);
	}

	TESTDEBUG(8, [test_appCommiunication::connectSlot], " leave...")
}

/**
 * @brief The operation used for receive data after receiveDateNotice is invoked.
 *
 * @param[in] p		base test object
 */
void *
receiveData(
	void * p)
{
	TESTDEBUG(8, [test_appCommiunication::receiveDate], " enter...")

	sem_wait(&g_sem);

	OpenSCATest::BaseTest * baseTestObject = (OpenSCATest::BaseTest *)p;

	if(NULL == baseTestObject->m_providePort){
		TESTDEBUG(0, [test_appCommiunication::receiveDate],
			" m_providePort is NULL.")
		exit(EXIT_FAILURE);
	}

	JTRS::OctetSequence dataSeq;
	baseTestObject->m_providePort->getData(dataSeq);

	TESTDEBUG(0, [test_appCommiunication::receiveDate],
		" receive data:" << dataSeq.get_buffer())

	
	TESTDEBUG(8, [test_appCommiunication::receiveDate], " leave...")

	uninstallApplication(baseTestObject, APP_NAME);
}

/**
 * @brief The operation used for uninstall application.
 *
 * @param[in] baseTestObject	base test object
 * @param[in] appName 	application name
 */
void 
uninstallApplication(
	OpenSCATest::BaseTest * baseTestObject,
	const std::string appName)
{
	baseTestObject->m_providePort->disconnectSlot();
	sem_destroy(&g_sem);

	// stop application
	baseTestObject->stopApplication(appName);

	// disconnect application
	baseTestObject->disconnectApplication();

	// uninstall application
	baseTestObject->uninstallApplication(appName);

	baseTestObject->m_orbVar->shutdown();
}

#endif
