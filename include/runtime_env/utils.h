/***************************************************************************//**
* @file     utils.h
* @author   open Team
* @version  9
* @date     2017-03-16
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

#if !defined __UTILS_H_
#define __UTILS_H_

#include <string.h>
#include <vector>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <unistd.h>

#include "macros.h"
#include "ConfigParser.h"
#include "TimeDelay.h"
#include "rte_debug.h"
#include "Boost_utils.h"

#define SDS_SLEEP                               1000000
///< unsigned long of max size
#define ULONG_MAX_SIZE                          10
#define TASK_PARAMS_COUNT                       6

#define MAX_MESSAGE_NUM                         1000
#define MAX_MESSAGE_LENGTH                      2048

#define MSG_Q_WAIT                              0
#define MSG_Q_NOWAIT                            1

#ifdef __SDS_OS_LINUX__
#define ERROR                                   -1
#define OK                                      0
#endif

#define swap16(s)                               ((((s) & 0x00ff) << 8) | \
                                                (((s) & 0xff00) >> 8))

#define swap32(s)                               ((((s) & 0x000000ff) << 24) |  \
                                                (((s) & 0x0000ff00) <<  8) |   \
                                                (((s) & 0x00ff0000) >>  8) |   \
                                                (((s) & 0xff000000) >> 24))

#define LocalToBigEndian_16(s)                  (IsBigEndian() ? s : swap16(s))
#define LocalToBigEndian_32(s)                  (IsBigEndian() ? s : swap32(s))
#define BigToLocalEndian_16(s)                  (IsBigEndian() ? s : swap16(s))
#define BigToLocalEndian_32(s)                  (IsBigEndian() ? s : swap32(s))

#define LocalToLeastEndian_16(s)                (IsBigEndian() ? swap16(s) : s)
#define LocalToLeastEndian_32(s)                (IsBigEndian() ? swap32(s) : s)
#define LeastToLocalEndian_16(s)                (IsBigEndian() ? swap16(s) : s)
#define LeastToLocalEndian_32(s)                (IsBigEndian() ? swap32(s) : s)

#define ETH_ADDR_MAP_PROP_ID                    "DCE:e809635d-5fae-42e5-bb10- \
                                                    177f736b4b15:1"
#define SRIO_ADDR_MAP_PROP_ID                   "DCE:438247b3-473f-485c-a6f6- \
                                                    8efc237f2fe6:1"
#define INSTANCE_NUM_PROP_ID                    "DCE:c5a4caf4-1acb-4301-baf1- \
                                                    6c398e9aa743:1"
#define MAIN_CTRL_MHAL_SRIO_PORT_ID             "DCE:fc601789-b6bf-4b64-8c49- \
                                                    733793f50f14:1"
#define HEARTBEAT_REQUEST_PROP_ID               "DCE:a289ce03-be97-4dfd-a1b0- \
                                                    4c7a5c8c0a56:1"

#define ADD_ADDR_MAP                            0x01
#define DEL_ADDR_MAP                            0x02
#define SINGLE_ETH_ADDR_MAP_ITEM_LENGTH         8
#define SINGLE_SRIO_ADDR_MAP_ITEM_LENGTH        4
#define LOGICAL_ADDR_LENGTH                     2
#define ETH_PHYSICAL_ADDR_LENGTH                6
#define SRIO_PHYSICAL_ADDR_LENGTH               2

typedef char    c6[6];

#define HEARTBEAT_REQUEST_EVENT                 1
#define MAX_CONTINOUS_DETECTED_BROKEN_TIMES     2

#ifdef __SDS_OS_VXWORKS__
typedef int pid_type;
#elif defined __SDS_OS_LINUX__
typedef pid_t pid_type;

typedef std::map<std::string, pid_t> PidMap;
#endif

typedef struct {
    c6 ethPhyAddr;
} EthPhyAddrType;

/**
 * @brief  Params task needs.
 */
typedef struct 
{
    unsigned long
    stackSize;                  ///< stack size the task needs
    unsigned long priority;     ///< task's priority
    char* entryPoint;           ///< task's entry point
} TaskParamsType;

namespace CONSTANT {

extern const char * FSROOT;
extern const char * SDRROOT;
extern const char * NAMING_SERVICE_SPDPATH;
extern const char * EVENT_SERVICE_SPDPATH;
extern const char * MAINDCDPATH;
extern const char * DMDPATH;
extern const char * MOUNTPOINT;
extern const char * OPENSCA_DOMAIN;
extern const char * APPLICATIONS;
extern const char * NODES;
extern const char * FILEMANAGER;
extern const char * MAIN_NODE;
extern const char * DEBUGLEVEL;
extern const char * HEALTH_PROP_ID;
extern const char * IS_BOARD_PROP_ID;
extern const char * AGGREGATE_SERVICE_SPDPATH;
extern const char * HEARTBEAT_DETECTION_SERVICE;
extern const char * KEYPATH;
extern const char * SNFILE;
extern const char * NAMING_SERVICE_ENDPOINTS;
}

