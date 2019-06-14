"
I represent a collection of tests for all grid based layouts.
"
Class {
	#name : #GridLayoutTests,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GridLayoutTests >> testDoExecuteGrid [
	"A test that checks execution of grid layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
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
	layout :=GraphGridLayout  new.
	layout doExecute: (used).
	self assert: (v3 position) equals: (5.0@27.5)
]

{ #category : #tests }
GridLayoutTests >> testGridSetLineItemsCount [ 
	"A test that checks setting of lineClountItemsBlock variable.
	In case od only two vertices, expected result is 2@1. "
	
	|tmp graph|
	graph := Graph new.
	graph addVertexWithValue: 1;
		addVertexWithValue: 2.
	tmp := GAbstractGridLayout new.
	self assert: (tmp setLineItemsCount: (graph vertices)) equals: (2@1)
]

{ #category : #tests }
GridLayoutTests >> testGridSetLineItemsCountMoreThan3 [ 
	"A test that checks setting of lineClountItemsBlock variable, when we have more than three 	vertices.
	Expected result is 3@3"
	
	|tmp graph|
	graph := Graph new.
	graph addVertexWithValue: 1;
		addVertexWithValue: 2;
		addVertexWithValue: 3;
		addVertexWithValue: 4;
		addVertexWithValue: 5;
		addVertexWithValue: 6;
		addVertexWithValue: 7.
	tmp := GAbstractGridLayout new.
	self assert: (tmp setLineItemsCount: (graph vertices)) equals: (3@3)
]

{ #category : #tests }
GridLayoutTests >> testInitializeAbstractGridL [ 
	"A test that checks initialization of GAbstractGridLayout object.
	Expected result is defalut value 5 set to gapSize."
	
	|tmp|
	tmp := GAbstractGridLayout  new.
	self assert: (tmp gapSize) equals: 5
]

{ #category : #tests }
GridLayoutTests >> testInitializeAbstractGridLineItems [ 
	"A test that checks initialization of lineClountItemsBlock variable.
	Expected result is default value 10."
	
	|tmp|
	tmp := GAbstractGridLayout  new.
	self assert: (tmp lineItemsCountBlock) equals: 10
]
