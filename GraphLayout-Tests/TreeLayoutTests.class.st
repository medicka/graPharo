"
I represent colection of tests for the class GraphTreeLayout.
"
Class {
	#name : #TreeLayoutTests,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
TreeLayoutTests >> testChildrenForExcept [
	"A test that checks computing children(out neighbors) for given vertex, except the ones we already 	layouted.
	For vertex v3 in this set of 4 vertices, of wich we used already v1, expected result is 1.
	For vertex v4 in this set of 4 vertices, of wich we used already v1, expected result is 0."
	
	|gr v1 v2 v3 v4 layout used|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v1.
	used := Set new.
	used add: v1.
	layout :=GraphTreeLayout new.
	self assert: (layout childrenFor: v4 except: used) size equals: 0
]

{ #category : #tests }
TreeLayoutTests >> testComputeChildrenFor [
	"A test that checks computing children(out neighbors) for given vertex.
	For vertex v3 in this set of 4 vertices, expected result is 2.
	For vertex v4 in this set of 4 vertices, expected result is 1."
	
	|gr v1 v2 v3 v4 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout :=GraphTreeLayout new.
	self assert: ((layout computeChildrenFor: v3) size = 2)
]

{ #category : #tests }
TreeLayoutTests >> testDefault [
	"A test that checks if the default translator is set.
	Explected result is not nil."
	
	|translator|
	translator := GraphTranslator default.
	self deny: (translator defaultTranslator isNil)
	
]

{ #category : #tests }
TreeLayoutTests >> testDefaultTranslatorDirect [
	"A test that checks if the default translator is set to translator of a type GraphDirectTranslator.
	Expected result is GraphDirectTranslator."
	
	|translator|
	translator := GraphTranslator default.
	self assert: (translator defaultTranslator class) equals: GraphDirectTranslator 
	
]

{ #category : #tests }
TreeLayoutTests >> testDoExecuteGrid [
	"A test that checks execution of grid layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. 
	For v4, expected result 15.0@20.0 .
	For v3, expected result 0.0@20.0 .
	For v2, expected result 15.0@0.0 .
	For v1, expected result 0.0@0.0 ." 
	
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
	self assert: (v2 position) equals: (15.0@0.0)
]

{ #category : #tests }
TreeLayoutTests >> testGridSetLineItemsCount [ 
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
TreeLayoutTests >> testGridSetLineItemsCountMoreThan3 [ 
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
TreeLayoutTests >> testInitializeAbstractGridL [ 
	"A test that checks initialization of GAbstractGridLayout object.
	Expected result is defalut value 5 set to gapSize."
	
	|tmp|
	tmp := GAbstractGridLayout  new.
	self assert: (tmp gapSize) equals: 5
]

{ #category : #tests }
TreeLayoutTests >> testInitializeAbstractGridLineItems [ 
	"A test that checks initialization of lineClountItemsBlock variable.
	Expected result is default value 10."
	
	|tmp|
	tmp := GAbstractGridLayout  new.
	self assert: (tmp lineItemsCountBlock) equals: 10
]

{ #category : #tests }
TreeLayoutTests >> testInitializeTreeL [ 
	"A test that checks initialization of GraphTreeLayout object.
	Expected result is variable alreadyLayoutedVertices is not nil."
	
	|tmp|
	tmp := GraphTreeLayout new.
	self deny: (tmp alreadyLayoutedVertices) isNil
]

{ #category : #tests }
TreeLayoutTests >> testTranslateTopLeft [
	"A test that checks if the translation is done properly. We invoke the translation from top left 	corner of element.
	Expected result is new position for each vertex.
	For v1 is 2@1.
	For v2 is 3@6.
	For v3 is 0@5.
	For v4 is 10@3."
	
	|gr v1 v2 v3 v4 translator|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	translator := GraphDirectTranslator new.
	translator translateTopLeftOf: v2 to: (3@6).
	self assert: (v2 position ) equals: (3@6)
]
