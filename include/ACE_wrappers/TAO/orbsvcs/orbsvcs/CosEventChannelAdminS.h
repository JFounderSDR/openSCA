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

#ifndef _TAO_IDL_COSEVENTCHANNELADMINS_H1TRUK_H_
#define _TAO_IDL_COSEVENTCHANNELADMINS_H1TRUK_H_


#include "CosEventChannelAdminC.h"
#include "CosEventCommS.h"
#include "tao/PortableServer/Basic_SArguments.h"
#include "tao/PortableServer/Special_Basic_SArguments.h"
#include "tao/PortableServer/Fixed_Size_SArgument_T.h"
#include "tao/PortableServer/Var_Size_SArgument_T.h"
#include "tao/PortableServer/Object_SArg_Traits.h"
#include "tao/PortableServer/UB_String_SArguments.h"
#include "tao/PortableServer/Object_SArg_Traits.h"
#include "tao/PortableServer/get_arg.h"
#include "tao/Special_Basic_Arguments.h"
#include "tao/UB_String_Arguments.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */

#include "tao/Collocation_Proxy_Broker.h"
#include "tao/PortableServer/PortableServer.h"
#include "tao/PortableServer/Servant_Base.h"

#include /**/ "orbsvcs/CosEvent/event_skel_export.h"

#if defined (TAO_EXPORT_MACRO)
#undef TAO_EXPORT_MACRO
#endif
#define TAO_EXPORT_MACRO TAO_Event_Skel_Export

TAO_BEGIN_VERSIONED_NAMESPACE_DECL



// TAO_IDL - Generated from
// .\be\be_visitor_arg_traits.cpp:68


TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL


// Arg traits specializations.
namespace TAO
{

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_PROXYPUSHCONSUMER__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_PROXYPUSHCONSUMER__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::ProxyPushConsumer>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::ProxyPushConsumer_ptr,
            ::CosEventChannelAdmin::ProxyPushConsumer_var,
            ::CosEventChannelAdmin::ProxyPushConsumer_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_PROXYPUSHSUPPLIER__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_PROXYPUSHSUPPLIER__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::ProxyPushSupplier>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::ProxyPushSupplier_ptr,
            ::CosEventChannelAdmin::ProxyPushSupplier_var,
            ::CosEventChannelAdmin::ProxyPushSupplier_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_PROXYPULLSUPPLIER__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_PROXYPULLSUPPLIER__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::ProxyPullSupplier>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::ProxyPullSupplier_ptr,
            ::CosEventChannelAdmin::ProxyPullSupplier_var,
            ::CosEventChannelAdmin::ProxyPullSupplier_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_PROXYPULLCONSUMER__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_PROXYPULLCONSUMER__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::ProxyPullConsumer>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::ProxyPullConsumer_ptr,
            ::CosEventChannelAdmin::ProxyPullConsumer_var,
            ::CosEventChannelAdmin::ProxyPullConsumer_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_CONSUMERADMIN__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_CONSUMERADMIN__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::ConsumerAdmin>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::ConsumerAdmin_ptr,
            ::CosEventChannelAdmin::ConsumerAdmin_var,
            ::CosEventChannelAdmin::ConsumerAdmin_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_SUPPLIERADMIN__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_SUPPLIERADMIN__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::SupplierAdmin>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::SupplierAdmin_ptr,
            ::CosEventChannelAdmin::SupplierAdmin_var,
            ::CosEventChannelAdmin::SupplierAdmin_out,
            TAO::Any_Insert_Policy_Stream
          >
  {
  };

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // .\be\be_visitor_arg_traits.cpp:147

#if !defined (_COSEVENTCHANNELADMIN_EVENTCHANNEL__SARG_TRAITS_)
#define _COSEVENTCHANNELADMIN_EVENTCHANNEL__SARG_TRAITS_

  template<>
  class  SArg_Traits< ::CosEventChannelAdmin::EventChannel>
    : public
        Object_SArg_Traits_T<
            ::CosEventChannelAdmin::EventChannel_ptr,
            ::CosEventChannelAdmin::EventChannel_var,
            ::CosEventChannelAdmin::EventChannel_out,
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

namespace POA_CosEventChannelAdmin
{
  

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class ProxyPushConsumer;
  typedef ProxyPushConsumer *ProxyPushConsumer_ptr;

  class TAO_Event_Skel_Export ProxyPushConsumer
    : public virtual POA_CosEventComm::PushConsumer
  {
  protected:
    ProxyPushConsumer (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::ProxyPushConsumer _stub_type;
    typedef ::CosEventChannelAdmin::ProxyPushConsumer_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::ProxyPushConsumer_var _stub_var_type;

    ProxyPushConsumer (const ProxyPushConsumer& rhs);
    virtual ~ProxyPushConsumer (void);

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
    
    ::CosEventChannelAdmin::ProxyPushConsumer *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void connect_push_supplier (
      ::CosEventComm::PushSupplier_ptr push_supplier) = 0;

    static void connect_push_supplier_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    push_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    disconnect_push_consumer_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);
  };

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class ProxyPushSupplier;
  typedef ProxyPushSupplier *ProxyPushSupplier_ptr;

  class TAO_Event_Skel_Export ProxyPushSupplier
    : public virtual POA_CosEventComm::PushSupplier
  {
  protected:
    ProxyPushSupplier (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::ProxyPushSupplier _stub_type;
    typedef ::CosEventChannelAdmin::ProxyPushSupplier_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::ProxyPushSupplier_var _stub_var_type;

    ProxyPushSupplier (const ProxyPushSupplier& rhs);
    virtual ~ProxyPushSupplier (void);

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
    
    ::CosEventChannelAdmin::ProxyPushSupplier *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void connect_push_consumer (
      ::CosEventComm::PushConsumer_ptr push_consumer) = 0;

    static void connect_push_consumer_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    disconnect_push_supplier_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);
  };

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class ProxyPullSupplier;
  typedef ProxyPullSupplier *ProxyPullSupplier_ptr;

