"
I represent the collection of tests for Graph class.
"
Class {
	#name : #GraphTests,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #tests }
GraphTests >> testAddEdge [
  "Testing of adding a new edge.
	Expected result number of edges in garph is 1."

	|tmp v1 v2|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	tmp addEdgeFrom: v1 to: v2.
	self assert: (tmp edges size) equals:  1
]

{ #category : #tests }
GraphTests >> testAddEdgeObject [
  "Testing of adding a new edge.
	Expected result number of edges in garph is 1."

	|tmp v1 v2 e1|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	e1 := Edge new.
	e1 setFrom: v1 to: v2.
	tmp addEdgeObject: e1.
	self assert: (tmp edges size) equals:  1
]

{ #category : #tests }
GraphTests >> testAddEdges [
  "Testing of adding a couple of edges.
	Expected result: vertices size is 4; egdes size is 2."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	self assert: (((tmp vertices size) = 4) & ((tmp edges size) = 2))
]

{ #category : #tests }
GraphTests >> testAddUndirectedEdge [
  "Testing of adding a new edge in undirected graph.
	Expected result number of edges in garph is 1."

	|tmp v1 v2|
	tmp := Graph new.
	tmp undirected.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	tmp addingUndirectedEdgeFrom: v1 to: v2.
	self assert: (tmp edges size) equals:  1
]

{ #category : #tests }
GraphTests >> testAddVertex [
  "Testing of adding a new Vertex.
	Adding vertex with value to a graph, expected result for size of set vertices is 1."

	|tmp v1|
	v1 := Vertex new.
	v1 vertexValue: 1.
	tmp := Graph new.
	tmp addVertex: v1.
	self assert: (tmp vertices size) equals: 1
]

{ #category : #tests }
GraphTests >> testAddVertexWithValue [
  "Testing of adding a new Vertex with value given.
	Adding vertex with value to a graph, expected result for size of set vertices is 1."

	|tmp|
	tmp := Graph new.
	tmp addVertexWithValue: 1.
	self assert: (tmp vertices size) equals: 1
]

{ #category : #tests }
GraphTests >> testAddVertices [
  "Testing of adding a couple new Vertex.
	Adding three vertices to a graph, expected result for size of set vertices is 3."

	|tmp v1 v2 v3|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	tmp addVertex: v1.
	tmp addVertex: v2.
	tmp addVertex: v3.
	self assert: (tmp vertices size) equals: 3
]

{ #category : #tests }
GraphTests >> testEdgeExist [
  "Testing the existance of an edge in a set of edges.
	For test edge going from v2, to v1, expected result is true."

	|tmp test v1 v2 v3|
	tmp := Graph new.
   v1 := tmp addVertexWithValue: 1.
   v2 := tmp addVertexWithValue: 2.
   v3 := tmp addVertexWithValue: 3.	
	test := Edge new.
	test fromVertex: v2;
		  toVertex: v1.
	tmp addEdgeFrom: v1 to: v2;
		addEdgeFrom: v3 to: v2;
		addEdgeFrom: v2 to: v1.
	self assert: (tmp edgeExists: test)
]

{ #category : #tests }
GraphTests >> testInitGraph [
  "Testing the initialization of object type Graph.
	Expected result is that variables edges and vertices are not nil."

	|tmp|
	tmp := Graph new.
	self deny: ((tmp edges isNil) & (tmp vertices isNil))
]

{ #category : #tests }
GraphTests >> testUndirectedGraph [
  "Testing of automatical addition od edges in case of undirected graph.
	Directed graph with one edge, his undelineing undirected graph has two edges."

	|tmp v1 v2|
	tmp := Graph new.
	tmp undirected: true.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	tmp addVertex: v1;
		addVertex: v2.
	tmp addEdgeFrom: v1 to: v2.
	self assert: (tmp edges size) equals: 2
]

{ #category : #tests }
GraphTests >> testVertexExist [
  "Testing the existance of a vertex in a set vertices.
	In given a vertices, vertix with value 2 exists."

	|tmp test|
	tmp := Graph new.
	test := Vertex new.
	test vertexValue: 2.
	tmp addVertexWithValue: 1.
	tmp addVertexWithValue: 2.
	tmp addVertexWithValue: 3.
	self assert: (tmp vertexExists: test)
]
