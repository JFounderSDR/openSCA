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

#Version required
cmake_minimum_required(VERSION 3.5)

SET(LIBRARY_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/libs/testsuite")
SET(EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/libs/testsuite")

SET(TESTSUITE_DIR "${PROJECT_SOURCE_DIR}/testsuite")

INCLUDE_DIRECTORIES("${PROJECT_SOURCE_DIR}/include/CF"
				"${TESTSUITE_DIR}/test_utils/include"
				"${TESTSUITE_DIR}/test_baseInterface/include")
				
add_subdirectory(test_utils)
add_subdirectory(test_baseInterface)
add_subdirectory(base_test_main)
add_subdirectory(test_applicationCommunication_main)
