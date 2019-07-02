"
I represent a collection of tests for objects type Vertex.
"
Class {
	#name : #VertexTests,
	#superclass : #AbstractVertexTest,
	#category : #'GraphStructure-Tests'
}

{ #category : #helpers }
VertexTests >> actualClass [
	^ Vertex
]

{ #category : #tests }
VertexTests >> testAddInNeighbourhood [
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
VertexTests >> testAddNeighbourhoodUndirected [
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
VertexTests >> testAddOutNeighbourhood [
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
VertexTests >> testInDegree [
  "Testing of a method that calculates in degree of a vertex.
	For vertex v1 expected result is 2.
	For vertex v4 expected result is 1."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v1 inDegree) equals: 2
]

{ #category : #tests }
VertexTests >> testInitVertex [
  "Testing the initialization of object type Vertex.
	Expected result is that variable vertexValue is not nil."

	|tmp|
	tmp := Vertex new.
	self deny: (tmp vertexValue isNil)
]

{ #category : #tests }
VertexTests >> testOutDegree [
  "Testing of a method that calculates out degree of a vertex.
	For vertex v4 expected result is 2.
	For vertex v3 expected result is 2.
	For vertex v1 expected result is 1."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2;
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v4 to: v1;
		addEdgeFrom: v1 to: v4; 
		addEdgeFrom: v3 to: v4.
	self assert: (v1 outDegree) equals: 1
]

{ #category : #tests }
VertexTests >> testUndirectedDegree [
  "Testing of a method that calculates degree of a vertex in an undirected graph.
	For vertex v4 expected result is 3."

	|tmp v1 v2 v3 v4|
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
	self assert: (v4 degree) equals: 3
]
