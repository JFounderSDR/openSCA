################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openDDS is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

if(MSVC_VERSION EQUAL 1900)
    if(CMAKE_CL_64)
        include("${CMAKE_CURRENT_LIST_DIR}/x64Win64VS2015/fastrtps-config.cmake")
    else()
        include("${CMAKE_CURRENT_LIST_DIR}/i86Win32VS2015/fastrtps-config.cmake")
    endif()
elseif(MSVC_VERSION GREATER 1900)
    if(CMAKE_CL_64)
        include("${CMAKE_CURRENT_LIST_DIR}/x64Win64VS2017/fastrtps-config.cmake")
    else()
        include("${CMAKE_CURRENT_LIST_DIR}/i86Win32VS2017/fastrtps-config.cmake")
    endif()
else()
    message(FATAL_ERROR "Not supported version of Visual Studio")
endif()
