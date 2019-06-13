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
GraphTests >> testAddInNeighborhood [
  "Testing of adding in neighbors to a vertex.
	For vertex v1 inNeighbours is not empty."

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
	self assert: (v1 inNeighborhood isEmpty) equals: false
]

{ #category : #tests }
GraphTests >> testAddNeighborhoodUndirected [
  "Testing of adding neighbors to vertex of undirected graph.
	For vertex v3 neighbours is not empty."

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
	self assert: (v3 neighborhood isEmpty) equals: false
]

{ #category : #tests }
GraphTests >> testAddOutNeighborhood [
  "Testing of adding out neighbors to a vertex.
	For vertex v4 outNeighbours is not empty."

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
	self assert: (v4 outNeighborhoodFromVertex: v4) isEmpty equals:  false
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
GraphTests >> testEdgeEquals [
	"Testing of a method that determends equality between edges.
	Expected result true."

	|v1 v2 v3 e1 e2|
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	e1 := Edge new.
	e1 fromVertex: v1;
		toVertex: v2.
	e2 := Edge new.
	e2 fromVertex: v1;
		toVertex: v2.
	self assert: (e1 equals: e2) equals: true
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
GraphTests >> testInDegree [
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
GraphTests >> testInitEdge [
  "Testing the initialization of object type Edge.
	Expected result is that variables fromVertex and toVertex are not nil."

	|tmp|
	tmp := Edge new.
	self deny: ((tmp fromVertex isNil) & (tmp toVertex isNil))
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
GraphTests >> testInitVertex [
  "Testing the initialization of object type Vertex.
	Expected result is that variable vertexValue is not nil."

	|tmp|
	tmp := Vertex new.
	self deny: (tmp vertexValue isNil)
]

{ #category : #tests }
GraphTests >> testMeasureDimensionHeight [
  "Testing of getting height of a vertex.
	Defalut dimensions of vertex 10x15.
	Expected result is 15."

	|tmp v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	tmp := v1 measureDimensions: v1.
	self assert: (tmp at: #height ) equals: 15
]

{ #category : #tests }
GraphTests >> testMeasureDimensionWidth [
  "Testing of getting width of a vertex.
	Defalut dimensions of vertex 10x15.
	Expected result is 10."

	|tmp v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	tmp := v1 measureDimensions: v1.
	self assert: (tmp at: #width ) equals: 10
]

{ #category : #tests }
GraphTests >> testOutDegree [
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
GraphTests >> testPosition [
	"Testing of changing position variable of a vertex.
	Default position of newly made vertex is 0@0.
	After sending a message `position:` to it we expect that new positiopn of vertex is 2@7."

	|vertex test|
	vertex := Vertex new.
	test := 2@7.
	vertex position: test.
	self assert: (vertex position) equals: (2@7)
]

{ #category : #tests }
GraphTests >> testUndirectedDegree [
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

{ #category : #tests }
GraphTests >> testVertexExistInSet [
  "Testing the existance of a vertex in any given set.
	For given set, vertex with value 3 exists."

	|v1 v2 v3 test set|
	set := Set new.
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	test := Vertex new.
	test vertexValue: 3.
	set add: v1;
		add: v2;
		add: v3. 
	self assert: (test vertexExists: test in: set)
]
