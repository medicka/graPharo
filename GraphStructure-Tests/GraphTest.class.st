"
I represent the collection of tests for Graph class.
"
Class {
	#name : #GraphTest,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #tests }
GraphTest >> testAddEdgeFromTo [
  "Testing of adding a new edge.
	Expected result number of edges in garph is 1."

	|graph v1 v2|
	graph := Graph new.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	graph addEdgeFrom: v1 to: v2.
	self assert: (graph edges size) equals:  1
]

{ #category : #tests }
GraphTest >> testAddEdgeObject [
  "Testing of adding a new edge.
	Expected result number of edges in garph is 1."

	|graph v1 v2 e1|
	graph := Graph new.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	e1 := Edge new.
	e1 setFrom: v1 to: v2.
	graph addEdgeObject: e1.
	self assert: (graph edges size) equals:  1
]

{ #category : #tests }
GraphTest >> testAddEdges [
  "Testing of adding a couple of edges.
	Expected result: vertices size is 4; egdes size is 2."

	|graph v1 v2 v3 v4|
	graph := Graph new.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	v3 := graph addVertexWithValue: 7.
	v4 := graph addVertexWithValue: 1.
	graph addEdgeFrom: v4 to: v2.
	graph addEdgeFrom: v3 to: v1.
	self assert: (((graph vertices size) = 4) & ((graph edges size) = 2))
]

{ #category : #tests }
GraphTest >> testAddOnEdgeFrom [

	|graph edge vertex|
	graph := Graph new.
	vertex := Vertex new.
	vertex vertexValue: 2.
	edge := Edge new.
	graph addOnEdge: edge from: vertex.
	self assert:(edge fromVertex ) equals: vertex.
]

{ #category : #tests }
GraphTest >> testAddOnEdgeTo [

	|graph edge vertex|
	graph := Graph new.
	vertex := Vertex new.
	vertex vertexValue: 2.
	edge := Edge new.
	graph addOnEdge: edge to: vertex.
	self assert:(edge toVertex ) equals: vertex.
]

{ #category : #tests }
GraphTest >> testAddUndirectedEdgeFromTo [
  "Testing of adding a new edge in undirected graph.
	Expected result number of edges in garph is 1."

	|graph v1 v2|
	graph := Graph new.
	graph undirected.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	graph addingUndirectedEdgeFrom: v1 to: v2.
	self assert: (graph edges size) equals:  1
]

{ #category : #tests }
GraphTest >> testAddVertex [
  "Testing of adding a new Vertex.
	Adding vertex with value to a graph, expected result for size of set vertices is 1."

	|graph vertex|
	vertex := Vertex new.
	vertex vertexValue: 1.
	graph := Graph new.
	graph addVertex: vertex.
	self assert: (graph vertices size) equals: 1
]

{ #category : #tests }
GraphTest >> testAddVertexWithValue [
  "Testing of adding a new Vertex with value given.
	Adding vertex with value to a graph, expected result for size of set vertices is 1."

	|graph|
	graph := Graph new.
	graph addVertexWithValue: 1.
	self assert: (graph vertices size) equals: 1
]

{ #category : #tests }
GraphTest >> testAddVertices [
  "Testing of adding a couple new Vertex.
	Adding three vertices to a graph, expected result for size of set vertices is 3."

	|graph v1 v2 v3|
	graph := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	graph addVertex: v1.
	graph addVertex: v2.
	graph addVertex: v3.
	self assert: (graph vertices size) equals: 3
]

{ #category : #tests }
GraphTest >> testEdgeExists [
	"Testing the existance of an edge in a set of edges.
	For test edge going from v2, to v1, expected result is true."

	| graph test v1 v2 v3 |
	graph := Graph new.
	v1 := graph addVertexWithValue: 1.
	v2 := graph addVertexWithValue: 2.
	v3 := graph addVertexWithValue: 3.
	test := Edge new.
	test
		fromVertex: v2;
		toVertex: v1.
	graph
		addEdgeFrom: v1 to: v2;
		addEdgeFrom: v3 to: v2;
		addEdgeFrom: v2 to: v1.
	self assert: (graph edgeExists: test)
]

{ #category : #tests }
GraphTest >> testInitialize [
	"Testing the initialization of object type Graph.
	Expected result is that variables edges and vertices are not nil."

	| graph |
	graph := Graph new.
	self deny: graph edges isNil & graph vertices isNil
]

{ #category : #tests }
GraphTest >> testUndirectedGraph [
	"Testing of automatical addition od edges in case of undirected graph.
	Directed graph with one edge, his undelineing undirected graph has two edges."

	| graph v1 v2 |
	graph := Graph new.
	graph undirected: true.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	graph
		addVertex: v1;
		addVertex: v2.
	graph addEdgeFrom: v1 to: v2.
	self assert: graph edges size equals: 2
]

{ #category : #tests }
GraphTest >> testVertexExists [
  "Testing the existance of a vertex in a set vertices.
	In given a vertices, vertix with value 2 exists."

	|graph test|
	graph := Graph new.
	test := Vertex new.
	test vertexValue: 2.
	graph addVertexWithValue: 1.
	graph addVertexWithValue: 2.
	graph addVertexWithValue: 3.
	self assert: (graph vertexExists: test)
]
