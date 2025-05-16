Class {
	#name : 'LibXml',
	#superclass : 'FFILibrary',
	#pools : [
		'XmlXmlTypedef'
	],
	#category : 'LibXml-Library',
	#package : 'LibXml',
	#tag : 'Library'
}

{ #category : 'validation' }
LibXml class >> validateXml: xmlFile xsd: xsdFile [
	"
	self 
		validateXml: './shiporder.xml' asFileReference fullName
		xsd: './shiporder.xsd' asFileReference fullName
	"
	| xml schema schemaParserCtxt validCtxt reader errors errorCallback ret |
	
	xml := self uniqueInstance.

	errors := OrderedCollection new.

	xml xmlInitParser.

	[
		schemaParserCtxt := xml xmlSchemaNewParserCtxt: xsdFile.
		schemaParserCtxt isNull ifTrue: [ self error: 'Can''t open a parser for the xsd file: ', xsdFile ].

		schema := xml xmlSchemaParse: schemaParserCtxt.
		xml xmlSchemaFreeParserCtxt: schemaParserCtxt.		
		schema isNull ifTrue: [ self error: 'Can''t parse xsd file: ', xsdFile ].
		
		validCtxt := xml xmlSchemaNewValidCtxt: schema.
		reader := xml xmlReaderForFileFilename: xmlFile encoding: nil options: 0.
		reader isNull ifTrue: [ self error: 'Can''t open a reader for file: ', xmlFile ].
		xml xmlTextReaderSchemaValidateCtxtReader: reader ctxt: validCtxt options: 0.
		xml 
			xmlSchemaSetValidStructuredErrorsCtxt: validCtxt 
			serror: (errorCallback := FFICallback 
				signature: #(void (void *user_data, void *error))
				block: [ :user_data :errorHandle | 
					| error |
					error := Xml_xmlError fromHandle: errorHandle.
					errors add: (OrderedDictionary newFromPairs: {
						#file. error file utf8StringFromCString.
						#line. error line.
						#int2. error int2.
						#code. error code. 
						#message. error message utf8StringFromCString
					}) ]) 
			ctx: ExternalAddress null.

		[ ((ret := xml xmlTextReaderRead: reader) = 1) and: [ errors isEmpty ] ] whileTrue.		
		xml xmlFreeTextReader: reader ] 
	ensure: [ 
		xml xmlCleanupParser ].

	^ errors
]

{ #category : 'public' }
LibXml >> UTF8Toisolat1Out: out outlen: outlen in: in inlen: inlen [

	self ffiCall: #(int UTF8Toisolat1(uchar* out, int* outlen, const uchar* in, int* inlen))
]

{ #category : 'public' }
LibXml >> __oldXMLWDcompatibility [

	self ffiCall: #(const int* __oldXMLWDcompatibility())
]

{ #category : 'public' }
LibXml >> __xmlBufferAllocScheme [

	self ffiCall: #(xmlBufferAllocationScheme __xmlBufferAllocScheme())
]

{ #category : 'public' }
LibXml >> __xmlDefaultBufferSize [

	self ffiCall: #(int* __xmlDefaultBufferSize())
]

{ #category : 'public' }
LibXml >> __xmlDefaultSAXHandler [

	self ffiCall: #(const xmlSAXHandlerV1* __xmlDefaultSAXHandler())
]

{ #category : 'public' }
LibXml >> __xmlDefaultSAXLocator [

	self ffiCall: #(const xmlSAXLocator* __xmlDefaultSAXLocator())
]

{ #category : 'public' }
LibXml >> __xmlDeregisterNodeDefaultValue [

	self ffiCall: #(xmlDeregisterNodeFunc* __xmlDeregisterNodeDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlDoValidityCheckingDefaultValue [

	self ffiCall: #(int* __xmlDoValidityCheckingDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlGenericError [

	self ffiCall: #(xmlGenericErrorFunc* __xmlGenericError())
]

{ #category : 'public' }
LibXml >> __xmlGenericErrorContext [

	self ffiCall: #(void** __xmlGenericErrorContext())
]

{ #category : 'public' }
LibXml >> __xmlGetWarningsDefaultValue [

	self ffiCall: #(int* __xmlGetWarningsDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlIndentTreeOutput [

	self ffiCall: #(int* __xmlIndentTreeOutput())
]

{ #category : 'public' }
LibXml >> __xmlKeepBlanksDefaultValue [

	self ffiCall: #(int* __xmlKeepBlanksDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlLastError [

	self ffiCall: #(xmlError* __xmlLastError())
]

{ #category : 'public' }
LibXml >> __xmlLineNumbersDefaultValue [

	self ffiCall: #(int* __xmlLineNumbersDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlLoadExtDtdDefaultValue [

	self ffiCall: #(int* __xmlLoadExtDtdDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlOutputBufferCreateFilenameURI: URI encoder: encoder compression: compression [

	self ffiCall: #(xmlOutputBufferPtr __xmlOutputBufferCreateFilename(const char* URI, xmlCharEncodingHandlerPtr encoder, int compression))
]

{ #category : 'public' }
LibXml >> __xmlOutputBufferCreateFilenameValue [

	self ffiCall: #(xmlOutputBufferCreateFilenameFunc* __xmlOutputBufferCreateFilenameValue())
]

{ #category : 'public' }
LibXml >> __xmlParserDebugEntities [

	self ffiCall: #(const int* __xmlParserDebugEntities())
]

{ #category : 'public' }
LibXml >> __xmlParserInputBufferCreateFilenameURI: URI enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr __xmlParserInputBufferCreateFilename(const char* URI, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> __xmlParserInputBufferCreateFilenameValue [

	self ffiCall: #(xmlParserInputBufferCreateFilenameFunc* __xmlParserInputBufferCreateFilenameValue())
]

{ #category : 'public' }
LibXml >> __xmlParserVersion [

	self ffiCall: #(const char* __xmlParserVersion())
]

{ #category : 'public' }
LibXml >> __xmlPedanticParserDefaultValue [

	self ffiCall: #(int* __xmlPedanticParserDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlRegisterNodeDefaultValue [

	self ffiCall: #(xmlRegisterNodeFunc* __xmlRegisterNodeDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlSaveNoEmptyTags [

	self ffiCall: #(int* __xmlSaveNoEmptyTags())
]

{ #category : 'public' }
LibXml >> __xmlStructuredError [

	self ffiCall: #(xmlStructuredErrorFunc* __xmlStructuredError())
]

{ #category : 'public' }
LibXml >> __xmlStructuredErrorContext [

	self ffiCall: #(void** __xmlStructuredErrorContext())
]

{ #category : 'public' }
LibXml >> __xmlSubstituteEntitiesDefaultValue [

	self ffiCall: #(int* __xmlSubstituteEntitiesDefaultValue())
]

{ #category : 'public' }
LibXml >> __xmlTreeIndentString [

	self ffiCall: #(const char** __xmlTreeIndentString())
]

{ #category : 'public' }
LibXml >> htmlDefaultSAXHandlerInit [

	self ffiCall: #(void htmlDefaultSAXHandlerInit())
]

{ #category : 'public' }
LibXml >> initGenericErrorDefaultFunc: handler [

	self ffiCall: #(void initGenericErrorDefaultFunc(xmlGenericErrorFunc* handler))
]

{ #category : 'public' }
LibXml >> isolat1ToUTF8Out: out outlen: outlen in: in inlen: inlen [

	self ffiCall: #(int isolat1ToUTF8(uchar* out, int* outlen, const uchar* in, int* inlen))
]

{ #category : 'accessing - platform' }
LibXml >> macLibraryName [

	^ FFIMacLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libxml.dylib'
]

{ #category : 'accessing' }
LibXml >> runner [
	
	^ TFProcessLocalWorker new 
		defaultWorker: TFSameThreadRunner uniqueInstance;
		yourself
]

{ #category : 'accessing - platform' }
LibXml >> unix64LibraryName [

	^ FFIUnix64LibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'libxml2.so'
]

{ #category : 'accessing - platform' }
LibXml >> win32LibraryName [

	^ FFIWindowsLibraryFinder new
		userPaths: #('./CIG/lib');
		findLibrary: 'xml.dll'
]

{ #category : 'public' }
LibXml >> xmlAddAttributeDeclCtxt: ctxt dtd: dtd elem: elem name: name ns: ns type: type def: def defaultValue: defaultValue tree: tree [

	self ffiCall: #(xmlAttributePtr xmlAddAttributeDecl(xmlValidCtxtPtr ctxt, xmlDtdPtr dtd, const xmlChar* elem, const xmlChar* name, const xmlChar* ns, xmlAttributeType type, xmlAttributeDefault def, const xmlChar* defaultValue, xmlEnumerationPtr tree))
]

{ #category : 'public' }
LibXml >> xmlAddChildListParent: parent cur: cur [

	self ffiCall: #(xmlNodePtr xmlAddChildList(xmlNodePtr parent, xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlAddChildParent: parent cur: cur [

	self ffiCall: #(xmlNodePtr xmlAddChild(xmlNodePtr parent, xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlAddDocEntityDoc: doc name: name type: type ExternalID: ExternalID SystemID: SystemID content: content [

	self ffiCall: #(xmlEntityPtr xmlAddDocEntity(xmlDocPtr doc, const xmlChar* name, int type, const xmlChar* ExternalID, const xmlChar* SystemID, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlAddDtdEntityDoc: doc name: name type: type ExternalID: ExternalID SystemID: SystemID content: content [

	self ffiCall: #(xmlEntityPtr xmlAddDtdEntity(xmlDocPtr doc, const xmlChar* name, int type, const xmlChar* ExternalID, const xmlChar* SystemID, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlAddElementDeclCtxt: ctxt dtd: dtd name: name type: type content: content [

	self ffiCall: #(xmlElementPtr xmlAddElementDecl(xmlValidCtxtPtr ctxt, xmlDtdPtr dtd, const xmlChar* name, xmlElementTypeVal type, xmlElementContentPtr content))
]

{ #category : 'public' }
LibXml >> xmlAddEncodingAliasName: name alias: alias [

	self ffiCall: #(int xmlAddEncodingAlias(const char* name, const char* alias))
]

{ #category : 'public' }
LibXml >> xmlAddEntityDoc: doc extSubset: extSubset name: name type: type ExternalID: ExternalID SystemID: SystemID content: content out: out [

	self ffiCall: #(int xmlAddEntity(xmlDocPtr doc, int extSubset, const xmlChar* name, int type, const xmlChar* ExternalID, const xmlChar* SystemID, const xmlChar* content, xmlEntityPtr* out))
]

{ #category : 'public' }
LibXml >> xmlAddIDCtxt: ctxt doc: doc value: value attr: attr [

	self ffiCall: #(xmlIDPtr xmlAddID(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar* value, xmlAttrPtr attr))
]

{ #category : 'public' }
LibXml >> xmlAddIDSafeAttr: attr value: value [

	self ffiCall: #(int xmlAddIDSafe(xmlAttrPtr attr, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlAddNextSiblingCur: cur elem: elem [

	self ffiCall: #(xmlNodePtr xmlAddNextSibling(xmlNodePtr cur, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlAddNotationDeclCtxt: ctxt dtd: dtd name: name PublicID: PublicID SystemID: SystemID [

	self ffiCall: #(xmlNotationPtr xmlAddNotationDecl(xmlValidCtxtPtr ctxt, xmlDtdPtr dtd, const xmlChar* name, const xmlChar* PublicID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlAddPrevSiblingCur: cur elem: elem [

	self ffiCall: #(xmlNodePtr xmlAddPrevSibling(xmlNodePtr cur, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlAddRefCtxt: ctxt doc: doc value: value attr: attr [

	self ffiCall: #(xmlRefPtr xmlAddRef(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar* value, xmlAttrPtr attr))
]

{ #category : 'public' }
LibXml >> xmlAddSiblingCur: cur elem: elem [

	self ffiCall: #(xmlNodePtr xmlAddSibling(xmlNodePtr cur, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlAllocOutputBuffer: encoder [

	self ffiCall: #(xmlOutputBufferPtr xmlAllocOutputBuffer(xmlCharEncodingHandlerPtr encoder))
]

{ #category : 'public' }
LibXml >> xmlAllocParserInputBuffer: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlAllocParserInputBuffer(xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlAttrSerializeTxtContentBuf: buf doc: doc attr: attr string: string [

	self ffiCall: #(void xmlAttrSerializeTxtContent(xmlBufferPtr buf, xmlDocPtr doc, xmlAttrPtr attr, const xmlChar* string))
]

{ #category : 'public' }
LibXml >> xmlAutomataCompile: am [

	self ffiCall: #(_xmlRegexp* xmlAutomataCompile(xmlAutomataPtr am))
]

{ #category : 'public' }
LibXml >> xmlAutomataGetInitState: am [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataGetInitState(xmlAutomataPtr am))
]

{ #category : 'public' }
LibXml >> xmlAutomataIsDeterminist: am [

	self ffiCall: #(int xmlAutomataIsDeterminist(xmlAutomataPtr am))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewAllTransAm: am from: from to: to lax: lax [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewAllTrans(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, int lax))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewCountTrans2Am: am from: from to: to token: token token2: token2 min: min max: max data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewCountTrans2(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, const xmlChar* token2, int min, int max, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewCountTransAm: am from: from to: to token: token min: min max: max data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewCountTrans(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, int min, int max, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewCountedTransAm: am from: from to: to counter: counter [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewCountedTrans(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, int counter))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewCounterAm: am min: min max: max [

	self ffiCall: #(int xmlAutomataNewCounter(xmlAutomataPtr am, int min, int max))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewCounterTransAm: am from: from to: to counter: counter [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewCounterTrans(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, int counter))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewEpsilonAm: am from: from to: to [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewEpsilon(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewNegTransAm: am from: from to: to token: token token2: token2 data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewNegTrans(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, const xmlChar* token2, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewOnceTrans2Am: am from: from to: to token: token token2: token2 min: min max: max data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewOnceTrans2(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, const xmlChar* token2, int min, int max, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewOnceTransAm: am from: from to: to token: token min: min max: max data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewOnceTrans(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, int min, int max, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewState: am [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewState(xmlAutomataPtr am))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewTransition2Am: am from: from to: to token: token token2: token2 data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewTransition2(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, const xmlChar* token2, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataNewTransitionAm: am from: from to: to token: token data: data [

	self ffiCall: #(xmlAutomataStatePtr xmlAutomataNewTransition(xmlAutomataPtr am, xmlAutomataStatePtr from, xmlAutomataStatePtr to, const xmlChar* token, void* data))
]

{ #category : 'public' }
LibXml >> xmlAutomataSetFinalStateAm: am state: state [

	self ffiCall: #(int xmlAutomataSetFinalState(xmlAutomataPtr am, xmlAutomataStatePtr state))
]

{ #category : 'public' }
LibXml >> xmlBufContent: buf [

	self ffiCall: #(xmlChar* xmlBufContent(const xmlBuf* buf))
]

{ #category : 'public' }
LibXml >> xmlBufEnd: buf [

	self ffiCall: #(xmlChar* xmlBufEnd(xmlBufPtr buf))
]

{ #category : 'public' }
LibXml >> xmlBufGetNodeContentBuf: buf cur: cur [

	self ffiCall: #(int xmlBufGetNodeContent(xmlBufPtr buf, const xmlNode* cur))
]

{ #category : 'public' }
LibXml >> xmlBufNodeDumpBuf: buf doc: doc cur: cur level: level format: format [

	self ffiCall: #(size_t xmlBufNodeDump(xmlBufPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format))
]

{ #category : 'public' }
LibXml >> xmlBufShrinkBuf: buf len: len [

	self ffiCall: #(size_t xmlBufShrink(xmlBufPtr buf, size_t len))
]

{ #category : 'public' }
LibXml >> xmlBufUse: buf [

	self ffiCall: #(size_t xmlBufUse(xmlBufPtr buf))
]

{ #category : 'public' }
LibXml >> xmlBufferAddBuf: buf str: str len: len [

	self ffiCall: #(int xmlBufferAdd(xmlBufferPtr buf, const xmlChar* str, int len))
]

{ #category : 'public' }
LibXml >> xmlBufferAddHeadBuf: buf str: str len: len [

	self ffiCall: #(int xmlBufferAddHead(xmlBufferPtr buf, const xmlChar* str, int len))
]

{ #category : 'public' }
LibXml >> xmlBufferCCatBuf: buf str: str [

	self ffiCall: #(int xmlBufferCCat(xmlBufferPtr buf, const char* str))
]

{ #category : 'public' }
LibXml >> xmlBufferCatBuf: buf str: str [

	self ffiCall: #(int xmlBufferCat(xmlBufferPtr buf, const xmlChar* str))
]

{ #category : 'public' }
LibXml >> xmlBufferContent: buf [

	self ffiCall: #(const xmlChar* xmlBufferContent(const xmlBuffer* buf))
]

{ #category : 'public' }
LibXml >> xmlBufferCreate [

	self ffiCall: #(xmlBufferPtr xmlBufferCreate())
]

{ #category : 'public' }
LibXml >> xmlBufferCreateSize: size [

	self ffiCall: #(xmlBufferPtr xmlBufferCreateSize(size_t size))
]

{ #category : 'public' }
LibXml >> xmlBufferCreateStaticMem: mem size: size [

	self ffiCall: #(xmlBufferPtr xmlBufferCreateStatic(void* mem, size_t size))
]

{ #category : 'public' }
LibXml >> xmlBufferDetach: buf [

	self ffiCall: #(xmlChar* xmlBufferDetach(xmlBufferPtr buf))
]

{ #category : 'public' }
LibXml >> xmlBufferDumpFile: file buf: buf [

	self ffiCall: #(int xmlBufferDump(FILE* file, xmlBufferPtr buf))
]

{ #category : 'public' }
LibXml >> xmlBufferEmpty: buf [

	self ffiCall: #(void xmlBufferEmpty(xmlBufferPtr buf))
]

{ #category : 'public' }
LibXml >> xmlBufferFree: buf [

	self ffiCall: #(void xmlBufferFree(xmlBufferPtr buf))
]

{ #category : 'public' }
LibXml >> xmlBufferGrowBuf: buf len: len [

	self ffiCall: #(int xmlBufferGrow(xmlBufferPtr buf, uint len))
]

{ #category : 'public' }
LibXml >> xmlBufferLength: buf [

	self ffiCall: #(int xmlBufferLength(const xmlBuffer* buf))
]

{ #category : 'public' }
LibXml >> xmlBufferResizeBuf: buf size: size [

	self ffiCall: #(int xmlBufferResize(xmlBufferPtr buf, uint size))
]

{ #category : 'public' }
LibXml >> xmlBufferSetAllocationSchemeBuf: buf scheme: scheme [

	self ffiCall: #(void xmlBufferSetAllocationScheme(xmlBufferPtr buf, xmlBufferAllocationScheme scheme))
]

{ #category : 'public' }
LibXml >> xmlBufferShrinkBuf: buf len: len [

	self ffiCall: #(int xmlBufferShrink(xmlBufferPtr buf, uint len))
]

{ #category : 'public' }
LibXml >> xmlBufferWriteCHARBuf: buf string: string [

	self ffiCall: #(void xmlBufferWriteCHAR(xmlBufferPtr buf, const xmlChar* string))
]

{ #category : 'public' }
LibXml >> xmlBufferWriteCharBuf: buf string: string [

	self ffiCall: #(void xmlBufferWriteChar(xmlBufferPtr buf, const char* string))
]

{ #category : 'public' }
LibXml >> xmlBufferWriteQuotedStringBuf: buf string: string [

	self ffiCall: #(void xmlBufferWriteQuotedString(xmlBufferPtr buf, const xmlChar* string))
]

{ #category : 'public' }
LibXml >> xmlBuildQNameNcname: ncname prefix: prefix memory: memory len: len [

	self ffiCall: #(xmlChar* xmlBuildQName(const xmlChar* ncname, const xmlChar* prefix, xmlChar* memory, int len))
]

{ #category : 'public' }
LibXml >> xmlByteConsumed: ctxt [

	self ffiCall: #(long xmlByteConsumed(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlCharEncCloseFunc: handler [

	self ffiCall: #(int xmlCharEncCloseFunc(xmlCharEncodingHandler* handler))
]

{ #category : 'public' }
LibXml >> xmlCharEncFirstLineHandler: handler out: out in: in [

	self ffiCall: #(int xmlCharEncFirstLine(xmlCharEncodingHandler* handler, _xmlBuffer* out, _xmlBuffer* in))
]

{ #category : 'public' }
LibXml >> xmlCharEncInFuncHandler: handler out: out in: in [

	self ffiCall: #(int xmlCharEncInFunc(xmlCharEncodingHandler* handler, _xmlBuffer* out, _xmlBuffer* in))
]

{ #category : 'public' }
LibXml >> xmlCharEncOutFuncHandler: handler out: out in: in [
	"/** DOC_ENABLE */"

	self ffiCall: #(int xmlCharEncOutFunc(xmlCharEncodingHandler* handler, _xmlBuffer* out, _xmlBuffer* in))
]

{ #category : 'public' }
LibXml >> xmlCharStrdup: cur [

	self ffiCall: #(xmlChar* xmlCharStrdup(const char* cur))
]

{ #category : 'public' }
LibXml >> xmlCharStrndupCur: cur len: len [

	self ffiCall: #(xmlChar* xmlCharStrndup(const char* cur, int len))
]

{ #category : 'public' }
LibXml >> xmlCheckFilename: path [

	self ffiCall: #(int xmlCheckFilename(const char* path))
]

{ #category : 'public' }
LibXml >> xmlCheckHTTPInputCtxt: ctxt ret: ret [

	self ffiCall: #(xmlParserInputPtr xmlCheckHTTPInput(xmlParserCtxtPtr ctxt, xmlParserInputPtr ret))
]

{ #category : 'public' }
LibXml >> xmlCheckThreadLocalStorage [

	self ffiCall: #(int xmlCheckThreadLocalStorage())
]

{ #category : 'public' }
LibXml >> xmlCheckUTF8: utf [

	self ffiCall: #(int xmlCheckUTF8(const uchar* utf))
]

{ #category : 'public' }
LibXml >> xmlCheckVersion: version [

	self ffiCall: #(void xmlCheckVersion(int version))
]

{ #category : 'public' }
LibXml >> xmlChildElementCount: parent [

	self ffiCall: #(ulong xmlChildElementCount(xmlNodePtr parent))
]

{ #category : 'public' }
LibXml >> xmlCleanupCharEncodingHandlers [

	self ffiCall: #(void xmlCleanupCharEncodingHandlers())
]

{ #category : 'public' }
LibXml >> xmlCleanupEncodingAliases [

	self ffiCall: #(void xmlCleanupEncodingAliases())
]

{ #category : 'public' }
LibXml >> xmlCleanupGlobals [

	self ffiCall: #(void xmlCleanupGlobals())
]

{ #category : 'public' }
LibXml >> xmlCleanupInputCallbacks [
	"/** DOC_ENABLE */"

	self ffiCall: #(void xmlCleanupInputCallbacks())
]

{ #category : 'public' }
LibXml >> xmlCleanupMemory [

	self ffiCall: #(void xmlCleanupMemory())
]

{ #category : 'public' }
LibXml >> xmlCleanupOutputCallbacks [

	self ffiCall: #(void xmlCleanupOutputCallbacks())
]

{ #category : 'public' }
LibXml >> xmlCleanupParser [

	self ffiCall: #(void xmlCleanupParser())
]

{ #category : 'public' }
LibXml >> xmlCleanupPredefinedEntities [

	self ffiCall: #(void xmlCleanupPredefinedEntities())
]

{ #category : 'public' }
LibXml >> xmlCleanupThreads [

	self ffiCall: #(void xmlCleanupThreads())
]

{ #category : 'public' }
LibXml >> xmlClearNodeInfoSeq: seq [

	self ffiCall: #(void xmlClearNodeInfoSeq(xmlParserNodeInfoSeqPtr seq))
]

{ #category : 'public' }
LibXml >> xmlClearParserCtxt: ctxt [

	self ffiCall: #(void xmlClearParserCtxt(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlCopyAttributeTable: table [

	self ffiCall: #(xmlAttributeTablePtr xmlCopyAttributeTable(xmlAttributeTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlCopyDoc: doc recursive: recursive [

	self ffiCall: #(xmlDocPtr xmlCopyDoc(xmlDocPtr doc, int recursive))
]

{ #category : 'public' }
LibXml >> xmlCopyDocElementContentDoc: doc content: content [

	self ffiCall: #(xmlElementContentPtr xmlCopyDocElementContent(xmlDocPtr doc, xmlElementContentPtr content))
]

{ #category : 'public' }
LibXml >> xmlCopyDtd: dtd [

	self ffiCall: #(xmlDtdPtr xmlCopyDtd(xmlDtdPtr dtd))
]

{ #category : 'public' }
LibXml >> xmlCopyElementContent: content [

	self ffiCall: #(xmlElementContentPtr xmlCopyElementContent(xmlElementContentPtr content))
]

{ #category : 'public' }
LibXml >> xmlCopyElementTable: table [

	self ffiCall: #(xmlElementTablePtr xmlCopyElementTable(xmlElementTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlCopyEntitiesTable: table [

	self ffiCall: #(xmlEntitiesTablePtr xmlCopyEntitiesTable(xmlEntitiesTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlCopyEnumeration: cur [

	self ffiCall: #(xmlEnumerationPtr xmlCopyEnumeration(xmlEnumerationPtr cur))
]

{ #category : 'public' }
LibXml >> xmlCopyErrorFrom: from to: to [

	self ffiCall: #(int xmlCopyError(const xmlError* from, xmlErrorPtr to))
]

{ #category : 'public' }
LibXml >> xmlCopyNamespace: cur [

	self ffiCall: #(xmlNsPtr xmlCopyNamespace(xmlNsPtr cur))
]

{ #category : 'public' }
LibXml >> xmlCopyNamespaceList: cur [

	self ffiCall: #(xmlNsPtr xmlCopyNamespaceList(xmlNsPtr cur))
]

{ #category : 'public' }
LibXml >> xmlCopyNode: node recursive: recursive [

	self ffiCall: #(xmlNodePtr xmlCopyNode(xmlNodePtr node, int recursive))
]

{ #category : 'public' }
LibXml >> xmlCopyNodeList: node [

	self ffiCall: #(xmlNodePtr xmlCopyNodeList(xmlNodePtr node))
]

{ #category : 'public' }
LibXml >> xmlCopyNotationTable: table [

	self ffiCall: #(xmlNotationTablePtr xmlCopyNotationTable(xmlNotationTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlCopyPropListTarget: target cur: cur [

	self ffiCall: #(xmlAttrPtr xmlCopyPropList(xmlNodePtr target, xmlAttrPtr cur))
]

{ #category : 'public' }
LibXml >> xmlCopyPropTarget: target cur: cur [

	self ffiCall: #(xmlAttrPtr xmlCopyProp(xmlNodePtr target, xmlAttrPtr cur))
]

{ #category : 'public' }
LibXml >> xmlCreateDocParserCtxt: cur [

	self ffiCall: #(xmlParserCtxtPtr xmlCreateDocParserCtxt(const xmlChar* cur))
]

{ #category : 'public' }
LibXml >> xmlCreateEntitiesTable [

	self ffiCall: #(xmlEntitiesTablePtr xmlCreateEntitiesTable())
]

{ #category : 'public' }
LibXml >> xmlCreateEnumeration: name [

	self ffiCall: #(xmlEnumerationPtr xmlCreateEnumeration(const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlCreateIOParserCtxtSax: sax user_data: user_data ioread: ioread ioclose: ioclose ioctx: ioctx enc: enc [

	self ffiCall: #(xmlParserCtxtPtr xmlCreateIOParserCtxt(xmlSAXHandlerPtr sax, void* user_data, xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void* ioctx, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlCreateIntSubsetDoc: doc name: name ExternalID: ExternalID SystemID: SystemID [

	self ffiCall: #(xmlDtdPtr xmlCreateIntSubset(xmlDocPtr doc, const xmlChar* name, const xmlChar* ExternalID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlCreatePushParserCtxtSax: sax user_data: user_data chunk: chunk size: size filename: filename [

	self ffiCall: #(xmlParserCtxtPtr xmlCreatePushParserCtxt(xmlSAXHandlerPtr sax, void* user_data, const char* chunk, int size, const char* filename))
]

{ #category : 'public' }
LibXml >> xmlCtxtGetLastError: ctx [

	self ffiCall: #(const xmlError* xmlCtxtGetLastError(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlCtxtParseDocumentCtxt: ctxt input: input [

	self ffiCall: #(xmlDocPtr xmlCtxtParseDocument(xmlParserCtxtPtr ctxt, xmlParserInputPtr input))
]

{ #category : 'public' }
LibXml >> xmlCtxtReadDocCtxt: ctxt cur: cur URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlCtxtReadDoc(xmlParserCtxtPtr ctxt, const xmlChar* cur, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlCtxtReadFdCtxt: ctxt fd: fd URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlCtxtReadFd(xmlParserCtxtPtr ctxt, int fd, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlCtxtReadFileCtxt: ctxt filename: filename encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlCtxtReadFile(xmlParserCtxtPtr ctxt, const char* filename, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlCtxtReadIOCtxt: ctxt ioread: ioread ioclose: ioclose ioctx: ioctx URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlCtxtReadIO(xmlParserCtxtPtr ctxt, xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void* ioctx, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlCtxtReadMemoryCtxt: ctxt buffer: buffer size: size URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlCtxtReadMemory(xmlParserCtxtPtr ctxt, const char* buffer, int size, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlCtxtReset: ctxt [

	self ffiCall: #(void xmlCtxtReset(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlCtxtResetLastError: ctx [

	self ffiCall: #(void xmlCtxtResetLastError(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlCtxtResetPushCtxt: ctxt chunk: chunk size: size filename: filename encoding: encoding [

	self ffiCall: #(int xmlCtxtResetPush(xmlParserCtxtPtr ctxt, const char* chunk, int size, const char* filename, const char* encoding))
]

{ #category : 'public' }
LibXml >> xmlCtxtSetErrorHandlerCtxt: ctxt handler: handler data: data [

	self ffiCall: #(void xmlCtxtSetErrorHandler(xmlParserCtxtPtr ctxt, xmlStructuredErrorFunc handler, void* data))
]

{ #category : 'public' }
LibXml >> xmlCtxtSetMaxAmplificationCtxt: ctxt maxAmpl: maxAmpl [

	self ffiCall: #(void xmlCtxtSetMaxAmplification(xmlParserCtxtPtr ctxt, uint maxAmpl))
]

{ #category : 'public' }
LibXml >> xmlCtxtSetOptionsCtxt: ctxt options: options [

	self ffiCall: #(int xmlCtxtSetOptions(xmlParserCtxtPtr ctxt, int options))
]

{ #category : 'public' }
LibXml >> xmlCtxtUseOptionsCtxt: ctxt options: options [

	self ffiCall: #(int xmlCtxtUseOptions(xmlParserCtxtPtr ctxt, int options))
]

{ #category : 'public' }
LibXml >> xmlDOMWrapAdoptNodeCtxt: ctxt sourceDoc: sourceDoc node: node destDoc: destDoc destParent: destParent options: options [

	self ffiCall: #(int xmlDOMWrapAdoptNode(xmlDOMWrapCtxtPtr ctxt, xmlDocPtr sourceDoc, xmlNodePtr node, xmlDocPtr destDoc, xmlNodePtr destParent, int options))
]

{ #category : 'public' }
LibXml >> xmlDOMWrapCloneNodeCtxt: ctxt sourceDoc: sourceDoc node: node clonedNode: clonedNode destDoc: destDoc destParent: destParent deep: deep options: options [

	self ffiCall: #(int xmlDOMWrapCloneNode(xmlDOMWrapCtxtPtr ctxt, xmlDocPtr sourceDoc, xmlNodePtr node, xmlNodePtr* clonedNode, xmlDocPtr destDoc, xmlNodePtr destParent, int deep, int options))
]

{ #category : 'public' }
LibXml >> xmlDOMWrapFreeCtxt: ctxt [

	self ffiCall: #(void xmlDOMWrapFreeCtxt(xmlDOMWrapCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlDOMWrapNewCtxt [

	self ffiCall: #(xmlDOMWrapCtxtPtr xmlDOMWrapNewCtxt())
]

{ #category : 'public' }
LibXml >> xmlDOMWrapReconcileNamespacesCtxt: ctxt elem: elem options: options [

	self ffiCall: #(int xmlDOMWrapReconcileNamespaces(xmlDOMWrapCtxtPtr ctxt, xmlNodePtr elem, int options))
]

{ #category : 'public' }
LibXml >> xmlDOMWrapRemoveNodeCtxt: ctxt doc: doc node: node options: options [

	self ffiCall: #(int xmlDOMWrapRemoveNode(xmlDOMWrapCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr node, int options))
]

{ #category : 'public' }
LibXml >> xmlDefaultSAXHandlerInit [

	self ffiCall: #(void xmlDefaultSAXHandlerInit())
]

{ #category : 'public' }
LibXml >> xmlDelEncodingAlias: alias [

	self ffiCall: #(int xmlDelEncodingAlias(const char* alias))
]

{ #category : 'public' }
LibXml >> xmlDeregisterNodeDefault: func [

	self ffiCall: #(xmlDeregisterNodeFunc xmlDeregisterNodeDefault(xmlDeregisterNodeFunc func))
]

{ #category : 'public' }
LibXml >> xmlDetectCharEncodingIn: in len: len [

	self ffiCall: #(xmlCharEncoding xmlDetectCharEncoding(const uchar* in, int len))
]

{ #category : 'public' }
LibXml >> xmlDictCleanup [

	self ffiCall: #(void xmlDictCleanup())
]

{ #category : 'public' }
LibXml >> xmlDictCreate [

	self ffiCall: #(xmlDictPtr xmlDictCreate())
]

{ #category : 'public' }
LibXml >> xmlDictCreateSub: sub [

	self ffiCall: #(xmlDictPtr xmlDictCreateSub(xmlDictPtr sub))
]

{ #category : 'public' }
LibXml >> xmlDictExistsDict: dict name: name len: len [

	self ffiCall: #(const xmlChar* xmlDictExists(xmlDictPtr dict, const xmlChar* name, int len))
]

{ #category : 'public' }
LibXml >> xmlDictFree: dict [

	self ffiCall: #(void xmlDictFree(xmlDictPtr dict))
]

{ #category : 'public' }
LibXml >> xmlDictGetUsage: dict [

	self ffiCall: #(size_t xmlDictGetUsage(xmlDictPtr dict))
]

{ #category : 'public' }
LibXml >> xmlDictLookupDict: dict name: name len: len [

	self ffiCall: #(const xmlChar* xmlDictLookup(xmlDictPtr dict, const xmlChar* name, int len))
]

{ #category : 'public' }
LibXml >> xmlDictOwnsDict: dict str: str [

	self ffiCall: #(int xmlDictOwns(xmlDictPtr dict, const xmlChar* str))
]

{ #category : 'public' }
LibXml >> xmlDictQLookupDict: dict prefix: prefix name: name [

	self ffiCall: #(const xmlChar* xmlDictQLookup(xmlDictPtr dict, const xmlChar* prefix, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlDictReference: dict [

	self ffiCall: #(int xmlDictReference(xmlDictPtr dict))
]

{ #category : 'public' }
LibXml >> xmlDictSetLimitDict: dict limit: limit [

	self ffiCall: #(size_t xmlDictSetLimit(xmlDictPtr dict, size_t limit))
]

{ #category : 'public' }
LibXml >> xmlDictSize: dict [

	self ffiCall: #(int xmlDictSize(xmlDictPtr dict))
]

{ #category : 'public' }
LibXml >> xmlDocCopyNode: node doc: doc recursive: recursive [

	self ffiCall: #(xmlNodePtr xmlDocCopyNode(xmlNodePtr node, xmlDocPtr doc, int recursive))
]

{ #category : 'public' }
LibXml >> xmlDocCopyNodeListDoc: doc node: node [

	self ffiCall: #(xmlNodePtr xmlDocCopyNodeList(xmlDocPtr doc, xmlNodePtr node))
]

{ #category : 'public' }
LibXml >> xmlDocDumpF: f cur: cur [

	self ffiCall: #(int xmlDocDump(FILE* f, xmlDocPtr cur))
]

{ #category : 'public' }
LibXml >> xmlDocDumpFormatMemoryCur: cur mem: mem size: size format: format [

	self ffiCall: #(void xmlDocDumpFormatMemory(xmlDocPtr cur, xmlChar** mem, int* size, int format))
]

{ #category : 'public' }
LibXml >> xmlDocDumpFormatMemoryEncOut_doc: out_doc doc_txt_ptr: doc_txt_ptr doc_txt_len: doc_txt_len txt_encoding: txt_encoding format: format [

	self ffiCall: #(void xmlDocDumpFormatMemoryEnc(xmlDocPtr out_doc, xmlChar** doc_txt_ptr, int* doc_txt_len, const char* txt_encoding, int format))
]

{ #category : 'public' }
LibXml >> xmlDocDumpMemoryCur: cur mem: mem size: size [

	self ffiCall: #(void xmlDocDumpMemory(xmlDocPtr cur, xmlChar** mem, int* size))
]

{ #category : 'public' }
LibXml >> xmlDocDumpMemoryEncOut_doc: out_doc doc_txt_ptr: doc_txt_ptr doc_txt_len: doc_txt_len txt_encoding: txt_encoding [

	self ffiCall: #(void xmlDocDumpMemoryEnc(xmlDocPtr out_doc, xmlChar** doc_txt_ptr, int* doc_txt_len, const char* txt_encoding))
]

{ #category : 'public' }
LibXml >> xmlDocFormatDumpF: f cur: cur format: format [

	self ffiCall: #(int xmlDocFormatDump(FILE* f, xmlDocPtr cur, int format))
]

{ #category : 'public' }
LibXml >> xmlDocGetRootElement: doc [

	self ffiCall: #(xmlNodePtr xmlDocGetRootElement(const xmlDoc* doc))
]

{ #category : 'public' }
LibXml >> xmlDocSetRootElementDoc: doc root: root [

	self ffiCall: #(xmlNodePtr xmlDocSetRootElement(xmlDocPtr doc, xmlNodePtr root))
]

{ #category : 'public' }
LibXml >> xmlDumpAttributeDeclBuf: buf attr: attr [

	self ffiCall: #(void xmlDumpAttributeDecl(xmlBufferPtr buf, xmlAttributePtr attr))
]

{ #category : 'public' }
LibXml >> xmlDumpAttributeTableBuf: buf table: table [

	self ffiCall: #(void xmlDumpAttributeTable(xmlBufferPtr buf, xmlAttributeTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlDumpElementDeclBuf: buf elem: elem [

	self ffiCall: #(void xmlDumpElementDecl(xmlBufferPtr buf, xmlElementPtr elem))
]

{ #category : 'public' }
LibXml >> xmlDumpElementTableBuf: buf table: table [

	self ffiCall: #(void xmlDumpElementTable(xmlBufferPtr buf, xmlElementTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlDumpEntitiesTableBuf: buf table: table [

	self ffiCall: #(void xmlDumpEntitiesTable(xmlBufferPtr buf, xmlEntitiesTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlDumpEntityDeclBuf: buf ent: ent [

	self ffiCall: #(void xmlDumpEntityDecl(xmlBufferPtr buf, xmlEntityPtr ent))
]

{ #category : 'public' }
LibXml >> xmlDumpNotationDeclBuf: buf nota: nota [

	self ffiCall: #(void xmlDumpNotationDecl(xmlBufferPtr buf, xmlNotationPtr nota))
]

{ #category : 'public' }
LibXml >> xmlDumpNotationTableBuf: buf table: table [

	self ffiCall: #(void xmlDumpNotationTable(xmlBufferPtr buf, xmlNotationTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlElemDumpF: f doc: doc cur: cur [

	self ffiCall: #(void xmlElemDump(FILE* f, xmlDocPtr doc, xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlEncodeEntitiesDoc: doc input: input [

	self ffiCall: #(const xmlChar* xmlEncodeEntities(xmlDocPtr doc, const xmlChar* input))
]

{ #category : 'public' }
LibXml >> xmlEncodeEntitiesReentrantDoc: doc input: input [

	self ffiCall: #(xmlChar* xmlEncodeEntitiesReentrant(xmlDocPtr doc, const xmlChar* input))
]

{ #category : 'public' }
LibXml >> xmlEncodeSpecialCharsDoc: doc input: input [

	self ffiCall: #(xmlChar* xmlEncodeSpecialChars(const xmlDoc* doc, const xmlChar* input))
]

{ #category : 'public' }
LibXml >> xmlFileClose: context [

	self ffiCall: #(int xmlFileClose(void* context))
]

{ #category : 'public' }
LibXml >> xmlFileMatch: filename [
	"/**
	 * Default 'file://' protocol callbacks
	 */"

	self ffiCall: #(int xmlFileMatch(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlFileOpen: filename [

	self ffiCall: #(void* xmlFileOpen(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlFileReadContext: context buffer: buffer len: len [

	self ffiCall: #(int xmlFileRead(void* context, char* buffer, int len))
]

{ #category : 'public' }
LibXml >> xmlFindCharEncodingHandler: name [

	self ffiCall: #(xmlCharEncodingHandlerPtr xmlFindCharEncodingHandler(const char* name))
]

{ #category : 'public' }
LibXml >> xmlFirstElementChild: parent [

	self ffiCall: #(xmlNodePtr xmlFirstElementChild(xmlNodePtr parent))
]

{ #category : 'public' }
LibXml >> xmlFormatErrorErr: err channel: channel data: data [

	self ffiCall: #(void xmlFormatError(const xmlError* err, xmlGenericErrorFunc channel, void* data))
]

{ #category : 'public' }
LibXml >> xmlFreeAttributeTable: table [

	self ffiCall: #(void xmlFreeAttributeTable(xmlAttributeTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlFreeAutomata: am [

	self ffiCall: #(void xmlFreeAutomata(xmlAutomataPtr am))
]

{ #category : 'public' }
LibXml >> xmlFreeDoc: cur [

	self ffiCall: #(void xmlFreeDoc(xmlDocPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeDocElementContentDoc: doc cur: cur [

	self ffiCall: #(void xmlFreeDocElementContent(xmlDocPtr doc, xmlElementContentPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeDtd: cur [

	self ffiCall: #(void xmlFreeDtd(xmlDtdPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeElementContent: cur [

	self ffiCall: #(void xmlFreeElementContent(xmlElementContentPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeElementTable: table [

	self ffiCall: #(void xmlFreeElementTable(xmlElementTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlFreeEntitiesTable: table [

	self ffiCall: #(void xmlFreeEntitiesTable(xmlEntitiesTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlFreeEntity: entity [

	self ffiCall: #(void xmlFreeEntity(xmlEntityPtr entity))
]

{ #category : 'public' }
LibXml >> xmlFreeEnumeration: cur [

	self ffiCall: #(void xmlFreeEnumeration(xmlEnumerationPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeIDTable: table [

	self ffiCall: #(void xmlFreeIDTable(xmlIDTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlFreeMutex: tok [

	self ffiCall: #(void xmlFreeMutex(xmlMutexPtr tok))
]

{ #category : 'public' }
LibXml >> xmlFreeNode: cur [

	self ffiCall: #(void xmlFreeNode(xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeNodeList: cur [

	self ffiCall: #(void xmlFreeNodeList(xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeNotationTable: table [

	self ffiCall: #(void xmlFreeNotationTable(xmlNotationTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlFreeNs: cur [

	self ffiCall: #(void xmlFreeNs(xmlNsPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeNsList: cur [

	self ffiCall: #(void xmlFreeNsList(xmlNsPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeParserCtxt: ctxt [

	self ffiCall: #(void xmlFreeParserCtxt(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlFreeParserInputBuffer: in [

	self ffiCall: #(void xmlFreeParserInputBuffer(xmlParserInputBufferPtr in))
]

{ #category : 'public' }
LibXml >> xmlFreeProp: cur [

	self ffiCall: #(void xmlFreeProp(xmlAttrPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreePropList: cur [

	self ffiCall: #(void xmlFreePropList(xmlAttrPtr cur))
]

{ #category : 'public' }
LibXml >> xmlFreeRMutex: tok [

	self ffiCall: #(void xmlFreeRMutex(xmlRMutexPtr tok))
]

{ #category : 'public' }
LibXml >> xmlFreeRefTable: table [

	self ffiCall: #(void xmlFreeRefTable(xmlRefTablePtr table))
]

{ #category : 'public' }
LibXml >> xmlFreeTextReader: reader [

	self ffiCall: #(void xmlFreeTextReader(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlFreeTextWriter: writer [

	self ffiCall: #(void xmlFreeTextWriter(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlFreeValidCtxt: arg1 [

	self ffiCall: #(void xmlFreeValidCtxt(xmlValidCtxtPtr arg1))
]

{ #category : 'public' }
LibXml >> xmlGcMemGetFreeFunc: freeFunc mallocFunc: mallocFunc mallocAtomicFunc: mallocAtomicFunc reallocFunc: reallocFunc strdupFunc: strdupFunc [

	self ffiCall: #(int xmlGcMemGet(xmlFreeFunc* freeFunc, xmlMallocFunc* mallocFunc, xmlMallocFunc* mallocAtomicFunc, xmlReallocFunc* reallocFunc, xmlStrdupFunc* strdupFunc))
]

{ #category : 'public' }
LibXml >> xmlGcMemSetupFreeFunc: freeFunc mallocFunc: mallocFunc mallocAtomicFunc: mallocAtomicFunc reallocFunc: reallocFunc strdupFunc: strdupFunc [

	self ffiCall: #(int xmlGcMemSetup(xmlFreeFunc freeFunc, xmlMallocFunc mallocFunc, xmlMallocFunc mallocAtomicFunc, xmlReallocFunc reallocFunc, xmlStrdupFunc strdupFunc))
]

{ #category : 'public' }
LibXml >> xmlGetBufferAllocationScheme [

	self ffiCall: #(xmlBufferAllocationScheme xmlGetBufferAllocationScheme())
]

{ #category : 'public' }
LibXml >> xmlGetCharEncodingHandler: enc [

	self ffiCall: #(xmlCharEncodingHandlerPtr xmlGetCharEncodingHandler(xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlGetCharEncodingName: enc [

	self ffiCall: #(const char* xmlGetCharEncodingName(xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlGetCompressMode [

	self ffiCall: #(int xmlGetCompressMode())
]

{ #category : 'public' }
LibXml >> xmlGetDocCompressMode: doc [

	self ffiCall: #(int xmlGetDocCompressMode(const xmlDoc* doc))
]

{ #category : 'public' }
LibXml >> xmlGetDocEntityDoc: doc name: name [

	self ffiCall: #(xmlEntityPtr xmlGetDocEntity(const xmlDoc* doc, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetDtdAttrDescDtd: dtd elem: elem name: name [

	self ffiCall: #(xmlAttributePtr xmlGetDtdAttrDesc(xmlDtdPtr dtd, const xmlChar* elem, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetDtdElementDescDtd: dtd name: name [

	self ffiCall: #(xmlElementPtr xmlGetDtdElementDesc(xmlDtdPtr dtd, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetDtdEntityDoc: doc name: name [

	self ffiCall: #(xmlEntityPtr xmlGetDtdEntity(xmlDocPtr doc, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetDtdNotationDescDtd: dtd name: name [

	self ffiCall: #(xmlNotationPtr xmlGetDtdNotationDesc(xmlDtdPtr dtd, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetDtdQAttrDescDtd: dtd elem: elem name: name prefix: prefix [

	self ffiCall: #(xmlAttributePtr xmlGetDtdQAttrDesc(xmlDtdPtr dtd, const xmlChar* elem, const xmlChar* name, const xmlChar* prefix))
]

{ #category : 'public' }
LibXml >> xmlGetDtdQElementDescDtd: dtd name: name prefix: prefix [

	self ffiCall: #(xmlElementPtr xmlGetDtdQElementDesc(xmlDtdPtr dtd, const xmlChar* name, const xmlChar* prefix))
]

{ #category : 'public' }
LibXml >> xmlGetEncodingAlias: alias [

	self ffiCall: #(const char* xmlGetEncodingAlias(const char* alias))
]

{ #category : 'public' }
LibXml >> xmlGetExternalEntityLoader [

	self ffiCall: #(xmlExternalEntityLoader xmlGetExternalEntityLoader())
]

{ #category : 'public' }
LibXml >> xmlGetFeatureCtxt: ctxt name: name result: result [

	self ffiCall: #(int xmlGetFeature(xmlParserCtxtPtr ctxt, const char* name, void* result))
]

{ #category : 'public' }
LibXml >> xmlGetFeaturesListLen: len result: result [

	self ffiCall: #(int xmlGetFeaturesList(int* len, const char** result))
]

{ #category : 'public' }
LibXml >> xmlGetIDDoc: doc ID: ID [

	self ffiCall: #(xmlAttrPtr xmlGetID(xmlDocPtr doc, const xmlChar* ID))
]

{ #category : 'public' }
LibXml >> xmlGetIntSubset: doc [

	self ffiCall: #(xmlDtdPtr xmlGetIntSubset(const xmlDoc* doc))
]

{ #category : 'public' }
LibXml >> xmlGetLastChild: parent [

	self ffiCall: #(xmlNodePtr xmlGetLastChild(const xmlNode* parent))
]

{ #category : 'public' }
LibXml >> xmlGetLastError [

	self ffiCall: #(const xmlError* xmlGetLastError())
]

{ #category : 'public' }
LibXml >> xmlGetLineNo: node [

	self ffiCall: #(long xmlGetLineNo(const xmlNode* node))
]

{ #category : 'public' }
LibXml >> xmlGetNoNsPropNode: node name: name [

	self ffiCall: #(xmlChar* xmlGetNoNsProp(const xmlNode* node, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetNodePath: node [

	self ffiCall: #(xmlChar* xmlGetNodePath(const xmlNode* node))
]

{ #category : 'public' }
LibXml >> xmlGetNsListDoc: doc node: node [

	self ffiCall: #(xmlNsPtr* xmlGetNsList(const xmlDoc* doc, const xmlNode* node))
]

{ #category : 'public' }
LibXml >> xmlGetNsListSafeDoc: doc node: node out: out [

	self ffiCall: #(int xmlGetNsListSafe(const xmlDoc* doc, const xmlNode* node, xmlNsPtr** out))
]

{ #category : 'public' }
LibXml >> xmlGetNsPropNode: node name: name nameSpace: nameSpace [

	self ffiCall: #(xmlChar* xmlGetNsProp(const xmlNode* node, const xmlChar* name, const xmlChar* nameSpace))
]

{ #category : 'public' }
LibXml >> xmlGetParameterEntityDoc: doc name: name [

	self ffiCall: #(xmlEntityPtr xmlGetParameterEntity(xmlDocPtr doc, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetPredefinedEntity: name [

	self ffiCall: #(xmlEntityPtr xmlGetPredefinedEntity(const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetPropNode: node name: name [

	self ffiCall: #(xmlChar* xmlGetProp(const xmlNode* node, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlGetRefsDoc: doc ID: ID [

	self ffiCall: #(xmlListPtr xmlGetRefs(xmlDocPtr doc, const xmlChar* ID))
]

{ #category : 'public' }
LibXml >> xmlGetThreadId [

	self ffiCall: #(int xmlGetThreadId())
]

{ #category : 'public' }
LibXml >> xmlGetUTF8CharUtf: utf len: len [

	self ffiCall: #(int xmlGetUTF8Char(const uchar* utf, int* len))
]

{ #category : 'public' }
LibXml >> xmlHasFeature: feature [

	self ffiCall: #(int xmlHasFeature(xmlFeature feature))
]

{ #category : 'public' }
LibXml >> xmlHasNsPropNode: node name: name nameSpace: nameSpace [

	self ffiCall: #(xmlAttrPtr xmlHasNsProp(const xmlNode* node, const xmlChar* name, const xmlChar* nameSpace))
]

{ #category : 'public' }
LibXml >> xmlHasPropNode: node name: name [

	self ffiCall: #(xmlAttrPtr xmlHasProp(const xmlNode* node, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlHashAdd2Hash: hash name: name name2: name2 userdata: userdata [

	self ffiCall: #(int xmlHashAdd2(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, void* userdata))
]

{ #category : 'public' }
LibXml >> xmlHashAdd3Hash: hash name: name name2: name2 name3: name3 userdata: userdata [

	self ffiCall: #(int xmlHashAdd3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3, void* userdata))
]

{ #category : 'public' }
LibXml >> xmlHashAddEntry2Hash: hash name: name name2: name2 userdata: userdata [

	self ffiCall: #(int xmlHashAddEntry2(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, void* userdata))
]

{ #category : 'public' }
LibXml >> xmlHashAddEntry3Hash: hash name: name name2: name2 name3: name3 userdata: userdata [

	self ffiCall: #(int xmlHashAddEntry3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3, void* userdata))
]

{ #category : 'public' }
LibXml >> xmlHashAddEntryHash: hash name: name userdata: userdata [

	self ffiCall: #(int xmlHashAddEntry(xmlHashTablePtr hash, const xmlChar* name, void* userdata))
]

{ #category : 'public' }
LibXml >> xmlHashAddHash: hash name: name userdata: userdata [

	self ffiCall: #(int xmlHashAdd(xmlHashTablePtr hash, const xmlChar* name, void* userdata))
]

{ #category : 'public' }
LibXml >> xmlHashCopyHash: hash copy: copy [

	self ffiCall: #(xmlHashTablePtr xmlHashCopy(xmlHashTablePtr hash, xmlHashCopier copy))
]

{ #category : 'public' }
LibXml >> xmlHashCopySafeHash: hash copy: copy dealloc: dealloc [

	self ffiCall: #(xmlHashTablePtr xmlHashCopySafe(xmlHashTablePtr hash, xmlHashCopier copy, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashCreate: size [

	self ffiCall: #(xmlHashTablePtr xmlHashCreate(int size))
]

{ #category : 'public' }
LibXml >> xmlHashCreateDictSize: size dict: dict [

	self ffiCall: #(xmlHashTablePtr xmlHashCreateDict(int size, xmlDictPtr dict))
]

{ #category : 'public' }
LibXml >> xmlHashDefaultDeallocatorEntry: entry name: name [

	self ffiCall: #(void xmlHashDefaultDeallocator(void* entry, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlHashFreeHash: hash dealloc: dealloc [

	self ffiCall: #(void xmlHashFree(xmlHashTablePtr hash, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashLookup2Hash: hash name: name name2: name2 [

	self ffiCall: #(void* xmlHashLookup2(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2))
]

{ #category : 'public' }
LibXml >> xmlHashLookup3Hash: hash name: name name2: name2 name3: name3 [

	self ffiCall: #(void* xmlHashLookup3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3))
]

{ #category : 'public' }
LibXml >> xmlHashLookupHash: hash name: name [

	self ffiCall: #(void* xmlHashLookup(xmlHashTablePtr hash, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlHashQLookup2Hash: hash prefix: prefix name: name prefix2: prefix2 name2: name2 [

	self ffiCall: #(void* xmlHashQLookup2(xmlHashTablePtr hash, const xmlChar* prefix, const xmlChar* name, const xmlChar* prefix2, const xmlChar* name2))
]

{ #category : 'public' }
LibXml >> xmlHashQLookup3Hash: hash prefix: prefix name: name prefix2: prefix2 name2: name2 prefix3: prefix3 name3: name3 [

	self ffiCall: #(void* xmlHashQLookup3(xmlHashTablePtr hash, const xmlChar* prefix, const xmlChar* name, const xmlChar* prefix2, const xmlChar* name2, const xmlChar* prefix3, const xmlChar* name3))
]

{ #category : 'public' }
LibXml >> xmlHashQLookupHash: hash prefix: prefix name: name [

	self ffiCall: #(void* xmlHashQLookup(xmlHashTablePtr hash, const xmlChar* prefix, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlHashRemoveEntry2Hash: hash name: name name2: name2 dealloc: dealloc [

	self ffiCall: #(int xmlHashRemoveEntry2(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashRemoveEntry3Hash: hash name: name name2: name2 name3: name3 dealloc: dealloc [

	self ffiCall: #(int xmlHashRemoveEntry3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashRemoveEntryHash: hash name: name dealloc: dealloc [

	self ffiCall: #(int xmlHashRemoveEntry(xmlHashTablePtr hash, const xmlChar* name, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashScan3Hash: hash name: name name2: name2 name3: name3 scan: scan data: data [

	self ffiCall: #(void xmlHashScan3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3, xmlHashScanner scan, void* data))
]

{ #category : 'public' }
LibXml >> xmlHashScanFull3Hash: hash name: name name2: name2 name3: name3 scan: scan data: data [

	self ffiCall: #(void xmlHashScanFull3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3, xmlHashScannerFull scan, void* data))
]

{ #category : 'public' }
LibXml >> xmlHashScanFullHash: hash scan: scan data: data [

	self ffiCall: #(void xmlHashScanFull(xmlHashTablePtr hash, xmlHashScannerFull scan, void* data))
]

{ #category : 'public' }
LibXml >> xmlHashScanHash: hash scan: scan data: data [

	self ffiCall: #(void xmlHashScan(xmlHashTablePtr hash, xmlHashScanner scan, void* data))
]

{ #category : 'public' }
LibXml >> xmlHashSize: hash [

	self ffiCall: #(int xmlHashSize(xmlHashTablePtr hash))
]

{ #category : 'public' }
LibXml >> xmlHashUpdateEntry2Hash: hash name: name name2: name2 userdata: userdata dealloc: dealloc [

	self ffiCall: #(int xmlHashUpdateEntry2(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, void* userdata, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashUpdateEntry3Hash: hash name: name name2: name2 name3: name3 userdata: userdata dealloc: dealloc [

	self ffiCall: #(int xmlHashUpdateEntry3(xmlHashTablePtr hash, const xmlChar* name, const xmlChar* name2, const xmlChar* name3, void* userdata, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlHashUpdateEntryHash: hash name: name userdata: userdata dealloc: dealloc [

	self ffiCall: #(int xmlHashUpdateEntry(xmlHashTablePtr hash, const xmlChar* name, void* userdata, xmlHashDeallocator dealloc))
]

{ #category : 'public' }
LibXml >> xmlIOHTTPClose: context [

	self ffiCall: #(int xmlIOHTTPClose(void* context))
]

{ #category : 'public' }
LibXml >> xmlIOHTTPMatch: filename [

	self ffiCall: #(int xmlIOHTTPMatch(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlIOHTTPOpen: filename [

	self ffiCall: #(void* xmlIOHTTPOpen(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlIOHTTPOpenWPost_uri: post_uri compression: compression [

	self ffiCall: #(void* xmlIOHTTPOpenW(const char* post_uri, int compression))
]

{ #category : 'public' }
LibXml >> xmlIOHTTPReadContext: context buffer: buffer len: len [

	self ffiCall: #(int xmlIOHTTPRead(void* context, char* buffer, int len))
]

{ #category : 'public' }
LibXml >> xmlIOParseDTDSax: sax input: input enc: enc [

	self ffiCall: #(xmlDtdPtr xmlIOParseDTD(xmlSAXHandlerPtr sax, xmlParserInputBufferPtr input, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlInitCharEncodingHandlers [

	self ffiCall: #(void xmlInitCharEncodingHandlers())
]

{ #category : 'public' }
LibXml >> xmlInitGlobals [

	self ffiCall: #(void xmlInitGlobals())
]

{ #category : 'public' }
LibXml >> xmlInitMemory [

	self ffiCall: #(int xmlInitMemory())
]

{ #category : 'public' }
LibXml >> xmlInitNodeInfoSeq: seq [

	self ffiCall: #(void xmlInitNodeInfoSeq(xmlParserNodeInfoSeqPtr seq))
]

{ #category : 'public' }
LibXml >> xmlInitParser [
	"/** DOC_ENABLE */"

	self ffiCall: #(void xmlInitParser())
]

{ #category : 'public' }
LibXml >> xmlInitParserCtxt: ctxt [

	self ffiCall: #(int xmlInitParserCtxt(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlInitThreads [

	self ffiCall: #(void xmlInitThreads())
]

{ #category : 'public' }
LibXml >> xmlInitializeDict [

	self ffiCall: #(int xmlInitializeDict())
]

{ #category : 'public' }
LibXml >> xmlInitializePredefinedEntities [

	self ffiCall: #(void xmlInitializePredefinedEntities())
]

{ #category : 'public' }
LibXml >> xmlIsBlankNode: node [

	self ffiCall: #(int xmlIsBlankNode(const xmlNode* node))
]

{ #category : 'public' }
LibXml >> xmlIsIDDoc: doc elem: elem attr: attr [

	self ffiCall: #(int xmlIsID(xmlDocPtr doc, xmlNodePtr elem, xmlAttrPtr attr))
]

{ #category : 'public' }
LibXml >> xmlIsMainThread [

	self ffiCall: #(int xmlIsMainThread())
]

{ #category : 'public' }
LibXml >> xmlIsMixedElementDoc: doc name: name [

	self ffiCall: #(int xmlIsMixedElement(xmlDocPtr doc, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlIsRefDoc: doc elem: elem attr: attr [

	self ffiCall: #(int xmlIsRef(xmlDocPtr doc, xmlNodePtr elem, xmlAttrPtr attr))
]

{ #category : 'public' }
LibXml >> xmlIsXHTMLSystemID: systemID publicID: publicID [

	self ffiCall: #(int xmlIsXHTML(const xmlChar* systemID, const xmlChar* publicID))
]

{ #category : 'public' }
LibXml >> xmlKeepBlanksDefault: val [

	self ffiCall: #(int xmlKeepBlanksDefault(int val))
]

{ #category : 'public' }
LibXml >> xmlLastElementChild: parent [

	self ffiCall: #(xmlNodePtr xmlLastElementChild(xmlNodePtr parent))
]

{ #category : 'public' }
LibXml >> xmlLineNumbersDefault: val [

	self ffiCall: #(int xmlLineNumbersDefault(int val))
]

{ #category : 'public' }
LibXml >> xmlLinkGetData: lk [

	self ffiCall: #(void* xmlLinkGetData(xmlLinkPtr lk))
]

{ #category : 'public' }
LibXml >> xmlListAppendL: l data: data [

	self ffiCall: #(int xmlListAppend(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListClear: l [

	self ffiCall: #(void xmlListClear(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListCopyCur: cur old: old [

	self ffiCall: #(int xmlListCopy(xmlListPtr cur, xmlListPtr old))
]

{ #category : 'public' }
LibXml >> xmlListCreateDeallocator: deallocator compare: compare [

	self ffiCall: #(xmlListPtr xmlListCreate(xmlListDeallocator deallocator, xmlListDataCompare compare))
]

{ #category : 'public' }
LibXml >> xmlListDelete: l [

	self ffiCall: #(void xmlListDelete(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListDup: old [

	self ffiCall: #(xmlListPtr xmlListDup(xmlListPtr old))
]

{ #category : 'public' }
LibXml >> xmlListEmpty: l [

	self ffiCall: #(int xmlListEmpty(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListEnd: l [

	self ffiCall: #(xmlLinkPtr xmlListEnd(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListFront: l [

	self ffiCall: #(xmlLinkPtr xmlListFront(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListInsertL: l data: data [

	self ffiCall: #(int xmlListInsert(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListMergeL1: l1 l2: l2 [

	self ffiCall: #(void xmlListMerge(xmlListPtr l1, xmlListPtr l2))
]

{ #category : 'public' }
LibXml >> xmlListPopBack: l [

	self ffiCall: #(void xmlListPopBack(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListPopFront: l [

	self ffiCall: #(void xmlListPopFront(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListPushBackL: l data: data [

	self ffiCall: #(int xmlListPushBack(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListPushFrontL: l data: data [

	self ffiCall: #(int xmlListPushFront(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListRemoveAll: l data: data [

	self ffiCall: #(int xmlListRemoveAll(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListRemoveFirstL: l data: data [

	self ffiCall: #(int xmlListRemoveFirst(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListRemoveLastL: l data: data [

	self ffiCall: #(int xmlListRemoveLast(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListReverse: l [

	self ffiCall: #(void xmlListReverse(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListReverseSearchL: l data: data [

	self ffiCall: #(void* xmlListReverseSearch(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListReverseWalkL: l walker: walker user: user [

	self ffiCall: #(void xmlListReverseWalk(xmlListPtr l, xmlListWalker walker, void* user))
]

{ #category : 'public' }
LibXml >> xmlListSearchL: l data: data [

	self ffiCall: #(void* xmlListSearch(xmlListPtr l, void* data))
]

{ #category : 'public' }
LibXml >> xmlListSize: l [

	self ffiCall: #(int xmlListSize(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListSort: l [

	self ffiCall: #(void xmlListSort(xmlListPtr l))
]

{ #category : 'public' }
LibXml >> xmlListWalkL: l walker: walker user: user [

	self ffiCall: #(void xmlListWalk(xmlListPtr l, xmlListWalker walker, void* user))
]

{ #category : 'public' }
LibXml >> xmlLoadExternalEntityURL: URL ID: ID ctxt: ctxt [

	self ffiCall: #(xmlParserInputPtr xmlLoadExternalEntity(const char* URL, const char* ID, xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlLockLibrary [

	self ffiCall: #(void xmlLockLibrary())
]

{ #category : 'public' }
LibXml >> xmlLookupCharEncodingHandlerEnc: enc out: out [

	self ffiCall: #(int xmlLookupCharEncodingHandler(xmlCharEncoding enc, xmlCharEncodingHandlerPtr* out))
]

{ #category : 'public' }
LibXml >> xmlMallocAtomicLocSize: size file: file line: line [

	self ffiCall: #(void* xmlMallocAtomicLoc(size_t size, const char* file, int line))
]

{ #category : 'public' }
LibXml >> xmlMallocLocSize: size file: file line: line [

	self ffiCall: #(void* xmlMallocLoc(size_t size, const char* file, int line))
]

{ #category : 'public' }
LibXml >> xmlMemBlocks [

	self ffiCall: #(int xmlMemBlocks())
]

{ #category : 'public' }
LibXml >> xmlMemDisplay: fp [

	self ffiCall: #(void xmlMemDisplay(FILE* fp))
]

{ #category : 'public' }
LibXml >> xmlMemDisplayLastFp: fp nbBytes: nbBytes [

	self ffiCall: #(void xmlMemDisplayLast(FILE* fp, long nbBytes))
]

{ #category : 'public' }
LibXml >> xmlMemFree: ptr [

	self ffiCall: #(void xmlMemFree(void* ptr))
]

{ #category : 'public' }
LibXml >> xmlMemGetFreeFunc: freeFunc mallocFunc: mallocFunc reallocFunc: reallocFunc strdupFunc: strdupFunc [

	self ffiCall: #(int xmlMemGet(xmlFreeFunc* freeFunc, xmlMallocFunc* mallocFunc, xmlReallocFunc* reallocFunc, xmlStrdupFunc* strdupFunc))
]

{ #category : 'public' }
LibXml >> xmlMemMalloc: size [

	self ffiCall: #(void* xmlMemMalloc(size_t size))
]

{ #category : 'public' }
LibXml >> xmlMemReallocPtr: ptr size: size [

	self ffiCall: #(void* xmlMemRealloc(void* ptr, size_t size))
]

{ #category : 'public' }
LibXml >> xmlMemSetupFreeFunc: freeFunc mallocFunc: mallocFunc reallocFunc: reallocFunc strdupFunc: strdupFunc [

	self ffiCall: #(int xmlMemSetup(xmlFreeFunc freeFunc, xmlMallocFunc mallocFunc, xmlReallocFunc reallocFunc, xmlStrdupFunc strdupFunc))
]

{ #category : 'public' }
LibXml >> xmlMemShowFp: fp nr: nr [

	self ffiCall: #(void xmlMemShow(FILE* fp, int nr))
]

{ #category : 'public' }
LibXml >> xmlMemSize: ptr [

	self ffiCall: #(size_t xmlMemSize(void* ptr))
]

{ #category : 'public' }
LibXml >> xmlMemStrdupLocStr: str file: file line: line [

	self ffiCall: #(char* xmlMemStrdupLoc(const char* str, const char* file, int line))
]

{ #category : 'public' }
LibXml >> xmlMemUsed [

	self ffiCall: #(int xmlMemUsed())
]

{ #category : 'public' }
LibXml >> xmlMemoryDump [

	self ffiCall: #(void xmlMemoryDump())
]

{ #category : 'public' }
LibXml >> xmlMemoryStrdup: str [

	self ffiCall: #(char* xmlMemoryStrdup(const char* str))
]

{ #category : 'public' }
LibXml >> xmlMutexLock: tok [

	self ffiCall: #(void xmlMutexLock(xmlMutexPtr tok))
]

{ #category : 'public' }
LibXml >> xmlMutexUnlock: tok [

	self ffiCall: #(void xmlMutexUnlock(xmlMutexPtr tok))
]

{ #category : 'public' }
LibXml >> xmlNewAutomata [

	self ffiCall: #(xmlAutomataPtr xmlNewAutomata())
]

{ #category : 'public' }
LibXml >> xmlNewCDataBlockDoc: doc content: content len: len [

	self ffiCall: #(xmlNodePtr xmlNewCDataBlock(xmlDocPtr doc, const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlNewCharEncodingHandlerName: name input: input output: output [

	self ffiCall: #(xmlCharEncodingHandlerPtr xmlNewCharEncodingHandler(const char* name, xmlCharEncodingInputFunc input, xmlCharEncodingOutputFunc output))
]

{ #category : 'public' }
LibXml >> xmlNewCharRefDoc: doc name: name [

	self ffiCall: #(xmlNodePtr xmlNewCharRef(xmlDocPtr doc, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlNewChildParent: parent ns: ns name: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewChild(xmlNodePtr parent, xmlNsPtr ns, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewComment: content [

	self ffiCall: #(xmlNodePtr xmlNewComment(const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDoc: version [

	self ffiCall: #(xmlDocPtr xmlNewDoc(const xmlChar* version))
]

{ #category : 'public' }
LibXml >> xmlNewDocCommentDoc: doc content: content [

	self ffiCall: #(xmlNodePtr xmlNewDocComment(xmlDocPtr doc, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDocElementContentDoc: doc name: name type: type [

	self ffiCall: #(xmlElementContentPtr xmlNewDocElementContent(xmlDocPtr doc, const xmlChar* name, xmlElementContentType type))
]

{ #category : 'public' }
LibXml >> xmlNewDocFragment: doc [

	self ffiCall: #(xmlNodePtr xmlNewDocFragment(xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlNewDocNodeDoc: doc ns: ns name: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewDocNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDocNodeEatNameDoc: doc ns: ns name: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewDocNodeEatName(xmlDocPtr doc, xmlNsPtr ns, xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDocPIDoc: doc name: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewDocPI(xmlDocPtr doc, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDocPropDoc: doc name: name value: value [

	self ffiCall: #(xmlAttrPtr xmlNewDocProp(xmlDocPtr doc, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlNewDocRawNodeDoc: doc ns: ns name: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewDocRawNode(xmlDocPtr doc, xmlNsPtr ns, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDocTextDoc: doc content: content [

	self ffiCall: #(xmlNodePtr xmlNewDocText(const xmlDoc* doc, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewDocTextLenDoc: doc content: content len: len [

	self ffiCall: #(xmlNodePtr xmlNewDocTextLen(xmlDocPtr doc, const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlNewDtdDoc: doc name: name ExternalID: ExternalID SystemID: SystemID [

	self ffiCall: #(xmlDtdPtr xmlNewDtd(xmlDocPtr doc, const xmlChar* name, const xmlChar* ExternalID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlNewElementContentName: name type: type [

	self ffiCall: #(xmlElementContentPtr xmlNewElementContent(const xmlChar* name, xmlElementContentType type))
]

{ #category : 'public' }
LibXml >> xmlNewEntityDoc: doc name: name type: type ExternalID: ExternalID SystemID: SystemID content: content [

	self ffiCall: #(xmlEntityPtr xmlNewEntity(xmlDocPtr doc, const xmlChar* name, int type, const xmlChar* ExternalID, const xmlChar* SystemID, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewGlobalNsDoc: doc href: href prefix: prefix [

	self ffiCall: #(xmlNsPtr xmlNewGlobalNs(xmlDocPtr doc, const xmlChar* href, const xmlChar* prefix))
]

{ #category : 'public' }
LibXml >> xmlNewIOInputStreamCtxt: ctxt input: input enc: enc [

	self ffiCall: #(xmlParserInputPtr xmlNewIOInputStream(xmlParserCtxtPtr ctxt, xmlParserInputBufferPtr input, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlNewMutex [

	self ffiCall: #(xmlMutexPtr xmlNewMutex())
]

{ #category : 'public' }
LibXml >> xmlNewNodeEatNameNs: ns name: name [

	self ffiCall: #(xmlNodePtr xmlNewNodeEatName(xmlNsPtr ns, xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlNewNodeNs: ns name: name [

	self ffiCall: #(xmlNodePtr xmlNewNode(xmlNsPtr ns, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlNewNsNode: node href: href prefix: prefix [

	self ffiCall: #(xmlNsPtr xmlNewNs(xmlNodePtr node, const xmlChar* href, const xmlChar* prefix))
]

{ #category : 'public' }
LibXml >> xmlNewNsPropEatNameNode: node ns: ns name: name value: value [

	self ffiCall: #(xmlAttrPtr xmlNewNsPropEatName(xmlNodePtr node, xmlNsPtr ns, xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlNewNsPropNode: node ns: ns name: name value: value [

	self ffiCall: #(xmlAttrPtr xmlNewNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlNewPIName: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewPI(const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewParserCtxt [

	self ffiCall: #(xmlParserCtxtPtr xmlNewParserCtxt())
]

{ #category : 'public' }
LibXml >> xmlNewPropNode: node name: name value: value [

	self ffiCall: #(xmlAttrPtr xmlNewProp(xmlNodePtr node, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlNewRMutex [

	self ffiCall: #(xmlRMutexPtr xmlNewRMutex())
]

{ #category : 'public' }
LibXml >> xmlNewReferenceDoc: doc name: name [

	self ffiCall: #(xmlNodePtr xmlNewReference(const xmlDoc* doc, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlNewSAXParserCtxtSax: sax userData: userData [

	self ffiCall: #(xmlParserCtxtPtr xmlNewSAXParserCtxt(const xmlSAXHandler* sax, void* userData))
]

{ #category : 'public' }
LibXml >> xmlNewText: content [

	self ffiCall: #(xmlNodePtr xmlNewText(const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewTextChildParent: parent ns: ns name: name content: content [

	self ffiCall: #(xmlNodePtr xmlNewTextChild(xmlNodePtr parent, xmlNsPtr ns, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNewTextLenContent: content len: len [

	self ffiCall: #(xmlNodePtr xmlNewTextLen(const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlNewTextReaderFilename: URI [

	self ffiCall: #(xmlTextReaderPtr xmlNewTextReaderFilename(const char* URI))
]

{ #category : 'public' }
LibXml >> xmlNewTextReaderInput: input URI: URI [

	self ffiCall: #(xmlTextReaderPtr xmlNewTextReader(xmlParserInputBufferPtr input, const char* URI))
]

{ #category : 'public' }
LibXml >> xmlNewTextWriter: out [

	self ffiCall: #(xmlTextWriterPtr xmlNewTextWriter(xmlOutputBufferPtr out))
]

{ #category : 'public' }
LibXml >> xmlNewTextWriterDoc: doc compression: compression [

	self ffiCall: #(xmlTextWriterPtr xmlNewTextWriterDoc(xmlDocPtr* doc, int compression))
]

{ #category : 'public' }
LibXml >> xmlNewTextWriterFilenameUri: uri compression: compression [

	self ffiCall: #(xmlTextWriterPtr xmlNewTextWriterFilename(const char* uri, int compression))
]

{ #category : 'public' }
LibXml >> xmlNewTextWriterMemoryBuf: buf compression: compression [

	self ffiCall: #(xmlTextWriterPtr xmlNewTextWriterMemory(xmlBufferPtr buf, int compression))
]

{ #category : 'public' }
LibXml >> xmlNewTextWriterPushParserCtxt: ctxt compression: compression [

	self ffiCall: #(xmlTextWriterPtr xmlNewTextWriterPushParser(xmlParserCtxtPtr ctxt, int compression))
]

{ #category : 'public' }
LibXml >> xmlNewTextWriterTreeDoc: doc node: node compression: compression [

	self ffiCall: #(xmlTextWriterPtr xmlNewTextWriterTree(xmlDocPtr doc, xmlNodePtr node, int compression))
]

{ #category : 'public' }
LibXml >> xmlNewValidCtxt [

	self ffiCall: #(xmlValidCtxtPtr xmlNewValidCtxt())
]

{ #category : 'public' }
LibXml >> xmlNextElementSibling: node [

	self ffiCall: #(xmlNodePtr xmlNextElementSibling(xmlNodePtr node))
]

{ #category : 'public' }
LibXml >> xmlNoNetExternalEntityLoaderURL: URL ID: ID ctxt: ctxt [

	self ffiCall: #(xmlParserInputPtr xmlNoNetExternalEntityLoader(const char* URL, const char* ID, xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlNodeAddContentCur: cur content: content [

	self ffiCall: #(int xmlNodeAddContent(xmlNodePtr cur, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNodeAddContentLenCur: cur content: content len: len [

	self ffiCall: #(int xmlNodeAddContentLen(xmlNodePtr cur, const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlNodeBufGetContentBuffer: buffer cur: cur [

	self ffiCall: #(int xmlNodeBufGetContent(xmlBufferPtr buffer, const xmlNode* cur))
]

{ #category : 'public' }
LibXml >> xmlNodeDumpBuf: buf doc: doc cur: cur level: level format: format [

	self ffiCall: #(int xmlNodeDump(xmlBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format))
]

{ #category : 'public' }
LibXml >> xmlNodeDumpOutputBuf: buf doc: doc cur: cur level: level format: format encoding: encoding [

	self ffiCall: #(void xmlNodeDumpOutput(xmlOutputBufferPtr buf, xmlDocPtr doc, xmlNodePtr cur, int level, int format, const char* encoding))
]

{ #category : 'public' }
LibXml >> xmlNodeGetAttrValueNode: node name: name nsUri: nsUri out: out [

	self ffiCall: #(int xmlNodeGetAttrValue(const xmlNode* node, const xmlChar* name, const xmlChar* nsUri, xmlChar** out))
]

{ #category : 'public' }
LibXml >> xmlNodeGetBaseDoc: doc cur: cur [

	self ffiCall: #(xmlChar* xmlNodeGetBase(const xmlDoc* doc, const xmlNode* cur))
]

{ #category : 'public' }
LibXml >> xmlNodeGetBaseSafeDoc: doc cur: cur baseOut: baseOut [

	self ffiCall: #(int xmlNodeGetBaseSafe(const xmlDoc* doc, const xmlNode* cur, xmlChar** baseOut))
]

{ #category : 'public' }
LibXml >> xmlNodeGetContent: cur [

	self ffiCall: #(xmlChar* xmlNodeGetContent(const xmlNode* cur))
]

{ #category : 'public' }
LibXml >> xmlNodeGetLang: cur [

	self ffiCall: #(xmlChar* xmlNodeGetLang(const xmlNode* cur))
]

{ #category : 'public' }
LibXml >> xmlNodeGetSpacePreserve: cur [

	self ffiCall: #(int xmlNodeGetSpacePreserve(const xmlNode* cur))
]

{ #category : 'public' }
LibXml >> xmlNodeIsText: node [

	self ffiCall: #(int xmlNodeIsText(const xmlNode* node))
]

{ #category : 'public' }
LibXml >> xmlNodeListGetRawStringDoc: doc list: list inLine: inLine [

	self ffiCall: #(xmlChar* xmlNodeListGetRawString(const xmlDoc* doc, const xmlNode* list, int inLine))
]

{ #category : 'public' }
LibXml >> xmlNodeListGetStringDoc: doc list: list inLine: inLine [

	self ffiCall: #(xmlChar* xmlNodeListGetString(xmlDocPtr doc, const xmlNode* list, int inLine))
]

{ #category : 'public' }
LibXml >> xmlNodeSetBaseCur: cur uri: uri [

	self ffiCall: #(int xmlNodeSetBase(xmlNodePtr cur, const xmlChar* uri))
]

{ #category : 'public' }
LibXml >> xmlNodeSetContentCur: cur content: content [

	self ffiCall: #(int xmlNodeSetContent(xmlNodePtr cur, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlNodeSetContentLenCur: cur content: content len: len [

	self ffiCall: #(int xmlNodeSetContentLen(xmlNodePtr cur, const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlNodeSetLangCur: cur lang: lang [

	self ffiCall: #(int xmlNodeSetLang(xmlNodePtr cur, const xmlChar* lang))
]

{ #category : 'public' }
LibXml >> xmlNodeSetNameCur: cur name: name [

	self ffiCall: #(void xmlNodeSetName(xmlNodePtr cur, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlNodeSetSpacePreserveCur: cur val: val [

	self ffiCall: #(int xmlNodeSetSpacePreserve(xmlNodePtr cur, int val))
]

{ #category : 'public' }
LibXml >> xmlNormalizeWindowsPath: path [

	self ffiCall: #(xmlChar* xmlNormalizeWindowsPath(const xmlChar* path))
]

{ #category : 'public' }
LibXml >> xmlOpenCharEncodingHandlerName: name output: output out: out [

	self ffiCall: #(int xmlOpenCharEncodingHandler(const char* name, int output, xmlCharEncodingHandlerPtr* out))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferClose: out [

	self ffiCall: #(int xmlOutputBufferClose(xmlOutputBufferPtr out))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferCreateBuffer: buffer encoder: encoder [

	self ffiCall: #(xmlOutputBufferPtr xmlOutputBufferCreateBuffer(xmlBufferPtr buffer, xmlCharEncodingHandlerPtr encoder))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferCreateFd: fd encoder: encoder [

	self ffiCall: #(xmlOutputBufferPtr xmlOutputBufferCreateFd(int fd, xmlCharEncodingHandlerPtr encoder))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferCreateFile: file encoder: encoder [

	self ffiCall: #(xmlOutputBufferPtr xmlOutputBufferCreateFile(FILE* file, xmlCharEncodingHandlerPtr encoder))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferCreateFilenameDefault: func [

	self ffiCall: #(xmlOutputBufferCreateFilenameFunc xmlOutputBufferCreateFilenameDefault(xmlOutputBufferCreateFilenameFunc func))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferCreateFilenameURI: URI encoder: encoder compression: compression [

	self ffiCall: #(xmlOutputBufferPtr xmlOutputBufferCreateFilename(const char* URI, xmlCharEncodingHandlerPtr encoder, int compression))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferCreateIOIowrite: iowrite ioclose: ioclose ioctx: ioctx encoder: encoder [

	self ffiCall: #(xmlOutputBufferPtr xmlOutputBufferCreateIO(xmlOutputWriteCallback iowrite, xmlOutputCloseCallback ioclose, void* ioctx, xmlCharEncodingHandlerPtr encoder))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferFlush: out [

	self ffiCall: #(int xmlOutputBufferFlush(xmlOutputBufferPtr out))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferGetContent: out [

	self ffiCall: #(const xmlChar* xmlOutputBufferGetContent(xmlOutputBufferPtr out))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferGetSize: out [

	self ffiCall: #(size_t xmlOutputBufferGetSize(xmlOutputBufferPtr out))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferWriteEscapeOut: out str: str escaping: escaping [

	self ffiCall: #(int xmlOutputBufferWriteEscape(xmlOutputBufferPtr out, const xmlChar* str, xmlCharEncodingOutputFunc escaping))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferWriteOut: out len: len buf: buf [

	self ffiCall: #(int xmlOutputBufferWrite(xmlOutputBufferPtr out, int len, const char* buf))
]

{ #category : 'public' }
LibXml >> xmlOutputBufferWriteStringOut: out str: str [

	self ffiCall: #(int xmlOutputBufferWriteString(xmlOutputBufferPtr out, const char* str))
]

{ #category : 'public' }
LibXml >> xmlParseBalancedChunkMemoryDoc: doc sax: sax user_data: user_data depth: depth string: string lst: lst [

	self ffiCall: #(int xmlParseBalancedChunkMemory(xmlDocPtr doc, xmlSAXHandlerPtr sax, void* user_data, int depth, const xmlChar* string, xmlNodePtr* lst))
]

{ #category : 'public' }
LibXml >> xmlParseBalancedChunkMemoryRecoverDoc: doc sax: sax user_data: user_data depth: depth string: string lst: lst recover: recover [

	self ffiCall: #(int xmlParseBalancedChunkMemoryRecover(xmlDocPtr doc, xmlSAXHandlerPtr sax, void* user_data, int depth, const xmlChar* string, xmlNodePtr* lst, int recover))
]

{ #category : 'public' }
LibXml >> xmlParseCharEncoding: name [

	self ffiCall: #(xmlCharEncoding xmlParseCharEncoding(const char* name))
]

{ #category : 'public' }
LibXml >> xmlParseChunkCtxt: ctxt chunk: chunk size: size terminate: terminate [

	self ffiCall: #(int xmlParseChunk(xmlParserCtxtPtr ctxt, const char* chunk, int size, int terminate))
]

{ #category : 'public' }
LibXml >> xmlParseCtxtExternalEntityCtx: ctx URL: URL ID: ID lst: lst [

	self ffiCall: #(int xmlParseCtxtExternalEntity(xmlParserCtxtPtr ctx, const xmlChar* URL, const xmlChar* ID, xmlNodePtr* lst))
]

{ #category : 'public' }
LibXml >> xmlParseDTDExternalID: ExternalID SystemID: SystemID [

	self ffiCall: #(xmlDtdPtr xmlParseDTD(const xmlChar* ExternalID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlParseDoc: cur [

	self ffiCall: #(xmlDocPtr xmlParseDoc(const xmlChar* cur))
]

{ #category : 'public' }
LibXml >> xmlParseDocument: ctxt [

	self ffiCall: #(int xmlParseDocument(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlParseEntity: filename [

	self ffiCall: #(xmlDocPtr xmlParseEntity(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlParseExtParsedEnt: ctxt [

	self ffiCall: #(int xmlParseExtParsedEnt(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlParseExternalEntityDoc: doc sax: sax user_data: user_data depth: depth URL: URL ID: ID lst: lst [

	self ffiCall: #(int xmlParseExternalEntity(xmlDocPtr doc, xmlSAXHandlerPtr sax, void* user_data, int depth, const xmlChar* URL, const xmlChar* ID, xmlNodePtr* lst))
]

{ #category : 'public' }
LibXml >> xmlParseFile: filename [

	self ffiCall: #(xmlDocPtr xmlParseFile(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlParseInNodeContextNode: node data: data datalen: datalen options: options lst: lst [

	self ffiCall: #(xmlParserErrors xmlParseInNodeContext(xmlNodePtr node, const char* data, int datalen, int options, xmlNodePtr* lst))
]

{ #category : 'public' }
LibXml >> xmlParseMemoryBuffer: buffer size: size [

	self ffiCall: #(xmlDocPtr xmlParseMemory(const char* buffer, int size))
]

{ #category : 'public' }
LibXml >> xmlParserAddNodeInfoCtxt: ctxt info: info [

	self ffiCall: #(void xmlParserAddNodeInfo(xmlParserCtxtPtr ctxt, xmlParserNodeInfoPtr info))
]

{ #category : 'public' }
LibXml >> xmlParserFindNodeInfoCtxt: ctxt node: node [

	self ffiCall: #(const xmlParserNodeInfo* xmlParserFindNodeInfo(xmlParserCtxtPtr ctxt, xmlNodePtr node))
]

{ #category : 'public' }
LibXml >> xmlParserFindNodeInfoIndexSeq: seq node: node [

	self ffiCall: #(ulong xmlParserFindNodeInfoIndex(xmlParserNodeInfoSeqPtr seq, xmlNodePtr node))
]

{ #category : 'public' }
LibXml >> xmlParserGetDirectory: filename [

	self ffiCall: #(char* xmlParserGetDirectory(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateFd: fd enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlParserInputBufferCreateFd(int fd, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateFile: file enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlParserInputBufferCreateFile(FILE* file, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateFilenameDefault: func [

	self ffiCall: #(xmlParserInputBufferCreateFilenameFunc xmlParserInputBufferCreateFilenameDefault(xmlParserInputBufferCreateFilenameFunc func))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateFilenameURI: URI enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlParserInputBufferCreateFilename(const char* URI, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateIOIoread: ioread ioclose: ioclose ioctx: ioctx enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlParserInputBufferCreateIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void* ioctx, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateMem: mem size: size enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlParserInputBufferCreateMem(const char* mem, int size, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferCreateStaticMem: mem size: size enc: enc [

	self ffiCall: #(xmlParserInputBufferPtr xmlParserInputBufferCreateStatic(const char* mem, int size, xmlCharEncoding enc))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferGrowIn: in len: len [

	self ffiCall: #(int xmlParserInputBufferGrow(xmlParserInputBufferPtr in, int len))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferPushIn: in len: len buf: buf [

	self ffiCall: #(int xmlParserInputBufferPush(xmlParserInputBufferPtr in, int len, const char* buf))
]

{ #category : 'public' }
LibXml >> xmlParserInputBufferReadIn: in len: len [

	self ffiCall: #(int xmlParserInputBufferRead(xmlParserInputBufferPtr in, int len))
]

{ #category : 'public' }
LibXml >> xmlParserInputGrowIn: in len: len [

	self ffiCall: #(int xmlParserInputGrow(xmlParserInputPtr in, int len))
]

{ #category : 'public' }
LibXml >> xmlParserInputReadIn: in len: len [

	self ffiCall: #(int xmlParserInputRead(xmlParserInputPtr in, int len))
]

{ #category : 'public' }
LibXml >> xmlParserPrintFileContext: input [

	self ffiCall: #(void xmlParserPrintFileContext(_xmlParserInput* input))
]

{ #category : 'public' }
LibXml >> xmlParserPrintFileInfo: input [
	"/** DOC_ENABLE */"

	self ffiCall: #(void xmlParserPrintFileInfo(_xmlParserInput* input))
]

{ #category : 'public' }
LibXml >> xmlPedanticParserDefault: val [

	self ffiCall: #(int xmlPedanticParserDefault(int val))
]

{ #category : 'public' }
LibXml >> xmlPopInputCallbacks [

	self ffiCall: #(int xmlPopInputCallbacks())
]

{ #category : 'public' }
LibXml >> xmlPopOutputCallbacks [

	self ffiCall: #(int xmlPopOutputCallbacks())
]

{ #category : 'public' }
LibXml >> xmlPreviousElementSibling: node [

	self ffiCall: #(xmlNodePtr xmlPreviousElementSibling(xmlNodePtr node))
]

{ #category : 'public' }
LibXml >> xmlRMutexLock: tok [

	self ffiCall: #(void xmlRMutexLock(xmlRMutexPtr tok))
]

{ #category : 'public' }
LibXml >> xmlRMutexUnlock: tok [

	self ffiCall: #(void xmlRMutexUnlock(xmlRMutexPtr tok))
]

{ #category : 'public' }
LibXml >> xmlReadDocCur: cur URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlReadDoc(const xmlChar* cur, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReadFd: fd URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlReadFd(int fd, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReadFileURL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlReadFile(const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReadIOIoread: ioread ioclose: ioclose ioctx: ioctx URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlReadIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void* ioctx, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReadMemoryBuffer: buffer size: size URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlDocPtr xmlReadMemory(const char* buffer, int size, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderForDocCur: cur URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlTextReaderPtr xmlReaderForDoc(const xmlChar* cur, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderForFd: fd URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlTextReaderPtr xmlReaderForFd(int fd, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderForFileFilename: filename encoding: encoding options: options [

	self ffiCall: #(xmlTextReaderPtr xmlReaderForFile(const char* filename, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderForIOIoread: ioread ioclose: ioclose ioctx: ioctx URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlTextReaderPtr xmlReaderForIO(xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void* ioctx, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderForMemoryBuffer: buffer size: size URL: URL encoding: encoding options: options [

	self ffiCall: #(xmlTextReaderPtr xmlReaderForMemory(const char* buffer, int size, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderNewDocReader: reader cur: cur URL: URL encoding: encoding options: options [

	self ffiCall: #(int xmlReaderNewDoc(xmlTextReaderPtr reader, const xmlChar* cur, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderNewFdReader: reader fd: fd URL: URL encoding: encoding options: options [

	self ffiCall: #(int xmlReaderNewFd(xmlTextReaderPtr reader, int fd, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderNewFileReader: reader filename: filename encoding: encoding options: options [

	self ffiCall: #(int xmlReaderNewFile(xmlTextReaderPtr reader, const char* filename, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderNewIOReader: reader ioread: ioread ioclose: ioclose ioctx: ioctx URL: URL encoding: encoding options: options [

	self ffiCall: #(int xmlReaderNewIO(xmlTextReaderPtr reader, xmlInputReadCallback ioread, xmlInputCloseCallback ioclose, void* ioctx, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderNewMemoryReader: reader buffer: buffer size: size URL: URL encoding: encoding options: options [

	self ffiCall: #(int xmlReaderNewMemory(xmlTextReaderPtr reader, const char* buffer, int size, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlReaderNewWalkerReader: reader doc: doc [

	self ffiCall: #(int xmlReaderNewWalker(xmlTextReaderPtr reader, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlReaderWalker: doc [

	self ffiCall: #(xmlTextReaderPtr xmlReaderWalker(xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlReallocLocPtr: ptr size: size file: file line: line [

	self ffiCall: #(void* xmlReallocLoc(void* ptr, size_t size, const char* file, int line))
]

{ #category : 'public' }
LibXml >> xmlReconciliateNsDoc: doc tree: tree [

	self ffiCall: #(int xmlReconciliateNs(xmlDocPtr doc, xmlNodePtr tree))
]

{ #category : 'public' }
LibXml >> xmlRecoverDoc: cur [

	self ffiCall: #(xmlDocPtr xmlRecoverDoc(const xmlChar* cur))
]

{ #category : 'public' }
LibXml >> xmlRecoverFile: filename [

	self ffiCall: #(xmlDocPtr xmlRecoverFile(const char* filename))
]

{ #category : 'public' }
LibXml >> xmlRecoverMemoryBuffer: buffer size: size [

	self ffiCall: #(xmlDocPtr xmlRecoverMemory(const char* buffer, int size))
]

{ #category : 'public' }
LibXml >> xmlRegExecErrInfoExec: exec string: string nbval: nbval nbneg: nbneg values: values terminal: terminal [

	self ffiCall: #(int xmlRegExecErrInfo(xmlRegExecCtxtPtr exec, const xmlChar** string, int* nbval, int* nbneg, xmlChar** values, int* terminal))
]

{ #category : 'public' }
LibXml >> xmlRegExecNextValuesExec: exec nbval: nbval nbneg: nbneg values: values terminal: terminal [

	self ffiCall: #(int xmlRegExecNextValues(xmlRegExecCtxtPtr exec, int* nbval, int* nbneg, xmlChar** values, int* terminal))
]

{ #category : 'public' }
LibXml >> xmlRegExecPushString2Exec: exec value: value value2: value2 data: data [

	self ffiCall: #(int xmlRegExecPushString2(xmlRegExecCtxtPtr exec, const xmlChar* value, const xmlChar* value2, void* data))
]

{ #category : 'public' }
LibXml >> xmlRegExecPushStringExec: exec value: value data: data [

	self ffiCall: #(int xmlRegExecPushString(xmlRegExecCtxtPtr exec, const xmlChar* value, void* data))
]

{ #category : 'public' }
LibXml >> xmlRegFreeExecCtxt: exec [

	self ffiCall: #(void xmlRegFreeExecCtxt(xmlRegExecCtxtPtr exec))
]

{ #category : 'public' }
LibXml >> xmlRegFreeRegexp: regexp [

	self ffiCall: #(void xmlRegFreeRegexp(xmlRegexpPtr regexp))
]

{ #category : 'public' }
LibXml >> xmlRegNewExecCtxtComp: comp callback: callback data: data [

	self ffiCall: #(xmlRegExecCtxtPtr xmlRegNewExecCtxt(xmlRegexpPtr comp, xmlRegExecCallbacks callback, void* data))
]

{ #category : 'public' }
LibXml >> xmlRegexpCompile: regexp [

	self ffiCall: #(xmlRegexpPtr xmlRegexpCompile(const xmlChar* regexp))
]

{ #category : 'public' }
LibXml >> xmlRegexpExecComp: comp value: value [

	self ffiCall: #(int xmlRegexpExec(xmlRegexpPtr comp, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlRegexpIsDeterminist: comp [

	self ffiCall: #(int xmlRegexpIsDeterminist(xmlRegexpPtr comp))
]

{ #category : 'public' }
LibXml >> xmlRegexpPrintOutput: output regexp: regexp [

	self ffiCall: #(void xmlRegexpPrint(FILE* output, xmlRegexpPtr regexp))
]

{ #category : 'public' }
LibXml >> xmlRegisterCharEncodingHandler: handler [

	self ffiCall: #(void xmlRegisterCharEncodingHandler(xmlCharEncodingHandlerPtr handler))
]

{ #category : 'public' }
LibXml >> xmlRegisterDefaultInputCallbacks [

	self ffiCall: #(void xmlRegisterDefaultInputCallbacks())
]

{ #category : 'public' }
LibXml >> xmlRegisterDefaultOutputCallbacks [

	self ffiCall: #(void xmlRegisterDefaultOutputCallbacks())
]

{ #category : 'public' }
LibXml >> xmlRegisterHTTPPostCallbacks [

	self ffiCall: #(void xmlRegisterHTTPPostCallbacks())
]

{ #category : 'public' }
LibXml >> xmlRegisterInputCallbacksMatchFunc: matchFunc openFunc: openFunc readFunc: readFunc closeFunc: closeFunc [

	self ffiCall: #(int xmlRegisterInputCallbacks(xmlInputMatchCallback matchFunc, xmlInputOpenCallback openFunc, xmlInputReadCallback readFunc, xmlInputCloseCallback closeFunc))
]

{ #category : 'public' }
LibXml >> xmlRegisterNodeDefault: func [

	self ffiCall: #(xmlRegisterNodeFunc xmlRegisterNodeDefault(xmlRegisterNodeFunc func))
]

{ #category : 'public' }
LibXml >> xmlRegisterOutputCallbacksMatchFunc: matchFunc openFunc: openFunc writeFunc: writeFunc closeFunc: closeFunc [

	self ffiCall: #(int xmlRegisterOutputCallbacks(xmlOutputMatchCallback matchFunc, xmlOutputOpenCallback openFunc, xmlOutputWriteCallback writeFunc, xmlOutputCloseCallback closeFunc))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGCleanupTypes [

	self ffiCall: #(void xmlRelaxNGCleanupTypes())
]

{ #category : 'public' }
LibXml >> xmlRelaxNGDumpOutput: output schema: schema [

	self ffiCall: #(void xmlRelaxNGDump(FILE* output, xmlRelaxNGPtr schema))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGDumpTreeOutput: output schema: schema [

	self ffiCall: #(void xmlRelaxNGDumpTree(FILE* output, xmlRelaxNGPtr schema))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGFree: schema [

	self ffiCall: #(void xmlRelaxNGFree(xmlRelaxNGPtr schema))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGFreeParserCtxt: ctxt [

	self ffiCall: #(void xmlRelaxNGFreeParserCtxt(xmlRelaxNGParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGFreeValidCtxt: ctxt [

	self ffiCall: #(void xmlRelaxNGFreeValidCtxt(xmlRelaxNGValidCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGGetParserErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(int xmlRelaxNGGetParserErrors(xmlRelaxNGParserCtxtPtr ctxt, xmlRelaxNGValidityErrorFunc* err, xmlRelaxNGValidityWarningFunc* warn, void** ctx))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGGetValidErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(int xmlRelaxNGGetValidErrors(xmlRelaxNGValidCtxtPtr ctxt, xmlRelaxNGValidityErrorFunc* err, xmlRelaxNGValidityWarningFunc* warn, void** ctx))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGInitTypes [

	self ffiCall: #(int xmlRelaxNGInitTypes())
]

{ #category : 'public' }
LibXml >> xmlRelaxNGNewDocParserCtxt: doc [

	self ffiCall: #(xmlRelaxNGParserCtxtPtr xmlRelaxNGNewDocParserCtxt(xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGNewMemParserCtxtBuffer: buffer size: size [

	self ffiCall: #(xmlRelaxNGParserCtxtPtr xmlRelaxNGNewMemParserCtxt(const char* buffer, int size))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGNewParserCtxt: URL [

	self ffiCall: #(xmlRelaxNGParserCtxtPtr xmlRelaxNGNewParserCtxt(const char* URL))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGNewValidCtxt: schema [

	self ffiCall: #(xmlRelaxNGValidCtxtPtr xmlRelaxNGNewValidCtxt(xmlRelaxNGPtr schema))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGParse: ctxt [

	self ffiCall: #(xmlRelaxNGPtr xmlRelaxNGParse(xmlRelaxNGParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGSetParserErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(void xmlRelaxNGSetParserErrors(xmlRelaxNGParserCtxtPtr ctxt, xmlRelaxNGValidityErrorFunc err, xmlRelaxNGValidityWarningFunc warn, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGSetParserStructuredErrorsCtxt: ctxt serror: serror ctx: ctx [

	self ffiCall: #(void xmlRelaxNGSetParserStructuredErrors(xmlRelaxNGParserCtxtPtr ctxt, xmlStructuredErrorFunc serror, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGSetValidErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(void xmlRelaxNGSetValidErrors(xmlRelaxNGValidCtxtPtr ctxt, xmlRelaxNGValidityErrorFunc err, xmlRelaxNGValidityWarningFunc warn, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGSetValidStructuredErrorsCtxt: ctxt serror: serror ctx: ctx [

	self ffiCall: #(void xmlRelaxNGSetValidStructuredErrors(xmlRelaxNGValidCtxtPtr ctxt, xmlStructuredErrorFunc serror, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGValidateDocCtxt: ctxt doc: doc [

	self ffiCall: #(int xmlRelaxNGValidateDoc(xmlRelaxNGValidCtxtPtr ctxt, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGValidateFullElementCtxt: ctxt doc: doc elem: elem [

	self ffiCall: #(int xmlRelaxNGValidateFullElement(xmlRelaxNGValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGValidatePopElementCtxt: ctxt doc: doc elem: elem [

	self ffiCall: #(int xmlRelaxNGValidatePopElement(xmlRelaxNGValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGValidatePushCDataCtxt: ctxt data: data len: len [

	self ffiCall: #(int xmlRelaxNGValidatePushCData(xmlRelaxNGValidCtxtPtr ctxt, const xmlChar* data, int len))
]

{ #category : 'public' }
LibXml >> xmlRelaxNGValidatePushElementCtxt: ctxt doc: doc elem: elem [

	self ffiCall: #(int xmlRelaxNGValidatePushElement(xmlRelaxNGValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlRelaxParserSetFlagCtxt: ctxt flag: flag [

	self ffiCall: #(int xmlRelaxParserSetFlag(xmlRelaxNGParserCtxtPtr ctxt, int flag))
]

{ #category : 'public' }
LibXml >> xmlRemoveIDDoc: doc attr: attr [

	self ffiCall: #(int xmlRemoveID(xmlDocPtr doc, xmlAttrPtr attr))
]

{ #category : 'public' }
LibXml >> xmlRemoveProp: cur [

	self ffiCall: #(int xmlRemoveProp(xmlAttrPtr cur))
]

{ #category : 'public' }
LibXml >> xmlRemoveRefDoc: doc attr: attr [

	self ffiCall: #(int xmlRemoveRef(xmlDocPtr doc, xmlAttrPtr attr))
]

{ #category : 'public' }
LibXml >> xmlReplaceNodeOld: old cur: cur [

	self ffiCall: #(xmlNodePtr xmlReplaceNode(xmlNodePtr old, xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlResetError: err [

	self ffiCall: #(void xmlResetError(xmlErrorPtr err))
]

{ #category : 'public' }
LibXml >> xmlResetLastError [

	self ffiCall: #(void xmlResetLastError())
]

{ #category : 'public' }
LibXml >> xmlSAX2AttributeDeclCtx: ctx elem: elem fullname: fullname type: type def: def defaultValue: defaultValue tree: tree [

	self ffiCall: #(void xmlSAX2AttributeDecl(void* ctx, const xmlChar* elem, const xmlChar* fullname, int type, int def, const xmlChar* defaultValue, xmlEnumerationPtr tree))
]

{ #category : 'public' }
LibXml >> xmlSAX2CDataBlockCtx: ctx value: value len: len [

	self ffiCall: #(void xmlSAX2CDataBlock(void* ctx, const xmlChar* value, int len))
]

{ #category : 'public' }
LibXml >> xmlSAX2CharactersCtx: ctx ch: ch len: len [

	self ffiCall: #(void xmlSAX2Characters(void* ctx, const xmlChar* ch, int len))
]

{ #category : 'public' }
LibXml >> xmlSAX2CommentCtx: ctx value: value [

	self ffiCall: #(void xmlSAX2Comment(void* ctx, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlSAX2ElementDeclCtx: ctx name: name type: type content: content [

	self ffiCall: #(void xmlSAX2ElementDecl(void* ctx, const xmlChar* name, int type, xmlElementContentPtr content))
]

{ #category : 'public' }
LibXml >> xmlSAX2EndDocument: ctx [

	self ffiCall: #(void xmlSAX2EndDocument(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2EndElementCtx: ctx name: name [

	self ffiCall: #(void xmlSAX2EndElement(void* ctx, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlSAX2EndElementNsCtx: ctx localname: localname prefix: prefix URI: URI [

	self ffiCall: #(void xmlSAX2EndElementNs(void* ctx, const xmlChar* localname, const xmlChar* prefix, const xmlChar* URI))
]

{ #category : 'public' }
LibXml >> xmlSAX2EntityDeclCtx: ctx name: name type: type publicId: publicId systemId: systemId content: content [

	self ffiCall: #(void xmlSAX2EntityDecl(void* ctx, const xmlChar* name, int type, const xmlChar* publicId, const xmlChar* systemId, xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlSAX2ExternalSubsetCtx: ctx name: name ExternalID: ExternalID SystemID: SystemID [

	self ffiCall: #(void xmlSAX2ExternalSubset(void* ctx, const xmlChar* name, const xmlChar* ExternalID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlSAX2GetColumnNumber: ctx [

	self ffiCall: #(int xmlSAX2GetColumnNumber(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2GetEntityCtx: ctx name: name [

	self ffiCall: #(xmlEntityPtr xmlSAX2GetEntity(void* ctx, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlSAX2GetLineNumber: ctx [

	self ffiCall: #(int xmlSAX2GetLineNumber(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2GetParameterEntityCtx: ctx name: name [

	self ffiCall: #(xmlEntityPtr xmlSAX2GetParameterEntity(void* ctx, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlSAX2GetPublicId: ctx [

	self ffiCall: #(const xmlChar* xmlSAX2GetPublicId(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2GetSystemId: ctx [

	self ffiCall: #(const xmlChar* xmlSAX2GetSystemId(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2HasExternalSubset: ctx [

	self ffiCall: #(int xmlSAX2HasExternalSubset(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2HasInternalSubset: ctx [

	self ffiCall: #(int xmlSAX2HasInternalSubset(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2IgnorableWhitespaceCtx: ctx ch: ch len: len [

	self ffiCall: #(void xmlSAX2IgnorableWhitespace(void* ctx, const xmlChar* ch, int len))
]

{ #category : 'public' }
LibXml >> xmlSAX2InitDefaultSAXHandlerHdlr: hdlr warning: warning [

	self ffiCall: #(void xmlSAX2InitDefaultSAXHandler(xmlSAXHandler* hdlr, int warning))
]

{ #category : 'public' }
LibXml >> xmlSAX2InitHtmlDefaultSAXHandler: hdlr [

	self ffiCall: #(void xmlSAX2InitHtmlDefaultSAXHandler(xmlSAXHandler* hdlr))
]

{ #category : 'public' }
LibXml >> xmlSAX2InternalSubsetCtx: ctx name: name ExternalID: ExternalID SystemID: SystemID [

	self ffiCall: #(void xmlSAX2InternalSubset(void* ctx, const xmlChar* name, const xmlChar* ExternalID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlSAX2IsStandalone: ctx [

	self ffiCall: #(int xmlSAX2IsStandalone(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2NotationDeclCtx: ctx name: name publicId: publicId systemId: systemId [

	self ffiCall: #(void xmlSAX2NotationDecl(void* ctx, const xmlChar* name, const xmlChar* publicId, const xmlChar* systemId))
]

{ #category : 'public' }
LibXml >> xmlSAX2ProcessingInstructionCtx: ctx target: target data: data [

	self ffiCall: #(void xmlSAX2ProcessingInstruction(void* ctx, const xmlChar* target, const xmlChar* data))
]

{ #category : 'public' }
LibXml >> xmlSAX2ReferenceCtx: ctx name: name [

	self ffiCall: #(void xmlSAX2Reference(void* ctx, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlSAX2ResolveEntityCtx: ctx publicId: publicId systemId: systemId [

	self ffiCall: #(xmlParserInputPtr xmlSAX2ResolveEntity(void* ctx, const xmlChar* publicId, const xmlChar* systemId))
]

{ #category : 'public' }
LibXml >> xmlSAX2SetDocumentLocatorCtx: ctx loc: loc [

	self ffiCall: #(void xmlSAX2SetDocumentLocator(void* ctx, xmlSAXLocatorPtr loc))
]

{ #category : 'public' }
LibXml >> xmlSAX2StartDocument: ctx [

	self ffiCall: #(void xmlSAX2StartDocument(void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSAX2StartElementCtx: ctx fullname: fullname atts: atts [

	self ffiCall: #(void xmlSAX2StartElement(void* ctx, const xmlChar* fullname, const xmlChar** atts))
]

{ #category : 'public' }
LibXml >> xmlSAX2StartElementNsCtx: ctx localname: localname prefix: prefix URI: URI nb_namespaces: nb_namespaces namespaces: namespaces nb_attributes: nb_attributes nb_defaulted: nb_defaulted attributes: attributes [

	self ffiCall: #(void xmlSAX2StartElementNs(void* ctx, const xmlChar* localname, const xmlChar* prefix, const xmlChar* URI, int nb_namespaces, const xmlChar** namespaces, int nb_attributes, int nb_defaulted, const xmlChar** attributes))
]

{ #category : 'public' }
LibXml >> xmlSAX2UnparsedEntityDeclCtx: ctx name: name publicId: publicId systemId: systemId notationName: notationName [

	self ffiCall: #(void xmlSAX2UnparsedEntityDecl(void* ctx, const xmlChar* name, const xmlChar* publicId, const xmlChar* systemId, const xmlChar* notationName))
]

{ #category : 'public' }
LibXml >> xmlSAXDefaultVersion: version [

	self ffiCall: #(int xmlSAXDefaultVersion(int version))
]

{ #category : 'public' }
LibXml >> xmlSAXParseDTDSax: sax ExternalID: ExternalID SystemID: SystemID [

	self ffiCall: #(xmlDtdPtr xmlSAXParseDTD(xmlSAXHandlerPtr sax, const xmlChar* ExternalID, const xmlChar* SystemID))
]

{ #category : 'public' }
LibXml >> xmlSAXParseDocSax: sax cur: cur recovery: recovery [

	self ffiCall: #(xmlDocPtr xmlSAXParseDoc(xmlSAXHandlerPtr sax, const xmlChar* cur, int recovery))
]

{ #category : 'public' }
LibXml >> xmlSAXParseEntitySax: sax filename: filename [

	self ffiCall: #(xmlDocPtr xmlSAXParseEntity(xmlSAXHandlerPtr sax, const char* filename))
]

{ #category : 'public' }
LibXml >> xmlSAXParseFileSax: sax filename: filename recovery: recovery [

	self ffiCall: #(xmlDocPtr xmlSAXParseFile(xmlSAXHandlerPtr sax, const char* filename, int recovery))
]

{ #category : 'public' }
LibXml >> xmlSAXParseFileWithDataSax: sax filename: filename recovery: recovery data: data [

	self ffiCall: #(xmlDocPtr xmlSAXParseFileWithData(xmlSAXHandlerPtr sax, const char* filename, int recovery, void* data))
]

{ #category : 'public' }
LibXml >> xmlSAXParseMemorySax: sax buffer: buffer size: size recovery: recovery [

	self ffiCall: #(xmlDocPtr xmlSAXParseMemory(xmlSAXHandlerPtr sax, const char* buffer, int size, int recovery))
]

{ #category : 'public' }
LibXml >> xmlSAXParseMemoryWithDataSax: sax buffer: buffer size: size recovery: recovery data: data [

	self ffiCall: #(xmlDocPtr xmlSAXParseMemoryWithData(xmlSAXHandlerPtr sax, const char* buffer, int size, int recovery, void* data))
]

{ #category : 'public' }
LibXml >> xmlSAXUserParseFileSax: sax user_data: user_data filename: filename [

	self ffiCall: #(int xmlSAXUserParseFile(xmlSAXHandlerPtr sax, void* user_data, const char* filename))
]

{ #category : 'public' }
LibXml >> xmlSAXUserParseMemorySax: sax user_data: user_data buffer: buffer size: size [

	self ffiCall: #(int xmlSAXUserParseMemory(xmlSAXHandlerPtr sax, void* user_data, const char* buffer, int size))
]

{ #category : 'public' }
LibXml >> xmlSAXVersionHdlr: hdlr version: version [

	self ffiCall: #(int xmlSAXVersion(xmlSAXHandler* hdlr, int version))
]

{ #category : 'public' }
LibXml >> xmlSaveFileEncFilename: filename cur: cur encoding: encoding [

	self ffiCall: #(int xmlSaveFileEnc(const char* filename, xmlDocPtr cur, const char* encoding))
]

{ #category : 'public' }
LibXml >> xmlSaveFileFilename: filename cur: cur [

	self ffiCall: #(int xmlSaveFile(const char* filename, xmlDocPtr cur))
]

{ #category : 'public' }
LibXml >> xmlSaveFileToBuf: buf cur: cur encoding: encoding [

	self ffiCall: #(int xmlSaveFileTo(xmlOutputBufferPtr buf, xmlDocPtr cur, const char* encoding))
]

{ #category : 'public' }
LibXml >> xmlSaveFormatFileEncFilename: filename cur: cur encoding: encoding format: format [

	self ffiCall: #(int xmlSaveFormatFileEnc(const char* filename, xmlDocPtr cur, const char* encoding, int format))
]

{ #category : 'public' }
LibXml >> xmlSaveFormatFileFilename: filename cur: cur format: format [

	self ffiCall: #(int xmlSaveFormatFile(const char* filename, xmlDocPtr cur, int format))
]

{ #category : 'public' }
LibXml >> xmlSaveFormatFileToBuf: buf cur: cur encoding: encoding format: format [

	self ffiCall: #(int xmlSaveFormatFileTo(xmlOutputBufferPtr buf, xmlDocPtr cur, const char* encoding, int format))
]

{ #category : 'public' }
LibXml >> xmlSchemaDumpOutput: output schema: schema [

	self ffiCall: #(void xmlSchemaDump(FILE* output, xmlSchemaPtr schema))
]

{ #category : 'public' }
LibXml >> xmlSchemaFree: schema [

	self ffiCall: #(void xmlSchemaFree(xmlSchemaPtr schema))
]

{ #category : 'public' }
LibXml >> xmlSchemaFreeParserCtxt: ctxt [

	self ffiCall: #(void xmlSchemaFreeParserCtxt(xmlSchemaParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaFreeValidCtxt: ctxt [

	self ffiCall: #(void xmlSchemaFreeValidCtxt(xmlSchemaValidCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaGetParserErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(int xmlSchemaGetParserErrors(xmlSchemaParserCtxtPtr ctxt, xmlSchemaValidityErrorFunc* err, xmlSchemaValidityWarningFunc* warn, void** ctx))
]

{ #category : 'public' }
LibXml >> xmlSchemaGetValidErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(int xmlSchemaGetValidErrors(xmlSchemaValidCtxtPtr ctxt, xmlSchemaValidityErrorFunc* err, xmlSchemaValidityWarningFunc* warn, void** ctx))
]

{ #category : 'public' }
LibXml >> xmlSchemaIsValid: ctxt [

	self ffiCall: #(int xmlSchemaIsValid(xmlSchemaValidCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaNewDocParserCtxt: doc [

	self ffiCall: #(xmlSchemaParserCtxtPtr xmlSchemaNewDocParserCtxt(xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlSchemaNewMemParserCtxtBuffer: buffer size: size [

	self ffiCall: #(xmlSchemaParserCtxtPtr xmlSchemaNewMemParserCtxt(const char* buffer, int size))
]

{ #category : 'public' }
LibXml >> xmlSchemaNewParserCtxt: URL [

	self ffiCall: #(xmlSchemaParserCtxtPtr xmlSchemaNewParserCtxt(const char* URL))
]

{ #category : 'public' }
LibXml >> xmlSchemaNewValidCtxt: schema [

	self ffiCall: #(xmlSchemaValidCtxtPtr xmlSchemaNewValidCtxt(xmlSchemaPtr schema))
]

{ #category : 'public' }
LibXml >> xmlSchemaParse: ctxt [

	self ffiCall: #(xmlSchemaPtr xmlSchemaParse(xmlSchemaParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaSAXPlugCtxt: ctxt sax: sax user_data: user_data [

	self ffiCall: #(xmlSchemaSAXPlugPtr xmlSchemaSAXPlug(xmlSchemaValidCtxtPtr ctxt, xmlSAXHandlerPtr* sax, void** user_data))
]

{ #category : 'public' }
LibXml >> xmlSchemaSAXUnplug: plug [

	self ffiCall: #(int xmlSchemaSAXUnplug(xmlSchemaSAXPlugPtr plug))
]

{ #category : 'public' }
LibXml >> xmlSchemaSetParserErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(void xmlSchemaSetParserErrors(xmlSchemaParserCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSchemaSetParserStructuredErrorsCtxt: ctxt serror: serror ctx: ctx [

	self ffiCall: #(void xmlSchemaSetParserStructuredErrors(xmlSchemaParserCtxtPtr ctxt, xmlStructuredErrorFunc serror, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSchemaSetValidErrorsCtxt: ctxt err: err warn: warn ctx: ctx [

	self ffiCall: #(void xmlSchemaSetValidErrors(xmlSchemaValidCtxtPtr ctxt, xmlSchemaValidityErrorFunc err, xmlSchemaValidityWarningFunc warn, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSchemaSetValidOptionsCtxt: ctxt options: options [

	self ffiCall: #(int xmlSchemaSetValidOptions(xmlSchemaValidCtxtPtr ctxt, int options))
]

{ #category : 'public' }
LibXml >> xmlSchemaSetValidStructuredErrorsCtxt: ctxt serror: serror ctx: ctx [

	self ffiCall: #(void xmlSchemaSetValidStructuredErrors(xmlSchemaValidCtxtPtr ctxt, xmlStructuredErrorFunc serror, void* ctx))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidCtxtGetOptions: ctxt [

	self ffiCall: #(int xmlSchemaValidCtxtGetOptions(xmlSchemaValidCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidCtxtGetParserCtxt: ctxt [

	self ffiCall: #(xmlParserCtxtPtr xmlSchemaValidCtxtGetParserCtxt(xmlSchemaValidCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidateDocCtxt: ctxt instance: instance [

	self ffiCall: #(int xmlSchemaValidateDoc(xmlSchemaValidCtxtPtr ctxt, xmlDocPtr instance))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidateFileCtxt: ctxt filename: filename options: options [

	self ffiCall: #(int xmlSchemaValidateFile(xmlSchemaValidCtxtPtr ctxt, const char* filename, int options))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidateOneElementCtxt: ctxt elem: elem [

	self ffiCall: #(int xmlSchemaValidateOneElement(xmlSchemaValidCtxtPtr ctxt, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidateSetFilenameVctxt: vctxt filename: filename [

	self ffiCall: #(void xmlSchemaValidateSetFilename(xmlSchemaValidCtxtPtr vctxt, const char* filename))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidateSetLocatorVctxt: vctxt f: f ctxt: ctxt [

	self ffiCall: #(void xmlSchemaValidateSetLocator(xmlSchemaValidCtxtPtr vctxt, xmlSchemaValidityLocatorFunc f, void* ctxt))
]

{ #category : 'public' }
LibXml >> xmlSchemaValidateStreamCtxt: ctxt input: input enc: enc sax: sax user_data: user_data [

	self ffiCall: #(int xmlSchemaValidateStream(xmlSchemaValidCtxtPtr ctxt, xmlParserInputBufferPtr input, xmlCharEncoding enc, xmlSAXHandlerPtr sax, void* user_data))
]

{ #category : 'public' }
LibXml >> xmlSearchNsByHrefDoc: doc node: node href: href [

	self ffiCall: #(xmlNsPtr xmlSearchNsByHref(xmlDocPtr doc, xmlNodePtr node, const xmlChar* href))
]

{ #category : 'public' }
LibXml >> xmlSearchNsDoc: doc node: node nameSpace: nameSpace [

	self ffiCall: #(xmlNsPtr xmlSearchNs(xmlDocPtr doc, xmlNodePtr node, const xmlChar* nameSpace))
]

{ #category : 'public' }
LibXml >> xmlSetBufferAllocationScheme: scheme [

	self ffiCall: #(void xmlSetBufferAllocationScheme(xmlBufferAllocationScheme scheme))
]

{ #category : 'public' }
LibXml >> xmlSetCompressMode: mode [

	self ffiCall: #(void xmlSetCompressMode(int mode))
]

{ #category : 'public' }
LibXml >> xmlSetDocCompressModeDoc: doc mode: mode [

	self ffiCall: #(void xmlSetDocCompressMode(xmlDocPtr doc, int mode))
]

{ #category : 'public' }
LibXml >> xmlSetExternalEntityLoader: f [

	self ffiCall: #(void xmlSetExternalEntityLoader(xmlExternalEntityLoader f))
]

{ #category : 'public' }
LibXml >> xmlSetFeatureCtxt: ctxt name: name value: value [

	self ffiCall: #(int xmlSetFeature(xmlParserCtxtPtr ctxt, const char* name, void* value))
]

{ #category : 'public' }
LibXml >> xmlSetGenericErrorFuncCtx: ctx handler: handler [
	"/** DOC_ENABLE */"

	self ffiCall: #(void xmlSetGenericErrorFunc(void* ctx, xmlGenericErrorFunc handler))
]

{ #category : 'public' }
LibXml >> xmlSetListDocList: list doc: doc [

	self ffiCall: #(int xmlSetListDoc(xmlNodePtr list, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlSetNsNode: node ns: ns [

	self ffiCall: #(void xmlSetNs(xmlNodePtr node, xmlNsPtr ns))
]

{ #category : 'public' }
LibXml >> xmlSetNsPropNode: node ns: ns name: name value: value [

	self ffiCall: #(xmlAttrPtr xmlSetNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlSetPropNode: node name: name value: value [

	self ffiCall: #(xmlAttrPtr xmlSetProp(xmlNodePtr node, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlSetStructuredErrorFuncCtx: ctx handler: handler [

	self ffiCall: #(void xmlSetStructuredErrorFunc(void* ctx, xmlStructuredErrorFunc handler))
]

{ #category : 'public' }
LibXml >> xmlSetTreeDocTree: tree doc: doc [

	self ffiCall: #(int xmlSetTreeDoc(xmlNodePtr tree, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlSetupParserForBufferCtxt: ctxt buffer: buffer filename: filename [

	self ffiCall: #(void xmlSetupParserForBuffer(xmlParserCtxtPtr ctxt, const xmlChar* buffer, const char* filename))
]

{ #category : 'public' }
LibXml >> xmlSnprintfElementContentBuf: buf size: size content: content englob: englob [

	self ffiCall: #(void xmlSnprintfElementContent(char* buf, int size, xmlElementContentPtr content, int englob))
]

{ #category : 'public' }
LibXml >> xmlSplitQName2Name: name prefix: prefix [

	self ffiCall: #(xmlChar* xmlSplitQName2(const xmlChar* name, xmlChar** prefix))
]

{ #category : 'public' }
LibXml >> xmlSplitQName3Name: name len: len [

	self ffiCall: #(const xmlChar* xmlSplitQName3(const xmlChar* name, int* len))
]

{ #category : 'public' }
LibXml >> xmlSprintfElementContentBuf: buf content: content englob: englob [

	self ffiCall: #(void xmlSprintfElementContent(char* buf, xmlElementContentPtr content, int englob))
]

{ #category : 'public' }
LibXml >> xmlStopParser: ctxt [

	self ffiCall: #(void xmlStopParser(xmlParserCtxtPtr ctxt))
]

{ #category : 'public' }
LibXml >> xmlStrEqualStr1: str1 str2: str2 [

	self ffiCall: #(int xmlStrEqual(const xmlChar* str1, const xmlChar* str2))
]

{ #category : 'public' }
LibXml >> xmlStrQEqualPref: pref name: name str: str [

	self ffiCall: #(int xmlStrQEqual(const xmlChar* pref, const xmlChar* name, const xmlChar* str))
]

{ #category : 'public' }
LibXml >> xmlStrcasecmpStr1: str1 str2: str2 [

	self ffiCall: #(int xmlStrcasecmp(const xmlChar* str1, const xmlChar* str2))
]

{ #category : 'public' }
LibXml >> xmlStrcasestr: str val: val [

	self ffiCall: #(const xmlChar* xmlStrcasestr(const xmlChar* str, const xmlChar* val))
]

{ #category : 'public' }
LibXml >> xmlStrcatCur: cur add: add [

	self ffiCall: #(xmlChar* xmlStrcat(xmlChar* cur, const xmlChar* add))
]

{ #category : 'public' }
LibXml >> xmlStrchrStr: str val: val [

	self ffiCall: #(const xmlChar* xmlStrchr(const xmlChar* str, xmlChar val))
]

{ #category : 'public' }
LibXml >> xmlStrcmpStr1: str1 str2: str2 [

	self ffiCall: #(int xmlStrcmp(const xmlChar* str1, const xmlChar* str2))
]

{ #category : 'public' }
LibXml >> xmlStrdup: cur [

	self ffiCall: #(xmlChar* xmlStrdup(const xmlChar* cur))
]

{ #category : 'public' }
LibXml >> xmlStringGetNodeListDoc: doc value: value [

	self ffiCall: #(xmlNodePtr xmlStringGetNodeList(const xmlDoc* doc, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlStringLenGetNodeListDoc: doc value: value len: len [

	self ffiCall: #(xmlNodePtr xmlStringLenGetNodeList(const xmlDoc* doc, const xmlChar* value, int len))
]

{ #category : 'public' }
LibXml >> xmlStrlen: str [

	self ffiCall: #(int xmlStrlen(const xmlChar* str))
]

{ #category : 'public' }
LibXml >> xmlStrncasecmpStr1: str1 str2: str2 len: len [

	self ffiCall: #(int xmlStrncasecmp(const xmlChar* str1, const xmlChar* str2, int len))
]

{ #category : 'public' }
LibXml >> xmlStrncatCur: cur add: add len: len [

	self ffiCall: #(xmlChar* xmlStrncat(xmlChar* cur, const xmlChar* add, int len))
]

{ #category : 'public' }
LibXml >> xmlStrncatNewStr1: str1 str2: str2 len: len [

	self ffiCall: #(xmlChar* xmlStrncatNew(const xmlChar* str1, const xmlChar* str2, int len))
]

{ #category : 'public' }
LibXml >> xmlStrncmpStr1: str1 str2: str2 len: len [

	self ffiCall: #(int xmlStrncmp(const xmlChar* str1, const xmlChar* str2, int len))
]

{ #category : 'public' }
LibXml >> xmlStrndupCur: cur len: len [

	self ffiCall: #(xmlChar* xmlStrndup(const xmlChar* cur, int len))
]

{ #category : 'public' }
LibXml >> xmlStrstr: str val: val [

	self ffiCall: #(const xmlChar* xmlStrstr(const xmlChar* str, const xmlChar* val))
]

{ #category : 'public' }
LibXml >> xmlStrsubStr: str start: start len: len [

	self ffiCall: #(xmlChar* xmlStrsub(const xmlChar* str, int start, int len))
]

{ #category : 'public' }
LibXml >> xmlSubstituteEntitiesDefault: val [

	self ffiCall: #(int xmlSubstituteEntitiesDefault(int val))
]

{ #category : 'public' }
LibXml >> xmlTextConcatNode: node content: content len: len [

	self ffiCall: #(int xmlTextConcat(xmlNodePtr node, const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlTextMergeFirst: first second: second [

	self ffiCall: #(xmlNodePtr xmlTextMerge(xmlNodePtr first, xmlNodePtr second))
]

{ #category : 'public' }
LibXml >> xmlTextReaderAttributeCount: reader [

	self ffiCall: #(int xmlTextReaderAttributeCount(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderBaseUri: reader [

	self ffiCall: #(xmlChar* xmlTextReaderBaseUri(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderByteConsumed: reader [

	self ffiCall: #(long xmlTextReaderByteConsumed(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderClose: reader [

	self ffiCall: #(int xmlTextReaderClose(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstBaseUri: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstBaseUri(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstEncoding: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstEncoding(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstLocalName: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstLocalName(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstName: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstName(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstNamespaceUri: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstNamespaceUri(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstPrefix: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstPrefix(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstStringReader: reader str: str [

	self ffiCall: #(const xmlChar* xmlTextReaderConstString(xmlTextReaderPtr reader, const xmlChar* str))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstValue: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstValue(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstXmlLang: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstXmlLang(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderConstXmlVersion: reader [

	self ffiCall: #(const xmlChar* xmlTextReaderConstXmlVersion(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderCurrentDoc: reader [

	self ffiCall: #(xmlDocPtr xmlTextReaderCurrentDoc(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderCurrentNode: reader [

	self ffiCall: #(xmlNodePtr xmlTextReaderCurrentNode(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderDepth: reader [

	self ffiCall: #(int xmlTextReaderDepth(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderExpand: reader [

	self ffiCall: #(xmlNodePtr xmlTextReaderExpand(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetAttributeNoReader: reader no: no [

	self ffiCall: #(xmlChar* xmlTextReaderGetAttributeNo(xmlTextReaderPtr reader, int no))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetAttributeNsReader: reader localName: localName namespaceURI: namespaceURI [

	self ffiCall: #(xmlChar* xmlTextReaderGetAttributeNs(xmlTextReaderPtr reader, const xmlChar* localName, const xmlChar* namespaceURI))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetAttributeReader: reader name: name [

	self ffiCall: #(xmlChar* xmlTextReaderGetAttribute(xmlTextReaderPtr reader, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetErrorHandlerReader: reader f: f arg: arg [

	self ffiCall: #(void xmlTextReaderGetErrorHandler(xmlTextReaderPtr reader, xmlTextReaderErrorFunc* f, void** arg))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetLastError: reader [

	self ffiCall: #(const xmlError* xmlTextReaderGetLastError(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetParserColumnNumber: reader [

	self ffiCall: #(int xmlTextReaderGetParserColumnNumber(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetParserLineNumber: reader [

	self ffiCall: #(int xmlTextReaderGetParserLineNumber(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetParserPropReader: reader prop: prop [

	self ffiCall: #(int xmlTextReaderGetParserProp(xmlTextReaderPtr reader, int prop))
]

{ #category : 'public' }
LibXml >> xmlTextReaderGetRemainder: reader [

	self ffiCall: #(xmlParserInputBufferPtr xmlTextReaderGetRemainder(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderHasAttributes: reader [

	self ffiCall: #(int xmlTextReaderHasAttributes(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderHasValue: reader [

	self ffiCall: #(int xmlTextReaderHasValue(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderIsDefault: reader [

	self ffiCall: #(int xmlTextReaderIsDefault(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderIsEmptyElement: reader [

	self ffiCall: #(int xmlTextReaderIsEmptyElement(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderIsNamespaceDecl: reader [

	self ffiCall: #(int xmlTextReaderIsNamespaceDecl(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderIsValid: reader [

	self ffiCall: #(int xmlTextReaderIsValid(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderLocalName: reader [

	self ffiCall: #(xmlChar* xmlTextReaderLocalName(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderLocatorBaseURI: locator [

	self ffiCall: #(xmlChar* xmlTextReaderLocatorBaseURI(xmlTextReaderLocatorPtr locator))
]

{ #category : 'public' }
LibXml >> xmlTextReaderLocatorLineNumber: locator [

	self ffiCall: #(int xmlTextReaderLocatorLineNumber(xmlTextReaderLocatorPtr locator))
]

{ #category : 'public' }
LibXml >> xmlTextReaderLookupNamespaceReader: reader prefix: prefix [

	self ffiCall: #(xmlChar* xmlTextReaderLookupNamespace(xmlTextReaderPtr reader, const xmlChar* prefix))
]

{ #category : 'public' }
LibXml >> xmlTextReaderMoveToAttributeNoReader: reader no: no [

	self ffiCall: #(int xmlTextReaderMoveToAttributeNo(xmlTextReaderPtr reader, int no))
]

{ #category : 'public' }
LibXml >> xmlTextReaderMoveToAttributeNsReader: reader localName: localName namespaceURI: namespaceURI [

	self ffiCall: #(int xmlTextReaderMoveToAttributeNs(xmlTextReaderPtr reader, const xmlChar* localName, const xmlChar* namespaceURI))
]

{ #category : 'public' }
LibXml >> xmlTextReaderMoveToAttributeReader: reader name: name [

	self ffiCall: #(int xmlTextReaderMoveToAttribute(xmlTextReaderPtr reader, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextReaderMoveToElement: reader [

	self ffiCall: #(int xmlTextReaderMoveToElement(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderMoveToFirstAttribute: reader [

	self ffiCall: #(int xmlTextReaderMoveToFirstAttribute(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderMoveToNextAttribute: reader [

	self ffiCall: #(int xmlTextReaderMoveToNextAttribute(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderName: reader [

	self ffiCall: #(xmlChar* xmlTextReaderName(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderNamespaceUri: reader [

	self ffiCall: #(xmlChar* xmlTextReaderNamespaceUri(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderNext: reader [

	self ffiCall: #(int xmlTextReaderNext(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderNextSibling: reader [

	self ffiCall: #(int xmlTextReaderNextSibling(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderNodeType: reader [

	self ffiCall: #(int xmlTextReaderNodeType(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderNormalization: reader [

	self ffiCall: #(int xmlTextReaderNormalization(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderPrefix: reader [

	self ffiCall: #(xmlChar* xmlTextReaderPrefix(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderPreserve: reader [

	self ffiCall: #(xmlNodePtr xmlTextReaderPreserve(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderPreservePatternReader: reader pattern: pattern namespaces: namespaces [

	self ffiCall: #(int xmlTextReaderPreservePattern(xmlTextReaderPtr reader, const xmlChar* pattern, const xmlChar** namespaces))
]

{ #category : 'public' }
LibXml >> xmlTextReaderQuoteChar: reader [

	self ffiCall: #(int xmlTextReaderQuoteChar(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderRead: reader [

	self ffiCall: #(int xmlTextReaderRead(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderReadAttributeValue: reader [

	self ffiCall: #(int xmlTextReaderReadAttributeValue(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderReadInnerXml: reader [

	self ffiCall: #(xmlChar* xmlTextReaderReadInnerXml(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderReadOuterXml: reader [

	self ffiCall: #(xmlChar* xmlTextReaderReadOuterXml(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderReadState: reader [

	self ffiCall: #(int xmlTextReaderReadState(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderReadString: reader [

	self ffiCall: #(xmlChar* xmlTextReaderReadString(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderRelaxNGSetSchemaReader: reader schema: schema [

	self ffiCall: #(int xmlTextReaderRelaxNGSetSchema(xmlTextReaderPtr reader, xmlRelaxNGPtr schema))
]

{ #category : 'public' }
LibXml >> xmlTextReaderRelaxNGValidateCtxtReader: reader ctxt: ctxt options: options [

	self ffiCall: #(int xmlTextReaderRelaxNGValidateCtxt(xmlTextReaderPtr reader, xmlRelaxNGValidCtxtPtr ctxt, int options))
]

{ #category : 'public' }
LibXml >> xmlTextReaderRelaxNGValidateReader: reader rng: rng [

	self ffiCall: #(int xmlTextReaderRelaxNGValidate(xmlTextReaderPtr reader, const char* rng))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSchemaValidateCtxtReader: reader ctxt: ctxt options: options [

	self ffiCall: #(int xmlTextReaderSchemaValidateCtxt(xmlTextReaderPtr reader, xmlSchemaValidCtxtPtr ctxt, int options))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSchemaValidateReader: reader xsd: xsd [

	self ffiCall: #(int xmlTextReaderSchemaValidate(xmlTextReaderPtr reader, const char* xsd))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSetErrorHandlerReader: reader f: f arg: arg [

	self ffiCall: #(void xmlTextReaderSetErrorHandler(xmlTextReaderPtr reader, xmlTextReaderErrorFunc f, void* arg))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSetMaxAmplificationReader: reader maxAmpl: maxAmpl [

	self ffiCall: #(void xmlTextReaderSetMaxAmplification(xmlTextReaderPtr reader, uint maxAmpl))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSetParserPropReader: reader prop: prop value: value [

	self ffiCall: #(int xmlTextReaderSetParserProp(xmlTextReaderPtr reader, int prop, int value))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSetSchemaReader: reader schema: schema [

	self ffiCall: #(int xmlTextReaderSetSchema(xmlTextReaderPtr reader, xmlSchemaPtr schema))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSetStructuredErrorHandlerReader: reader f: f arg: arg [

	self ffiCall: #(void xmlTextReaderSetStructuredErrorHandler(xmlTextReaderPtr reader, xmlStructuredErrorFunc f, void* arg))
]

{ #category : 'public' }
LibXml >> xmlTextReaderSetupReader: reader input: input URL: URL encoding: encoding options: options [

	self ffiCall: #(int xmlTextReaderSetup(xmlTextReaderPtr reader, xmlParserInputBufferPtr input, const char* URL, const char* encoding, int options))
]

{ #category : 'public' }
LibXml >> xmlTextReaderStandalone: reader [

	self ffiCall: #(int xmlTextReaderStandalone(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderValue: reader [

	self ffiCall: #(xmlChar* xmlTextReaderValue(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextReaderXmlLang: reader [

	self ffiCall: #(xmlChar* xmlTextReaderXmlLang(xmlTextReaderPtr reader))
]

{ #category : 'public' }
LibXml >> xmlTextWriterClose: writer [

	self ffiCall: #(int xmlTextWriterClose(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndAttribute: writer [

	self ffiCall: #(int xmlTextWriterEndAttribute(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndCDATA: writer [

	self ffiCall: #(int xmlTextWriterEndCDATA(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndComment: writer [

	self ffiCall: #(int xmlTextWriterEndComment(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndDTD: writer [

	self ffiCall: #(int xmlTextWriterEndDTD(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndDTDAttlist: writer [

	self ffiCall: #(int xmlTextWriterEndDTDAttlist(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndDTDElement: writer [

	self ffiCall: #(int xmlTextWriterEndDTDElement(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndDTDEntity: writer [

	self ffiCall: #(int xmlTextWriterEndDTDEntity(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndDocument: writer [

	self ffiCall: #(int xmlTextWriterEndDocument(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndElement: writer [

	self ffiCall: #(int xmlTextWriterEndElement(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterEndPI: writer [

	self ffiCall: #(int xmlTextWriterEndPI(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterFlush: writer [

	self ffiCall: #(int xmlTextWriterFlush(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterFullEndElement: writer [

	self ffiCall: #(int xmlTextWriterFullEndElement(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterSetIndentStringWriter: writer str: str [

	self ffiCall: #(int xmlTextWriterSetIndentString(xmlTextWriterPtr writer, const xmlChar* str))
]

{ #category : 'public' }
LibXml >> xmlTextWriterSetIndentWriter: writer indent: indent [

	self ffiCall: #(int xmlTextWriterSetIndent(xmlTextWriterPtr writer, int indent))
]

{ #category : 'public' }
LibXml >> xmlTextWriterSetQuoteCharWriter: writer quotechar: quotechar [

	self ffiCall: #(int xmlTextWriterSetQuoteChar(xmlTextWriterPtr writer, xmlChar quotechar))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartAttributeNSWriter: writer prefix: prefix name: name namespaceURI: namespaceURI [

	self ffiCall: #(int xmlTextWriterStartAttributeNS(xmlTextWriterPtr writer, const xmlChar* prefix, const xmlChar* name, const xmlChar* namespaceURI))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartAttributeWriter: writer name: name [

	self ffiCall: #(int xmlTextWriterStartAttribute(xmlTextWriterPtr writer, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartCDATA: writer [

	self ffiCall: #(int xmlTextWriterStartCDATA(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartComment: writer [

	self ffiCall: #(int xmlTextWriterStartComment(xmlTextWriterPtr writer))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartDTDAttlistWriter: writer name: name [

	self ffiCall: #(int xmlTextWriterStartDTDAttlist(xmlTextWriterPtr writer, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartDTDElementWriter: writer name: name [

	self ffiCall: #(int xmlTextWriterStartDTDElement(xmlTextWriterPtr writer, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartDTDEntityWriter: writer pe: pe name: name [

	self ffiCall: #(int xmlTextWriterStartDTDEntity(xmlTextWriterPtr writer, int pe, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartDTDWriter: writer name: name pubid: pubid sysid: sysid [

	self ffiCall: #(int xmlTextWriterStartDTD(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* pubid, const xmlChar* sysid))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartDocumentWriter: writer version: version encoding: encoding standalone: standalone [

	self ffiCall: #(int xmlTextWriterStartDocument(xmlTextWriterPtr writer, const char* version, const char* encoding, const char* standalone))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartElementNSWriter: writer prefix: prefix name: name namespaceURI: namespaceURI [

	self ffiCall: #(int xmlTextWriterStartElementNS(xmlTextWriterPtr writer, const xmlChar* prefix, const xmlChar* name, const xmlChar* namespaceURI))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartElementWriter: writer name: name [

	self ffiCall: #(int xmlTextWriterStartElement(xmlTextWriterPtr writer, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlTextWriterStartPIWriter: writer target: target [

	self ffiCall: #(int xmlTextWriterStartPI(xmlTextWriterPtr writer, const xmlChar* target))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteAttributeNSWriter: writer prefix: prefix name: name namespaceURI: namespaceURI content: content [

	self ffiCall: #(int xmlTextWriterWriteAttributeNS(xmlTextWriterPtr writer, const xmlChar* prefix, const xmlChar* name, const xmlChar* namespaceURI, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteAttributeWriter: writer name: name content: content [

	self ffiCall: #(int xmlTextWriterWriteAttribute(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteBase64Writer: writer data: data start: start len: len [

	self ffiCall: #(int xmlTextWriterWriteBase64(xmlTextWriterPtr writer, const char* data, int start, int len))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteBinHexWriter: writer data: data start: start len: len [

	self ffiCall: #(int xmlTextWriterWriteBinHex(xmlTextWriterPtr writer, const char* data, int start, int len))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteCDATAWriter: writer content: content [

	self ffiCall: #(int xmlTextWriterWriteCDATA(xmlTextWriterPtr writer, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteCommentWriter: writer content: content [

	self ffiCall: #(int xmlTextWriterWriteComment(xmlTextWriterPtr writer, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDAttlistWriter: writer name: name content: content [

	self ffiCall: #(int xmlTextWriterWriteDTDAttlist(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDElementWriter: writer name: name content: content [

	self ffiCall: #(int xmlTextWriterWriteDTDElement(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDEntityWriter: writer pe: pe name: name pubid: pubid sysid: sysid ndataid: ndataid content: content [

	self ffiCall: #(int xmlTextWriterWriteDTDEntity(xmlTextWriterPtr writer, int pe, const xmlChar* name, const xmlChar* pubid, const xmlChar* sysid, const xmlChar* ndataid, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDExternalEntityContentsWriter: writer pubid: pubid sysid: sysid ndataid: ndataid [

	self ffiCall: #(int xmlTextWriterWriteDTDExternalEntityContents(xmlTextWriterPtr writer, const xmlChar* pubid, const xmlChar* sysid, const xmlChar* ndataid))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDExternalEntityWriter: writer pe: pe name: name pubid: pubid sysid: sysid ndataid: ndataid [

	self ffiCall: #(int xmlTextWriterWriteDTDExternalEntity(xmlTextWriterPtr writer, int pe, const xmlChar* name, const xmlChar* pubid, const xmlChar* sysid, const xmlChar* ndataid))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDInternalEntityWriter: writer pe: pe name: name content: content [

	self ffiCall: #(int xmlTextWriterWriteDTDInternalEntity(xmlTextWriterPtr writer, int pe, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDNotationWriter: writer name: name pubid: pubid sysid: sysid [

	self ffiCall: #(int xmlTextWriterWriteDTDNotation(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* pubid, const xmlChar* sysid))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteDTDWriter: writer name: name pubid: pubid sysid: sysid subset: subset [

	self ffiCall: #(int xmlTextWriterWriteDTD(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* pubid, const xmlChar* sysid, const xmlChar* subset))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteElementNSWriter: writer prefix: prefix name: name namespaceURI: namespaceURI content: content [

	self ffiCall: #(int xmlTextWriterWriteElementNS(xmlTextWriterPtr writer, const xmlChar* prefix, const xmlChar* name, const xmlChar* namespaceURI, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteElementWriter: writer name: name content: content [

	self ffiCall: #(int xmlTextWriterWriteElement(xmlTextWriterPtr writer, const xmlChar* name, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWritePIWriter: writer target: target content: content [

	self ffiCall: #(int xmlTextWriterWritePI(xmlTextWriterPtr writer, const xmlChar* target, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteRawLenWriter: writer content: content len: len [

	self ffiCall: #(int xmlTextWriterWriteRawLen(xmlTextWriterPtr writer, const xmlChar* content, int len))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteRawWriter: writer content: content [

	self ffiCall: #(int xmlTextWriterWriteRaw(xmlTextWriterPtr writer, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlTextWriterWriteStringWriter: writer content: content [

	self ffiCall: #(int xmlTextWriterWriteString(xmlTextWriterPtr writer, const xmlChar* content))
]

{ #category : 'public' }
LibXml >> xmlThrDefBufferAllocScheme: v [

	self ffiCall: #(xmlBufferAllocationScheme xmlThrDefBufferAllocScheme(xmlBufferAllocationScheme v))
]

{ #category : 'public' }
LibXml >> xmlThrDefDefaultBufferSize: v [

	self ffiCall: #(int xmlThrDefDefaultBufferSize(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefDeregisterNodeDefault: func [

	self ffiCall: #(xmlDeregisterNodeFunc xmlThrDefDeregisterNodeDefault(xmlDeregisterNodeFunc func))
]

{ #category : 'public' }
LibXml >> xmlThrDefDoValidityCheckingDefaultValue: v [

	self ffiCall: #(int xmlThrDefDoValidityCheckingDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefGetWarningsDefaultValue: v [

	self ffiCall: #(int xmlThrDefGetWarningsDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefKeepBlanksDefaultValue: v [

	self ffiCall: #(int xmlThrDefKeepBlanksDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefLineNumbersDefaultValue: v [

	self ffiCall: #(int xmlThrDefLineNumbersDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefLoadExtDtdDefaultValue: v [

	self ffiCall: #(int xmlThrDefLoadExtDtdDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefOutputBufferCreateFilenameDefault: func [

	self ffiCall: #(xmlOutputBufferCreateFilenameFunc xmlThrDefOutputBufferCreateFilenameDefault(xmlOutputBufferCreateFilenameFunc func))
]

{ #category : 'public' }
LibXml >> xmlThrDefParserDebugEntities: v [

	self ffiCall: #(int xmlThrDefParserDebugEntities(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefParserInputBufferCreateFilenameDefault: func [

	self ffiCall: #(xmlParserInputBufferCreateFilenameFunc xmlThrDefParserInputBufferCreateFilenameDefault(xmlParserInputBufferCreateFilenameFunc func))
]

{ #category : 'public' }
LibXml >> xmlThrDefPedanticParserDefaultValue: v [

	self ffiCall: #(int xmlThrDefPedanticParserDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlThrDefRegisterNodeDefault: func [

	self ffiCall: #(xmlRegisterNodeFunc xmlThrDefRegisterNodeDefault(xmlRegisterNodeFunc func))
]

{ #category : 'public' }
LibXml >> xmlThrDefSetGenericErrorFuncCtx: ctx handler: handler [

	self ffiCall: #(void xmlThrDefSetGenericErrorFunc(void* ctx, xmlGenericErrorFunc handler))
]

{ #category : 'public' }
LibXml >> xmlThrDefSetStructuredErrorFuncCtx: ctx handler: handler [

	self ffiCall: #(void xmlThrDefSetStructuredErrorFunc(void* ctx, xmlStructuredErrorFunc handler))
]

{ #category : 'public' }
LibXml >> xmlThrDefSubstituteEntitiesDefaultValue: v [

	self ffiCall: #(int xmlThrDefSubstituteEntitiesDefaultValue(int v))
]

{ #category : 'public' }
LibXml >> xmlUTF8CharcmpUtf1: utf1 utf2: utf2 [

	self ffiCall: #(int xmlUTF8Charcmp(const xmlChar* utf1, const xmlChar* utf2))
]

{ #category : 'public' }
LibXml >> xmlUTF8Size: utf [

	self ffiCall: #(int xmlUTF8Size(const xmlChar* utf))
]

{ #category : 'public' }
LibXml >> xmlUTF8Strlen: utf [

	self ffiCall: #(int xmlUTF8Strlen(const xmlChar* utf))
]

{ #category : 'public' }
LibXml >> xmlUTF8StrlocUtf: utf utfchar: utfchar [

	self ffiCall: #(int xmlUTF8Strloc(const xmlChar* utf, const xmlChar* utfchar))
]

{ #category : 'public' }
LibXml >> xmlUTF8StrndupUtf: utf len: len [

	self ffiCall: #(xmlChar* xmlUTF8Strndup(const xmlChar* utf, int len))
]

{ #category : 'public' }
LibXml >> xmlUTF8StrposUtf: utf pos: pos [

	self ffiCall: #(const xmlChar* xmlUTF8Strpos(const xmlChar* utf, int pos))
]

{ #category : 'public' }
LibXml >> xmlUTF8StrsizeUtf: utf len: len [

	self ffiCall: #(int xmlUTF8Strsize(const xmlChar* utf, int len))
]

{ #category : 'public' }
LibXml >> xmlUTF8StrsubUtf: utf start: start len: len [

	self ffiCall: #(xmlChar* xmlUTF8Strsub(const xmlChar* utf, int start, int len))
]

{ #category : 'public' }
LibXml >> xmlUnlinkNode: cur [

	self ffiCall: #(void xmlUnlinkNode(xmlNodePtr cur))
]

{ #category : 'public' }
LibXml >> xmlUnlockLibrary [

	self ffiCall: #(void xmlUnlockLibrary())
]

{ #category : 'public' }
LibXml >> xmlUnsetNsPropNode: node ns: ns name: name [

	self ffiCall: #(int xmlUnsetNsProp(xmlNodePtr node, xmlNsPtr ns, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlUnsetPropNode: node name: name [

	self ffiCall: #(int xmlUnsetProp(xmlNodePtr node, const xmlChar* name))
]

{ #category : 'public' }
LibXml >> xmlValidBuildContentModelCtxt: ctxt elem: elem [

	self ffiCall: #(int xmlValidBuildContentModel(xmlValidCtxtPtr ctxt, xmlElementPtr elem))
]

{ #category : 'public' }
LibXml >> xmlValidCtxtNormalizeAttributeValueCtxt: ctxt doc: doc elem: elem name: name value: value [

	self ffiCall: #(xmlChar* xmlValidCtxtNormalizeAttributeValue(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidGetPotentialChildrenCtree: ctree names: names len: len max: max [

	self ffiCall: #(int xmlValidGetPotentialChildren(xmlElementContent* ctree, const xmlChar** names, int* len, int max))
]

{ #category : 'public' }
LibXml >> xmlValidGetValidElementsPrev: prev next: next names: names max: max [

	self ffiCall: #(int xmlValidGetValidElements(xmlNode* prev, xmlNode* next, const xmlChar** names, int max))
]

{ #category : 'public' }
LibXml >> xmlValidNormalizeAttributeValueDoc: doc elem: elem name: name value: value [

	self ffiCall: #(xmlChar* xmlValidNormalizeAttributeValue(xmlDocPtr doc, xmlNodePtr elem, const xmlChar* name, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateAttributeDeclCtxt: ctxt doc: doc attr: attr [

	self ffiCall: #(int xmlValidateAttributeDecl(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlAttributePtr attr))
]

{ #category : 'public' }
LibXml >> xmlValidateAttributeValueType: type value: value [

	self ffiCall: #(int xmlValidateAttributeValue(xmlAttributeType type, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateDocumentCtxt: ctxt doc: doc [

	self ffiCall: #(int xmlValidateDocument(xmlValidCtxtPtr ctxt, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlValidateDocumentFinalCtxt: ctxt doc: doc [

	self ffiCall: #(int xmlValidateDocumentFinal(xmlValidCtxtPtr ctxt, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlValidateDtdCtxt: ctxt doc: doc dtd: dtd [

	self ffiCall: #(int xmlValidateDtd(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlDtdPtr dtd))
]

{ #category : 'public' }
LibXml >> xmlValidateDtdFinalCtxt: ctxt doc: doc [

	self ffiCall: #(int xmlValidateDtdFinal(xmlValidCtxtPtr ctxt, xmlDocPtr doc))
]

{ #category : 'public' }
LibXml >> xmlValidateElementCtxt: ctxt doc: doc elem: elem [

	self ffiCall: #(int xmlValidateElement(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlValidateElementDeclCtxt: ctxt doc: doc elem: elem [

	self ffiCall: #(int xmlValidateElementDecl(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlElementPtr elem))
]

{ #category : 'public' }
LibXml >> xmlValidateNCNameValue: value space: space [
	"/** DOC_ENABLE */"

	self ffiCall: #(int xmlValidateNCName(const xmlChar* value, int space))
]

{ #category : 'public' }
LibXml >> xmlValidateNMTokenValue: value space: space [

	self ffiCall: #(int xmlValidateNMToken(const xmlChar* value, int space))
]

{ #category : 'public' }
LibXml >> xmlValidateNameValue: value [

	self ffiCall: #(int xmlValidateNameValue(const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateNameValue: value space: space [

	self ffiCall: #(int xmlValidateName(const xmlChar* value, int space))
]

{ #category : 'public' }
LibXml >> xmlValidateNamesValue: value [

	self ffiCall: #(int xmlValidateNamesValue(const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateNmtokenValue: value [

	self ffiCall: #(int xmlValidateNmtokenValue(const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateNmtokensValue: value [

	self ffiCall: #(int xmlValidateNmtokensValue(const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateNotationDeclCtxt: ctxt doc: doc nota: nota [

	self ffiCall: #(int xmlValidateNotationDecl(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNotationPtr nota))
]

{ #category : 'public' }
LibXml >> xmlValidateNotationUseCtxt: ctxt doc: doc notationName: notationName [

	self ffiCall: #(int xmlValidateNotationUse(xmlValidCtxtPtr ctxt, xmlDocPtr doc, const xmlChar* notationName))
]

{ #category : 'public' }
LibXml >> xmlValidateOneAttributeCtxt: ctxt doc: doc elem: elem attr: attr value: value [

	self ffiCall: #(int xmlValidateOneAttribute(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem, xmlAttrPtr attr, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidateOneElementCtxt: ctxt doc: doc elem: elem [

	self ffiCall: #(int xmlValidateOneElement(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem))
]

{ #category : 'public' }
LibXml >> xmlValidateOneNamespaceCtxt: ctxt doc: doc elem: elem prefix: prefix ns: ns value: value [

	self ffiCall: #(int xmlValidateOneNamespace(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem, const xmlChar* prefix, xmlNsPtr ns, const xmlChar* value))
]

{ #category : 'public' }
LibXml >> xmlValidatePopElementCtxt: ctxt doc: doc elem: elem qname: qname [

	self ffiCall: #(int xmlValidatePopElement(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem, const xmlChar* qname))
]

{ #category : 'public' }
LibXml >> xmlValidatePushCDataCtxt: ctxt data: data len: len [

	self ffiCall: #(int xmlValidatePushCData(xmlValidCtxtPtr ctxt, const xmlChar* data, int len))
]

{ #category : 'public' }
LibXml >> xmlValidatePushElementCtxt: ctxt doc: doc elem: elem qname: qname [

	self ffiCall: #(int xmlValidatePushElement(xmlValidCtxtPtr ctxt, xmlDocPtr doc, xmlNodePtr elem, const xmlChar* qname))
]

{ #category : 'public' }
LibXml >> xmlValidateQNameValue: value space: space [

	self ffiCall: #(int xmlValidateQName(const xmlChar* value, int space))
]

{ #category : 'public' }
LibXml >> xmlValidateRootCtxt: ctxt doc: doc [

	self ffiCall: #(int xmlValidateRoot(xmlValidCtxtPtr ctxt, xmlDocPtr doc))
]
