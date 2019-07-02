"
I represent one vertex(node) in a graph.
"
Class {
	#name : #Vertex,
	#superclass : #AbstractVertex,
	#instVars : [
		'vertexValue'
	],
	#category : #GraphStructure
}

{ #category : #comparing }
Vertex >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ width = anObject width and: [ vertexValue = anObject vertexValue and: [ height = anObject height and: [ position = anObject position ] ] ]
]

{ #category : #adding }
Vertex >> addInNeighbour: vertex [
	"Addes inNeighbor."
	
  self inNeighbourhood add: vertex
]

{ #category : #adding }
Vertex >> addOutNeighbour: vertex [
	"Addes outNeighbor."
	
  self outNeighbourhood add: vertex
]

{ #category : #comparing }
Vertex >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ width hash bitXor: (vertexValue hash bitXor: (height hash bitXor: position hash))
]

{ #category : #initialization }
Vertex >> initialize [ 
	"Initializes Vertex objects."

	vertexValue := 0.
	outNeighborhood := Set new.
	inNeighborhood  := Set new.
	height := 15.
	width := 10.
	position := (width/2)@(height/2)
]

{ #category : #printing }
Vertex >> printOn: aStream [
	aStream
		nextPut: $[;
		print: vertexValue;
		nextPut: $]
]

{ #category : #getter }
Vertex >> vertexValue [ 
	^vertexValue 
]

{ #category : #setter }
Vertex >> vertexValue: value [
	vertexValue  := value 
]
