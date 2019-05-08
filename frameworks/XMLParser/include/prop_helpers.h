/***************************************************************************//**
* @file     prop_helpers.h
* @author   open Team
* @version  9
* @date     2017-03-16
* @brief
* @Remark : <Description>
* @verbatim
* ==============================================================================
* <Date>     | <Version> | <Author>       | <Description>
* ==============================================================================
*  2015-05-23 | 1       | open Team       | Create file
* ==============================================================================
* @endverbatim
* ******************************************************************************
* <h2><center>&copy; Copyright(c)2015-2025 JFounder Info Tech Co.,Ltd</center></h2>
* All rights reserved. The right to copy, distribute, modify or otherwise make use
* of this software may be licensed only pursuant to the terms of an applicable
* JFounder license agreement. Company website: www.onetek.net
*//****************************************************************************/

#ifndef PROPHELPERS_H
#define PROPHELPERS_H

#include <string>
#include <vector>
#include <fstream>
#include <sstream>

//#include "CORBA.h"
#include "CFS.h"

/**
 * The openscaSupport namespace contains useful functions used throughout the
 * opensca framework. The classes in this namespace are also useful for SCA
 * component developers.
 */
namespace openscaSupport {
CORBA::Boolean
strings_to_boolean(
  std::vector<std::string> values);

CORBA::Char
strings_to_char(
  std::vector<std::string> values);

CORBA::Double
strings_to_double(
  std::vector<std::string> values);

CORBA::Float
strings_to_float(
  std::vector<std::string> values);

CORBA::Short
strings_to_short(
  std::vector<std::string> values);

CORBA::Long
strings_to_long(
  std::vector<std::string> values);

CORBA::Octet
strings_to_octet(
  std::vector<std::string> values);

CORBA::UShort
strings_to_unsigned_short(
  std::vector<std::string> values);

CORBA::ULong
strings_to_unsigned_long(
  std::vector<std::string> values);

CORBA::String_var
strings_to_string(
  std::vector<std::string> values);

CORBA::BooleanSeq *
strings_to_boolean_sequence(
  std::vector<std::string> values);

CORBA::CharSeq *
strings_to_char_sequence(
  std::vector<std::string> values);

CORBA::DoubleSeq *
strings_to_double_sequence(
  std::vector<std::string> values);

CORBA::FloatSeq *
strings_to_float_sequence(
  std::vector<std::string> values);

CORBA::ShortSeq *
strings_to_short_sequence(
  std::vector<std::string> values);

CORBA::LongSeq *
strings_to_long_sequence(
  std::vector<std::string> values);

CORBA::OctetSeq *
strings_to_octet_sequence(
  std::vector<std::string> values);

CORBA::UShortSeq *
strings_to_unsigned_short_sequence(
  std::vector<std::string> values);

CORBA::ULongSeq *
strings_to_unsigned_long_sequence(
  std::vector<std::string> values);

CORBA::StringSeq *
strings_to_string_sequence(
  std::vector<std::string> values);
}

#endif