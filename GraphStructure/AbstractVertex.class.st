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
		'outNeighborhood'
	],
	#category : #GraphStructure
}

{ #category : #getter }
AbstractVertex >> degree [
	"Returns a degree of a vertex in an undirected graph."

	^ self neighbourhood size
]

{ #category : #accessing }
AbstractVertex >> height [ 
	^height 
]

{ #category : #getter }
AbstractVertex >> inDegree [
	"Returns in degree of a vertex"

	^ self inNeighbourhood size
]

{ #category : #getter }
AbstractVertex >> inNeighbourhood [
	^inNeighborhood 
]

{ #category : #getter }
AbstractVertex >> neighbourhood [ 
	"Returns a neighborhood for vertex of undirected graph"
	
   ^outNeighborhood union: inNeighborhood
  
]

{ #category : #getter }
AbstractVertex >> outDegree [
	"Returns out degree of a vertex"

	^ self outNeighbourhood size
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
