Class {
	#name : 'Xml_xmlParserCtxt',
	#superclass : 'XmlStructure',
	#classVars : [
		'OFFSET_ATTALLOCS',
		'OFFSET_ATTRHASH',
		'OFFSET_ATTRHASHMAX',
		'OFFSET_ATTS',
		'OFFSET_ATTSDEFAULT',
		'OFFSET_ATTSSPECIAL',
		'OFFSET_CATALOGS',
		'OFFSET_CHARSET',
		'OFFSET_CHECKINDEX',
		'OFFSET_DEPTH',
		'OFFSET_DICT',
		'OFFSET_DICTNAMES',
		'OFFSET_DIRECTORY',
		'OFFSET_DISABLESAX',
		'OFFSET_DOCDICT',
		'OFFSET_ENCODING',
		'OFFSET_ENDCHECKSTATE',
		'OFFSET_ENTITY',
		'OFFSET_ERRNO',
		'OFFSET_ERRORCTXT',
		'OFFSET_ERRORHANDLER',
		'OFFSET_EXTERNAL',
		'OFFSET_EXTSUBSYSTEM',
		'OFFSET_EXTSUBURI',
		'OFFSET_FREEATTRS',
		'OFFSET_FREEATTRSNR',
		'OFFSET_FREEELEMS',
		'OFFSET_FREEELEMSNR',
		'OFFSET_HASEXTERNALSUBSET',
		'OFFSET_HASPEREFS',
		'OFFSET_HTML',
		'OFFSET_INPUT',
		'OFFSET_INPUTMAX',
		'OFFSET_INPUTNR',
		'OFFSET_INPUTTAB',
		'OFFSET_INPUT_ID',
		'OFFSET_INSTATE',
		'OFFSET_INSUBSET',
		'OFFSET_INTSUBNAME',
		'OFFSET_KEEPBLANKS',
		'OFFSET_LASTERROR',
		'OFFSET_LINENUMBERS',
		'OFFSET_LOADSUBSET',
		'OFFSET_MAXAMPL',
		'OFFSET_MAXATTS',
		'OFFSET_MYDOC',
		'OFFSET_NAME',
		'OFFSET_NAMEMAX',
		'OFFSET_NAMENR',
		'OFFSET_NAMETAB',
		'OFFSET_NBCHARS',
		'OFFSET_NBENTITIES',
		'OFFSET_NBERRORS',
		'OFFSET_NBWARNINGS',
		'OFFSET_NODE',
		'OFFSET_NODEINFO',
		'OFFSET_NODEINFOMAX',
		'OFFSET_NODEINFONR',
		'OFFSET_NODEINFOTAB',
		'OFFSET_NODELEN',
		'OFFSET_NODEMAX',
		'OFFSET_NODEMEM',
		'OFFSET_NODENR',
		'OFFSET_NODETAB',
		'OFFSET_NODE_SEQ',
		'OFFSET_NSDB',
		'OFFSET_NSMAX',
		'OFFSET_NSNR',
		'OFFSET_NSTAB',
		'OFFSET_NSWELLFORMED',
		'OFFSET_OPTIONS',
		'OFFSET_PARSEMODE',
		'OFFSET_PEDANTIC',
		'OFFSET_PROGRESSIVE',
		'OFFSET_PUSHTAB',
		'OFFSET_RECORD_INFO',
		'OFFSET_RECOVERY',
		'OFFSET_REPLACEENTITIES',
		'OFFSET_SAX',
		'OFFSET_SAX2',
		'OFFSET_SIZEENTCOPY',
		'OFFSET_SIZEENTITIES',
		'OFFSET_SPACE',
		'OFFSET_SPACEMAX',
		'OFFSET_SPACENR',
		'OFFSET_SPACETAB',
		'OFFSET_STANDALONE',
		'OFFSET_STR_XML',
		'OFFSET_STR_XMLNS',
		'OFFSET_STR_XML_NS',
		'OFFSET_TOKEN',
		'OFFSET_USERDATA',
		'OFFSET_VALID',
		'OFFSET_VALIDATE',
		'OFFSET_VCTXT',
		'OFFSET_VERSION',
		'OFFSET_WELLFORMED',
		'OFFSET__PRIVATE'
	],
	#category : 'LibXml-Base',
	#package : 'LibXml',
	#tag : 'Base'
}

