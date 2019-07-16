"
I represent an abstract layout class for graphs. My subclasses will implement actual algorithms.
"
Class {
	#name : #GLayout,
	#superclass : #Object,
	#instVars : [
		'verticesGroup',
		'translator'
	],
	#category : #GraphLayout
}

{ #category : #testing }
GLayout class >> isAbstract [
	"It is a convention in this project to name concrete classes with Graph."

	^ (self name beginsWith: 'Graph') not
]

{ #category : #hook }
GLayout >> doExecute: elements [ 
	"Performs the layout."

	self subclassResponsibility
]

{ #category : #hook }
GLayout >> doInitialize: elements [ 
	"Method executed before beginning the layout. Useful when the graph to be ordered need to be prepared"
	"self announce: (ROLayoutBegin new elements: elements)."
]

{ #category : #hook }
GLayout >> doPost: elements [ 
	"Method executed after performing the layout"
	"self announce: (ROLayoutEnd new elements: elements)."
]

{ #category : #hook }
GLayout >> executeOnElements: elements [  
	"Execute the layout, myself, on the elements"
		
	self doInitialize: elements.
	self doExecute: elements.
	self doPost: elements
]

{ #category : #getter }
GLayout >> fatherOf: aNode [
	^ aNode attributes at: #father ifAbsent: [ nil ]
]

{ #category : #setter }
GLayout >> fatherOf: aNode put: aValue [
	aNode attributes at: #father put: aValue
]

{ #category : #hook }
GLayout >> initialize [ 
	"Initializes the GraphLayout."
	
	super initialize.
	translator := GraphTranslator default.
]

{ #category : #getter }
GLayout >> layerOf: aNode [
	^ aNode attributes at: #layout
]

{ #category : #setter }
GLayout >> layerOf: aNode put: aValue [
	aNode attributes at: #layout put: aValue
]

{ #category : #getter }
GLayout >> leftContourOf: aNode [
	^ aNode attributes at: #leftContour ifAbsent: [ ^ nil ]
]

{ #category : #setter }
GLayout >> leftContourOf: aNode put: aValue [
	aNode attributes at: #leftContour put: aValue
]

{ #category : #getter }
GLayout >> rightContourOf: aNode [
	^ aNode attributes at: #rightContour ifAbsent: [ ^ nil ]
]

{ #category : #setter }
GLayout >> rightContourOf: aNode put: aValue [
	aNode attributes at: #rightContour put: aValue
]

{ #category : #'stepping and presenter' }
GLayout >> step [ 
"	currentIteraction := currentIteraction + 1.
	(currentIteraction \\ self iterationsToSendEvent) = 0 
		ifTrue: [ self announce: (ROLayoutStep new 
											currentIteration: currentIteraction;
											maxInterations: maxInterations) ].
	"
]

{ #category : #getter }
GLayout >> xOf: aVertex [

	^ aVertex position x
]

{ #category : #setter }
GLayout >> xOf: aNode put: aValue [
		
	|y|
	y := aNode position y.
	aNode position: aValue@y
]
