// -*- C++ -*-
// $Id$

/**
 * Code generated by the The ACE ORB (TAO) IDL Compiler v2.0a
 * TAO and the TAO IDL Compiler have been developed by:
 *       Center for Distributed Object Computing
 *       Washington University
 *       St. Louis, MO
 *       USA
 *       http://www.cs.wustl.edu/~schmidt/doc-center.html
 * and
 *       Distributed Object Computing Laboratory
 *       University of California at Irvine
 *       Irvine, CA
 *       USA
 * and
 *       Institute for Software Integrated Systems
 *       Vanderbilt University
 *       Nashville, TN
 *       USA
 *       http://www.isis.vanderbilt.edu/
 *
 * Information about TAO is available at:
 *     http://www.cs.wustl.edu/~schmidt/TAO.html
 **/

// TAO_IDL - Generated from
// .\be\be_codegen.cpp:460

#ifndef _TAO_IDL_RTECUDPADMINS_ZNTE2S_H_
#define _TAO_IDL_RTECUDPADMINS_ZNTE2S_H_


#include "RtecUDPAdminC.h"
#include "RtecEventCommS.h"
#include "tao/OctetSeqS.h"
#include "tao/PortableServer/Basic_SArguments.h"
#include "tao/PortableServer/Special_Basic_SArguments.h"
#include "tao/PortableServer/Fixed_Size_SArgument_T.h"
#include "tao/PortableServer/Var_Size_SArgument_T.h"
#include "tao/PortableServer/Object_SArg_Traits.h"
#include "tao/PortableServer/UB_String_SArguments.h"
#include "tao/PortableServer/Fixed_Array_SArgument_T.h"
#include "tao/PortableServer/Var_Array_SArgument_T.h"
#include "tao/PortableServer/get_arg.h"
#include "tao/Special_Basic_Arguments.h"
#include "tao/UB_String_Arguments.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#include "tao/Collocation_Proxy_Broker.h"
#include "tao/PortableServer/PortableServer.h"
#include "tao/PortableServer/Servant_Base.h"

#include /**/ "orbsvcs/Event/event_skel_export.h"

#if defined (TAO_EXPORT_MACRO)
#undef TAO_EXPORT_MACRO
#endif
#define TAO_EXPORT_MACRO TAO_RTEvent_Skel_Export

TAO_BEGIN_VERSIONED_NAMESPACE_DECL



// TAO_IDL - Generated from
// .\be\be_visitor_arg_traits.cpp:68


TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL


// Arg traits specializations.
namespace TAO
{

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:941

  template<>
  class SArg_Traits< ::RtecUDPAdmin::UDP_Addr>
    : public
        Fixed_Size_SArg_Traits_T<
            ::RtecUDPAdmin::UDP_Addr,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

  template<>
  class SArg_Traits< ::RtecUDPAdmin::char16_tag>
    : public
        Fixed_Array_SArg_Traits_T<
            ::RtecUDPAdmin::char16_var,
            ::RtecUDPAdmin::char16_forany,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:941

  template<>
  class SArg_Traits< ::RtecUDPAdmin::UDP_Addr_v6>
    : public
        Fixed_Size_SArg_Traits_T<
            ::RtecUDPAdmin::UDP_Addr_v6,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:898

  template<>
  class SArg_Traits< ::RtecUDPAdmin::Address_Family>
    : public
        Basic_SArg_Traits_T<
            ::RtecUDPAdmin::Address_Family,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:1052

  template<>
  class SArg_Traits< ::RtecUDPAdmin::UDP_Address>
    : public
        Fixed_Size_SArg_Traits_T<
            ::RtecUDPAdmin::UDP_Address,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_RTECUDPADMIN_ADDRSERVER__SARG_TRAITS_)
#define _RTECUDPADMIN_ADDRSERVER__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::RtecUDPAdmin::AddrServer>
    : public
        Object_SArg_Traits_T<
            ::RtecUDPAdmin::AddrServer_ptr,
            ::RtecUDPAdmin::AddrServer_var,
            ::RtecUDPAdmin::AddrServer_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */
}

TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL




// TAO_IDL - Generated from
// c:\ace_wrappers\tao\tao_idl\be\be_visitor_module/module_sh.cpp:41

namespace POA_RtecUDPAdmin
{
  

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class AddrServer;
  typedef AddrServer *AddrServer_ptr;

  class TAO_RTEvent_Skel_Export AddrServer
    : public virtual PortableServer::ServantBase
  {
  protected:
    AddrServer (void);
  
  public:
    /// Useful for template programming.
    typedef ::RtecUDPAdmin::AddrServer _stub_type;
    typedef ::RtecUDPAdmin::AddrServer_ptr _stub_ptr_type;
    typedef ::RtecUDPAdmin::AddrServer_var _stub_var_type;

    AddrServer (const AddrServer& rhs);
    virtual ~AddrServer (void);

    virtual ::CORBA::Boolean _is_a (const char* logical_type_id);

    static void _is_a_skel (
        TAO_ServerRequest & req,
        void * servant_upcall,
        void * servant);
    
    static void _non_existent_skel (
        TAO_ServerRequest & req,
        void * servant_upcall,
        void * servant);
    
    static void _interface_skel (
        TAO_ServerRequest & req,
        void * servant_upcall,
        void * servant);
    
    static void _component_skel (
        TAO_ServerRequest & req,
        void * servant_upcall,
        void * servant);
    
    static void _repository_id_skel (
        TAO_ServerRequest & req,
        void * servant_upcall,
        void * servant);
    
    virtual void _dispatch (
        TAO_ServerRequest & req,
        void * servant_upcall);
    
    ::RtecUDPAdmin::AddrServer *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void get_addr (
      const ::RtecEventComm::EventHeader & header,
      ::RtecUDPAdmin::UDP_Addr_out addr) = 0;

    static void get_addr_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void get_address (
      const ::RtecEventComm::EventHeader & header,
      ::RtecUDPAdmin::UDP_Address_out addr) = 0;

    static void get_address_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);
  };

// TAO_IDL - Generated from
// c:\ace_wrappers\tao\tao_idl\be\be_visitor_module/module_sh.cpp:72

} // module RtecUDPAdmin

TAO_END_VERSIONED_NAMESPACE_DECL



#include "RtecUDPAdminS_T.h"

#if defined (__ACE_INLINE__)
#include "RtecUDPAdminS.inl"
#endif /* defined INLINE */

#endif /* ifndef */
