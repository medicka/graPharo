"
I represent a collection of tests for all tree layouts.
"
Class {
	#name : #GAbstractTreeLayoutTest,
	#superclass : #GEdgeDrivenLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GAbstractTreeLayoutTest >> testChildrenFor [

	|gr v1 v2 v3 v4 v5 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := self newInstance.
	layout childrenFor: v3.
	self assert: layout cachedParents notNil 
]

{ #category : #tests }
GAbstractTreeLayoutTest >> testParentsFor [

	|gr v1 v2 v3 v4 v5 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := self newInstance.
	layout parentsFor: v3.
	self assert: layout cachedParents notNil 
]
