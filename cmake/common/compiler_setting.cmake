################################################################################
# openSCA/cmake/common
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

SET(CMAKE_C_COMPILER   "${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/bin/arm-xilinx-linux-gnueabi-gcc")
SET(CMAKE_CXX_COMPILER "${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/bin/arm-xilinx-linux-gnueabi-g++")
SET(CMAKE_AR "${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/bin/arm-xilinx-linux-gnueabi-ar")

# where is the target environment 
SET(CMAKE_FIND_ROOT_PATH 
	"${COMPILER_DIR}/SDK/2015.4/lib" 
	"${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/lib" 
	"${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc")

# search for programs in the build host directories (not necessary)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)

# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
			
# it is valid for c or cxx compiler
add_compile_options(-ldl)
set(CMAKE_CXX_FLAGS "-lrt -lpthread ${CMAKE_CXX_FLAGS}")

set(CMAKE_CXX_FLAGS_DEBUG "-g3 -Wall")

set(CMAKE_CXX_FLAGS_RELEASE "-O2 -Wall")
