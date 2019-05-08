################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openDDS is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

###############################################################################
# Set common CPACK variables.
###############################################################################
include (InstallRequiredSystemLibraries)

set(CPACK_PACKAGE_NAME "openSCA-SDK4.6.8-ARMv7.linux-gcc4.9.2-ubuntu")

set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "${CPACK_PACKAGE_NAME} - ${${PROJECT_NAME}_DESCRIPTION_SUMMARY}")

set(CPACK_PACKAGE_DESCRIPTION "${${PROJECT_NAME}_DESCRIPTION}")

set(CPACK_PACKAGE_VENDOR "openSCA")
set(CPACK_PACKAGE_CONTACT "openSCA Support <support@onetek.net>")

set(CPACK_PACKAGE_VERSION_MAJOR ${PROJECT_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${PROJECT_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${PROJECT_VERSION_PATCH})
set(CPACK_PACKAGE_VERSION ${PROJECT_VERSION})

set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")

set(CPACK_COMPONENT_CMAKE_HIDDEN 1)
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} cmake)

###############################################################################
# Platform and architecture dependant
###############################################################################
if(WIN32)
    set(CPACK_GENERATOR NSIS)

    configure_file(${PROJECT_SOURCE_DIR}/cmake/packaging/windows/WindowsPackaging.cmake.in ${PROJECT_BINARY_DIR}/cmake/packaging/windows/WindowsPackaging.cmake @ONLY)
    configure_file(${PROJECT_SOURCE_DIR}/cmake/packaging/windows/NSISPackaging.cmake.in ${PROJECT_BINARY_DIR}/cmake/packaging/windows/NSISPackaging.cmake @ONLY)

    # Update CMAKE_MODULE_PATH to find NSIS.template.in
    set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} "${PROJECT_SOURCE_DIR}/cmake/packaging/windows")

    # Set cpack project config file.
    set(CPACK_PROJECT_CONFIG_FILE ${PROJECT_BINARY_DIR}/cmake/packaging/windows/WindowsPackaging.cmake)
elseif(${CMAKE_SYSTEM_NAME} STREQUAL "Linux")
    set(CPACK_GENERATOR TGZ)
    set(CPACK_SOURCE_GENERATOR TGZ)

    # Prepare specific cmake scripts
    configure_file(${PROJECT_SOURCE_DIR}/cmake/packaging/linux/LinuxPackagingSDK.cmake.in LinuxPackagingSDK.cmake @ONLY)

    # Prepare scripts for autotools
    include(${PROJECT_SOURCE_DIR}/cmake/packaging/linux/autotools_generator_utility.cmake)
    # Set cpack project config file.
    set(CPACK_PROJECT_CONFIG_FILE LinuxPackaging.cmake)
endif()

include(CPack)
