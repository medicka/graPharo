"
I represent a collection of tests for concreate regular tree layouts.
"
Class {
	#name : #GraphTreeLayoutTest,
	#superclass : #GRegularTreeLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphTreeLayoutTest >> actualClass [
	^ GraphTreeLayout 
]

{ #category : #tests }
GraphTreeLayoutTest >> testBottomLayoutAtPointAtLayer [
	"A test that checks execution of tree layout with values: bottom orientation and no layering. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 70.0@60.
	For v4, expected result 10.0@25.
	For v3, expected result 25@60 .
	For v2, expected result 10.0@-10.
	For v1, expected result 40.0@25 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout orientation: #bottom.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 10.0@ -10
]

{ #category : #tests }
GraphTreeLayoutTest >> testDoExecute [
	"A test that checks execution of tree layout whit default values: top orientation and no layering. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 70.0@12.5.
	For v4, expected result 10.0@47.5.
	For v3, expected result 25@12.5 .
	For v2, expected result 10.0@82.5.
	For v1, expected result 40.0@47.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout doExecute: used.
	self assert: (v4 position roundDownTo: 0.01) equals: 10.0@47.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testInitialize [
	| layout |
	layout := GraphTreeLayout new.
	self assert: (layout horizontalGap = 20 and: layout verticalGap  = 20)
]

{ #category : #tests }
GraphTreeLayoutTest >> testLeftLayoutAtPointAtLayer [
	"A test that checks execution of tree layout with left orientation. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 10.0@82.5.
	For v4, expected result 40@12.5.
	For v3, expected result 10@30 .
	For v2, expected result 70@12.5.
	For v1, expected result 40.0@47.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout orientation: #left.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 70@12.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testRearrangeByLayersBottom [
	"A test that checks execution of tree layout with bottom orientation and layering. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 80.0@67.5.
	For v4, expected result 15.0@32.5.
	For v3, expected result 30@67.5 .
	For v2, expected result 10.0@-12.5.
	For v1, expected result 50.0@27.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewHeight: 25.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v4 setNewWidth: 20.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout orientation: #bottom.
	layout isLayered: true.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 10.0@ -12.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testRearrangeByLayersLeft [
	"A test that checks execution of tree layout with left orientation and layering. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 10@92.5.
	For v4, expected result 45@12.5.
	For v3, expected result 10@35 .
	For v2, expected result 80@12.5.
	For v1, expected result 40@52.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewHeight: 25.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v4 setNewWidth: 20.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout orientation: #left.
	layout isLayered: true.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 80@12.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testRearrangeByLayersRight [
	"A test that checks execution of tree layout with right orientation and layering. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 95@92.5.
	For v4, expected result 60@12.5.
	For v3, expected result 95@35 .
	For v2, expected result 25@12.5.
	For v1, expected result 65@52.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewHeight: 25.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v4 setNewWidth: 20.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout orientation: #right.
	layout isLayered: true.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 25@12.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testRearrangeByLayersTop [
	"A test that checks execution of tree layout with top orientation and layering. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 80.0@12.5.
	For v4, expected result 15.0@47.5.
	For v3, expected result 30@12.5 .
	For v2, expected result 10.0@82.5.
	For v1, expected result 50@52.5."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewHeight: 25.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v4 setNewWidth: 20.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout isLayered: true.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 10.0@82.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testRightLayoutAtPointAtLayer [
	"A test that checks execution of tree layout with left orientation. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 70@82.5.
	For v4, expected result 40@12.5.
	For v3, expected result 70@30 .
	For v2, expected result 10@12.5.
	For v1, expected result 40.0@47.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout orientation: #right.
	layout doExecute: used.
	self assert: (v2 position roundDownTo: 0.01) equals: 10@12.5
]

{ #category : #tests }
GraphTreeLayoutTest >> testTopLayoutAtPointAtLayer [
	"A test that checks execution of tree layout with top orientation. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v5, expected result 70.0@12.5.
	For v4, expected result 10.0@47.5.
	For v3, expected result 25@12.5 .
	For v2, expected result 10.0@82.5.
	For v1, expected result 40.0@47.5 ."

	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used
		add: v1;
		add: v2;
		add: v3;
		add: v4;
		add: v5.
	layout := GraphTreeLayout new.
	layout doExecute: used.
	self assert: (v4 position roundDownTo: 0.01) equals: 10.0@47.5
]
