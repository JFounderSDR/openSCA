/***************************************************************************//**
* @file     TimeDelay.h
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
#ifndef __TIMEDELAY_H
#define __TIMEDELAY_H

#ifdef __SDS_OS_VXWORKS__
#include "taskLib.h"
#include "usrLib.h"
#include "tickLib.h"
#include "sysLib.h"
#include "semLib.h"
#endif

#include "utils.h"

/**
 * @brief The operation shall make the thread who invokes this operation
 *        sleep specific time, unit is millisecond.
 */
void
sMsSleep(
    unsigned long ms);

#endif /* __TIMEDELAY_H */
