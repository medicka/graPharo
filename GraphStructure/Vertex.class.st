"
I represent one vertex(node) in a graph.
"
Class {
	#name : #Vertex,
	#superclass : #Object,
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

{ #category : #containment }
Vertex >> vertexExistsIn: aSet [
	|tmp|
	tmp := false.
	aSet do: [ :each| ((each vertexValue) = (self vertexValue) )
		ifTrue: [ tmp :=true ] 
		].
	^tmp
	
]

{ #category : #getter }
Vertex >> vertexValue [ 
	^vertexValue 
]

{ #category : #setter }
Vertex >> vertexValue: value [
	vertexValue  := value 
]
