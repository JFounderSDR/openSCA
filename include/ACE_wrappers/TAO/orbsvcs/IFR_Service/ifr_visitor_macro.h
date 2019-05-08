/* -*- C++ -*- */
// $Id: ifr_visitor_macro.h 14 2007-02-01 15:49:12Z mitza $

#ifndef TAO_IFR_VISITOR_MACRO_H
#define TAO_IFR_VISITOR_MACRO_H

#include /**/ "ace/pre.h"
#include "ace/CORBA_macros.h"

#include "tao/ORB_Constants.h"

#define TAO_IFR_VISITOR_WRITE_GUARD \
  ACE_WRITE_GUARD_THROW_EX (ACE_Lock, \
                            monitor, \
                            visitor.lock (), \
                            CORBA::INTERNAL ( \
                              CORBA::SystemException::_tao_minor_code ( \
                                TAO_GUARD_FAILURE, \
                                0), \
                              CORBA::COMPLETED_NO)); \

#include /**/ "ace/post.h"

#endif /* TAO_IFR_VISITOR_MACRO_H */
