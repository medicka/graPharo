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
		'width'
	],
	#category : #GraphStructure
}

{ #category : #accessing }
AbstractVertex >> height [ 
	^height 
]

{ #category : #'as yet unclassified' }
AbstractVertex >> outNeighbourhoodFromVertex: aVertex [
	"Returns out neighborhood of a given vertex."
	
	^aVertex outNeighbourhood 
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
