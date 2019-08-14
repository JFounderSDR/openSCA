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

###############################################################################
# CMake build rules for openSCA
###############################################################################

cmake_minimum_required(VERSION 3.5)

# target os
SET(CMAKE_SYSTEM_NAME Linux)

include(./configure.cmake)

#Set lib out path, the lib generated will be export into this destinestion directory
SET(LIBRARY_OUTPUT_PATH "${PROJECT_SOURCE_DIR}/libs")

#the include path of source project
set(PROJECT_INCULDE_DIR "${PROJECT_SOURCE_DIR}/include")

#project bin directory
set(PROJECT_BINARY_DIR "${PROJECT_SOURCE_DIR}/bin")

# Set CMAKE_BUILD_TYPE to Release by default.
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
    message(STATUS "Setting build type to 'Release' as none was specified.")
    set(CMAKE_BUILD_TYPE Release CACHE STRING
        "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
        FORCE)
    set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

###############################################################################
# Version information                                                         #
###############################################################################

# Set version
set(LIB_MAJOR_VERSION 0)
set(LIB_MINOR_VERSION 6)
set(LIB_PATCH_VERSION 0)
set(LIB_VERSION_STR "${LIB_MAJOR_VERSION}.${LIB_MINOR_VERSION}.${LIB_PATCH_VERSION}")
message(STATUS "library version is ${LIB_VERSION_STR}")

###############################################################################
# Project                                                                     #
###############################################################################

if(CMAKE_VERSION VERSION_LESS 3.0)
    project(openSCA C CXX)
    set(PROJECT_VERSION_MAJOR "${LIB_MAJOR_VERSION}")
    set(PROJECT_VERSION_MINOR "${LIB_MINOR_VERSION}")
    set(PROJECT_VERSION_PATCH "${LIB_PATCH_VERSION}")
    set(PROJECT_VERSION "${LIB_VERSION_STR}")
else()
    cmake_policy(SET CMP0048 NEW)
    project(openSCA VERSION "${LIB_VERSION_STR}" LANGUAGES C CXX)
endif()

