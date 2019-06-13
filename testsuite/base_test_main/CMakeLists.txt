################################################################################
# openSCA/testsuite/test_interface_main
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version2.2.2, developed and copyrighted by JFounder Inc. 
################################################################################
cmake_minimum_required(VERSION 3.5)

project(base_test_main.out)

aux_source_directory (./src SRC)

add_executable(${PROJECT_NAME} ${SRC})

target_link_libraries(${PROJECT_NAME} test_baseInterface test_utils CF_Utils File FileSystem FileManager XMLParser CF_StdPorts ApplicationFactory Application)
