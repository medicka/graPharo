"
I represent a direct translation of vertices.
"
Class {
	#name : #GraphDirectTranslator,
	#superclass : #GraphTranslator,
	#category : #GraphLayout
}

{ #category : #testing }
GraphDirectTranslator class >> isDefault [ 
	^ true
]

{ #category : #hook }
GraphDirectTranslator >> translate: element to: newPosition [ 

	|w h|
	w:= newPosition x + (((element measureDimensions: element) at: #width)/2).
	h:= newPosition y + (((element measureDimensions: element) at: #height)/2).
	element position: w@h
]
