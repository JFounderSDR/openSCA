################################################################################
# openSCA/frameworks
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version2.2.2, developed and copyrighted by JFounder Inc. 
################################################################################

#Version required
cmake_minimum_required(VERSION 3.5)

SET(LIBRARY_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/libs/frameworks")
SET(EXECUTABLE_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/libs/frameworks")

SET(FRAMEWORKS_DIR "${PROJECT_SOURCE_DIR}/frameworks")

link_libraries(
       "${PROJECT_SOURCE_DIR}/libs/runtime_env/liborb_abstraction.so"
       "${PROJECT_SOURCE_DIR}/libs/runtime_env/librte_utils.so"
       "${PROJECT_SOURCE_DIR}/libs/tiny1xml/libtiny1xml.so"
)

INCLUDE_DIRECTORIES(
		"${FRAMEWORKS_DIR}/CF_Interface/include"
		"${FRAMEWORKS_DIR}/libCF_Utils/include"
		"${FRAMEWORKS_DIR}/libCF_StdPorts/include"
		"${FRAMEWORKS_DIR}/Application/include"
		"${FRAMEWORKS_DIR}/ApplicationFactory/include"
        "${FRAMEWORKS_DIR}/File/include"
		"${FRAMEWORKS_DIR}/FileSystem/include"
        "${FRAMEWORKS_DIR}/FileManager/include"
        "${FRAMEWORKS_DIR}/XMLParser/include"
)

#add subdirectory
add_subdirectory(${FRAMEWORKS_DIR}/CF_Interface)
add_subdirectory(${FRAMEWORKS_DIR}/libCF_Utils)
add_subdirectory(${FRAMEWORKS_DIR}/libCF_StdPorts)
add_subdirectory(${FRAMEWORKS_DIR}/File)
add_subdirectory(${FRAMEWORKS_DIR}/FileSystem)
add_subdirectory(${FRAMEWORKS_DIR}/FileManager)
add_subdirectory(${FRAMEWORKS_DIR}/XMLParser)
add_subdirectory(${FRAMEWORKS_DIR}/DeviceMgr)
add_subdirectory(${FRAMEWORKS_DIR}/Application)
add_subdirectory(${FRAMEWORKS_DIR}/ApplicationFactory)
add_subdirectory(${FRAMEWORKS_DIR}/DomainMgr)
add_subdirectory(${FRAMEWORKS_DIR}/BootLoader)
add_subdirectory(${FRAMEWORKS_DIR}/NamingService)

