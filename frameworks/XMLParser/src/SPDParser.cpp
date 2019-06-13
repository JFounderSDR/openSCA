/***************************************************************************//**
* @file     SPDParser.cpp
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

#include "../include/SPDParser.h"
#include "../include/debug.h"

/**
 * this class is designed to parse all elements of SPD.xml. SPD.xml contains
 * serveral key element, include title, propertRef, authors, description, and
 * Implemention.
 */
SPDParser::SPDParser(
    CF::File_ptr file) {
	DEBUG(4, SPDParser::SPDParser, "entering SPDParser constructor.");
	if (CORBA::is_nil(file)) {
		DEBUG(5, SPDParser::SPDParser, "file is nil.");
		exit(EXIT_FAILURE);
	}

	m_fileName = file->fileName();

	unsigned long fileSize = file->sizeOf();
	if (fileSize == 0) {
		DEBUG(5, SPDParser::SPDParser, "the size of file is zero.");
		exit(EXIT_FAILURE);
	}

	CF::OctetSequence_var fileData;
	file->read(fileData, fileSize);

	unsigned char * fileBuffer = fileData->get_buffer();

	XMLDoc.Parse((const char *)fileBuffer);

	// Handle SAD or DCD files
	TiXmlElement * elem = XMLDoc.FirstChildElement("softpkg");
	if (!elem) {
		const char * fn = file->fileName();
		unsigned int error_row = XMLDoc.ErrorRow();
		unsigned int error_col = XMLDoc.ErrorCol();

		std::cerr << "Invalid SPD file: " << fn << "error occur at row:" <<
		    error_row << "and column:" << error_col << std::endl;
		std::cerr << "input parameter is file object reference" << std::endl;

		throw CF::FileException();
	}

	m_authors.clear();
	m_implementations.clear();
	parseFile(elem);

	DEBUG(5, SPDParser::SPDParser, "leaving SPDParser constructor")
}

// absolute path
SPDParser::SPDParser(
    std::string fileName) {
	DEBUG(4, SPDParser::SPDParser, "entering SPDParser constructor.");

	std::ifstream fileIn(fileName.c_str());
	std::stringstream buffer;
	buffer << fileIn.rdbuf();
	std::string contents(buffer.str());
	this->m_fileName = fileName;
	XMLDoc.Parse(contents.c_str());

	// Handle SAD or DCD files
	TiXmlElement *elem = XMLDoc.FirstChildElement("softpkg");
	if (!elem) {
		unsigned int error_row = XMLDoc.ErrorRow();
		unsigned int error_col = XMLDoc.ErrorCol();

		std::cerr << "Invalid SPD file: " << m_fileName << 
			"error occur at row:" << error_row << "and column:" << 
			error_col << std::endl;
		std::cerr << "input parameter is file absolute path" << std::endl;

		fileIn.close();
		throw CF::FileException();
	}

	m_authors.clear();
	m_implementations.clear();
	parseFile(elem);

	fileIn.close();
	DEBUG(5, SPDParser::SPDParser, "leaving SPDParser constructor")
}

SPDParser::~SPDParser() {
	DEBUG(4, SPDParser::~SPDParser, "Entering SPDParser destructor.");

	for (unsigned int i = 0; i < m_authors.size(); i++) {
		if (m_authors[i]) {
			delete m_authors[i];
		}
	}

	DEBUG(5, SPDParser::~SPDParser, "Deleted authors.");

	for (int i = 0; i < m_implementations.size(); i++) {
		if (m_implementations[i]) {
			delete m_implementations[i];
		}
	}

	DEBUG(5, SPDParser::~SPDParser, "leaving SPDParser destructor.");
}

std::vector <SPDAuthor*> *
SPDParser::getAuthors() {
	return &m_authors;
}

const char *
SPDParser::getDescription() {
	return m_softPkgDescription.c_str();
}

std::vector <SPDImplementation*> *
SPDParser::getImplementations() {
	return &m_implementations;
}

const char *
SPDParser::getPRFFile() {
	return m_prfFile.c_str();
}

const char *
SPDParser::getSCDFile() {
	return m_scdFile.c_str();
}

const char *
SPDParser::getSoftPkgID() {
	return m_softPkgID.c_str();
}

const char *
SPDParser::getSoftPkgName() {
	return m_softPkgName.c_str();
}

const char *
SPDParser::getSoftPkgTitle() {
	return m_softPkgTitle.c_str();
}

const char *
SPDParser::getSoftPkgType() {
	return m_softPkgType.c_str();
}

const char *
SPDParser::getSoftPkgVersion() {
	return m_softPkgVersion.c_str();
}

const char *
SPDParser::getSPDFile() {
	return m_spdFile.c_str();
}

char *
SPDParser::getTextNode(
    TiXmlElement * elem) {
	return  NULL;
}

bool
SPDParser::isScaCompliant() {
	if (m_softPkgType == "sca_compliant")
		return true;
	else
		return false;
}

