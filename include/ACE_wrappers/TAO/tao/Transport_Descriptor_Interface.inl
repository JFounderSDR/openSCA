// -*- C++ -*-
//
//$Id: Transport_Descriptor_Interface.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_Transport_Descriptor_Interface::TAO_Transport_Descriptor_Interface (
  TAO_Endpoint *endpoint,
  CORBA::Boolean take_ownership)
  : endpoint_ (endpoint),
    bidir_flag_ (false),
    release_ (take_ownership)
{
}

ACE_INLINE
TAO_Transport_Descriptor_Interface::TAO_Transport_Descriptor_Interface (void)
  : endpoint_ (0),
    bidir_flag_ (false),
    release_ (false)
{
}


ACE_INLINE TAO_Endpoint *
TAO_Transport_Descriptor_Interface::endpoint (void)
{
  return this->endpoint_;
}


ACE_INLINE void
TAO_Transport_Descriptor_Interface::set_bidir_flag (CORBA::Boolean flag)
{
  this->bidir_flag_ = flag;
}

TAO_END_VERSIONED_NAMESPACE_DECL
