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

{ #category : #hook }
GraphLayout >> doExecute: elements [ 
	"Performs the layout"

	self subclassResponsibility
]

{ #category : #hook }
GraphLayout >> initialize [ 
	super initialize.
	translator := GraphTranslator default.
]
