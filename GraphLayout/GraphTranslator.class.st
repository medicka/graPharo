"
I represent a class in charge of moving the vertices to the right positions on the canvas.
"
Class {
	#name : #GraphTranslator,
	#superclass : #Object,
	#instVars : [
		'view'
	],
	#classVars : [
		'defaultTranslator'
	],
	#category : #'GraphLayout-Translator'
}

{ #category : #accessing }
GraphTranslator class >> default [ 
	"Return the default translator, the one used in the layouts"

	defaultTranslator ifNotNil: [ ^ defaultTranslator ].
	^ defaultTranslator := self defaultClass new
]

{ #category : #accessing }
GraphTranslator class >> defaultClass [ 
	^ self allSubclasses detect: #isDefault
]

{ #category : #getter }
GraphTranslator >> defaultTranslator [
	^defaultTranslator
]

{ #category : #'public - translating' }
GraphTranslator >> translate: element to: newPosition [ 
	"Translate of the center of the element"
	
	self subclassResponsibility 
]

{ #category : #'public - translating' }
GraphTranslator >> translate: element to: newPosition direction: aDirection [ 
	"Translate the bottom left corner of the element"

	self translate: element to: newPosition" + (element extent / 2 * aDirection)"
]

{ #category : #'as yet unclassified' }
GraphTranslator >> translateBottomLeftOf: element to: newPosition [
	"Translate the bottom left corner of the element"

	| w h |
	w := newPosition x + (element width / 2).
	h := newPosition y - (element height / 2).
	self translate: element to: w @ h direction: 1 @ 1
]

{ #category : #'as yet unclassified' }
GraphTranslator >> translateBottomRightOf: element to: newPosition [ 
	"Translate the bottom right corner of the element"
	| w h |
	w := newPosition x - (element width / 2).
	h := newPosition y - (element height / 2).
	self translate: element to: w @ h direction: 1 @ 1
]

{ #category : #'public - translating' }
GraphTranslator >> translateTopLeftOf: element to: newPosition [ 
	"Translate the top left corner of the element"
		| w h |
	w := newPosition x + (element width / 2).
	h := newPosition y + (element height / 2).
	self translate: element to: w @ h direction: 1 @ 1
]
