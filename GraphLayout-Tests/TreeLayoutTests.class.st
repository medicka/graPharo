"
I represent colection of tests for the class GraphTreeLayout.
"
Class {
	#name : #TreeLayoutTests,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
TreeLayoutTests >> testAbstractCircleInit [
	"Test that checks if initialization of object type GAbstractCircleLayout is correct. Expected resault 	for initialAngle is 0."
		
	|layout|
	layout := GAbstractCircleLayout new.
	self assert: (layout initialAngle) equals: 0
]

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
TreeLayoutTests >> testComputeIncrementalAngleFor [
	"A test that checks if the computation or incremental angle is done properly. 	initialIncrementalAngle in not selected, therefore for set of 4 elements, expected result is 1.57 	radians. We round down to two decilals for easier testing." 
	
	|gr layout|
	gr := Graph new.
	gr addVertexWithValue: 1;
		addVertexWithValue: 2;
		addVertexWithValue: 3;
		addVertexWithValue: 4.
	layout :=GraphCircleLayout  new.
	self assert: ((layout computeIncrementalAngleFor: (gr vertices)) roundDownTo: 0.01) equals: 1.57
]

{ #category : #tests }
TreeLayoutTests >> testComputeRadiusFor [
	"A test that checks if the computation or radius is done properly. initialRadius in not selected, 	therefore for set of 4 elements with scalingFactor of 11(default one), expected result is 44 	radians." 
	
	|gr layout|
	gr := Graph new.
	gr addVertexWithValue: 1;
		addVertexWithValue: 2;
		addVertexWithValue: 3;
		addVertexWithValue: 4.
	layout :=GraphCircleLayout  new.
	self assert: (layout computeRadiusFor: (gr vertices)) equals: 44
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
TreeLayoutTests >> testDoExecuteCircle [
	"A test that checks execution of circle layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection, and we round down to two decimals. Have in mind 	that position stors center of 	vertex.
	For v4, expected result 48.99@7.5 .
	For v3, expected result 5.0@51.5 .
	For v2, expected result 49.0@95.5 .
	For v1, expected result 93.0@51.5 ." 
	
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
	self assert: ((v2 position)roundDownTo: 0.01) equals: (49.0@95.5)
]

{ #category : #tests }
TreeLayoutTests >> testDoExecuteGrid [
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
	Expected result is new position for each vertex. Position is in the center of vertex.
	For v1 if translated to 2@1 is 7@8.5.
	For v2 if translated to 3@6 is 8@13.5."
	
	|gr v1 v2 v3 v4 translator|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	translator := GraphDirectTranslator new.
	translator translateTopLeftOf: v2 to: (3@6).
	self assert: (v2 position ) equals: (8@13.5)
]
