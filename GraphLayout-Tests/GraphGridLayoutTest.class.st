"
I represent a collection of tests for all grid based layouts.
"
Class {
	#name : #GraphGridLayoutTest,
	#superclass : #GAbstractGridLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphGridLayoutTest >> actualClass [
	^ GraphGridLayout 
]

{ #category : #tests }
GraphGridLayoutTest >> testDoExecute [
	"A test that checks execution of grid layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v4, expected result 30.0@37.5 .
	For v3, expected result 5.0@27.5 .
	For v2, expected result 30.0@7.5 .
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
	layout :=GraphGridLayout  new.
	layout doExecute: (used).
	self assert: (v3 position) equals: (5.0@37.5)
]
