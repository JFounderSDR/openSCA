################################################################################
# openSCA/libCF_Utils
# Copyright 2019 JFounder, Inc.
# openSCA (Licensed Product) is protected by copyright, and is
# distributed under the following terms.
# 
# openSCA is an proprietary implementation of the Joint Tactical Networking
# center (JTNC) SOFTWARE COMMUNICATION ARCHITECTURE SPECIFICATION (SCA) 
# version2.2.2, developed and copyrighted by JFounder Inc. 
################################################################################
cmake_minimum_required(VERSION 3.5)

project(CF_Interface)

aux_source_directory (./src SRC)

link_libraries(
		"${ACE_LIB_DIR}/libTAO_PI.so"
		"${ACE_LIB_DIR}/libACE.so"
		"${ACE_LIB_DIR}/libTAO.so"
		"${ACE_LIB_DIR}/libTAO_AnyTypeCode.so"
		"${ACE_LIB_DIR}/libKokyu.so"
		"${ACE_LIB_DIR}/libTAO_CodecFactory.so"
		"${ACE_LIB_DIR}/libTAO_Codeset.so"
		"${ACE_LIB_DIR}/libTAO_CosEvent.so"
		"${ACE_LIB_DIR}/libTAO_CosEvent_Skel.so"
		"${ACE_LIB_DIR}/libTAO_CosEvent_Serv.so"
		"${ACE_LIB_DIR}/libTAO_CosNaming_Serv.so" 
		"${ACE_LIB_DIR}/libTAO_CosNaming.so" 
		"${ACE_LIB_DIR}/libTAO_CosNaming_Skel.so"
		"${ACE_LIB_DIR}/libTAO_DynamicInterface.so"
		"${ACE_LIB_DIR}/libTAO_IFR_Client.so"
		"${ACE_LIB_DIR}/libTAO_ImR_Client.so"
		"${ACE_LIB_DIR}/libTAO_IORTable.so"
		"${ACE_LIB_DIR}/libTAO_Svc_Utils.so"
		"${ACE_LIB_DIR}/libTAO_Messaging.so"
		"${ACE_LIB_DIR}/libTAO_Valuetype.so"
		"${ACE_LIB_DIR}/libTAO_PortableServer.so"
)

add_library (${PROJECT_NAME} SHARED ${SRC})

