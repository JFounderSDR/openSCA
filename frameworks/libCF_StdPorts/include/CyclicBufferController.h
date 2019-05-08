///////////////////////////////////////////////////////////
//  CyclicBufferController.h
//  Implementation of the Class CyclicBufferController
//  Created on:      11-7��-2018 14:33:52
//  Original author: JHX
///////////////////////////////////////////////////////////

#if !defined(EA_79624BC7_BB4C_4e04_BA35_C7BF6F1EC6C7__INCLUDED_)
#define EA_79624BC7_BB4C_4e04_BA35_C7BF6F1EC6C7__INCLUDED_

/**
 * @brief	The class managers a buffer which used to store data form
 * 			bus and privide data to waveform. The buffer has a initial
 * 			size. WritePtr used to write data to the buffer, and decrease
 * 			relevant value of writableSize after writing, if writableSize 
 * 			is less than the size of data need to write to the buffer, 
 * 			then will write failed. ReadPtr used to read data from buffer, 
 * 			and increase relevant size of writableSize after reading.
 */
class CyclicBufferController
{

public:
	CyclicBufferController();
	virtual ~CyclicBufferController();

	unsigned int getWritableSize();
	bool initializeDataBuf(unsigned int bufSize);
	char* readData();
	void releaseBuf();
	bool writeData(const char* writedData, unsigned int dataSize);

private:
	/**
	 * data buffer to store data read from bus
	 */
	char m_dataBuf[80960];
	/**
	 * end pointer of data buffer
	 */
	char* m_endPtr;
	/**
	 * pointer used to read data form buffer
	 */
	char* m_readPtr;
	/**
	 * statr pointer of data buffer
	 */
	char* m_startPtr;
	/**
	 * pointer use to write data to buffer
	 */
	char* m_writePtr;
	/**
	 * buffer used to store data read
	 */
	char m_readBuf[20000];
	
	/**
	 * size of cyclic buffer
	 */
	unsigned int m_cycBufSize;

};
#endif // !defined(EA_79624BC7_BB4C_4e04_BA35_C7BF6F1EC6C7__INCLUDED_)