set(PROJECT_NAME_STYLED "openSCA")
set(PROJECT_NAME_LARGE "Open SCA")
string(TOUPPER "${PROJECT_NAME}" PROJECT_NAME_UPPER)
set(${PROJECT_NAME}_DESCRIPTION_SUMMARY "C++ library implementation of SCA2.2.2")
set(${PROJECT_NAME}_DESCRIPTION "JFounder ${PROJECT_NAME_LARGE} library provides 
    open framework for Software Defined System.")

message(STATUS "Configuring ${PROJECT_NAME_LARGE}")
message(STATUS "Version: ${PROJECT_VERSION}")

###############################################################################
# Generation of windows installers.
###############################################################################
option(OPENSCA_INSTALLER "Activate the creation of a build to create windows installers" OFF)

###############################################################################
# openSCA build options
###############################################################################
option(OPENSCA_BUILD "Activate internal building" ON)

if(OPENSCA_INSTALLER)
    set(OPENSCA_BUILD ON)
endif()

###############################################################################
# Warning level
###############################################################################
if(MSVC OR MSVC_IDE)
    if(CMAKE_CXX_FLAGS MATCHES "/W[0-4]")
        string(REGEX REPLACE "/W[0-4]" "/W4" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    else()
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /W4")
    endif()

    if(OPENSCA_EXTRA_CMAKE_CXX_FLAGS)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${OPENSCA_EXTRA_CMAKE_CXX_FLAGS}")
    endif()

    if(OPENSCA_BUILD)
        string(REPLACE "/DNDEBUG" "" CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
    endif()
else()
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -pedantic -Wextra -Wno-unknown-pragmas")
    if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
        set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,--no-undefined")
    elseif(CMAKE_CXX_COMPILER_ID MATCHES "Clang")
        set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -Wl,-undefined,error")
    endif()

    if(OPENSCA_BUILD)
        string(REPLACE "-DNDEBUG" "" CMAKE_CXX_FLAGS_RELWITHDEBINFO "${CMAKE_CXX_FLAGS_RELWITHDEBINFO}")
    endif()
endif()

###############################################################################
# Complier Settings
###############################################################################
include(./cmake/common/compiler_setting.cmake)

# display compiler options
set(CMAKE_VERBOSE_MAKEFILE ON)

SET(ACE_LIB_DIR "${PROJECT_SOURCE_DIR}/libs/ace_tao")
SET(TINY1XML_LIB_DIR "${PROJECT_SOURCE_DIR}/libs/tiny1xml")
SET(RUNTIME_LIB_DIR "${PROJECT_SOURCE_DIR}/libs/runtime_env")
SET(ACE_INCLUDE_DIR "${PROJECT_SOURCE_DIR}/include/ACE_wrappers")

link_directories("${PROJECT_SOURCE_DIR}/libs/boost")

#link include directories
INCLUDE_DIRECTORIES("${PROJECT_INCULDE_DIR}/tiny1xml"
		              "${PROJECT_INCULDE_DIR}"
                  "${PROJECT_INCULDE_DIR}/runtime_env"
                  "${ACE_INCLUDE_DIR}" 
                  "${ACE_INCLUDE_DIR}/ace"
                  "${ACE_INCLUDE_DIR}/TAO"
                  "${ACE_INCLUDE_DIR}/TAO/tao"
                  "${ACE_INCLUDE_DIR}/TAO/orbsvcs"
                  "${ACE_INCLUDE_DIR}/TAO/orbsvcs/CosEvent"
                  "${COMPILER_DIR}/include")

###############################################################################
# Compile library.
###############################################################################
include (./BuildOption.cmake)

if (FRAMEWORKS_BUILD)
	add_subdirectory(frameworks)
endif()

if (EXAMPLES_BUILD)
	add_subdirectory(examples)
endif()

###############################################################################
# GCC colors if using CCache
###############################################################################
if("${CMAKE_CXX_COMPILER_LAUNCHER}" STREQUAL "ccache" AND
        CMAKE_COMPILER_IS_GNUCXX AND
        CMAKE_CXX_COMPILER_VERSION VERSION_GREATER 4,8)
    add_compile_options(-fdiagnostics-color=always)
endif()

###############################################################################
# Test system configuration
###############################################################################
include(${PROJECT_SOURCE_DIR}/cmake/common/check_configuration.cmake)
set(FORCE_CXX "11")
check_stdcxx()
check_compile_feature()
check_endianness()

###############################################################################
# Check MSVC architecture
###############################################################################
if(MSVC OR MSVC_IDE)
    check_msvc_arch()
endif()

###############################################################################
# Internal debug messages
###############################################################################

option(INTERNAL_DEBUG "Activate developer debug messages" OFF)
if(OPENSCA_BUILD AND NOT OPENSCA_INSTALLER_MINION)
    set(INTERNAL_DEBUG ON)
endif()

###############################################################################
# Load CMake modules
###############################################################################
set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${PROJECT_SOURCE_DIR}/cmake/modules)

###############################################################################
# Default shared libraries
###############################################################################
# Global flag to cause add_library() to create shared libraries if on.
# If set to true, this will cause all libraries to be built shared
# unless the library was explicitly added as a static library.
option(BUILD_SHARED_LIBS "Create shared libraries by default" ON)

###############################################################################
# Load external projects.
###############################################################################
include(${PROJECT_SOURCE_DIR}/cmake/common/opensca_libraries.cmake)
option(TO_FIND_PACKAGE "Activate other package or thirdparty" OFF)

if(TO_FIND_PACKAGE)
	OPENSCA_find_thirdparty(Boost boost)
	OPENSCA_find_thirdparty(TinyXML2 tinyxml2)
endif()

###############################################################################
# Security Options
###############################################################################
option(SECURITY "Activate security" OFF)

if(SECURITY)
    find_package(OpenSSL REQUIRED)
    messages(STATUS "entering find_package OpenSSL")
endif()

###############################################################################
# Testing options
###############################################################################
enable_testing()
include(CTest)
add_subdirectory(testsuite)

if(OPENSCA_BUILD AND IS_TOP_LEVEL AND NOT OPENSCA_INSTALLER AND NOT OPENSCA_INSTALLER_MINION)
    set(COMPILE_EXAMPLES ON)
endif()

if(COMPILE_EXAMPLES)
    add_subdirectory(examples)
endif()

###############################################################################
# Documentation
###############################################################################
include(./cmake/common/doxygen.cmake)

###############################################################################
# Installation paths for SDK
# here use relative path. for examples "." represent root directory in SDK
###############################################################################
#set default install directory 
set(BIN_INSTALL_DIR . CACHE PATH "Installation directory for binaries")
set(CMAKE_INSTALL_DIR . CACHE PATH "Installation directory for cmake")
set(INCLUDE_INSTALL_DIR . CACHE PATH "Installation directory for C++ headers")
set(LIB_INSTALL_DIR . CACHE PATH "Installation directory for libraries")
set(DEMOS_INSTALL_DIR . CACHE PATH "Installation directory for demos")
set(IDL_INSTALL_DIR . CACHE PATH "Installation directory for idl")
set(TESTSUITE_INSTALL_DIR . CACHE PATH "Installation directory for testsuite")
set(TOOLS_INSTALL_DIR . CACHE PATH "Installation directory for tools")

if(WIN32)
    set(DOC_DIR docs)
else()
    set(DOC_DIR .)
endif()

set(DOC_INSTALL_DIR ${DOC_DIR} CACHE PATH "Installation directory for documentation")

if(WIN32 AND OPENSCA_INSTALLER AND IS_TOP_LEVEL)
    set(LICENSE_INSTALL_DIR . CACHE PATH "Installation directory for licenses")
else()
    set(LICENSE_INSTALL_DIR . CACHE PATH "Installation directory for licenses")
endif()

###############################################################################
# Packaging openSCA-SDK
###############################################################################
# Install licenses
install(FILES ${PROJECT_SOURCE_DIR}/LICENSE
    DESTINATION ${LICENSE_INSTALL_DIR}
    COMPONENT licenses
    )
set(CPACK_COMPONENT_LICENSES_HIDDEN 1)
set(CPACK_COMPONENTS_ALL licenses)

# Install binaries
install(DIRECTORY ${PROJECT_SOURCE_DIR}/bin
    DESTINATION ${BIN_INSTALL_DIR}
    COMPONENT binaries)
set(CPACK_COMPONENT_BINARIES_DISPLAY_NAME "binaries")
set(CPACK_COMPONENT_BINARIES_DESCRIPTION "openSCA binaries")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} binaries)

