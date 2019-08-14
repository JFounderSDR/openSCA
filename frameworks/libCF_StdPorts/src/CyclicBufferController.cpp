/***************************************************************************//**
* @file     CyclicBufferController.cpp
* @author   open Team
* @version  1
* @date     2017-03-14
* @brief
* @Details
* @Remark : <Description>
* @verbatim
* ==============================================================================
* <Date>     | <Version> | <Author>       | <Description>
* ==============================================================================
*  2019-03-19 | 1       | open Team       | Create file
* ==============================================================================
* @endverbatim
* ******************************************************************************
* <h2><center>&copy; Copyright(c)2017-2022 JFounder Info Tech Co.,Ltd</center></h2>
* All rights reserved. The right to copy, distribute, modify or otherwise make use
* of this software may be licensed only pursuant to the terms
* of an applicable JFounder license agreement.
*//****************************************************************************/

#include "../include/CyclicBufferController.h"
#include "../include/debug.h"

CyclicBufferController::CyclicBufferController()
{
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
bool CyclicBufferController::initializeDataBuf()
{
	m_cycBufSize = BUFFER_SIZE;
	if(m_dataBuf)
	{
		m_startPtr = m_dataBuf;
		m_endPtr = m_dataBuf + BUFFER_SIZE;
		m_writePtr = m_dataBuf;
		m_readPtr = m_dataBuf;
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
	DEBUG(5, CyclicBufferController::writeData, "dataSize: " << dataSize)

	//of datas have been witten to buffer.
	unsigned int writableSize =
			m_cycBufSize - (m_writePtr - m_readPtr + m_cycBufSize) % m_cycBufSize;
	DEBUG(3, CyclicBufferController::writeData, "writableSize: " << writableSize)
	DEBUG(3, CyclicBufferController::writeData, "needWrittenDataSize: " << needWrittenDataSize)
	if(writableSize < needWrittenDataSize) {
		return false;
	}
	
	if(dataSize < 1) {
		DEBUG(0, CyclicBufferController::writeData, "invalid data.")
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
	DEBUG(7, CyclicBufferController::readData, "enter in...")
	unsigned int readableSize =
			(m_writePtr - m_readPtr + m_cycBufSize) % m_cycBufSize;

	if(readableSize <= 2){
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

	if(rearLen >= dataSize)
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

}
