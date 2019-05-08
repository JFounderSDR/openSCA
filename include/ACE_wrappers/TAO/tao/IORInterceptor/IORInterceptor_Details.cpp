// -*- C++ -*-
// $Id: IORInterceptor_Details.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/IORInterceptor/IORInterceptor_Details.h"
#include "tao/SystemException.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

namespace TAO
{
  void
  IORInterceptor_Details::apply_policies (const CORBA::PolicyList &)
  {
    // There are currently no policies that apply to IOR Interceptors.
    throw ::CORBA::INV_POLICY ();
  }
}

TAO_END_VERSIONED_NAMESPACE_DECL
