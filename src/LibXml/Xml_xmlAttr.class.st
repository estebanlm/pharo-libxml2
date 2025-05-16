Class {
	#name : 'Xml_xmlAttr',
	#superclass : 'XmlStructure',
	#classVars : [
		'OFFSET_ATYPE',
		'OFFSET_CHILDREN',
		'OFFSET_DOC',
		'OFFSET_ID',
		'OFFSET_LAST',
		'OFFSET_NAME',
		'OFFSET_NEXT',
		'OFFSET_NS',
		'OFFSET_PARENT',
		'OFFSET_PREV',
		'OFFSET_PSVI',
		'OFFSET_TYPE',
		'OFFSET__PRIVATE'
	],
	#category : 'LibXml-Base',
	#package : 'LibXml',
	#tag : 'Base'
}

{ #category : 'field definition' }
Xml_xmlAttr class >> fieldsDesc [

	^ #(
	void* _private;
	xmlElementType type;
	xmlChar* name;
	_xmlNode* children;
	_xmlNode* last;
	_xmlNode* parent;
	_xmlAttr* next;
	_xmlAttr* prev;
	_xmlDoc* doc;
	xmlNs* ns;
	xmlAttributeType atype;
	void* psvi;
	_xmlID* id
	)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> _private [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET__PRIVATE) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> _private: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET__PRIVATE put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> atype [
	"This method was automatically generated"
	^XmlAttributeType fromInteger: (handle unsignedLongAt: OFFSET_ATYPE)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> atype: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_ATYPE put: anObject value
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> children [
	"This method was automatically generated"
	^Xml_xmlNode fromHandle: (handle pointerAt: OFFSET_CHILDREN)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> children: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_CHILDREN put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> doc [
	"This method was automatically generated"
	^Xml_xmlDoc fromHandle: (handle pointerAt: OFFSET_DOC)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> doc: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_DOC put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> id [
	"This method was automatically generated"
	^Xml_xmlID fromHandle: (handle pointerAt: OFFSET_ID)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> id: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_ID put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> last [
	"This method was automatically generated"
	^Xml_xmlNode fromHandle: (handle pointerAt: OFFSET_LAST)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> last: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_LAST put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> name [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_NAME) type: ExternalType byte asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> name: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NAME put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> next [
	"This method was automatically generated"
	^Xml_xmlAttr fromHandle: (handle pointerAt: OFFSET_NEXT)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> next: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NEXT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> ns [
	"This method was automatically generated"
	^Xml_xmlNs fromHandle: (handle pointerAt: OFFSET_NS)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> ns: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_NS put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> parent [
	"This method was automatically generated"
	^Xml_xmlNode fromHandle: (handle pointerAt: OFFSET_PARENT)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> parent: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PARENT put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> prev [
	"This method was automatically generated"
	^Xml_xmlAttr fromHandle: (handle pointerAt: OFFSET_PREV)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> prev: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PREV put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> psvi [
	"This method was automatically generated"
	^ExternalData fromHandle: (handle pointerAt: OFFSET_PSVI) type: ExternalType void asPointerType
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> psvi: anObject [
	"This method was automatically generated"
	handle pointerAt: OFFSET_PSVI put: anObject getHandle.
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> type [
	"This method was automatically generated"
	^XmlElementType fromInteger: (handle unsignedLongAt: OFFSET_TYPE)
]

{ #category : 'accessing - structure variables' }
Xml_xmlAttr >> type: anObject [
	"This method was automatically generated"
	handle unsignedLongAt: OFFSET_TYPE put: anObject value
]
