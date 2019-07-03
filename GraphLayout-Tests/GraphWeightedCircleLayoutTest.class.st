Class {
	#name : #GraphWeightedCircleLayoutTest,
	#superclass : #GAbstractWeightedCircleLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphWeightedCircleLayoutTest >> actualClass [ 
	^ GraphWeightedCircleLayout 
]

{ #category : #tests }
GraphWeightedCircleLayoutTest >> testDoExecuteWeightedCircle [
	"A test that checks execution of weighted circle layout. For easier testing, we transfer the set 	of vertices 	to LinkedList, so we can have ordered collection, and we round down to two decimals. 	Have in mind that position stors center of 	vertex.
	For v4, expected result 105.14@25.41 .
	For v3, expected result 6.31@62.52 .
	For v2, expected result 58.72@124.67 .
	For v1, expected result 113.54@102.76 ." 
	
	|gr v1 v2 v3 v4 layout used|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v2 setNewHeight: 10.
	v3 := gr addVertexWithValue: 3.
	v3 setNewHeight: 30.
	v4 := gr addVertexWithValue: 4.
	v4 setNewHeight: 20.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used add: v1;
		add: v2;
		add: v3;
		add: v4.
	layout :=GraphWeightedCircleLayout  new.
	layout doExecute: (used).
	self assert: ((v4 position)roundDownTo: 0.01) equals: (105.14@25.41)
]
