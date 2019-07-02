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
VertexTest >> testAddInNeighbourhood [
	"Testing of adding in neighbors to a vertex.
	For vertex v1 inNeighbours is not empty."

	| tmp v1 v2 v3 v4 |
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self deny: v1 inNeighbourhood isEmpty
]

{ #category : #tests }
VertexTest >> testAddNeighbourhoodUndirected [
	"Testing of adding neighbors to vertex of undirected graph.
	For vertex v3 neighbours is not empty."

	| tmp v1 v2 v3 v4 |
	tmp := Graph new.
	tmp undirected: true.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addingUndirectedEdgeFrom: v3 to: v4.
	self deny: v3 neighbourhood isEmpty
]

{ #category : #tests }
VertexTest >> testAddOutNeighbourhood [
	"Testing of adding out neighbors to a vertex.
	For vertex v4 outNeighbours is not empty."

	| tmp v1 v2 v3 v4 |
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self deny: (v4 outNeighbourhoodFromVertex: v4) isEmpty
]

{ #category : #tests }
VertexTest >> testInitialize [
  "Testing the initialization of object type Vertex.
	Expected result is that variable vertexValue is not nil."

	|tmp|
	tmp := Vertex new.
	self deny: (tmp vertexValue isNil)
]
