"
I represent an abstract class, that implements some ˝must have˝ methods and alows creation of a Wrapper.
"
Class {
	#name : #AbstractVertex,
	#superclass : #Object,
	#traits : 'TVertexTrait',
	#classTraits : 'TVertexTrait classTrait',
	#instVars : [
		'position'
	],
	#category : #GraphStructure
}

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
