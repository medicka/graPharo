"
I represent a direct translation of vertices.
"
Class {
	#name : #GraphDirectTranslator,
	#superclass : #GraphTranslator,
	#category : #GraphLayout
}

{ #category : #hook }
GraphDirectTranslator >> translate: element to: newPosition [ 
	element position: newPosition asFloatPoint
]
