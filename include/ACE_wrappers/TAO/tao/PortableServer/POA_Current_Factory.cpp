// $Id: POA_Current_Factory.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "tao/PortableServer/POA_Current_Factory.h"
#include "tao/PortableServer/POA_Current.h"
#include "tao/ORB_Core.h"

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

CORBA::Object_ptr
TAO_POA_Current_Factory::create_object (CORBA::ORB_ptr,
                                        int,
                                        ACE_TCHAR * [])
{
  TAO::Portable_Server::POA_Current* adapter = 0;
  ACE_NEW_RETURN (adapter,
                  TAO::Portable_Server::POA_Current (),
                  0);
  return adapter;
}

ACE_FACTORY_DEFINE (TAO_PortableServer, TAO_POA_Current_Factory)
ACE_STATIC_SVC_DEFINE (TAO_POA_Current_Factory,
                       ACE_TEXT ("TAO_POA_Current_Factory"),
                       ACE_SVC_OBJ_T,
                       &ACE_SVC_NAME (TAO_POA_Current_Factory),
                       ACE_Service_Type::DELETE_THIS | ACE_Service_Type::DELETE_OBJ,
                       0)

TAO_END_VERSIONED_NAMESPACE_DECL