bool
SPDParser::isScaNonCompliant() {
	if (m_softPkgType == "sca_non_compliant")
		return true;
	else
		return false;
}

void
SPDParser::parseFile(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser, "In parseFile.");

	parseSoftPkgAttributes(elem);
	parseSoftPkgTitle(elem);
	parseSoftPkgDescription(elem);
	parseSoftPkgAuthor(elem);
	parsePRFRef(elem);
	parseSCDRef(elem);
	parseImplementations(elem);
}

void
SPDParser::parseImplementations(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parseImplementations, "In parseImplementations.");

	TiXmlElement * imp = elem->FirstChildElement("implementation");

	if (!imp) {
		std::cerr << "Invalid SPD file: " << m_fileName.c_str()
		    << "must include at least one <implementation>" << std::endl;
		throw CF::FileException();
	}

	for (; imp; imp = imp->NextSiblingElement("implementation")) {
		m_implementations.push_back(new SPDImplementation(imp));
	}
}

void
SPDParser::parsePRFRef(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parsePRFRef, "In parsePRFRef.");

	TiXmlElement *prf = elem->FirstChildElement("propertyfile");

	if (prf) {
		TiXmlElement *local = prf->FirstChildElement("localfile");

		m_prfFile = local->Attribute("name");;
	}
}

void
SPDParser::parseSCDRef(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parseSCDRef, "In parseSCDRef.");

	TiXmlElement * scd = elem->FirstChildElement("descriptor");

	if (scd) {
		TiXmlElement * local = scd->FirstChildElement("localfile");
		if (!local) {
			std::cerr << "Invalid SPD file: " << m_fileName.c_str()
			    << "cannot read <localfile> tag for SCD ref" << std::endl;
			throw CF::FileException();
		}
		m_scdFile = local->Attribute("name");
	} else {
		std::cerr << "Invalid SPD file: " << m_fileName.c_str()
		    << "cannot read <descriptor> tag for SCD ref" << std::endl;
		throw CF::FileException();
	}
}

void
SPDParser::parseSoftPkgAttributes(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parseSoftPkgAttributes, "In parseSoftPkgAttributes.");

	const char * id = elem->Attribute("id");
	m_softPkgID = id;

	const char * name = elem->Attribute("name");
	m_softPkgName = name;

	const char * type = elem->Attribute("type");
	if (type) {
		m_softPkgType = type;
	} else {
		m_softPkgType = "sca_compliant";
	}

	const char * ver = elem->Attribute("version");

	if (ver)
		m_softPkgVersion = ver;
}

void
SPDParser::parseSoftPkgAuthor(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parseSoftPkgAuthor, "In parseSoftPkgAuthor.");

	TiXmlElement * author = elem->FirstChildElement("author");

	if (!author) {
		std::cerr << "Invalid SPD file: " << m_fileName.c_str()
		    << "must include at least one <author>" << std::endl;
		throw CF::FileException();
	}

	for (; author; author = author->NextSiblingElement("author")) {
		SPDAuthor * spdAuthor = new SPDAuthor(author);
		m_authors.push_back(spdAuthor);
	}
}

void
SPDParser::parseSoftPkgDescription(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parseSoftPkgDescription, 
		"In parseSoftPkgDescription.");

	TiXmlElement * title = elem->FirstChildElement("description");

	if (title && title->GetText()) {
		// Check that tag exists and contains text
		m_softPkgDescription = title->GetText();
	}
}

void
SPDParser::parseSoftPkgTitle(
    TiXmlElement * elem) {
	DEBUG(4, SPDParser::parseSoftPkgTitle, "In parseSoftPkgTitle.");

	TiXmlElement * title = elem->FirstChildElement("title");

	if (title) {
		const char *str = title->GetText();
		if (str)
			m_softPkgTitle = str;
	}
}

/**
 * this class is designed to parse Implementation element of SPD.xml.
 * Implementation consist of some relative child element such as processor,
 * compliler, prf and so on.
 */
SPDImplementation::SPDImplementation(
    TiXmlElement * elem) {
	parseElement(elem);
}

SPDImplementation::~SPDImplementation() {
	if (m_prfFile) {
		delete m_prfFile;
		m_prfFile = NULL;
	}
}

const char *
SPDImplementation::getCodeFile() {
	return m_codeFile.c_str();
}

CF::LoadableDevice::LoadType
SPDImplementation::getCodeType() const {
	return m_codeType;
}

const char *
SPDImplementation::getCompilerName() {
	return m_compilerName.c_str();
}

const char *
SPDImplementation::getCompilerVersion() {
	return m_compilerVersion.c_str();
}

const char *
SPDImplementation::getEntryPoint() {
	return m_entryPoint.c_str();
}

unsigned long
SPDImplementation::getStackSize() {
	unsigned long ulStackSize = strtoul(m_stackSize.c_str(), NULL, 0);
	return ulStackSize;
}

unsigned long
SPDImplementation::getPriority() {
	unsigned long ulPriority = strtoul(m_priority.c_str(), NULL, 0);
	return ulPriority;
}

