"
I represent a class in charge of moving the vertices to the right positions on the canvas.
"
Class {
	#name : #GraphTranslator,
	#superclass : #Object,
	#instVars : [
		'view'
	],
	#category : #GraphLayout
}

{ #category : #'public - translating' }
GraphTranslator >> translate: element to: newPosition direction: aDirection [ 
	"Translate the bottom left corner of the element"

	self translate: element to: newPosition" + (element extent / 2 * aDirection)"
]

{ #category : #'public - translating' }
GraphTranslator >> translateTopLeftOf: element to: newPosition [ 
	"Translate the top right corner of the element"

	self translate: element to: newPosition direction: 1 @ 1
]