# cpack cmake
install(DIRECTORY ${PROJECT_SOURCE_DIR}/cmake
    DESTINATION ${CMAKE_INSTALL_DIR}
    COMPONENT cmake)
set(CPACK_COMPONENT_CMAKE_DISPLAY_NAME "cmake")
set(CPACK_COMPONENT_CMAKE_DESCRIPTION "OPENSCA cmake")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} cmake)

# Install headers
install(DIRECTORY ${PROJECT_SOURCE_DIR}/include
    DESTINATION ${INCLUDE_INSTALL_DIR}
    COMPONENT headers)
set(CPACK_COMPONENT_HEADERS_DISPLAY_NAME "headers")
set(CPACK_COMPONENT_HEADERS_DESCRIPTION "openSCA headers")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} headers)

# Install demos
install(DIRECTORY ${PROJECT_SOURCE_DIR}/demos
    DESTINATION ${DEMOS_INSTALL_DIR}
    COMPONENT demos)
set(CPACK_COMPONENT_DEMOS_DISPLAY_NAME "demos")
set(CPACK_COMPONENT_DEMOS_DESCRIPTION "OPENSCA demos")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} demos)

# Install idl
install(DIRECTORY ${PROJECT_SOURCE_DIR}/idl
    DESTINATION ${IDL_INSTALL_DIR}
    COMPONENT idl)
