"
I represent an abstract layout class for graphs. My subclasses will implement actual algorithms.
"
Class {
	#name : #GraphLayout,
	#superclass : #Object,
	#instVars : [
		'verticesGroup',
		'translator'
	],
	#category : #GraphLayout
}

{ #category : #testing }
GraphLayout class >> isAbstract [
	"It is a convention in this project to name concrete classes with Graph."

	^ (self name beginsWith: 'Graph') not
]

{ #category : #hook }
GraphLayout >> doExecute: elements [ 
	"Performs the layout."

	self subclassResponsibility
]

{ #category : #hook }
GraphLayout >> doInitialize: elements [ 
	"Method executed before beginning the layout. Useful when the graph to be ordered need to be prepared"
	"self announce: (ROLayoutBegin new elements: elements)."
]

{ #category : #hook }
GraphLayout >> doPost: elements [ 
	"Method executed after performing the layout"
	"self announce: (ROLayoutEnd new elements: elements)."
]

{ #category : #hook }
GraphLayout >> executeOnElements: elements [  
	"Execute the layout, myself, on the elements"
		
	self doInitialize: elements.
	self doExecute: elements.
	self doPost: elements
]

{ #category : #hook }
GraphLayout >> initialize [ 
	"Initializes the GraphLayout."
	
	super initialize.
	translator := GraphTranslator default.
]

{ #category : #'stepping and presenter' }
GraphLayout >> step [ 
"	currentIteraction := currentIteraction + 1.
	(currentIteraction \\ self iterationsToSendEvent) = 0 
		ifTrue: [ self announce: (ROLayoutStep new 
											currentIteration: currentIteraction;
											maxInterations: maxInterations) ].
	"
]
