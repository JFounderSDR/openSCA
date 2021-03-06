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
// .\be\be_codegen.cpp:150

#ifndef _TAO_PIDL_IIOPENDPOINTVALUEC_8AKBEM_H_
#define _TAO_PIDL_IIOPENDPOINTVALUEC_8AKBEM_H_


#include /**/ "ace/config-all.h"

#if !defined (ACE_LACKS_PRAGMA_ONCE)
# pragma once
#endif /* ACE_LACKS_PRAGMA_ONCE */


#include /**/ "tao/EndpointPolicy/EndpointPolicy_Export.h"
#include "tao/Basic_Types.h"
#include "tao/Object.h"
#include "tao/String_Manager_T.h"
#include "tao/Objref_VarOut_T.h"
#include "tao/Arg_Traits_T.h"
#include "tao/Basic_Arguments.h"
#include "tao/Special_Basic_Arguments.h"
#include "tao/Any_Insert_Policy_T.h"
#include "tao/Fixed_Size_Argument_T.h"
#include "tao/Var_Size_Argument_T.h"
#include "tao/Object_Argument_T.h"
#include "tao/UB_String_Arguments.h"
#include /**/ "tao/Version.h"
#include /**/ "tao/Versioned_Namespace.h"

#include "tao/EndpointPolicy/EndpointPolicyC.h"

#if TAO_MAJOR_VERSION != 2 || TAO_MINOR_VERSION != 0 || TAO_BETA_VERSION != 4
#error This file should be regenerated with TAO_IDL from version 2.0a
#endif

#if defined (TAO_EXPORT_MACRO)
#undef TAO_EXPORT_MACRO
#endif
#define TAO_EXPORT_MACRO TAO_EndpointPolicy_Export

TAO_BEGIN_VERSIONED_NAMESPACE_DECL



// TAO_IDL - Generated from
// c:\ace_wrappers\tao\tao_idl\be\be_visitor_module/module_ch.cpp:41

namespace EndpointPolicy
{

  // TAO_IDL - Generated from
  // .\be\be_interface.cpp:784

#if !defined (_ENDPOINTPOLICY_IIOPENDPOINTVALUE__VAR_OUT_CH_)
#define _ENDPOINTPOLICY_IIOPENDPOINTVALUE__VAR_OUT_CH_

  class IIOPEndpointValue;
  typedef IIOPEndpointValue *IIOPEndpointValue_ptr;

  typedef
    TAO_Objref_Var_T<
        IIOPEndpointValue
      >
    IIOPEndpointValue_var;
  
  typedef
    TAO_Objref_Out_T<
        IIOPEndpointValue
      >
    IIOPEndpointValue_out;

#endif /* end #if !defined */

  // TAO_IDL - Generated from
  // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_ch.cpp:45

  class TAO_EndpointPolicy_Export IIOPEndpointValue
    : public virtual ::EndpointPolicy::EndpointValueBase
  
  {
  public:

    // TAO_IDL - Generated from
    // .\be\be_type.cpp:307
    
    typedef IIOPEndpointValue_ptr _ptr_type;
    typedef IIOPEndpointValue_var _var_type;
    typedef IIOPEndpointValue_out _out_type;

    static void _tao_any_destructor (void *);

    // The static operations.
    static IIOPEndpointValue_ptr _duplicate (IIOPEndpointValue_ptr obj);

    static void _tao_release (IIOPEndpointValue_ptr obj);

    static IIOPEndpointValue_ptr _narrow (::CORBA::Object_ptr obj);
    static IIOPEndpointValue_ptr _unchecked_narrow (::CORBA::Object_ptr obj);
    static IIOPEndpointValue_ptr _nil (void);

    virtual char * host (
      void) = 0;

    virtual void host (
      const char * host) = 0;

    virtual ::CORBA::UShort port (
      void) = 0;

    virtual void port (
      ::CORBA::UShort port) = 0;

    // TAO_IDL - Generated from
    // c:\ace_wrappers\tao\tao_idl\be\be_visitor_interface/interface_ch.cpp:156

    virtual ::CORBA::Boolean _is_a (const char *type_id);
    virtual const char* _interface_repository_id (void) const;
    virtual ::CORBA::Boolean marshal (TAO_OutputCDR &cdr);
  
  protected:
    // Abstract or local interface only.
    IIOPEndpointValue (void);

    

    virtual ~IIOPEndpointValue (void);
  
  private:
    // Private and unimplemented for concrete interfaces.
    IIOPEndpointValue (const IIOPEndpointValue &);

    void operator= (const IIOPEndpointValue &);
  };

// TAO_IDL - Generated from
// c:\ace_wrappers\tao\tao_idl\be\be_visitor_module/module_ch.cpp:70

} // module EndpointPolicy

// TAO_IDL - Generated from
// .\be\be_visitor_arg_traits.cpp:68


TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL


// Arg traits specializations.
namespace TAO
{
}

TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL




// TAO_IDL - Generated from
// .\be\be_visitor_traits.cpp:62


TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL

// Traits specializations.
namespace TAO
{

#if !defined (_ENDPOINTPOLICY_IIOPENDPOINTVALUE__TRAITS_)
#define _ENDPOINTPOLICY_IIOPENDPOINTVALUE__TRAITS_

  template<>
  struct TAO_EndpointPolicy_Export Objref_Traits< ::EndpointPolicy::IIOPEndpointValue>
  {
    static ::EndpointPolicy::IIOPEndpointValue_ptr duplicate (
        ::EndpointPolicy::IIOPEndpointValue_ptr p);
    static void release (
        ::EndpointPolicy::IIOPEndpointValue_ptr p);
    static ::EndpointPolicy::IIOPEndpointValue_ptr nil (void);
    static ::CORBA::Boolean marshal (
        const ::EndpointPolicy::IIOPEndpointValue_ptr p,
        TAO_OutputCDR & cdr);
  };

#endif /* end #if !defined */
}
TAO_END_VERSIONED_NAMESPACE_DECL


TAO_BEGIN_VERSIONED_NAMESPACE_DECL




// TAO_IDL - Generated from
// .\be\be_codegen.cpp:1581


TAO_END_VERSIONED_NAMESPACE_DECL

#endif /* ifndef */

