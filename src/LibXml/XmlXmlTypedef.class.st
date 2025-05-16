Class {
	#name : 'XmlXmlTypedef',
	#superclass : 'SharedPool',
	#classVars : [
		'_xmlAttr',
		'_xmlAttrHashBucket',
		'_xmlAttribute',
		'_xmlAutomata',
		'_xmlAutomataState',
		'_xmlBuf',
		'_xmlBuffer',
		'_xmlCharEncodingHandler',
		'_xmlCharEncodingHandler__uconv_t',
		'_xmlDOMWrapCtxt',
		'_xmlDict',
		'_xmlDoc',
		'_xmlDtd',
		'_xmlElement',
		'_xmlElementContent',
		'_xmlEntity',
		'_xmlEnumeration',
		'_xmlError',
		'_xmlHashTable',
		'_xmlID',
		'_xmlLink',
		'_xmlList',
		'_xmlMutex',
		'_xmlNode',
		'_xmlNotation',
		'_xmlNs',
		'_xmlOutputBuffer',
		'_xmlParserCtxt',
		'_xmlParserInput',
		'_xmlParserInputBuffer',
		'_xmlParserNodeInfo',
		'_xmlParserNodeInfoSeq',
		'_xmlParserNsData',
		'_xmlRMutex',
		'_xmlRef',
		'_xmlRegExecCtxt',
		'_xmlRegexp',
		'_xmlRelaxNG',
		'_xmlRelaxNGParserCtxt',
		'_xmlRelaxNGValidCtxt',
		'_xmlSAXHandler',
		'_xmlSAXHandlerV1',
		'_xmlSAXLocator',
		'_xmlSchema',
		'_xmlSchemaParserCtxt',
		'_xmlSchemaSAXPlug',
		'_xmlSchemaValidCtxt',
		'_xmlStartTag',
		'_xmlTextReader',
		'_xmlTextWriter',
		'_xmlValidCtxt',
		'_xmlValidState',
		'attributeDeclSAXFunc',
		'attributeSAXFunc',
		'bool',
		'cdataBlockSAXFunc',
		'charactersSAXFunc',
		'commentSAXFunc',
		'elementDeclSAXFunc',
		'endDocumentSAXFunc',
		'endElementNsSAX2Func',
		'endElementSAXFunc',
		'entityDeclSAXFunc',
		'errorSAXFunc',
		'externalSubsetSAXFunc',
		'fatalErrorSAXFunc',
		'getEntitySAXFunc',
		'getParameterEntitySAXFunc',
		'hasExternalSubsetSAXFunc',
		'hasInternalSubsetSAXFunc',
		'iconv_t',
		'ignorableWhitespaceSAXFunc',
		'int16_t',
		'int32_t',
		'int64_t',
		'int8_t',
		'internalSubsetSAXFunc',
		'isStandaloneSAXFunc',
		'notationDeclSAXFunc',
		'pid_t',
		'processingInstructionSAXFunc',
		'referenceSAXFunc',
		'resolveEntitySAXFunc',
		'setDocumentLocatorSAXFunc',
		'startDocumentSAXFunc',
		'startElementNsSAX2Func',
		'startElementSAXFunc',
		'time_t',
		'uint16_t',
		'uint32_t',
		'uint64_t',
		'uint8_t',
		'uintptr_t',
		'unparsedEntityDeclSAXFunc',
		'warningSAXFunc',
		'xmlAttr',
		'xmlAttrHashBucket',
		'xmlAttrPtr',
		'xmlAttribute',
		'xmlAttributeDefault',
		'xmlAttributePtr',
		'xmlAttributeTable',
		'xmlAttributeTablePtr',
		'xmlAttributeType',
		'xmlAutomata',
		'xmlAutomataPtr',
		'xmlAutomataState',
		'xmlAutomataStatePtr',
		'xmlBuf',
		'xmlBufPtr',
		'xmlBuffer',
		'xmlBufferAllocationScheme',
		'xmlBufferPtr',
		'xmlChar',
		'xmlCharEncError',
		'xmlCharEncoding',
		'xmlCharEncodingHandler',
		'xmlCharEncodingHandlerPtr',
		'xmlCharEncodingInputFunc',
		'xmlCharEncodingOutputFunc',
		'xmlDOMWrapAcquireNsFunction',
		'xmlDOMWrapCtxt',
		'xmlDOMWrapCtxtPtr',
		'xmlDeregisterNodeFunc',
		'xmlDict',
		'xmlDictPtr',
		'xmlDoc',
		'xmlDocProperties',
		'xmlDocPtr',
		'xmlDtd',
		'xmlDtdPtr',
		'xmlElement',
		'xmlElementContent',
		'xmlElementContentOccur',
		'xmlElementContentPtr',
		'xmlElementContentType',
		'xmlElementPtr',
		'xmlElementTable',
		'xmlElementTablePtr',
		'xmlElementType',
		'xmlElementTypeVal',
		'xmlEntitiesTable',
		'xmlEntitiesTablePtr',
		'xmlEntity',
		'xmlEntityPtr',
		'xmlEntityType',
		'xmlEnumeration',
		'xmlEnumerationPtr',
		'xmlError',
		'xmlErrorDomain',
		'xmlErrorLevel',
		'xmlErrorPtr',
		'xmlExternalEntityLoader',
		'xmlFeature',
		'xmlFreeFunc',
		'xmlGenericErrorFunc',
		'xmlHashCopier',
		'xmlHashDeallocator',
		'xmlHashScanner',
		'xmlHashScannerFull',
		'xmlHashTable',
		'xmlHashTablePtr',
		'xmlID',
		'xmlIDPtr',
		'xmlIDTable',
		'xmlIDTablePtr',
		'xmlInputCloseCallback',
		'xmlInputMatchCallback',
		'xmlInputOpenCallback',
		'xmlInputReadCallback',
		'xmlLink',
		'xmlLinkPtr',
		'xmlList',
		'xmlListDataCompare',
		'xmlListDeallocator',
		'xmlListPtr',
		'xmlListWalker',
		'xmlMallocFunc',
		'xmlMutex',
		'xmlMutexPtr',
		'xmlNode',
		'xmlNodePtr',
		'xmlNotation',
		'xmlNotationPtr',
		'xmlNotationTable',
		'xmlNotationTablePtr',
		'xmlNs',
		'xmlNsPtr',
		'xmlNsType',
		'xmlOutputBuffer',
		'xmlOutputBufferCreateFilenameFunc',
		'xmlOutputBufferPtr',
		'xmlOutputCloseCallback',
		'xmlOutputMatchCallback',
		'xmlOutputOpenCallback',
		'xmlOutputWriteCallback',
		'xmlParserCtxt',
		'xmlParserCtxtPtr',
		'xmlParserErrors',
		'xmlParserInput',
		'xmlParserInputBuffer',
		'xmlParserInputBufferCreateFilenameFunc',
		'xmlParserInputBufferPtr',
		'xmlParserInputDeallocate',
		'xmlParserInputPtr',
		'xmlParserInputState',
		'xmlParserMode',
		'xmlParserNodeInfo',
		'xmlParserNodeInfoPtr',
		'xmlParserNodeInfoSeq',
		'xmlParserNodeInfoSeqPtr',
		'xmlParserNsData',
		'xmlParserOption',
		'xmlParserProperties',
		'xmlParserSeverities',
		'xmlRMutex',
		'xmlRMutexPtr',
		'xmlReaderTypes',
		'xmlReallocFunc',
		'xmlRef',
		'xmlRefPtr',
		'xmlRefTable',
		'xmlRefTablePtr',
		'xmlRegExecCallbacks',
		'xmlRegExecCtxt',
		'xmlRegExecCtxtPtr',
		'xmlRegexp',
		'xmlRegexpPtr',
		'xmlRegisterNodeFunc',
		'xmlRelaxNG',
		'xmlRelaxNGParserCtxt',
		'xmlRelaxNGParserCtxtPtr',
		'xmlRelaxNGParserFlag',
		'xmlRelaxNGPtr',
		'xmlRelaxNGValidCtxt',
		'xmlRelaxNGValidCtxtPtr',
		'xmlRelaxNGValidErr',
		'xmlRelaxNGValidityErrorFunc',
		'xmlRelaxNGValidityWarningFunc',
		'xmlSAXHandler',
		'xmlSAXHandlerPtr',
		'xmlSAXHandlerV1',
		'xmlSAXHandlerV1Ptr',
		'xmlSAXLocator',
		'xmlSAXLocatorPtr',
		'xmlSchema',
		'xmlSchemaParserCtxt',
		'xmlSchemaParserCtxtPtr',
		'xmlSchemaPtr',
		'xmlSchemaSAXPlugPtr',
		'xmlSchemaSAXPlugStruct',
		'xmlSchemaValidCtxt',
		'xmlSchemaValidCtxtPtr',
		'xmlSchemaValidError',
		'xmlSchemaValidOption',
		'xmlSchemaValidityErrorFunc',
		'xmlSchemaValidityLocatorFunc',
		'xmlSchemaValidityWarningFunc',
		'xmlStartTag',
		'xmlStrdupFunc',
		'xmlStructuredErrorFunc',
		'xmlTextReader',
		'xmlTextReaderErrorFunc',
		'xmlTextReaderLocatorPtr',
		'xmlTextReaderMode',
		'xmlTextReaderPtr',
		'xmlTextWriter',
		'xmlTextWriterPtr',
		'xmlValidCtxt',
		'xmlValidCtxtPtr',
		'xmlValidState',
		'xmlValidStatePtr',
		'xmlValidityErrorFunc',
		'xmlValidityWarningFunc'
	],
	#category : 'LibXml-Library',
	#package : 'LibXml',
	#tag : 'Library'
}

