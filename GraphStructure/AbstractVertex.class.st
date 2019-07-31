"
I represent an abstract class, that implements some ˝must have˝ methods and alows creation of a Wrapper.
"
Class {
	#name : #AbstractVertex,
	#superclass : #Object,
	#traits : 'TVertexTrait',
	#classTraits : 'TVertexTrait classTrait',
	#instVars : [
		'position',
		'height',
		'width',
		'inNeighborhood',
		'outNeighborhood',
		'attributes',
		'encompassingRectangle',
		'compositeMargin'
	],
	#category : #GraphStructure
}

{ #category : #accessing }
AbstractVertex >> attributes [
	"Return the list of attributes associated to the element. Attributes are useful for caching values"

	^ attributes ifNil: [ attributes := Dictionary new ]
]

{ #category : #accessing }
AbstractVertex >> compositeMargin [
	^ compositeMargin ifNil: [ 10@10 ]
]

{ #category : #accessing }
AbstractVertex >> encompassingRectangle [
	^ encompassingRectangle ifNil: [ encompassingRectangle := Rectangle center: self position extent: self dimension ]
]

{ #category : #accessing }
AbstractVertex >> height [ 
	^height 
]

{ #category : #getter }
AbstractVertex >> inNeighbourhood [
	^inNeighborhood 
]

{ #category : #getter }
AbstractVertex >> outNeighbourhood [
	^outNeighborhood 
]

{ #category : #accessing }
AbstractVertex >> position [ 
	^position
]

{ #category : #accessing }
AbstractVertex >> position: aPosition [
	position := aPosition 
]

{ #category : #accessing }
AbstractVertex >> setNewHeight: aNumber [ 
	"Method for changing height of a vertex."
	
	height := aNumber
]

{ #category : #accessing }
AbstractVertex >> setNewWidth: aNumber [ 
	"Method for changing width of a vertex."
	
	width := aNumber
]

{ #category : #accessing }
AbstractVertex >> width [ 
	^width
]
