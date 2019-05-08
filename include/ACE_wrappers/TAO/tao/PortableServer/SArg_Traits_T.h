// -*- C++ -*-

//=============================================================================
/**
 *  @file    SArg_Traits_T.h
 *
 *  $Id: SArg_Traits_T.h 1861 2011-08-31 16:18:08Z mesnierp $
 *
 *  @author Jeff Parsons
 *  @author Carlos O'Ryan
 */
//=============================================================================

#ifndef TAO_SARG_TRAITS_T_H
#define TAO_SARG_TRAITS_T_H

#include /**/ "ace/pre.h"

#include /**/ "tao/Versioned_Namespace.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

namespace TAO
{
  /**
   *
   * @brief Base class for all skeleton arg traits specializations.
   *
   */
  template<typename T>
  class SArg_Traits
  {
  };
}

TAO_END_VERSIONED_NAMESPACE_DECL

#include /**/ "ace/post.h"

#endif /* TAO_SARG_TRAITS_T_H */
