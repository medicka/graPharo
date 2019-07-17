"
I represent a collection of tests for cell based layout.
"
Class {
	#name : #GraphCellLayoutTest,
	#superclass : #GAbstractGridLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphCellLayoutTest >> actualClass [
	^ GraphCellLayout 
]

{ #category : #tests }
GraphCellLayoutTest >> testDoExecute [
	"A test that checks execution of cell layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v4, expected result 125.0@42.5 .
	For v3, expected result 25.0@42.5 .
	For v2, expected result 125.0@7.5 .
	For v1, expected result 25.0@7.5 ." 
	
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
	layout :=GraphCellLayout  new.
	layout doExecute: (used).
	self assert: (v1 position) equals: (25@7.5)
]

{ #category : #tests }
GraphCellLayoutTest >> testInitialize [
	| layout |
	layout := GraphCellLayout new.
	self assert: layout align equals: #left
]

{ #category : #tests }
GraphCellLayoutTest >> testLeftCentered [
	| layout |
	layout := GraphCellLayout new.
	self assert: layout translateElement notNil
]
