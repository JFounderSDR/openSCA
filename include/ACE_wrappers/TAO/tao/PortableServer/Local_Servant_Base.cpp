// $Id: Local_Servant_Base.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/PortableServer/Local_Servant_Base.h"
#include "tao/SystemException.h"

#if !defined (__ACE_INLINE__)
# include "tao/PortableServer/Local_Servant_Base.inl"
#endif /* ! __ACE_INLINE__ */

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

void
TAO_Local_ServantBase::_dispatch (TAO_ServerRequest &, void *)
{
  throw ::CORBA::BAD_OPERATION ();
}

TAO_END_VERSIONED_NAMESPACE_DECL
