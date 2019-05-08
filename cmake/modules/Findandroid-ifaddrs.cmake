################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openDDS is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

# ANDROID_IFADDRS_FOUND
# ANDROID_IFADDRS_INCLUDE_DIR
# ANDROID_IFADDRS_SOURCE_DIR

find_path(ANDROID_IFADDRS_INCLUDE_DIR NAMES ifaddrs.h NO_CMAKE_FIND_ROOT_PATH)
find_path(ANDROID_IFADDRS_SOURCE_DIR NAMES ifaddrs.c NO_CMAKE_FIND_ROOT_PATH)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(android-ifaddrs DEFAULT_MSG ANDROID_IFADDRS_INCLUDE_DIR ANDROID_IFADDRS_SOURCE_DIR)

mark_as_advanced(ANDROID_IFADDRS_SOURCE_DIR ANDROID_IFADDRS_INCLUDE_DIR)