#ifdef __SDS_OS_LINUX__
typedef int MsgQId;
#elif defined __SDS_OS_VXWORKS__
typedef MSG_Q_ID MsgQId;
#endif

extern MsgQId loadMsgQueue;

#ifdef __SDS_OS_VXWORKS__
extern SEM_ID domainMgrMtx;
extern SEM_ID devMgrMtx;
extern SEM_ID sysMgrMtx;
#endif

extern void 
delete2DArray(
    int argc, 
    char ** argv);

/**
 * @brief The operation shall create a message queue.
 * @param[inout] msgQId     Id of the message queue created.
 * @return Result of creating the message queue.
 * @retval true   Create message queue successfully.
 * @retval false  Create message queue failed.
 */
extern bool 
createMsgQueue(
    MsgQId & msgQId);

/**
 * @brief The operation shall send a message to specific message queue.
 * @param[in]   msgId   Id of the message queue to which message will be sent.
 * @param[in]   msg     Message will be sent to the message queue.
 * @param[in]   msgSize Size of the sent message.
 * @return  Result of sending message to the message queue.
 * @retval  Send successfully.
 * @retval  Send failed.
 */
extern bool 
msgSend(
    MsgQId msgId, 
    char * msg, 
    unsigned int msgSize);

/**
 * @brief   The operation shall receive message from specific message queue.
 * @param[in]    msgId     Id of message queue from which receive message.
 * @param[inout] msg       Message received from the message queue.
 * @param[in]    msgSize   Expected size of the message received.
 * @param[in]    flag      Flag of waiting or no waiting if there is no message
 *                         in message queue when receive, optional value are
 *                         MSG_Q_WAIT and MSG_Q_NOWAIT.
 * @return Actual size of the message received.
 */
extern int 
msgReceive(
    MsgQId msgId, 
    char * msg, 
    unsigned int msgSize, 
    int flag);

/**
 * @brief   The operation shall delete the specific message queue.
 * @param[in] qid   Id of message queue will be deleted.
 * @return Result of deleting the message queue.
 * @retval true     Delete successfully.
 * @retval false    Delete failed.
 */
extern bool 
delMsgQueue(
    MsgQId qid);

extern bool 
IsBigEndian();

/**
 * @brief   The operation convert an integer to string.
 */
extern char * 
IntTOStr(
    int num);

extern void 
showErrnoInfo();

/**
 * @brief   The operation check whether the input parameter is 
 *          accord with the format of ip address.
 */
extern bool 
checkIpFormat(
    const char * ip);

/**
 * @brief   The operation check whether the input parameter is 
 *          accord with the format of Hex.
 */
extern bool 
checkHexFormat(
    const char * hexStr);

/**
 * @brief   Convert hex string to dec number whose type is short.
 * 
 * @param[in]     hexStr    string need to be converted.
 * @param[inout]  result    dec number converted by string.
 * 
 * @return  result of convertion.
 * @retval  true    convert successfully.
 * @retval  false   convert failed.
 */
extern bool 
hexConvertToDec(
    const char * hexStr, 
    short & result);

/**
 * @brief   Convert hex string to dec number whose type is unsigned short.
 * 
 * @param[in]     hexStr    string need to be converted.
 * @param[inout]  result    dec number converted by string.
 * 
 * @return  result of convertion.
 * @retval  true    convert successfully.
 * @retval  false   convert failed.
 */
extern bool 
hexConvertToDec(
    const char * hexStr, 
    unsigned short & result);

/**
 * @brief   Convert hex string to dec number whose type is long.
 * 
 * @param[in]     hexStr    string need to be converted.
 * @param[inout]  result    dec number converted by string.
 * 
 * @return  result of convertion.
 * @retval  true    convert successfully.
 * @retval  false   convert failed.
 */
extern bool 
hexConvertToDec(
    const char * hexStr, 
    long & result);

/**
 * @brief   Convert hex string to dec number whose type is unsigned long.
 * 
 * @param[in]     hexStr    string need to be converted.
 * @param[inout]  result    dec number converted by string.
 * 
 * @return  result of convertion.
 * @retval  true    convert successfully.
 * @retval  false   convert failed.
 */
extern bool 
hexConvertToDec(
    const char * hexStr, 
    unsigned long & result);

std::string
replaceFileNameofPath(
    const char* fullPath,
    const char* fileName);

/**
 *  configure opensca.conf path.
 */
void
setConfigFilePathToSHM(
    const char * path);

/**
 * get opensca.conf path.
 * 
 * @param[in] path  storage path information
 * @param[in] size  maximum path length  
 */
void
getConfigFilePathFromSHM(
    char * path,
    int size);

#endif //_LIBCF_UTILS_H_
