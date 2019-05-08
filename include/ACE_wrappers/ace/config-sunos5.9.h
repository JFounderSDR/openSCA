/* -*- C++ -*- */
// $Id: config-sunos5.9.h 1861 2011-08-31 16:18:08Z mesnierp $

// The following configuration file is designed to work for SunOS 5.9
// (Solaris 9) platforms using the SunC++ 5.x (Forte 6 and 7), or g++
// compilers.

#ifndef ACE_CONFIG_H

// ACE_CONFIG_H is defined by one of the following #included headers.

// #include the SunOS 5.8 config, then add any SunOS 5.9 updates below.
#include "ace/config-sunos5.8.h"

#define ACE_HAS_SENDFILE 1
#define ACE_LACKS_THR_CONCURRENCY_FUNCS

#endif /* ACE_CONFIG_H */
