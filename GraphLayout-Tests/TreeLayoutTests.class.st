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
TreeLayoutTests >> testInitializeTreeL [ 
	"A test that checks initialization of GraphTreeLayout object.
	Expected result is variable alreadyLayoutedVertices is not nil."
	
	|tmp|
	tmp := GraphTreeLayout new.
	self deny: (tmp alreadyLayoutedNodes) isNil
]
