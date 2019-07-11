/***************************************************************************//**
* @file     Boost_utils.h
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

#if !defined _BOOST_UTILS_H_
#define _BOOST_UTILS_H_

#include <string>
#include "rte_debug.h"
#include <iostream>
#include <boost/interprocess/managed_shared_memory.hpp>
#include <boost/interprocess/sync/interprocess_mutex.hpp>
#include <boost/interprocess/sync/interprocess_condition.hpp>
#include <boost/interprocess/sync/scoped_lock.hpp>
#include <boost/interprocess/sync/interprocess_semaphore.hpp>
#include <boost/interprocess/containers/string.hpp>
#include <boost/interprocess/allocators/allocator.hpp>
#include <boost/thread/thread.hpp>
#include <boost/bind.hpp>
#include <boost/smart_ptr.hpp>

///< create shared memory of start bootloader
#define SCA_SHM_SIZE							(1024)
///< Name of shared memory from boost, contains semaphores, locks, conditional variables
#define SCA_SHM                                 ("sca_shm")

namespace BOOST_CONSTANT {
extern const char * DEVICE_MANAGER_CND;
extern const char * DOMAIN_MANAGER_CND;
extern const char * SYSTEM_MANAGER_CND;
extern const char * APP_MUTEX_CND;
extern const char * INIT_DEVICE_CND;
extern const char * MUTEX_CND;
extern const char * COMP_SYNCHRO_SEM;
extern const char * CHECK_APP_STATUS;
}

/**
 * Create a shared memory with given name and size.
 */
void
createSharedMemory(
    const std::string & shmName,
    int size);

/**
 * Destruction a shared memory with given name.
 */
void
removeSharedMemory(
    const std::string & shmName);

/**
 * Condition variable notice the state of all threads waiting on this to ready.
 */
void
notifyConditionTrue(
    const std::string & conditionName);

/**
 * Condition variable notice the state of all threads get lock.
 */
void
waitConditionTrue(
    const std::string & conditionName);

/**
 * Process locking.
 */
void
sds_lock(
    const std::string & lockName);

void
sds_lock_destroy(
    const std::string & lockName);

/**
 * Process unlocking.
 */
void
sds_unlock(
    const std::string & lockName);

/**
 * Decrements the interprocess_semaphore. If the interprocess_semaphore value is not greater than zero,
 * then the calling process/thread blocks until it can decrement the counter.
 */
inline void
waitSemaphore(
    const std::string & semName,
    int initVal = 0) {
	try {

		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		boost::interprocess::interprocess_semaphore * sem =
		    managed_shm.find_or_construct<boost::interprocess::interprocess_semaphore>
		    (semName.c_str())(initVal);
		sem->wait();
	} catch (boost::interprocess::interprocess_exception & ex) {
		RTE_DEBUG(0, [Boost_utils::waitSemaphore],
			" waitSemaphore interprocess exception:" << ex.what())
	}
}

void
destroySemaphore(
	const std::string & semName);

/**
 * Increments the interprocess_semaphore count. If there are processes/threads blocked waiting
 * for the interprocess_semaphore, then one of these processes will return successfully from
 * its wait function.
 */
inline void
postSemaphore(
    const std::string & semName,
    int initVal = 0) {
	try {
		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		boost::interprocess::interprocess_semaphore * sem =
		    managed_shm.find_or_construct< boost::interprocess::interprocess_semaphore >
		    (semName.c_str())(initVal);
		sem->post();
	} catch (boost::interprocess::interprocess_exception & ex) {
		RTE_DEBUG(0, [Boost_utils::postSemaphore],
			" postSemaphore interprocess exception:" << ex.what())
	}
}

#endif //_BOOST_UTILS_H_