{ #category : 'field definition' }
Xml_xmlParserCtxt class >> fieldsDesc [

	^ #(
	_xmlSAXHandler* sax;
	void* userData;
	xmlDocPtr myDoc;
	int wellFormed;
	int replaceEntities;
	xmlChar* version;
	xmlChar* encoding;
	int standalone;
	int html;
	xmlParserInputPtr input;
	int inputNr;
	int inputMax;
	xmlParserInputPtr* inputTab;
	xmlNodePtr node;
	int nodeNr;
	int nodeMax;
	xmlNodePtr* nodeTab;
	int record_info;
	xmlParserNodeInfoSeq node_seq;
	int errNo;
	int hasExternalSubset;
	int hasPErefs;
	int external;
	int valid;
	int validate;
	xmlValidCtxt vctxt;
	xmlParserInputState instate;
	int token;
	char* directory;
	xmlChar* name;
	int nameNr;
	int nameMax;
	xmlChar** nameTab;
	long nbChars;
	long checkIndex;
	int keepBlanks;
	int disableSAX;
	int inSubset;
	xmlChar* intSubName;
	xmlChar* extSubURI;
	xmlChar* extSubSystem;
	int* space;
	int spaceNr;
	int spaceMax;
	int* spaceTab;
	int depth;
	xmlParserInputPtr entity;
	int charset;
	int nodelen;
	int nodemem;
	int pedantic;
	void* _private;
	int loadsubset;
	int linenumbers;
	void* catalogs;
	int recovery;
	int progressive;
	xmlDictPtr dict;
	xmlChar** atts;
	int maxatts;
	int docdict;
	xmlChar* str_xml;
	xmlChar* str_xmlns;
	xmlChar* str_xml_ns;
	int sax2;
	int nsNr;
	int nsMax;
	xmlChar** nsTab;
	uint* attallocs;
	xmlStartTag* pushTab;
	xmlHashTablePtr attsDefault;
	xmlHashTablePtr attsSpecial;
	int nsWellFormed;
	int options;
	int dictNames;
	int freeElemsNr;
	xmlNodePtr freeElems;
	int freeAttrsNr;
	xmlAttrPtr freeAttrs;
	xmlError lastError;
	xmlParserMode parseMode;
	ulong nbentities;
	ulong sizeentities;
	xmlParserNodeInfo* nodeInfo;
	int nodeInfoNr;
	int nodeInfoMax;
	xmlParserNodeInfo* nodeInfoTab;
	int input_id;
	ulong sizeentcopy;
	int endCheckState;
	ushort nbErrors;
	ushort nbWarnings;
	uint maxAmpl;
	xmlParserNsData* nsdb;
	uint attrHashMax;
	xmlAttrHashBucket* attrHash;
	xmlStructuredErrorFunc errorHandler;
	void* errorCtxt
	)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> _private [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__PRIVATE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> _private: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__PRIVATE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attallocs [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ATTALLOCS) type: ExternalType ulong asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attallocs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ATTALLOCS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attrHash [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ATTRHASH) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attrHash: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ATTRHASH put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attrHashMax [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_ATTRHASHMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attrHashMax: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ATTRHASHMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> atts [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ATTS) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> atts: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ATTS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attsDefault [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ATTSDEFAULT) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attsDefault: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ATTSDEFAULT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attsSpecial [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ATTSSPECIAL) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> attsSpecial: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ATTSSPECIAL put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> catalogs [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_CATALOGS) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> catalogs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CATALOGS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> charset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_CHARSET
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> charset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_CHARSET put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> checkIndex [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_CHECKINDEX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> checkIndex: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_CHECKINDEX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> depth [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DEPTH
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> depth: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DEPTH put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> dict [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DICT) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> dict: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DICT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> dictNames [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DICTNAMES
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> dictNames: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DICTNAMES put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> directory [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_DIRECTORY) type: ExternalType char asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> directory: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DIRECTORY put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> disableSAX [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DISABLESAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> disableSAX: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DISABLESAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> docdict [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_DOCDICT
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> docdict: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_DOCDICT put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> encoding [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ENCODING) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> encoding: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ENCODING put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> endCheckState [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ENDCHECKSTATE
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> endCheckState: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ENDCHECKSTATE put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> entity [
	"This method was automatically generated"
	^Xml_xmlParserInput fromHandle: (handle pointerAt: OFFSET_ENTITY)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> entity: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ENTITY put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> errNo [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_ERRNO
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> errNo: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_ERRNO put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> errorCtxt [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_ERRORCTXT) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> errorCtxt: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ERRORCTXT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> errorHandler [
	"This method was automatically generated"
	^FFICallback forAddress: ((handle pointerAt: OFFSET_ERRORHANDLER) asInteger)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> errorHandler: anObject [
	"This method was automatically generated"
	handle 
		pointerAt: OFFSET_ERRORHANDLER
		put: (anObject 
			ifNotNil: [ anObject thunk asExternalAddress ]
			ifNil: [ ExternalAddress null ])
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> extSubSystem [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_EXTSUBSYSTEM) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> extSubSystem: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_EXTSUBSYSTEM put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> extSubURI [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_EXTSUBURI) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> extSubURI: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_EXTSUBURI put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> external [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_EXTERNAL
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> external: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_EXTERNAL put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeAttrs [
	"This method was automatically generated"
	^Xml_xmlAttr fromHandle: (handle pointerAt: OFFSET_FREEATTRS)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeAttrs: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FREEATTRS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeAttrsNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FREEATTRSNR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeAttrsNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FREEATTRSNR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeElems [
	"This method was automatically generated"
	^Xml_xmlNode fromHandle: (handle pointerAt: OFFSET_FREEELEMS)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeElems: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_FREEELEMS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeElemsNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_FREEELEMSNR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> freeElemsNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_FREEELEMSNR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> hasExternalSubset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HASEXTERNALSUBSET
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> hasExternalSubset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HASEXTERNALSUBSET put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> hasPErefs [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HASPEREFS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> hasPErefs: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HASPEREFS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> html [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_HTML
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> html: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_HTML put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inSubset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INSUBSET
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inSubset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INSUBSET put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> input [
	"This method was automatically generated"
	^Xml_xmlParserInput fromHandle: (handle pointerAt: OFFSET_INPUT)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> input: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_INPUT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inputMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INPUTMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inputMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INPUTMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inputNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INPUTNR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inputNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INPUTNR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inputTab [
	"This method was automatically generated"
	^Xml_xmlParserInput fromHandle: (handle pointerAt: OFFSET_INPUTTAB)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> inputTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_INPUTTAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> input_id [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_INPUT_ID
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> input_id: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_INPUT_ID put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> instate [
	"This method was automatically generated"
	^XmlParserInputState fromInteger: (handle unsignedLongAt: OFFSET_INSTATE)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> instate: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_INSTATE put: anObject value
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> intSubName [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_INTSUBNAME) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> intSubName: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_INTSUBNAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> keepBlanks [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_KEEPBLANKS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> keepBlanks: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_KEEPBLANKS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> lastError [
	"This method was automatically generated"
	^ Xml_xmlError fromHandle: (handle referenceStructAt: OFFSET_LASTERROR length: Xml_xmlError byteSize)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> lastError: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_LASTERROR put: anObject getHandle length: Xml_xmlError byteSize
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> linenumbers [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LINENUMBERS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> linenumbers: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LINENUMBERS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> loadsubset [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_LOADSUBSET
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> loadsubset: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_LOADSUBSET put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> maxAmpl [
	"This method was automatically generated"
	^handle unsignedLongAt: OFFSET_MAXAMPL
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> maxAmpl: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_MAXAMPL put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> maxatts [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_MAXATTS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> maxatts: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_MAXATTS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> myDoc [
	"This method was automatically generated"
	^Xml_xmlDoc fromHandle: (handle pointerAt: OFFSET_MYDOC)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> myDoc: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_MYDOC put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> name [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAME) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> name: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nameMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NAMEMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nameMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NAMEMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nameNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NAMENR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nameNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NAMENR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nameTab [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAMETAB) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nameTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAMETAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbChars [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_NBCHARS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbChars: anObject [
	"This method was automatically generated"
	^handle platformLongAt: OFFSET_NBCHARS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbErrors [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NBERRORS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbErrors: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NBERRORS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbWarnings [
	"This method was automatically generated"
	^handle unsignedShortAt: OFFSET_NBWARNINGS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbWarnings: anObject [
	"This method was automatically generated"
	handle unsignedShortAt: OFFSET_NBWARNINGS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbentities [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_NBENTITIES
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nbentities: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_NBENTITIES put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> node [
	"This method was automatically generated"
	^Xml_xmlNode fromHandle: (handle pointerAt: OFFSET_NODE)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> node: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NODE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfo [
	"This method was automatically generated"
	^Xml_xmlParserNodeInfo fromHandle: (handle pointerAt: OFFSET_NODEINFO)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfo: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NODEINFO put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfoMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODEINFOMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfoMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODEINFOMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfoNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODEINFONR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfoNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODEINFONR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfoTab [
	"This method was automatically generated"
	^Xml_xmlParserNodeInfo fromHandle: (handle pointerAt: OFFSET_NODEINFOTAB)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeInfoTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NODEINFOTAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODEMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODEMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODENR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODENR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeTab [
	"This method was automatically generated"
	^Xml_xmlNode fromHandle: (handle pointerAt: OFFSET_NODETAB)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodeTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NODETAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> node_seq [
	"This method was automatically generated"
	^ Xml_xmlParserNodeInfoSeq fromHandle: (handle referenceStructAt: OFFSET_NODE_SEQ length: Xml_xmlParserNodeInfoSeq byteSize)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> node_seq: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_NODE_SEQ put: anObject getHandle length: Xml_xmlParserNodeInfoSeq byteSize
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodelen [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODELEN
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodelen: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODELEN put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodemem [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NODEMEM
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nodemem: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NODEMEM put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NSMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NSMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NSNR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NSNR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsTab [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NSTAB) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NSTAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsWellFormed [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_NSWELLFORMED
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsWellFormed: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_NSWELLFORMED put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsdb [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NSDB) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> nsdb: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NSDB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> options [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_OPTIONS
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> options: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_OPTIONS put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> parseMode [
	"This method was automatically generated"
	^XmlParserMode fromInteger: (handle unsignedLongAt: OFFSET_PARSEMODE)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> parseMode: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_PARSEMODE put: anObject value
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> pedantic [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PEDANTIC
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> pedantic: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PEDANTIC put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> progressive [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_PROGRESSIVE
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> progressive: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_PROGRESSIVE put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> pushTab [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PUSHTAB) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> pushTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PUSHTAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> record_info [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RECORD_INFO
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> record_info: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RECORD_INFO put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> recovery [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_RECOVERY
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> recovery: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_RECOVERY put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> replaceEntities [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_REPLACEENTITIES
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> replaceEntities: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_REPLACEENTITIES put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sax [
	"This method was automatically generated"
	^Xml_xmlSAXHandler fromHandle: (handle pointerAt: OFFSET_SAX)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sax2 [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SAX2
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sax2: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SAX2 put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sax: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SAX put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sizeentcopy [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEENTCOPY
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sizeentcopy: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEENTCOPY put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sizeentities [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEENTITIES
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> sizeentities: anObject [
	"This method was automatically generated"
	^handle platformUnsignedLongAt: OFFSET_SIZEENTITIES put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> space [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SPACE) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> space: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SPACE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> spaceMax [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SPACEMAX
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> spaceMax: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SPACEMAX put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> spaceNr [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_SPACENR
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> spaceNr: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_SPACENR put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> spaceTab [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_SPACETAB) type: ExternalType long asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> spaceTab: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_SPACETAB put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> standalone [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_STANDALONE
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> standalone: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_STANDALONE put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> str_xml [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STR_XML) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> str_xml: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STR_XML put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> str_xml_ns [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STR_XML_NS) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> str_xml_ns: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STR_XML_NS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> str_xmlns [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_STR_XMLNS) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> str_xmlns: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_STR_XMLNS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> token [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_TOKEN
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> token: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_TOKEN put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> userData [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_USERDATA) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> userData: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_USERDATA put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> valid [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VALID
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> valid: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VALID put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> validate [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_VALIDATE
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> validate: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_VALIDATE put: anObject
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> vctxt [
	"This method was automatically generated"
	^ Xml_xmlValidCtxt fromHandle: (handle referenceStructAt: OFFSET_VCTXT length: Xml_xmlValidCtxt byteSize)
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> vctxt: anObject [
	"This method was automatically generated"
	handle structAt: OFFSET_VCTXT put: anObject getHandle length: Xml_xmlValidCtxt byteSize
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> version [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_VERSION) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> version: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_VERSION put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> wellFormed [
	"This method was automatically generated"
	^handle signedLongAt: OFFSET_WELLFORMED
]

{ #category : 'accessing - structure variables' }
Xml_xmlParserCtxt >> wellFormed: anObject [
	"This method was automatically generated"
	handle signedLongAt: OFFSET_WELLFORMED put: anObject
]
