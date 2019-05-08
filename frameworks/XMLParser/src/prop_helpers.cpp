/***************************************************************************//**
* @file     prop_helpers.cpp
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

#include <string>
#include <vector>
#include <cstdlib>

#include "tao/corba.h"

#include "utils.h"
#include "../include/prop_helpers.h"

CORBA::Boolean
openscaSupport::strings_to_boolean(
    std::vector<std::string> values) {
    CORBA::Boolean result(false);

    if (values[0] == "true") {
        result = true;
    } else if (values[0] == "false") {
        result = false;
    }

    return result;
}

CORBA::Char
openscaSupport::strings_to_char(
    std::vector<std::string> values) {
    CORBA::Char result(' ');

    result = (char) atoi(values[0].c_str());
    return result;
}

CORBA::Double
openscaSupport::strings_to_double(
    std::vector<std::string> values) {
    CORBA::Double result(0);

    result = strtod(values[0].c_str(), NULL);

    return result;
}

CORBA::Float
openscaSupport::strings_to_float(
    std::vector<std::string> values) {
    CORBA::Float result(0);

    result = atof(values[0].c_str());

    return result;
}

CORBA::Short
openscaSupport::strings_to_short(
    std::vector<std::string> values) {
    CORBA::Short result(0);

    if ( checkHexFormat(values[0].c_str()) ) {
        short temp = 0;
        if ( hexConvertToDec(values[0].c_str(), temp) ) {
            result = temp;
        }
    } else {
        result = (short) atoi(values[0].c_str());
    }

    return result;
}

CORBA::Long
openscaSupport::strings_to_long(
    std::vector<std::string> values) {
    CORBA::Long result(0);

    if ( checkHexFormat(values[0].c_str()) ) {
        long temp = 0;
        if ( hexConvertToDec(values[0].c_str(), temp) ) {
            result = temp;
        }
    } else {
        result = strtol(values[0].c_str(), NULL, 0);
    }

    return result;
}

CORBA::Octet
openscaSupport::strings_to_octet(
    std::vector<std::string> values) {
    CORBA::Octet result(0);

    result = (unsigned char) atoi(values[0].c_str());

    return result;
}

CORBA::UShort
openscaSupport::strings_to_unsigned_short(
    std::vector<std::string> values) {
    CORBA::UShort result(0);

    if ( checkHexFormat(values[0].c_str()) ) {
        unsigned short temp = 0;
        if ( hexConvertToDec(values[0].c_str(), temp) ) {
            result = temp;
        }
    } else {
        result = (unsigned short) atoi(values[0].c_str());
    }

    return result;
}

CORBA::ULong
openscaSupport::strings_to_unsigned_long(
    std::vector<std::string> values) {
    CORBA::ULong result(0);

    if ( checkHexFormat(values[0].c_str()) ) {
        unsigned long temp = 0;
        if ( hexConvertToDec(values[0].c_str(), temp) ) {
            result = temp;
        }
    } else {
        result = (unsigned long) strtoul(values[0].c_str(), NULL, 0);
    }

    return result;
}

CORBA::String_var
openscaSupport::strings_to_string(
    std::vector<std::string> values) {
    CORBA::String_var result;

    result = CORBA::string_dup(values[0].c_str());

    return result;
}

CORBA::BooleanSeq *
openscaSupport::strings_to_boolean_sequence(
    std::vector<std::string> values) {
    CORBA::BooleanSeq_var result = new CORBA::BooleanSeq;

    result->length(values.size());
    for (unsigned int i = 0; i < values.size(); ++i) {

        if (values[i] == "true") {
            result[i] = true;
        } else if (values[i] == "false") {
            result[i] = false;
        }
    }

    return result._retn();
}

CORBA::CharSeq *
openscaSupport::strings_to_char_sequence(
    std::vector<std::string> values) {
    CORBA::CharSeq_var result = new CORBA::CharSeq;

    result->length(values.size());
    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = values[i][0];
    }

    return result._retn();
}

CORBA::DoubleSeq *
openscaSupport::strings_to_double_sequence(
    std::vector<std::string> values) {
    CORBA::DoubleSeq_var result = new CORBA::DoubleSeq;

    result->length(values.size());
    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = strtod(values[i].c_str(), NULL);
    }

    return result._retn();
}

CORBA::FloatSeq *
openscaSupport::strings_to_float_sequence(
    std::vector<std::string> values) {
    CORBA::FloatSeq_var result = new CORBA::FloatSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = atof(values[i].c_str());
    }

    return result._retn();
}

CORBA::ShortSeq *
openscaSupport::strings_to_short_sequence(
    std::vector<std::string> values) {
    CORBA::ShortSeq_var result = new CORBA::ShortSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = (short) atoi(values[i].c_str());
    }

    return result._retn();
}

CORBA::LongSeq *
openscaSupport::strings_to_long_sequence(
    std::vector<std::string> values) {
    CORBA::LongSeq_var result = new CORBA::LongSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = strtol(values[i].c_str(), NULL, 0);
    }

    return result._retn();
}

CORBA::OctetSeq *
openscaSupport::strings_to_octet_sequence(
    std::vector<std::string> values) {
    CORBA::OctetSeq_var result = new CORBA::OctetSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = (short) atoi(values[i].c_str());
    }

    return result._retn();
}

CORBA::UShortSeq *
openscaSupport::strings_to_unsigned_short_sequence(
    std::vector<std::string> values) {
    CORBA::UShortSeq_var result = new CORBA::UShortSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = (unsigned short) atoi(values[i].c_str());
    }

    return result._retn();
}

CORBA::ULongSeq *
openscaSupport::strings_to_unsigned_long_sequence(
    std::vector<std::string> values) {
    CORBA::ULongSeq_var result = new CORBA::ULongSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = (unsigned long) strtoul(values[i].c_str(), NULL, 0);
    }

    return result._retn();
}

CORBA::StringSeq *
openscaSupport::strings_to_string_sequence(
    std::vector<std::string> values) {
    CORBA::StringSeq_var result = new CORBA::StringSeq;

    result->length(values.size());

    for (unsigned int i = 0; i < values.size(); ++i) {
        result[i] = CORBA::string_dup(values[i].c_str());
    }

    return result._retn();
}
