"
I represent one vertex(node) in a graph.
"
Class {
	#name : #Vertex,
	#superclass : #AbstractVertex,
	#instVars : [
		'vertexValue',
		'outNeighborhood',
		'inNeighborhood'
	],
	#category : #GraphStructure
}

{ #category : #adding }
Vertex >> addInNeighbor: vertex [
  self inNeighborhood add: vertex
]

{ #category : #adding }
Vertex >> addOutNeighbor: vertex [
  self outNeighborhood add: vertex
]

{ #category : #getter }
Vertex >> degree [
	"Returns a degree of a vertex in an undirected graph."
	^(self neighborhood size)
]

{ #category : #getter }
Vertex >> inDegree [
	"Returns in degree of a vertex"
	^(self inNeighborhood size) 
]

{ #category : #getter }
Vertex >> inNeighborhood [
	^inNeighborhood 
]

{ #category : #initialization }
Vertex >> initialize [ 
	vertexValue := 0.
	outNeighborhood := Set new.
	inNeighborhood  := Set new.
	position := 0@0
	
]

{ #category : #getter }
Vertex >> neighborhood [ 
	"Returns a neighborhood for vertex of undirected graph"
	|tmp|
	tmp := Set new.
	outNeighborhood do: [ :each| tmp add: each ].
	inNeighborhood do: [ :each| tmp add: each ].
   ^tmp
  
]

{ #category : #getter }
Vertex >> outDegree [
	"Returns out degree of a vertex"
	^(self outNeighborhood size) 
]

{ #category : #getter }
Vertex >> outNeighborhood [
	^outNeighborhood 
]

{ #category : #printing }
Vertex >> printOn: ver1 [ 
	ver1 nextPut: $[;
		 print: vertexValue ;
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
