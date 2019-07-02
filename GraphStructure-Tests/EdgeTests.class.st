"
I represent a collection of tests for objects of a type Edge.
"
Class {
	#name : #EdgeTests,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #tests }
EdgeTests >> testEdgeEquals [
	"Testing of a method that determends equality between edges.
	Expected result true."

	|v1 v2 v3 e1 e2|
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	e1 := Edge new.
	e1 fromVertex: v1;
		toVertex: v2.
	e2 := Edge new.
	e2 fromVertex: v1;
		toVertex: v2.
	self assert: (e1 equals: e2)
]

{ #category : #tests }
EdgeTests >> testInitEdge [
  "Testing the initialization of object type Edge.
	Expected result is that variables fromVertex and toVertex are not nil."

	|tmp|
	tmp := Edge new.
	self deny: ((tmp fromVertex isNil) & (tmp toVertex isNil))
]

{ #category : #tests }
EdgeTests >> testSetFromTo [
	"This test is checking setting of edges ends."
	
	|edge v1 v2|
	edge := Edge new.
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	edge setFrom: v1 to: v2.
	self assert: edge fromVertex equals: v1.
]
