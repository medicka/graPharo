"
I represent a collection of tests for grid based layouts.
"
Class {
	#name : #GAbstractGridLayoutTest,
	#superclass : #GLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GAbstractGridLayoutTest >> testInitialize [ 
	"A test that checks initialization of GAbstractGridLayout object.
	Expected result is defalut value 5 set to gapSize."
	
	|tmp|
	tmp := self newInstance .
	self assert: (tmp gapSize) equals: 15
]

{ #category : #tests }
GAbstractGridLayoutTest >> testInitializeLineItems [ 
	"A test that checks initialization of lineClountItemsBlock variable.
	Expected result is default value 10."
	
	|tmp|
	tmp := self newInstance .
	self assert: (tmp lineItemsCountBlock) equals: 10
]

{ #category : #tests }
GAbstractGridLayoutTest >> testSetLineItemsCount [ 
	"A test that checks setting of lineClountItemsBlock variable.
	In case od only two vertices, expected result is 2@1. "
	
	|tmp graph|
	graph := Graph new.
	graph addVertexWithValue: 1;
		addVertexWithValue: 2.
	tmp := self newInstance .
	self assert: (tmp setLineItemsCount: (graph vertices)) equals: (2@1)
]

{ #category : #tests }
GAbstractGridLayoutTest >> testSetLineItemsCountMoreThan3 [ 
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
	tmp := self newInstance .
	self assert: (tmp setLineItemsCount: (graph vertices)) equals: (3@3)
]