set(CPACK_COMPONENT_IDL_DISPLAY_NAME "idl")
set(CPACK_COMPONENT_IDL_DESCRIPTION "OPENSCA idl")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} idl)

# Install tools
install(DIRECTORY ${PROJECT_SOURCE_DIR}/tools
    DESTINATION ${TOOLS_INSTALL_DIR}
    COMPONENT tools)
set(CPACK_COMPONENT_TOOLS_DISPLAY_NAME "tools")
set(CPACK_COMPONENT_TOOLS_DESCRIPTION "openSCA tools")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} tools)

# Install testsuite
install(DIRECTORY ${PROJECT_SOURCE_DIR}/testsuite
    DESTINATION ${TESTSUITE_INSTALL_DIR}
    COMPONENT headers)
set(CPACK_COMPONENT_TESTSUITE_DISPLAY_NAME "testsuite")
set(CPACK_COMPONENT_TESTSUITE_DESCRIPTION "openSCA testsuite")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} testsuite)

# Install etc
install(DIRECTORY ${PROJECT_SOURCE_DIR}/etc
    DESTINATION ${INCLUDE_INSTALL_DIR}
    COMPONENT etc)
set(CPACK_COMPONENT_ETC_DISPLAY_NAME "etc")
set(CPACK_COMPONENT_ETC_DESCRIPTION "openSCA etc")
set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} etc)

option(INSTALL_EXAMPLES "Install example" OFF)
if(OPENSCA_INSTALLER)
    set(INSTALL_EXAMPLES ON)
endif()

# Install examples
if(INSTALL_EXAMPLES)
  # Install examples
  install(DIRECTORY ${PROJECT_SOURCE_DIR}/examples
      DESTINATION ./
      COMPONENT examples
      PATTERN "examples/CMakeLists.txt" EXCLUDE
      )

  set(CPACK_COMPONENT_EXAMPLES_DISPLAY_NAME "Examples")
  set(CPACK_COMPONENT_EXAMPLES_DESCRIPTION "openSCA ${PROJECT_NAME_LARGE} examples")
  set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} examples)
endif()

if(BUILD_DOCUMENTATION)
    # Instalation of doxygen files
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/docs/api_reference
        DESTINATION ${DOC_INSTALL_DIR}
        COMPONENT documentation
        )

    ### Documentation component
    set(CPACK_COMPONENT_DOCUMENTATION_DISPLAY_NAME "Documentation")
    set(CPACK_COMPONENT_DOCUMENTATION_DESCRIPTION "openSCA ${PROJECT_NAME_LARGE} documentation")

    set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} documentation)
endif()

# Install libraries
if(MSVC OR MSVC_IDE)
    if(OPENSCA_INSTALLER)
        set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL}
            libraries_i86Win32VS2015
            libraries_x64Win64VS2015
            libraries_i86Win32VS2017
            libraries_x64Win64VS2017
            )
    else()
        set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} libraries_${MSVC_ARCH})
    endif()
else()
    install(DIRECTORY ${PROJECT_SOURCE_DIR}/libs
    DESTINATION ${LIB_INSTALL_DIR}
    COMPONENT libraries)
    set(CPACK_COMPONENT_LIBRARIES_DISPLAY_NAME "libraries")
    set(CPACK_COMPONENT_LIBRARIES_DESCRIPTION "OPENSCA libraries")
    set(CPACK_COMPONENTS_ALL ${CPACK_COMPONENTS_ALL} libraries)
endif()

include(${PROJECT_SOURCE_DIR}/cmake/packaging/OPENSCAPackagingSDK.cmake)