  class TAO_Event_Skel_Export ProxyPullSupplier
    : public virtual POA_CosEventComm::PullSupplier
  {
  protected:
    ProxyPullSupplier (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::ProxyPullSupplier _stub_type;
    typedef ::CosEventChannelAdmin::ProxyPullSupplier_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::ProxyPullSupplier_var _stub_var_type;

    ProxyPullSupplier (const ProxyPullSupplier& rhs);
    virtual ~ProxyPullSupplier (void);

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
    
    ::CosEventChannelAdmin::ProxyPullSupplier *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void connect_pull_consumer (
      ::CosEventComm::PullConsumer_ptr pull_consumer) = 0;

    static void connect_pull_consumer_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    pull_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    try_pull_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    disconnect_pull_supplier_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);
  };

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class ProxyPullConsumer;
  typedef ProxyPullConsumer *ProxyPullConsumer_ptr;

  class TAO_Event_Skel_Export ProxyPullConsumer
    : public virtual POA_CosEventComm::PullConsumer
  {
  protected:
    ProxyPullConsumer (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::ProxyPullConsumer _stub_type;
    typedef ::CosEventChannelAdmin::ProxyPullConsumer_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::ProxyPullConsumer_var _stub_var_type;

    ProxyPullConsumer (const ProxyPullConsumer& rhs);
    virtual ~ProxyPullConsumer (void);

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
    
    ::CosEventChannelAdmin::ProxyPullConsumer *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void connect_pull_supplier (
      ::CosEventComm::PullSupplier_ptr pull_supplier) = 0;

    static void connect_pull_supplier_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // .\be\be_interface.cpp:2223

    static void
    disconnect_pull_consumer_skel (
        TAO_ServerRequest & server_request, 
        void * servant_upcall,
        void * servant);
  };

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class ConsumerAdmin;
  typedef ConsumerAdmin *ConsumerAdmin_ptr;

  class TAO_Event_Skel_Export ConsumerAdmin
    : public virtual PortableServer::ServantBase
  {
  protected:
    ConsumerAdmin (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::ConsumerAdmin _stub_type;
    typedef ::CosEventChannelAdmin::ConsumerAdmin_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::ConsumerAdmin_var _stub_var_type;

    ConsumerAdmin (const ConsumerAdmin& rhs);
    virtual ~ConsumerAdmin (void);

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
    
    ::CosEventChannelAdmin::ConsumerAdmin *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual ::CosEventChannelAdmin::ProxyPushSupplier_ptr obtain_push_supplier (
      void) = 0;

    static void obtain_push_supplier_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual ::CosEventChannelAdmin::ProxyPullSupplier_ptr obtain_pull_supplier (
      void) = 0;

    static void obtain_pull_supplier_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);
  };

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class SupplierAdmin;
  typedef SupplierAdmin *SupplierAdmin_ptr;

  class TAO_Event_Skel_Export SupplierAdmin
    : public virtual PortableServer::ServantBase
  {
  protected:
    SupplierAdmin (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::SupplierAdmin _stub_type;
    typedef ::CosEventChannelAdmin::SupplierAdmin_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::SupplierAdmin_var _stub_var_type;

    SupplierAdmin (const SupplierAdmin& rhs);
    virtual ~SupplierAdmin (void);

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
    
    ::CosEventChannelAdmin::SupplierAdmin *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual ::CosEventChannelAdmin::ProxyPushConsumer_ptr obtain_push_consumer (
      void) = 0;

    static void obtain_push_consumer_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual ::CosEventChannelAdmin::ProxyPullConsumer_ptr obtain_pull_consumer (
      void) = 0;

    static void obtain_pull_consumer_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);
  };

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_sh.cpp:78

  class EventChannel;
  typedef EventChannel *EventChannel_ptr;

  class TAO_Event_Skel_Export EventChannel
    : public virtual PortableServer::ServantBase
  {
  protected:
    EventChannel (void);
  
  public:
    /// Useful for template programming.
    typedef ::CosEventChannelAdmin::EventChannel _stub_type;
    typedef ::CosEventChannelAdmin::EventChannel_ptr _stub_ptr_type;
    typedef ::CosEventChannelAdmin::EventChannel_var _stub_var_type;

    EventChannel (const EventChannel& rhs);
    virtual ~EventChannel (void);

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
    
    ::CosEventChannelAdmin::EventChannel *_this (void);
    
    virtual const char* _interface_repository_id (void) const;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual ::CosEventChannelAdmin::ConsumerAdmin_ptr for_consumers (
      void) = 0;

    static void for_consumers_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual ::CosEventChannelAdmin::SupplierAdmin_ptr for_suppliers (
      void) = 0;

    static void for_suppliers_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_operation/operation_sh.cpp:41

    virtual void destroy (
      void) = 0;

    static void destroy_skel (
        TAO_ServerRequest & server_request,
        void * servant_upcall,
        void * servant);
  };

// TAO_IDL - Generated from
// c:\ace_wrappers\tao\tao_idl\be\be_visitor_module/module_sh.cpp:72

} // module CosEventChannelAdmin

TAO_END_VERSIONED_NAMESPACE_DECL



#include "CosEventChannelAdminS_T.h"

#if defined (__ACE_INLINE__)
#include "CosEventChannelAdminS.inl"
#endif /* defined INLINE */

#endif /* ifndef */
