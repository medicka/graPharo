"
I represent a collection of tests for objects type Vertex.
"
Class {
	#name : #VertexTest,
	#superclass : #AbstractVertexTest,
	#category : #'GraphStructure-Tests'
}

{ #category : #helpers }
VertexTest >> actualClass [
	^ Vertex
]

{ #category : #tests }
VertexTest >> testAddInNeighbour [
	"Testing of adding in neighbors to a vertex.
	For vertex v1 inNeighbours is not empty."

	| graph v1 v2 v3 v4 |
	graph := Graph new.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	v3 := graph addVertexWithValue: 7.
	v4 := graph addVertexWithValue: 1.
	graph addEdgeFrom: v4 to: v2.
	graph addEdgeFrom: v3 to: v1.
	graph addEdgeFrom: v4 to: v1.
	graph addEdgeFrom: v3 to: v4.
	self deny: v1 inNeighbourhood isEmpty
]

{ #category : #tests }
VertexTest >> testAddNeighbourUndirected [
	"Testing of adding neighbors to vertex of undirected graph.
	For vertex v3 neighbours is not empty."

	| graph v1 v2 v3 v4 |
	graph := Graph new.
	graph undirected: true.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	v3 := graph addVertexWithValue: 7.
	v4 := graph addVertexWithValue: 1.
	graph addEdgeFrom: v4 to: v2.
	graph addEdgeFrom: v3 to: v1.
	graph addEdgeFrom: v4 to: v1.
	graph addingUndirectedEdgeFrom: v3 to: v4.
	self deny: v3 neighbourhood isEmpty
]

{ #category : #tests }
VertexTest >> testAddOutNeighbour [
	"Testing of adding out neighbors to a vertex.
	For vertex v4 outNeighbours is not empty."

	| graph v1 v2 v3 v4 |
	graph := Graph new.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	v3 := graph addVertexWithValue: 7.
	v4 := graph addVertexWithValue: 1.
	graph addEdgeFrom: v4 to: v2.
	graph addEdgeFrom: v3 to: v1.
	graph addEdgeFrom: v4 to: v1.
	graph addEdgeFrom: v3 to: v4.
	self deny: (v4 outNeighbourhood) isEmpty
]

{ #category : #tests }
VertexTest >> testInitialize [
  "Testing the initialization of object type Vertex.
	Expected result is that variable vertexValue is not nil."

	|graph|
	graph := Vertex new.
	self deny: (graph vertexValue isNil)
]
