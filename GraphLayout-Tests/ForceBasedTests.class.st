"
I represent a set of test on connected to force based layout.
"
Class {
	#name : #ForceBasedTests,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
ForceBasedTests >> testDoExecuteForceBased [
	"A test that checks execution of force based layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v4, expected result 20.0@27.5 .
	For v3, expected result 5.0@27.5 .
	For v2, expected result 20.0@7.5 .
	For v1, expected result 5.0@7.5 ." 
	
	|gr v1 v2 v3 v4 layout used|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used add: v1;
		add: v2;
		add: v3;
		add: v4.
	layout :=GraphForceBasedLayout  new.
	layout doExecute: (used).
	self assert: (v3 position) equals: (5.0@27.5)
]

{ #category : #tests }
ForceBasedTests >> testInitialPositionOfNodes [
	"A test that checks setting of initial position of all vertices. As our Initial layout is Grid, that means that expected resault is positioning like the one in Grid layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v4, expected result 20.0@27.5 .
	For v3, expected result 5.0@27.5 .
	For v2, expected result 20.0@7.5 .
	For v1, expected result 5.0@7.5 ." 
	
	|gr v1 v2 v3 v4 layout used|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used add: v1;
		add: v2;
		add: v3;
		add: v4.
	layout :=GraphForceBasedLayout new.
	layout initialPositionOfNodes: (used).
	self assert: (v2 position) equals: (20.0@7.5)
]

{ #category : #tests }
ForceBasedTests >> testLengthOf [
	"Testing of retreaving of length of a specific edge. For a given edge we set a length in dictionary as 17.5, expected result is 17.5."
	
	|gr v1 v2 edge layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	edge := Edge new.
	edge setFrom: v1 to: v2.
	layout := GraphForceBasedLayout new.
	layout set: edge length: 17.5.
	self assert: (layout lengthOf: edge) equals: 17.5.
	
]

{ #category : #tests }
ForceBasedTests >> testLengthOfAbsent [
	"Testing of retreaving of length of a specific edge. When there is no given edge in Lengths dictionary, expected result is 20."
	
	|gr v1 v2 edge layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	edge := Edge new.
	edge setFrom: v1 to: v2.
	layout := GraphForceBasedLayout new.
	self assert: (layout lengthOf: edge) equals: 20.
	
]

{ #category : #tests }
ForceBasedTests >> testPrepareNodes [
	"Test for checking preparation of nodes, adding weights to every node (weight increases for every in or out edge).
	Expected results:
	v1 is 1.
	v2 is 1.
	v3 is 2. 
	v4 is 2.
	v5 is 0."

	|gr v1 v2 v3 v4 v5 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := GraphForceBasedLayout new.
	layout setEdgesFromElements: (gr vertices ).
	layout prepareNodes: (gr vertices ).
	self assert: (layout weights at: v3) equals: 2
]

{ #category : #tests }
ForceBasedTests >> testRunLayoutSimpleNotZero [
	"A test that checks runing of simple layout if the number of iterations is 5.Expected result is 0.009." 
	
	|layout|
	layout :=GraphForceBasedLayout new.
	layout nbIterations: 5.
	layout runLayoutSimply.
	self assert: ((layout alpha) roundDownTo: 0.0001) equals: 0.095
]

{ #category : #tests }
ForceBasedTests >> testRunLayoutSimpleZero [
	"A test that checks runing of simple layout if the number of iterations is 0. Since we calculate last alpha before checking if it is  bigger than 0.005, expected result is 0.0049." 
	
	|layout|
	layout :=GraphForceBasedLayout new.
	layout runLayoutSimply.
	self assert: ((layout alpha) roundDownTo: 0.0001) equals: 0.0049
]

{ #category : #tests }
ForceBasedTests >> testStrenghtOf [
	"Testing of retreaving of strength of a specific edge. For a given edge we set a strength in dictionary as 0.56, expected result is 0.56."
	
	|gr v1 v2 edge layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	edge := Edge new.
	edge setFrom: v1 to: v2.
	layout := GraphForceBasedLayout new.
	layout set: edge strength: 0.56.
	self assert: (layout strengthOf: edge) equals: 0.56.
	
]

{ #category : #tests }
ForceBasedTests >> testStrenghtOfAbsent [
	"Testing of retreaving of strength of a specific edge.When there is no given edge in Strengths dictionary, expected result is 1."
	
	|gr v1 v2 edge layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	edge := Edge new.
	edge setFrom: v1 to: v2.
	layout := GraphForceBasedLayout new.
	self assert: (layout strengthOf: edge) equals: 1.
	
]