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
Vertex >> addInNeighbour: vertex [
	"Addes inNeighbor."
	
  self inNeighbourhood add: vertex
]

{ #category : #adding }
Vertex >> addOutNeighbour: vertex [
	"Addes outNeighbor."
	
  self outNeighbourhood add: vertex
]

{ #category : #getter }
Vertex >> degree [
	"Returns a degree of a vertex in an undirected graph."
	
	^(self neighbourhood size)
]

{ #category : #getter }
Vertex >> inDegree [
	"Returns in degree of a vertex"
	
	^(self inNeighbourhood size) 
]

{ #category : #getter }
Vertex >> inNeighbourhood [
	^inNeighborhood 
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

{ #category : #getter }
Vertex >> neighbourhood [ 
	"Returns a neighborhood for vertex of undirected graph"
	
   ^outNeighborhood union: inNeighborhood
  
]

{ #category : #getter }
Vertex >> outDegree [
	"Returns out degree of a vertex"
	
	^(self outNeighbourhood size) 
]

{ #category : #getter }
Vertex >> outNeighbourhood [
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
