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
  "Testing of adding a new edge."

	|tmp v1 v2|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	tmp addEdgeFrom: v1 to: v2.
	self assert: ((tmp edges size) = 1)
]

{ #category : #tests }
GraphTests >> testAddEdges [
  "Testing of adding a couple of edge."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	self assert: (((tmp vertices size) = 4) & ((tmp edges size) = 2))
]

{ #category : #tests }
GraphTests >> testAddInNeighborhood [
  "Testing of adding in neighbors to a vertex."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v4 inNeighborhood isEmpty = false)
]

{ #category : #tests }
GraphTests >> testAddNeighborhoodUndirected [
  "Testing of adding neighbors to vertex of undirected graph."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	tmp undirected: true.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v4 neighborhood isEmpty = false)
]

{ #category : #tests }
GraphTests >> testAddOutNeighborhood [
  "Testing of adding out neighbors to a vertex."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v4 outNeighborhood isEmpty= false)
]

{ #category : #tests }
GraphTests >> testAddVertex [
  "Testing of adding a new Vertex."

	|tmp|
	tmp := Graph new.
	tmp addVertex: 1.
	self assert: ((tmp vertices size) = 1)
]

{ #category : #tests }
GraphTests >> testAddVertices [
  "Testing of adding a couple new Vertex."

	|tmp|
	tmp := Graph new.
	tmp addVertex: 1.
	tmp addVertex: 2.
	tmp addVertex: 3.
	self assert: ((tmp vertices size) = 3)
]

{ #category : #tests }
GraphTests >> testInDegree [
  "Testing of a method that calculates in degree of a vertex."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v4 inDegree = 1)
]

{ #category : #tests }
GraphTests >> testInitEdge [
  "Testing the initialization of object type Edge."

	|tmp|
	tmp := Edge new.
	self deny: ((tmp fromVertex = nil) & (tmp toVertex = nil))
]

{ #category : #tests }
GraphTests >> testInitGraph [
  "Testing the initialization of object type Graph."

	|tmp|
	tmp := Graph new.
	self deny: ((tmp edges = nil) & (tmp vertices = nil) & (tmp adjacencyList = nil))
]

{ #category : #tests }
GraphTests >> testInitVertex [
  "Testing the initialization of object type Vertex."

	|tmp|
	tmp := Vertex new.
	self deny: (tmp vertexValue = nil)
]

{ #category : #tests }
GraphTests >> testOutDegree [
  "Testing of a method that calculates out degree of a vertex."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v4 outDegree = 2)
]

{ #category : #tests }
GraphTests >> testUndirectedDegree [
  "Testing of a method that calculates degree of a vertex in an undirected graph."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	tmp undirected: true.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	v3 := Vertex new.
	v3 vertexValue: 7.
	v4 := Vertex new.
	v4 vertexValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v4 degree = 3)
]

{ #category : #tests }
GraphTests >> testUndirectedGraph [
  "Testing of automatical addition od edges in undirected graph"

	|tmp v1 v2|
	tmp := Graph new.
	tmp undirected: true.
	v1 := Vertex new.
	v1 vertexValue: 4.
	v2 := Vertex new.
	v2 vertexValue: 3.
	tmp addEdgeFrom: v1 to: v2.
	self assert: ((tmp edges size) = 2)
]

{ #category : #tests }
GraphTests >> testVertexExist [
  "Testing the existance of a vertex in a set vertices."

	|tmp test|
	tmp := Graph new.
	test := Vertex new.
	test vertexValue: 2.
	tmp addVertex: 1.
	tmp addVertex: 2.
	tmp addVertex: 3.
	self assert: ((tmp vertexExists: test) = true)
]
