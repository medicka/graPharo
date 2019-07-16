"
I represent a collection of tests for behaviour in TVertexTrait.
"
Class {
	#name : #TVertexTraitTest,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #tests }
TVertexTraitTest >> testDimension [  
"Expected result:
v1 is 50@55,
v2 is 10@15,
v3 is 70@75, 
v4 is 30@35."
	
	|gr v1 v2 v3 v4|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v1 to: v4;
		addEdgeFrom: v4 to: v2.
	self assert: v4 dimension equals: 30@35
]

{ #category : #tests }
TVertexTraitTest >> testHasChildren [ 
"Expected result:
v1 true,
v2 false,
v3 true, v4 true."
	
	|gr v1 v2 v3 v4|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v1 to: v4;
		addEdgeFrom: v4 to: v2.
	self assert: v3 hasChildren 
]

{ #category : #tests }
TVertexTraitTest >> testMeasureDimensionHeight [
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
TVertexTraitTest >> testMeasureDimensionWidth [
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
TVertexTraitTest >> testVertexExistsIn [
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
