// -*- C++ -*-
//
// $Id: EC_Supplier_Filter.inl 14 2007-02-01 15:49:12Z mitza $

TAO_BEGIN_VERSIONED_NAMESPACE_DECL

ACE_INLINE
TAO_EC_Filter_Worker::TAO_EC_Filter_Worker (RtecEventComm::EventSet &event,
                                            const TAO_EC_QOS_Info &event_info)
  :  event_ (event),
     event_info_ (event_info)
{
}

TAO_END_VERSIONED_NAMESPACE_DECL