const char *
SPDImplementation::getID() {
	return m_implementationID.c_str();
}

OSAttributes
SPDImplementation::getOperatingSystem() {
	return m_os;
}

PropertyFile *
SPDImplementation::getPRFFile() {
	return m_prfFile;
}

std::vector<std::string>
SPDImplementation::getProcessors() const {
	return m_processorsName;
}

void
SPDImplementation::parseCode(
    TiXmlElement * elem) {
	DEBUG(4, SPDImplementation, "In parse Code.");

	TiXmlElement * code = elem->FirstChildElement("code");
	setCodeType (code->Attribute("type"));

	TiXmlElement * local = code->FirstChildElement("localfile");
	m_codeFile = local->Attribute("name");

	TiXmlElement * entry = code->FirstChildElement("entrypoint");
	if (entry)
		m_entryPoint = entry->GetText();

	TiXmlElement * stack = code->FirstChildElement("stacksize");
	if (stack)
		m_stackSize = stack->GetText();

	TiXmlElement * prio = code->FirstChildElement("priority");
	if (prio)
		m_priority = prio->GetText();
}

void
SPDImplementation::parseCompiler(
    TiXmlElement * elem) {
	DEBUG(4, SPDImplementation, "In parseCompiler.");

	TiXmlElement * compiler = elem->FirstChildElement("compiler");

	if (compiler) {
		m_compilerName = compiler->Attribute("name");;

		const char * ver = compiler->Attribute("version");
		if (ver)
			m_compilerVersion = ver;
	}
}

void
SPDImplementation::parseElement(
    TiXmlElement * elem) {
	parseID (elem);
	parsePRFRef (elem);
	parseCode (elem);
	parseCompiler (elem);
	parseOperatingSystems (elem);
	parseProcessors (elem);
}

void
SPDImplementation::parseID(
    TiXmlElement * elem) {
	DEBUG(4, SPDImplementation::parseID, "In parseID.");
	m_implementationID = elem->Attribute("id");
}

void
SPDImplementation::parseOperatingSystems(
    TiXmlElement * elem) {
	DEBUG(4, SPDImplementation::parseOperatingSystems, 
		"In parseOperatingSystems.");

	TiXmlElement * osn = elem->FirstChildElement("os");

	if (osn) {
		const char * name = osn->Attribute("name");
		m_os.setOSName(name);

		const char * ver = osn->Attribute("version");
		if (ver)
			m_os.setOSVersion(ver);
	}
}

void
SPDImplementation::parsePRFRef(
    TiXmlElement * elem) {
	DEBUG(4, SPDImplementation::parsePRFRef, "In parsePRFRef.");

	TiXmlElement * prf = elem->FirstChildElement("propertyfile");

	if (prf) {
		m_prfFile = new PropertyFile(prf);
	} else {
		m_prfFile = NULL;
	}
}

void
SPDImplementation::parseProcessors(
    TiXmlElement * elem) {
	DEBUG(4, SPDImplementation::parseProcessors, "In parseProcessors.");

	TiXmlElement * proc = elem->FirstChildElement("processor");

	for (; proc; proc = proc->NextSiblingElement("processor")) {
		const char * procName = proc->Attribute("name");
		m_processorsName.push_back (procName);
	}
}

void
SPDImplementation::setCodeType(
    const char * _ct) {
	if (strcmp(_ct, "Executable") == 0) {
		m_codeType = CF::LoadableDevice::EXECUTABLE;
	} else if (strcmp(_ct, "SharedLib") == 0) {
		m_codeType = CF::LoadableDevice::SHARED_LIBRARY;
	} else {
		std::cerr << "[SPDImplementation::setCodeType] \
			invalid code type" << std::endl;

		exit(EXIT_FAILURE);
	}
}

/**
 * this class is designed to parse SPD Author element, and save Author Infomation
 * such as company, name, webpage.
 */
SPDAuthor::SPDAuthor(
    TiXmlElement * elem) {
	DEBUG(4, SPDAuthor, "Entering SPDAuthor constructor.")
	parseElement(elem);
}

SPDAuthor::~SPDAuthor() {

}

const char *
SPDAuthor::getAuthorCompany() {
	return m_authorCompany.c_str();
}

const char *
SPDAuthor::getAuthorName() {
	return m_authorName.c_str();
}

const char *
SPDAuthor::getAuthorWebPage() {
	return m_authorWebPage.c_str();
}

void
SPDAuthor::parseElement(
    TiXmlElement * elem) {
	TiXmlElement * node = elem->FirstChildElement();

	for (; node; node = node->NextSiblingElement()) {
		std::string eName = node->GetText();

		if (eName == "name")
			m_authorName = node->GetText();
		else if (eName == "company")
			m_authorCompany = node->GetText();
		else if (eName == "webpage")
			m_authorWebPage = node->GetText();
	}
}

OSAttributes::OSAttributes() {

}

OSAttributes::~OSAttributes() {

}
