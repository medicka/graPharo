"
I represent a direct translation of vertices.
"
Class {
	#name : #GraphDirectTranslator,
	#superclass : #GraphTranslator,
	#category : #'GraphLayout-Translator'
}

{ #category : #testing }
GraphDirectTranslator class >> isDefault [ 
	^ true
]

{ #category : #hook }
GraphDirectTranslator >> translate: element to: newPosition [ 

	|w h|
	w:= newPosition x.
	h:= newPosition y.
	element position: w@h
]
