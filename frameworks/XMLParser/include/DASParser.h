/***************************************************************************//**
* @file     DASParser.h
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

#if !defined(EA_BECAE32F_C9B5_4911_ACA7_6C61692706C2__INCLUDED_)
#define EA_BECAE32F_C9B5_4911_ACA7_6C61692706C2__INCLUDED_

#include "tinyxml.h"

#include "CFS.h"

class DASParser {

  public:
	virtual ~DASParser();

	DASParser(
	    CF::File_ptr file);

	CF::DeviceAssignmentSequence *
	das() {
		return  m_dasVar._retn();
	}

  protected:
	TiXmlNode * root;
	TiXmlDocument XMLDoc;

  private:
	CF::DeviceAssignmentSequence_var m_dasVar;
	unsigned int m_numElements;

	DASParser();
	void add_element();
};

#endif // !defined(EA_BECAE32F_C9B5_4911_ACA7_6C61692706C2__INCLUDED_)