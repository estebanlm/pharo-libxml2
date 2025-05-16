Class {
	#name : 'XmlParserOption',
	#superclass : 'XmlEnumeration',
	#classVars : [
		'XML_PARSE_BIG_LINES',
		'XML_PARSE_COMPACT',
		'XML_PARSE_DTDATTR',
		'XML_PARSE_DTDLOAD',
		'XML_PARSE_DTDVALID',
		'XML_PARSE_HUGE',
		'XML_PARSE_IGNORE_ENC',
		'XML_PARSE_NOBASEFIX',
		'XML_PARSE_NOBLANKS',
		'XML_PARSE_NOCDATA',
		'XML_PARSE_NODICT',
		'XML_PARSE_NOENT',
		'XML_PARSE_NOERROR',
		'XML_PARSE_NONET',
		'XML_PARSE_NOWARNING',
		'XML_PARSE_NOXINCNODE',
		'XML_PARSE_NO_XXE',
		'XML_PARSE_NSCLEAN',
		'XML_PARSE_OLD10',
		'XML_PARSE_OLDSAX',
		'XML_PARSE_PEDANTIC',
		'XML_PARSE_RECOVER',
		'XML_PARSE_SAX1',
		'XML_PARSE_XINCLUDE'
	],
	#category : 'LibXml-Base',
	#package : 'LibXml',
	#tag : 'Base'
}

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_BIG_LINES [
	"This method was automatically generated"
	^ XML_PARSE_BIG_LINES
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_COMPACT [
	"This method was automatically generated"
	^ XML_PARSE_COMPACT
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_DTDATTR [
	"This method was automatically generated"
	^ XML_PARSE_DTDATTR
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_DTDLOAD [
	"This method was automatically generated"
	^ XML_PARSE_DTDLOAD
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_DTDVALID [
	"This method was automatically generated"
	^ XML_PARSE_DTDVALID
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_HUGE [
	"This method was automatically generated"
	^ XML_PARSE_HUGE
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_IGNORE_ENC [
	"This method was automatically generated"
	^ XML_PARSE_IGNORE_ENC
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOBASEFIX [
	"This method was automatically generated"
	^ XML_PARSE_NOBASEFIX
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOBLANKS [
	"This method was automatically generated"
	^ XML_PARSE_NOBLANKS
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOCDATA [
	"This method was automatically generated"
	^ XML_PARSE_NOCDATA
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NODICT [
	"This method was automatically generated"
	^ XML_PARSE_NODICT
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOENT [
	"This method was automatically generated"
	^ XML_PARSE_NOENT
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOERROR [
	"This method was automatically generated"
	^ XML_PARSE_NOERROR
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NONET [
	"This method was automatically generated"
	^ XML_PARSE_NONET
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOWARNING [
	"This method was automatically generated"
	^ XML_PARSE_NOWARNING
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NOXINCNODE [
	"This method was automatically generated"
	^ XML_PARSE_NOXINCNODE
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NO_XXE [
	"This method was automatically generated"
	^ XML_PARSE_NO_XXE
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_NSCLEAN [
	"This method was automatically generated"
	^ XML_PARSE_NSCLEAN
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_OLD10 [
	"This method was automatically generated"
	^ XML_PARSE_OLD10
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_OLDSAX [
	"This method was automatically generated"
	^ XML_PARSE_OLDSAX
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_PEDANTIC [
	"This method was automatically generated"
	^ XML_PARSE_PEDANTIC
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_RECOVER [
	"This method was automatically generated"
	^ XML_PARSE_RECOVER
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_SAX1 [
	"This method was automatically generated"
	^ XML_PARSE_SAX1
]

{ #category : 'accessing enum' }
XmlParserOption class >> XML_PARSE_XINCLUDE [
	"This method was automatically generated"
	^ XML_PARSE_XINCLUDE
]

{ #category : 'enum declaration' }
XmlParserOption class >> enumDecl [

	^ #(
	XML_PARSE_RECOVER 1
	XML_PARSE_NOENT 2
	XML_PARSE_DTDLOAD 4
	XML_PARSE_DTDATTR 8
	XML_PARSE_DTDVALID 16
	XML_PARSE_NOERROR 32
	XML_PARSE_NOWARNING 64
	XML_PARSE_PEDANTIC 128
	XML_PARSE_NOBLANKS 256
	XML_PARSE_SAX1 512
	XML_PARSE_XINCLUDE 1024
	XML_PARSE_NONET 2048
	XML_PARSE_NODICT 4096
	XML_PARSE_NSCLEAN 8192
	XML_PARSE_NOCDATA 16384
	XML_PARSE_NOXINCNODE 32768
	XML_PARSE_COMPACT 65536
	XML_PARSE_OLD10 131072
	XML_PARSE_NOBASEFIX 262144
	XML_PARSE_HUGE 524288
	XML_PARSE_OLDSAX 1048576
	XML_PARSE_IGNORE_ENC 2097152
	XML_PARSE_BIG_LINES 4194304
	XML_PARSE_NO_XXE 8388608 )
]
