################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openDDS is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

macro(openSCA_find_package package)

    if(NOT ${package}_FOUND)
        # Parse arguments.
        set(options REQUIRED)
        set(multiValueArgs OPTIONS)
        cmake_parse_arguments(FIND "${options}" "" "${multiValueArgs}" ${ARGN})

        option(THIRDPARTY "Activate the use of internal thirdparties" OFF)
        option(THIRDPARTY_UPDATE "Activate the auto update of internal thirdparties" ON)

        if(openSCA_BUILD)
            set(THIRDPARTY ON)
        endif()

        option(THIRDPARTY_${package} "Activate the use of internal thirdparty ${package}" OFF)

        if(NOT openSCA_INSTALLER)
            find_package(${package} QUIET)
        endif()

        if(NOT ${package}_FOUND AND (THIRDPARTY OR THIRDPARTY_${package}))
            set(SUBDIRECTORY_EXIST TRUE)
            if(THIRDPARTY_UPDATE OR NOT EXISTS "${PROJECT_SOURCE_DIR}/thirdparty/${package}/CMakeLists.txt")
                message(STATUS "${package} thirdparty is being updated...")
                execute_process(
                    COMMAND git submodule update --recursive --init "thirdparty/${package}"
                    WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
                    RESULT_VARIABLE EXECUTE_RESULT
                    )
                if(NOT EXECUTE_RESULT EQUAL 0)
                    message(WARNING "Cannot configure Git submodule ${package}")
                    if(NOT EXISTS "${PROJECT_SOURCE_DIR}/thirdparty/${package}/CMakeLists.txt")
                        set(SUBDIRECTORY_EXIST FALSE)
                    endif()
                endif()
            endif()

            if(SUBDIRECTORY_EXIST)
                foreach(opt_ ${FIND_OPTIONS})
                    set(${opt_} ON)
                endforeach()
                add_subdirectory(${PROJECT_SOURCE_DIR}/thirdparty/${package})
                set(${package}_FOUND TRUE)
                if(NOT IS_TOP_LEVEL)
                    set(${package}_FOUND TRUE PARENT_SCOPE)
                endif()
            endif()
        endif()

        if(${package}_FOUND)
            message(STATUS "${package} library found...")
        elseif(${FIND_REQUIRED})
            message(FATAL_ERROR "${package} library not found...")
        else()
            message(STATUS "${package} library not found...")
        endif()
    endif()
endmacro()

macro(openSCA_find_thirdparty package thirdparty_name)
    if(NOT (openSCA_INSTALLER AND (MSVC OR MSVC_IDE)))

        option(THIRDPARTY_${package} "Activate the use of internal thirdparty ${package}" OFF)

        if(THIRDPARTY OR THIRDPARTY_${package})
            execute_process(
                COMMAND git submodule update --recursive --init "thirdparty/${thirdparty_name}"
                WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
                RESULT_VARIABLE EXECUTE_RESULT
                )

            if(EXECUTE_RESULT EQUAL 0)
            else()
                message(FATAL_ERROR "Cannot configure Git submodule ${package}")
            endif()
            set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${PROJECT_SOURCE_DIR}/thirdparty/${thirdparty_name})
            set(CMAKE_PREFIX_PATH ${CMAKE_PREFIX_PATH} ${PROJECT_SOURCE_DIR}/thirdparty/${thirdparty_name}/${thirdparty_name})
        endif()

        find_package(${package} REQUIRED QUIET)

    endif()
endmacro()
