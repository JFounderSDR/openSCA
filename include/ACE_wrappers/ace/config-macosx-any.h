//* -*- C++ -*- */
// $Id: config-macosx-any.h 2022 2012-04-10 18:17:23Z fieldst $

// The following configuration file is designed to work for Mac OS X
// Based on ACE_MACOSX_VERSION it will select the correct config file

#ifndef ACE_CONFIG_MACOSX_ANY_H
#define ACE_CONFIG_MACOSX_ANY_H
#include /**/ "ace/pre.h"

#define ACE_OSX_VERSION __ENVIRONMENT_MAC_OS_X_VERSION_MIN_REQUIRED__

#if ACE_OSX_VERSION >= 1000 && ACE_OSX_VERSION < 1030
#  include "config-macosx.h"
#elif ACE_OSX_VERSION >= 1030 && ACE_OSX_VERSION < 1040
#  include "config-macosx-panther.h"
#elif ACE_OSX_VERSION >= 1040 && ACE_OSX_VERSION < 1050
#  include "config-macosx-tiger.h"
#elif ACE_OSX_VERSION >= 1050 && ACE_OSX_VERSION < 1060
#  include "config-macosx-leopard.h"
#elif ACE_OSX_VERSION >= 1060 && ACE_OSX_VERSION < 1070
#  include "config-macosx-snowleopard.h"
#else
#  error Unsupported Mac OSX version
#endif

#endif // ACE_CONFIG_MACOSX_ANY_H
