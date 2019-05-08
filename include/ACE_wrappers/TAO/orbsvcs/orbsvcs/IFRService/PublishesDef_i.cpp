/* -*- C++ -*- */
// $Id: PublishesDef_i.cpp 1861 2011-08-31 16:18:08Z mesnierp $

#include "orbsvcs/IFRService/PublishesDef_i.h"
#include "orbsvcs/IFRService/Repository_i.h"

TAO_PublishesDef_i::TAO_PublishesDef_i (TAO_Repository_i *repo)
  : TAO_IRObject_i (repo),
    TAO_Contained_i (repo),
    TAO_EventPortDef_i (repo)
{
}

TAO_PublishesDef_i::~TAO_PublishesDef_i (void)
{
}

CORBA::DefinitionKind
TAO_PublishesDef_i::def_kind (void)
{
  return CORBA::dk_Publishes;
}

