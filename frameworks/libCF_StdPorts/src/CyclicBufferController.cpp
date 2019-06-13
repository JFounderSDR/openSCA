///////////////////////////////////////////////////////////
//  CyclicBufferController.cpp
//  Implementation of the Class CyclicBufferController
//  Created on:      11-7��-2018 14:33:52
//  Original author: JHX
///////////////////////////////////////////////////////////

#include "../include/CyclicBufferController.h"
#include "../include/debug.h"
#include <string.h>
#include <assert.h>
#include <stdlib.h>
#include <iostream>
#include <stdio.h>

CyclicBufferController::CyclicBufferController()
{
	//m_dataBuf = NULL;
	m_readPtr = NULL;
	m_writePtr = NULL;
	m_startPtr = NULL;
	m_endPtr = NULL;
	memset(m_dataBuf, 0, sizeof(m_dataBuf));
	memset(m_readBuf, 0, sizeof(m_readBuf));
}

CyclicBufferController::~CyclicBufferController()
{

}


/**
 * @brief Get size of remaining buffer which can be written data.
 * 
 * @return    remaining buffer's size
 */
unsigned int CyclicBufferController::getWritableSize()
{
	unsigned int writableSize = m_cycBufSize - 
			(m_writePtr - m_readPtr + m_cycBufSize) % m_cycBufSize;
	return writableSize;
}


/**
 * @brief    Initialize data buffer, allocate memory which size is determined by
 * input parameter.
 * 
 * @return    Result of initialize data buffer.
 * @retval    true    initialize data buffer successfully
 * @retval    false   initialize data buffer failed
 */
bool CyclicBufferController::initializeDataBuf(unsigned int bufSize)
{
	//m_cycBufSize = bufSize;
	m_cycBufSize = 80960;
//	std::cout << "************m_cycBufSize: " << m_cycBufSize << std::endl;
	//m_dataBuf = (char*)malloc(bufSize);
	if(m_dataBuf)
	{
		m_startPtr = m_dataBuf;
		//m_endPtr = m_dataBuf + bufSize;
		m_endPtr = m_dataBuf + 80960;
		m_writePtr = m_dataBuf;
		m_readPtr = m_dataBuf;
//		printf("m_startPtr: %p\n", m_startPtr);
//		printf("m_readPtr: %p\n", m_readPtr);
//		printf("m_endPtr: %p\n", m_endPtr);
		return true;
	}else{
		return false;
	}
	
}


/**
 * @brief       Write data to data buffer.
 * 
 * @param[in]   writedData    	data need to be writed to the buffer
 * @param[in]	dataSize		size of data writed				
 * 
 * @return		Result of writing data to buffer.
 * @retval		true	write successfully.
 * @retval		false  write failed.
 */
bool 
CyclicBufferController::writeData(
	const char* writedData,
	unsigned int dataSize)
{
	assert(writedData);
	unsigned int needWrittenDataSize = dataSize + 2;
	DEBUG(1, CyclicBufferController::writeData, "dataSize: " << dataSize)

	//of datas have been witten to buffer.
	unsigned int writableSize =
			m_cycBufSize - (m_writePtr - m_readPtr + m_cycBufSize) % m_cycBufSize;
	DEBUG(3, CyclicBufferController::writeData, "writableSize: " << writableSize)
	DEBUG(3, CyclicBufferController::writeData, "needWrittenDataSize: " << needWrittenDataSize)
	if(writableSize < needWrittenDataSize)
	{
		return false;
	}
	
	if(dataSize < 1)
	{
		std::cout << "invalid data" << std::endl;
		return false;
	}
	unsigned int rearLen = m_endPtr - m_writePtr;

	if (rearLen <= 2) {
		memcpy(m_writePtr, &dataSize, rearLen);
		m_writePtr = m_startPtr;
		memcpy(m_writePtr, (char*)(&dataSize) + rearLen, 2 - rearLen);
		m_writePtr += (2 - rearLen);
		memcpy(m_writePtr, writedData, dataSize);
		m_writePtr += dataSize;
	} else if ((2 < rearLen) && (rearLen < needWrittenDataSize)) {
		memcpy(m_writePtr, &dataSize, 2);
		memcpy(m_writePtr + 2, writedData, rearLen - 2);
		m_writePtr = m_startPtr;
		memcpy(m_writePtr, writedData + rearLen - 2, dataSize - (rearLen - 2));
		m_writePtr += (dataSize - (rearLen - 2));
	} else if (rearLen >= needWrittenDataSize) {
		memcpy(m_writePtr, &dataSize, 2);
		memcpy(m_writePtr + 2, writedData, dataSize);
		m_writePtr += needWrittenDataSize;
	}

	return true;
}


/**
 * @brief    Read data form buffer, a packet one time.
 * @return   packet read
 */
char* CyclicBufferController::readData()
{
	DEBUG(1, CyclicBufferController::readData, "enter in...")
	unsigned int readableSize =
			(m_writePtr - m_readPtr + m_cycBufSize) % m_cycBufSize;

	if( readableSize <= 2 )
	{
		return NULL;
	}
	
	memset(m_readBuf, 0, sizeof(m_readBuf));

	unsigned int rearLen = m_endPtr - m_readPtr;
	unsigned short poyloadSize = 0;

	if( rearLen <= 2 ){
		memcpy(&poyloadSize, m_readPtr, rearLen);
		memcpy(&poyloadSize + rearLen, m_startPtr,
				sizeof(unsigned short) - rearLen);
	}else{
		memcpy(&poyloadSize, m_readPtr, sizeof(unsigned short));
	}

	unsigned short dataSize = poyloadSize + 2;
//	DEBUG(0, [CyclicBufferController::readData], "dataSize: " << dataSize)
//	DEBUG(0, [CyclicBufferController::readData], "rearLen: " << rearLen)
	if( rearLen >= dataSize )
	{
		memcpy(m_readBuf, m_readPtr, dataSize);
		m_readPtr += dataSize;
	}else{
		memcpy(m_readBuf, m_readPtr, rearLen);
		m_readPtr = m_startPtr;
		memcpy(m_readBuf + rearLen, m_readPtr, dataSize - rearLen);
		m_readPtr += dataSize - rearLen;
	}
	DEBUG(1, CyclicBufferController::readData, "leave...")
	return  m_readBuf;
}


/**
 * @brief    Free the buffer memory.
 */
void CyclicBufferController::releaseBuf()
{
//	if(m_dataBuf)
//	{
//		free(m_dataBuf);
//		m_dataBuf = NULL;
//	}
}
