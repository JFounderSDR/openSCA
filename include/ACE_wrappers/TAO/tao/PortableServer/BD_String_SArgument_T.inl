// -*- C+ -*-
//
// $Id: BD_String_SArgument_T.inl 1861 2011-08-31 16:18:08Z mesnierp $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
TAO::In_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
In_BD_String_SArgument_T (void)
{}

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
const typename S_var::s_traits::char_type *
TAO::In_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
arg (void) const
{
  return this->x_.in ();
}

// ==========================================================================

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
TAO::Inout_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
Inout_BD_String_SArgument_T (void)
{}

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
typename S_var::s_traits::char_type *&
TAO::Inout_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
arg (void)
{
  return this->x_.inout ();
}

// ==========================================================================

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
TAO::Out_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
Out_BD_String_SArgument_T (void)
{}

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
typename S_var::s_traits::char_type *&
TAO::Out_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
arg (void)
{
  return this->x_.out ();
}

// ==========================================================================

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
TAO::Ret_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
Ret_BD_String_SArgument_T (void)
{}

template<typename S_var,
         size_t BOUND,
         template <typename> class Insert_Policy>
ACE_INLINE
typename S_var::s_traits::char_type *&
TAO::Ret_BD_String_SArgument_T<S_var,BOUND,Insert_Policy>::
arg (void)
{
  return this->x_.out ();
}

TAO_END_VERSIONED_NAMESPACE_DECL