{ #category : 'class initialization' }
XmlXmlTypedef class >> initialize [

	uint16_t := #uint16.
	uint64_t := #uint64.
	uint8_t := #uint8.
	int32_t := #int32.
	uint32_t := #uint32.
	time_t := #int.
	pid_t := #int.
	bool := #Boolean.
	int8_t := #int8.
	int16_t := #int16.
	int64_t := #int64.
	uintptr_t := #'void *'.
	_xmlCharEncodingHandler__uconv_t := #void.
	xmlCharEncError := XmlCharEncError.
	xmlCharEncoding := XmlCharEncoding.
	xmlCharEncodingInputFunc := FFICallback.
	xmlCharEncodingOutputFunc := FFICallback.
	_xmlCharEncodingHandler := Xml_xmlCharEncodingHandler.
	xmlCharEncodingHandler := Xml_xmlCharEncodingHandler.
	xmlCharEncodingHandlerPtr := #'xmlCharEncodingHandler *'.
	_xmlBuffer := Xml_xmlBuffer.
	xmlChar := #uchar.
	xmlFreeFunc := FFICallback.
	xmlMallocFunc := FFICallback.
	xmlReallocFunc := FFICallback.
	xmlStrdupFunc := FFICallback.
	_xmlRegexp := Xml_xmlRegexp.
	xmlRegexp := Xml_xmlRegexp.
	xmlRegexpPtr := #'xmlRegexp *'.
	_xmlRegExecCtxt := Xml_xmlRegExecCtxt.
	xmlRegExecCtxt := Xml_xmlRegExecCtxt.
	xmlRegExecCtxtPtr := #'xmlRegExecCtxt *'.
	xmlRegExecCallbacks := FFICallback.
	_xmlParserInputBuffer := Xml_xmlParserInputBuffer.
	xmlParserInputBuffer := Xml_xmlParserInputBuffer.
	xmlParserInputBufferPtr := #'xmlParserInputBuffer *'.
	_xmlOutputBuffer := Xml_xmlOutputBuffer.
	xmlOutputBuffer := Xml_xmlOutputBuffer.
	xmlOutputBufferPtr := #'xmlOutputBuffer *'.
	_xmlParserInput := Xml_xmlParserInput.
	xmlParserInput := Xml_xmlParserInput.
	xmlParserInputPtr := #'xmlParserInput *'.
	_xmlParserCtxt := Xml_xmlParserCtxt.
	xmlParserCtxt := Xml_xmlParserCtxt.
	xmlParserCtxtPtr := #'xmlParserCtxt *'.
	_xmlSAXLocator := Xml_xmlSAXLocator.
	xmlSAXLocator := Xml_xmlSAXLocator.
	xmlSAXLocatorPtr := #'xmlSAXLocator *'.
	_xmlSAXHandler := Xml_xmlSAXHandler.
	xmlSAXHandler := Xml_xmlSAXHandler.
	xmlSAXHandlerPtr := #'xmlSAXHandler *'.
	_xmlEntity := Xml_xmlEntity.
	xmlEntity := Xml_xmlEntity.
	xmlEntityPtr := #'xmlEntity *'.
	xmlBufferAllocationScheme := XmlBufferAllocationScheme.
	xmlBuffer := Xml_xmlBuffer.
	xmlBufferPtr := #'xmlBuffer *'.
	_xmlBuf := Xml_xmlBuf.
	xmlBuf := Xml_xmlBuf.
	xmlBufPtr := #'xmlBuf *'.
	xmlElementType := XmlElementType.
	_xmlNotation := Xml_xmlNotation.
	xmlNotation := Xml_xmlNotation.
	xmlNotationPtr := #'xmlNotation *'.
	xmlAttributeType := XmlAttributeType.
	xmlAttributeDefault := XmlAttributeDefault.
	_xmlEnumeration := Xml_xmlEnumeration.
	xmlEnumeration := Xml_xmlEnumeration.
	xmlEnumerationPtr := #'xmlEnumeration *'.
	_xmlAttribute := Xml_xmlAttribute.
	xmlAttribute := Xml_xmlAttribute.
	xmlAttributePtr := #'xmlAttribute *'.
	xmlElementContentType := XmlElementContentType.
	xmlElementContentOccur := XmlElementContentOccur.
	_xmlElementContent := Xml_xmlElementContent.
	xmlElementContent := Xml_xmlElementContent.
	xmlElementContentPtr := #'xmlElementContent *'.
	xmlElementTypeVal := XmlElementTypeVal.
	_xmlElement := Xml_xmlElement.
	xmlElement := Xml_xmlElement.
	xmlElementPtr := #'xmlElement *'.
	xmlNsType := XmlElementType.
	_xmlNs := Xml_xmlNs.
	xmlNs := Xml_xmlNs.
	xmlNsPtr := #'xmlNs *'.
	xmlDtd := Xml_xmlDtd.
	xmlDtdPtr := #'xmlDtd *'.
	_xmlAttr := Xml_xmlAttr.
	xmlAttr := Xml_xmlAttr.
	xmlAttrPtr := #'xmlAttr *'.
	xmlID := Xml_xmlID.
	xmlIDPtr := #'xmlID *'.
	_xmlRef := Xml_xmlRef.
	xmlRef := Xml_xmlRef.
	xmlRefPtr := #'xmlRef *'.
	xmlNode := Xml_xmlNode.
	xmlNodePtr := #'xmlNode *'.
	xmlDocProperties := XmlDocProperties.
	xmlDoc := Xml_xmlDoc.
	xmlDocPtr := #'xmlDoc *'.
	_xmlDict := Xml_xmlDict.
	_xmlDOMWrapCtxt := Xml_xmlDOMWrapCtxt.
	xmlDOMWrapCtxt := Xml_xmlDOMWrapCtxt.
	xmlDOMWrapCtxtPtr := #'xmlDOMWrapCtxt *'.
	xmlDOMWrapAcquireNsFunction := FFICallback.
	xmlRegisterNodeFunc := FFICallback.
	xmlDeregisterNodeFunc := FFICallback.
	xmlDict := Xml_xmlDict.
	xmlDictPtr := #'xmlDict *'.
	_xmlHashTable := Xml_xmlHashTable.
	xmlHashTable := Xml_xmlHashTable.
	xmlHashTablePtr := #'xmlHashTable *'.
	xmlHashDeallocator := FFICallback.
	xmlHashCopier := FFICallback.
	xmlHashScanner := FFICallback.
	xmlHashScannerFull := FFICallback.
	xmlErrorLevel := XmlErrorLevel.
	xmlErrorDomain := XmlErrorDomain.
	_xmlError := Xml_xmlError.
	xmlError := Xml_xmlError.
	xmlErrorPtr := #'xmlError *'.
	xmlParserErrors := XmlParserErrors.
	xmlGenericErrorFunc := FFICallback.
	xmlStructuredErrorFunc := FFICallback.
	_xmlLink := Xml_xmlLink.
	xmlLink := Xml_xmlLink.
	xmlLinkPtr := #'xmlLink *'.
	_xmlList := Xml_xmlList.
	xmlList := Xml_xmlList.
	xmlListPtr := #'xmlList *'.
	xmlListDeallocator := FFICallback.
	xmlListDataCompare := FFICallback.
	xmlListWalker := FFICallback.
	_xmlAutomata := Xml_xmlAutomata.
	xmlAutomata := Xml_xmlAutomata.
	xmlAutomataPtr := #'xmlAutomata *'.
	_xmlAutomataState := Xml_xmlAutomataState.
	xmlAutomataState := Xml_xmlAutomataState.
	xmlAutomataStatePtr := #'xmlAutomataState *'.
	_xmlValidState := Xml_xmlValidState.
	xmlValidState := Xml_xmlValidState.
	xmlValidStatePtr := #'xmlValidState *'.
	xmlValidityErrorFunc := FFICallback.
	xmlValidityWarningFunc := FFICallback.
	_xmlValidCtxt := Xml_xmlValidCtxt.
	xmlValidCtxt := Xml_xmlValidCtxt.
	xmlValidCtxtPtr := #'xmlValidCtxt *'.
	xmlNotationTable := Xml_xmlHashTable.
	xmlNotationTablePtr := #'xmlNotationTable *'.
	xmlElementTable := Xml_xmlHashTable.
	xmlElementTablePtr := #'xmlElementTable *'.
	xmlAttributeTable := Xml_xmlHashTable.
	xmlAttributeTablePtr := #'xmlAttributeTable *'.
	xmlIDTable := Xml_xmlHashTable.
	xmlIDTablePtr := #'xmlIDTable *'.
	xmlRefTable := Xml_xmlHashTable.
	xmlRefTablePtr := #'xmlRefTable *'.
	xmlEntityType := XmlEntityType.
	xmlEntitiesTable := Xml_xmlHashTable.
	xmlEntitiesTablePtr := #'xmlEntitiesTable *'.
	xmlInputMatchCallback := FFICallback.
	xmlInputOpenCallback := FFICallback.
	xmlInputReadCallback := FFICallback.
	xmlInputCloseCallback := FFICallback.
	xmlOutputMatchCallback := FFICallback.
	xmlOutputOpenCallback := FFICallback.
	xmlOutputWriteCallback := FFICallback.
	xmlOutputCloseCallback := FFICallback.
	xmlParserInputBufferCreateFilenameFunc := FFICallback.
	xmlOutputBufferCreateFilenameFunc := FFICallback.
	_xmlMutex := Xml_xmlMutex.
	xmlMutex := Xml_xmlMutex.
	xmlMutexPtr := #'xmlMutex *'.
	_xmlRMutex := Xml_xmlRMutex.
	xmlRMutex := Xml_xmlRMutex.
	xmlRMutexPtr := #'xmlRMutex *'.
	xmlParserInputDeallocate := FFICallback.
	_xmlParserNodeInfo := Xml_xmlParserNodeInfo.
	xmlParserNodeInfo := Xml_xmlParserNodeInfo.
	xmlParserNodeInfoPtr := #'xmlParserNodeInfo *'.
	_xmlParserNodeInfoSeq := Xml_xmlParserNodeInfoSeq.
	xmlParserNodeInfoSeq := Xml_xmlParserNodeInfoSeq.
	xmlParserNodeInfoSeqPtr := #'xmlParserNodeInfoSeq *'.
	xmlParserInputState := XmlParserInputState.
	xmlParserMode := XmlParserMode.
	_xmlStartTag := Xml_xmlStartTag.
	xmlStartTag := Xml_xmlStartTag.
	_xmlParserNsData := Xml_xmlParserNsData.
	xmlParserNsData := Xml_xmlParserNsData.
	_xmlAttrHashBucket := Xml_xmlAttrHashBucket.
	xmlAttrHashBucket := Xml_xmlAttrHashBucket.
	resolveEntitySAXFunc := FFICallback.
	internalSubsetSAXFunc := FFICallback.
	externalSubsetSAXFunc := FFICallback.
	getEntitySAXFunc := FFICallback.
	getParameterEntitySAXFunc := FFICallback.
	entityDeclSAXFunc := FFICallback.
	notationDeclSAXFunc := FFICallback.
	attributeDeclSAXFunc := FFICallback.
	elementDeclSAXFunc := FFICallback.
	unparsedEntityDeclSAXFunc := FFICallback.
	setDocumentLocatorSAXFunc := FFICallback.
	startDocumentSAXFunc := FFICallback.
	endDocumentSAXFunc := FFICallback.
	startElementSAXFunc := FFICallback.
	endElementSAXFunc := FFICallback.
	attributeSAXFunc := FFICallback.
	referenceSAXFunc := FFICallback.
	charactersSAXFunc := FFICallback.
	ignorableWhitespaceSAXFunc := FFICallback.
	processingInstructionSAXFunc := FFICallback.
	commentSAXFunc := FFICallback.
	cdataBlockSAXFunc := FFICallback.
	warningSAXFunc := FFICallback.
	errorSAXFunc := FFICallback.
	fatalErrorSAXFunc := FFICallback.
	isStandaloneSAXFunc := FFICallback.
	hasInternalSubsetSAXFunc := FFICallback.
	hasExternalSubsetSAXFunc := FFICallback.
	startElementNsSAX2Func := FFICallback.
	endElementNsSAX2Func := FFICallback.
	_xmlSAXHandlerV1 := Xml_xmlSAXHandlerV1.
	xmlSAXHandlerV1 := Xml_xmlSAXHandlerV1.
	xmlSAXHandlerV1Ptr := #'xmlSAXHandlerV1 *'.
	xmlExternalEntityLoader := FFICallback.
	xmlParserOption := XmlParserOption.
	xmlFeature := XmlFeature.
	_xmlRelaxNG := Xml_xmlRelaxNG.
	xmlRelaxNG := Xml_xmlRelaxNG.
	xmlRelaxNGPtr := #'xmlRelaxNG *'.
	xmlRelaxNGValidityErrorFunc := FFICallback.
	xmlRelaxNGValidityWarningFunc := FFICallback.
	_xmlRelaxNGParserCtxt := Xml_xmlRelaxNGParserCtxt.
	xmlRelaxNGParserCtxt := Xml_xmlRelaxNGParserCtxt.
	xmlRelaxNGParserCtxtPtr := #'xmlRelaxNGParserCtxt *'.
	_xmlRelaxNGValidCtxt := Xml_xmlRelaxNGValidCtxt.
	xmlRelaxNGValidCtxt := Xml_xmlRelaxNGValidCtxt.
	xmlRelaxNGValidCtxtPtr := #'xmlRelaxNGValidCtxt *'.
	xmlRelaxNGValidErr := XmlRelaxNGValidErr.
	xmlRelaxNGParserFlag := XmlRelaxNGParserFlag.
	xmlSchemaValidError := XmlSchemaValidError.
	xmlSchemaValidOption := XmlSchemaValidOption.
	_xmlSchema := Xml_xmlSchema.
	xmlSchema := Xml_xmlSchema.
	xmlSchemaPtr := #'xmlSchema *'.
	xmlSchemaValidityErrorFunc := FFICallback.
	xmlSchemaValidityWarningFunc := FFICallback.
	_xmlSchemaParserCtxt := Xml_xmlSchemaParserCtxt.
	xmlSchemaParserCtxt := Xml_xmlSchemaParserCtxt.
	xmlSchemaParserCtxtPtr := #'xmlSchemaParserCtxt *'.
	_xmlSchemaValidCtxt := Xml_xmlSchemaValidCtxt.
	xmlSchemaValidCtxt := Xml_xmlSchemaValidCtxt.
	xmlSchemaValidCtxtPtr := #'xmlSchemaValidCtxt *'.
	xmlSchemaValidityLocatorFunc := FFICallback.
	_xmlSchemaSAXPlug := Xml_xmlSchemaSAXPlug.
	xmlSchemaSAXPlugStruct := Xml_xmlSchemaSAXPlug.
	xmlSchemaSAXPlugPtr := #'xmlSchemaSAXPlugStruct *'.
	xmlParserSeverities := XmlParserSeverities.
	xmlTextReaderMode := XmlTextReaderMode.
	xmlParserProperties := XmlParserProperties.
	xmlReaderTypes := XmlReaderTypes.
	_xmlTextReader := Xml_xmlTextReader.
	xmlTextReader := Xml_xmlTextReader.
	xmlTextReaderPtr := #'xmlTextReader *'.
	xmlTextReaderLocatorPtr := #'void *'.
	xmlTextReaderErrorFunc := FFICallback.
	iconv_t := #'void *'.
	_xmlTextWriter := Xml_xmlTextWriter.
	xmlTextWriter := Xml_xmlTextWriter.
	xmlTextWriterPtr := #'xmlTextWriter *'.
	_xmlDtd := Xml_xmlDtd.
	_xmlID := Xml_xmlID.
	_xmlNode := Xml_xmlNode.
	_xmlDoc := Xml_xmlDoc
]
