################################################################################
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openDDS is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version4.1, developed and copyrighted by JFounder Inc. 
################################################################################

# Add an option to toggle the generation of the API documentation.
option(BUILD_DOCUMENTATION "Use doxygen to create product documentation" OFF)

if(openSCA_INSTALLER)
    set(BUILD_DOCUMENTATION ON)
    set(DOXYGEN_SHOULD_SKIP_THIS_PUBLIC "DOXYGEN_SHOULD_SKIP_THIS_PUBLIC")
endif()

if(BUILD_DOCUMENTATION)
    find_package(Doxygen)
    if(NOT DOXYGEN_FOUND)
        message(FATAL_ERROR "doxygen is needed to build the documentation. Please install it correctly")
    endif()
    if(UNIX)
        find_program(DOXYFILE_MAKE make)
        if(DOXYFILE_MAKE)
            message(STATUS "Found Make: ${DOXYFILE_MAKE}")
        else()
            message(FATAL_ERROR "make is needed to build the documentation. Please install it correctly")
        endif()
    elseif(WIN32)
        set(DOXYFILE_MAKE make.bat)
    endif()
    find_program(WGET_EXE wget)
    if(WGET_EXE)
        message(STATUS "Found WGet: ${WGET_EXE}")
    else()
        message(FATAL_ERROR "wget is needed to build the documentation. Please install it correctly")
    endif()
    find_program(UNZIP_EXE unzip)
    if(UNZIP_EXE)
        message(STATUS "Found Unzip: ${UNZIP_EXE}")
    else()
        message(FATAL_ERROR "unzip is needed to build the documentation. Please install it correctly")
    endif()

    # Target to create documentation directories
    add_custom_target(docdirs
        COMMAND ${CMAKE_COMMAND} -E make_directory ${PROJECT_SOURCE_DIR}/docs
        COMMENT "Creating documentation directory" VERBATIM)
    ### Doxygen ########################

    # Configure the template doxyfile for or specific project
    configure_file(doxyfile.in ${PROJECT_SOURCE_DIR}/doxyfile @ONLY IMMEDIATE)
    # Add custom target to run doxygen when ever the project is build
    add_custom_target(doxygen
        COMMAND "${DOXYGEN_EXECUTABLE}" "${PROJECT_SOURCE_DIR}/doxyfile"
        SOURCES "${PROJECT_SOURCE_DIR}/doxyfile"
        COMMENT "Generating API documentation with doxygen" VERBATIM)
    message(STATUS "have generated API documentation with doxygen")

    add_dependencies(doxygen docdirs)

    add_custom_target(doc ALL
        COMMENT "Generated project documentation" VERBATIM)
endif()