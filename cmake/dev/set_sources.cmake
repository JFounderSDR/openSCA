################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openDDS is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

macro(set_sources)
    set(${PROJECT_NAME}_SOURCES
        ${${PROJECT_NAME}_SOURCES}
        ${ARGN}
        )

    set_property(GLOBAL PROPERTY ${PROJECT_NAME}_SOURCES_PROPERTY ${${PROJECT_NAME}_SOURCES})
endmacro()

macro(set_public_headers_directory abs_directory rel_directory)
    # Parse arguments.
    set(args_to_install_)
    set(options INSTALL)
    set(oneValueArgs DESTINATION COMPONENT)
    cmake_parse_arguments(FIND_PH "${options}" "${oneValueArgs}" "" ${ARGN})

    if(FIND_PH_DESTINATION)
        list(APPEND args_to_install_ "DESTINATION" "${FIND_PH_DESTINATION}")
    endif()
    if(FIND_PH_COMPONENT)
        list(APPEND args_to_install_ "COMPONENT" "${FIND_PH_COMPONENT}")
    endif()

    install(DIRECTORY ${abs_directory}/${rel_directory}
        ${args_to_install_}
        FILES_MATCHING
        PATTERN "*.h"
        PATTERN "*.hpp"
        PATTERN "*.ipp"
        )

    if(FIND_PH_INSTALL)
        get_property(${PROJECT_NAME}_PUBLIC_HEADERS_DIRECTORIES GLOBAL PROPERTY ${PROJECT_NAME}_PUBLIC_HEADERS_DIRECTORIES_PROPERTY)
        set(${PROJECT_NAME}_PUBLIC_HEADERS_DIRECTORIES ${${PROJECT_NAME}_PUBLIC_HEADERS_DIRECTORIES} ${abs_directory})
        set_property(GLOBAL PROPERTY ${PROJECT_NAME}_PUBLIC_HEADERS_DIRECTORIES_PROPERTY ${${PROJECT_NAME}_PUBLIC_HEADERS_DIRECTORIES})
    endif()

endmacro()

macro(set_public_header abs_directory rel_directory file)
    set(args_to_install_)
    set(options INSTALL)
    set(oneValueArgs DESTINATION COMPONENT)
    cmake_parse_arguments(FIND_PH "${options}" "${oneValueArgs}" "" ${ARGN})

    if(FIND_PH_DESTINATION)
        list(APPEND args_to_install_ "DESTINATION" "${FIND_PH_DESTINATION}")
    endif()
    if(FIND_PH_COMPONENT)
        list(APPEND args_to_install_ "COMPONENT" "${FIND_PH_COMPONENT}")
    endif()

    install(FILES ${abs_directory}/${rel_directory}/${file}
        ${args_to_install_}
        )

    if(FIND_PH_INSTALL)
        get_property(${PROJECT_NAME}_PUBLIC_HEADERS_FILES GLOBAL PROPERTY ${PROJECT_NAME}_PUBLIC_HEADERS_FILES_PROPERTY)
        set(${PROJECT_NAME}_PUBLIC_HEADERS_FILES ${${PROJECT_NAME}_PUBLIC_HEADERS_FILES} ${rel_directory}/${file})
        set_property(GLOBAL PROPERTY ${PROJECT_NAME}_PUBLIC_HEADERS_FILES_PROPERTY ${${PROJECT_NAME}_PUBLIC_HEADERS_FILES})
    endif()
endmacro()
