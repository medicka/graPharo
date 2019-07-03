"
I represent a collection of tests for all circle based layouts.
"
Class {
	#name : #GraphCircleLayoutTest,
	#superclass : #GAbstractCircleLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphCircleLayoutTest >> actualClass [
	^ GraphCircleLayout 
]

{ #category : #tests }
GraphCircleLayoutTest >> testDoExecuteCircle [
	"A test that checks execution of circle layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection, and we round down to two decimals. Have in mind 	that position stors center of 	vertex.
	For v4, expected result 64.99@7.5 .
	For v3, expected result 5.0@67.5 .
	For v2, expected result 65.0@127.5 .
	For v1, expected result 125.0@67.5 ." 
	
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
	layout :=GraphCircleLayout  new.
	layout doExecute: (used).
	self assert: ((v4 position)roundDownTo: 0.01) equals: (64.99@7.5)
]
