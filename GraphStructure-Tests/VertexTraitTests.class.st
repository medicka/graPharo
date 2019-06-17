"
I represent a collection of tests for behaviour in TVertexTrait.
"
Class {
	#name : #VertexTraitTests,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #tests }
VertexTraitTests >> testMeasureDimensionHeight [
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
VertexTraitTests >> testMeasureDimensionWidth [
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
VertexTraitTests >> testVertexExistInSet [
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
