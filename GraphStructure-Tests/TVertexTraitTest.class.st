"
I represent a collection of tests for behaviour in TVertexTrait.
"
Class {
	#name : #TVertexTraitTest,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #tests }
TVertexTraitTest >> testDegree [
	"Testing of a method that calculates degree of a vertex in an undirected graph.
	For vertex v4 expected result is 3."

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
	self assert: v4 degree equals: 3
]

{ #category : #tests }
TVertexTraitTest >> testDimension [
	"Expected result:
v1 is 50@55,
v2 is 10@15,
v3 is 70@75, 
v4 is 30@35."

	| graph v1 v2 v3 v4 |
	graph := Graph new.
	v1 := graph addVertexWithValue: 1.
	v2 := graph addVertexWithValue: 2.
	v3 := graph addVertexWithValue: 3.
	v4 := graph addVertexWithValue: 4.
	graph
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v1 to: v4;
		addEdgeFrom: v4 to: v2.
	self assert: v4 dimension equals: 30 @ 35
]

{ #category : #tests }
TVertexTraitTest >> testHasChildren [
	"Expected result:
	v1 true,
	v2 false,
	v3 true, v4 true."

	| graph v1 v2 v3 v4 |
	graph := Graph new.
	v1 := graph addVertexWithValue: 1.
	v2 := graph addVertexWithValue: 2.
	v3 := graph addVertexWithValue: 3.
	v4 := graph addVertexWithValue: 4.
	graph
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v1 to: v4;
		addEdgeFrom: v4 to: v2.
	self assert: v3 hasChildren
]

{ #category : #tests }
TVertexTraitTest >> testInDegree [
	"Testing of a method that calculates in degree of a vertex.
	For vertex v1 expected result is 2.
	For vertex v4 expected result is 1."

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
	self assert: v1 inDegree equals: 2
]

{ #category : #tests }
TVertexTraitTest >> testNeighbourhood [
	"Testing of a method that calculates neighbourhood of a vertex in a undirected graph.
	For vertex v1 expected result is 2.
	For vertex v4 expected result is 3."

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
	graph addEdgeFrom: v3 to: v4.
	self assert: (v4 neighbourhood) size equals: 3
]

{ #category : #tests }
TVertexTraitTest >> testOutDegree [
	"Testing of a method that calculates out degree of a vertex.
	For vertex v4 expected result is 2.
	For vertex v3 expected result is 2.
	For vertex v1 expected result is 1."

	| graph v1 v2 v3 v4 |
	graph := Graph new.
	v1 := graph addVertexWithValue: 4.
	v2 := graph addVertexWithValue: 3.
	v3 := graph addVertexWithValue: 7.
	v4 := graph addVertexWithValue: 1.
	graph
		addEdgeFrom: v4 to: v2;
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v4 to: v1;
		addEdgeFrom: v1 to: v4;
		addEdgeFrom: v3 to: v4.
	self assert: v1 outDegree equals: 1
]

{ #category : #tests }
TVertexTraitTest >> testVertexExistsIn [
	"Testing the existance of a vertex in any given set.
	For given set, vertex with value 3 exists."

	| v1 v2 v3 test set |
	set := Set new.
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	test := Vertex new.
	test vertexValue: 3.
	set
		add: v1;
		add: v2;
		add: v3.
	self assert: (test vertexExists: test in: set)
]
