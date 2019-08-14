################################################################################
# openSCA/configure.cmake
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version2.2.2, developed and copyrighted by JFounder Inc. 
################################################################################

################################################################################
# CMake build rules for openSCA
################################################################################

cmake_minimum_required(VERSION 3.5)

#project output root directory
set(PROJECT_DIR /home/jf-yt)

#the root path of source project
set(PROJECT_SOURCE_DIR "${PROJECT_DIR}/openSCA")

#set default install directory 
set(CMAKE_INSTALL_PREFIX "${PROJECT_DIR}/install")

#cross compiler directory
set(COMPILER_DIR "${PROJECT_DIR}/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf")
