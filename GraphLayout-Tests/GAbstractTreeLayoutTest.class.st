"
I represent a collection of tests incomon for all tree layouts.
"
Class {
	#name : #GAbstractTreeLayoutTest,
	#superclass : #GEdgeDrivenLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GAbstractTreeLayoutTest >> testChildrenFor [
	"Testing of retriving children for given vertex. Expected result is cachedChildren notNil."

	| gr v1 v2 v3 v4 v5 layout |
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
	layout := self newInstance.
	layout childrenFor: v3.
	self assert: layout cachedChildren notNil
]

{ #category : #tests }
GAbstractTreeLayoutTest >> testParentsFor [
	"Testing of retriving parents for given vertex. Expected result is cachedParents notNil."

	| gr v1 v2 v3 v4 v5 layout |
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
	layout := self newInstance.
	layout parentsFor: v3.
	self assert: layout cachedParents notNil
]

{ #category : #tests }
GAbstractTreeLayoutTest >> testRootNodesFor [
	"Testing og a method which finds all root nodes in the graph. Those are all the nodes, that have no inNeighbourhood. Expected result is 1."

	| gr v1 v2 v3 v4 v5 layout |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v3 to: v5;
		addEdgeFrom: v4 to: v2.
	layout := self newInstance.
	self assert: (layout rootNodesFor: gr vertices) size equals: 1
]
