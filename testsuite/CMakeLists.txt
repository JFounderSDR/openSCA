################################################################################
# openSCA/testsuite
# Copyright 2019 JFounder, Inc.
# OPENSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# OPENSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

option(OPENSCA_TESTS "Activate the building and execution of performance tests" OFF)
option(PROFILING_TESTS "Activate the building and execution of profiling tests" OFF)
option(OPENSCA_BUILD_TESTS "Activate the building and execution unit tests and integral tests" OFF)

if(OPENSCA_BUILD AND NOT OPENSCA_INSTALLER AND NOT OPENSCA_INSTALLER_MINION)
    set(OPENSCA_BUILD_TESTS ON)
endif()

file(TO_CMAKE_PATH "${PROJECT_SOURCE_DIR}/valgrind.supp" MEMORYCHECK_SUPPRESSIONS_FILE_TMP)
set(MEMORYCHECK_SUPPRESSIONS_FILE ${MEMORYCHECK_SUPPRESSIONS_FILE_TMP} CACHE FILEPATH "Valgrind suppresions file")

###############################################################################
# Testing
###############################################################################
if(OPENSCA_BUILD_TESTS AND IS_TOP_LEVEL AND NOT OPENSCA_INSTALLER)
    add_subdirectory(blackbox)
    add_subdirectory(communication)
    add_subdirectory(unittest)
endif()

###############################################################################
# Profiling tests using valgrind
###############################################################################
if(NOT ((MSVC OR MSVC_IDE)) AND PROFILING_TESTS)
   find_program(CTEST_MEMORYCHECK_COMMAND NAMES valgrind)
   if(CTEST_MEMORYCHECK_COMMAND)
      add_subdirectory(profiling)
   endif()
endif()

###############################################################################
# Performance tests
###############################################################################
if(PERFORMANCE_TESTS)
    add_subdirectory(performance)
endif()