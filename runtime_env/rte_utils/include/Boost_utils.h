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
#include "debug.h"
#include <iostream>
#include <boost/interprocess/managed_shared_memory.hpp>
#include <boost/interprocess/sync/interprocess_mutex.hpp>
#include <boost/interprocess/sync/interprocess_condition.hpp>
#include <boost/interprocess/sync/scoped_lock.hpp>
#include <boost/interprocess/sync/interprocess_semaphore.hpp>
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
inline void
createSharedMemory(
    const std::string & shmName,
    int size) {
	boost::interprocess::managed_shared_memory
	managed_shm(boost::interprocess::create_only, shmName.c_str(), size);
}

/**
 * Destruction a shared memory with given name.
 */
inline void
removeSharedMemory(
    const std::string & shmName) {
	boost::interprocess::shared_memory_object::remove(shmName.c_str());
}

/**
 * Condition variable notice the state of all threads waiting on this to ready.
 */
inline void
notifyConditionTrue(
    const std::string & conditionName) {
	try {

		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		boost::interprocess::interprocess_condition * cnd =
		    managed_shm.find_or_construct<boost::interprocess::interprocess_condition>
		    (conditionName.c_str())();

		cnd->notify_all();

	} catch (boost::interprocess::interprocess_exception & ex) {
		DEBUG(7, waitConditionTrue,
		      " notifyConditionTrue interprocess exception:" << ex.what())
	}
}

/**
 * Condition variable notice the state of all threads get lock.
 */
inline void
waitConditionTrue(
    const std::string & conditionName) {
	try {

		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		boost::interprocess::interprocess_mutex * mtx =
		    managed_shm.find_or_construct<boost::interprocess::interprocess_mutex>("mtx")();
		boost::interprocess::interprocess_condition * cnd =
		    managed_shm.find_or_construct<boost::interprocess::interprocess_condition>
		    (conditionName.c_str())();
		boost::interprocess::scoped_lock<boost::interprocess::interprocess_mutex> lock(
		    *mtx );

		cnd->notify_all();
		cnd->wait(lock);

	} catch (boost::interprocess::interprocess_exception & ex) {
		DEBUG(7, waitConditionTrue,
		      " waitConditionTrue interprocess exception:" << ex.what())
	}
}

/**
 * Process locking.
 */
inline void
sds_lock(
    const std::string & lockName) {
	try {

		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		boost::interprocess::interprocess_mutex * mtx =
		    managed_shm.find_or_construct<boost::interprocess::interprocess_mutex>
		    (lockName.c_str())();
		mtx->lock();

	} catch (boost::interprocess::interprocess_exception & ex) {
		DEBUG(7, sds_lock, " sds_lock interprocess exception:" << ex.what())
	}
}

inline void
sds_lock_destroy(
    const std::string & lockName) {
	try {
		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		bool result = managed_shm.destroy<boost::interprocess::interprocess_mutex>
		              (lockName.c_str());
	} catch (boost::interprocess::interprocess_exception & ex) {
		DEBUG(7, sds_lock, " sds_lock_destroy interprocess exception:" << ex.what())
	}
}

/**
 * Process unlocking.
 */
inline void
sds_unlock(
    const std::string & lockName) {
	try {

		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		boost::interprocess::interprocess_mutex * mtx =
		    managed_shm.find_or_construct<boost::interprocess::interprocess_mutex>
		    (lockName.c_str())();
		mtx->unlock();

	} catch (boost::interprocess::interprocess_exception & ex) {
		DEBUG(7, sds_unlock, " sds_unlock interprocess exception:" << ex.what())
	}
}

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
		DEBUG(7, waitSemaphore, " waitSemaphore interprocess exception:" << ex.what())
	}
}

inline void destroySemaphore(const std::string &semName) {
	try {
		boost::interprocess::managed_shared_memory managed_shm(
		    boost::interprocess::open_only, SCA_SHM);
		bool result = managed_shm.destroy<boost::interprocess::interprocess_semaphore>
		              (semName.c_str());
	} catch (boost::interprocess::interprocess_exception & ex) {
		DEBUG(7, waitSemaphore, " destroySemaphore interprocess exception:" <<
		      ex.what())
	}
}

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
		DEBUG(7, postSemaphore, " postSemaphore interprocess exception:" << ex.what())
	}
}

#endif //_BOOST_UTILS_H_