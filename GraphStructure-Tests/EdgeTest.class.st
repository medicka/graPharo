"
I represent a collection of tests for objects of a type Edge.
"
Class {
	#name : #EdgeTest,
	#superclass : #AbstractEdgeTest,
	#category : #'GraphStructure-Tests'
}

{ #category : #accessing }
EdgeTest >> actualClass [
	^ Edge
]

{ #category : #tests }
EdgeTest >> testInitialize [
	"Testing the initialization of object type Edge.
	Expected result is that variables fromVertex and toVertex are not nil."

	| edge |
	edge := Edge new.
	self deny: edge fromVertex isNil & edge toVertex isNil
]

{ #category : #tests }
EdgeTest >> testSetFromTo [
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
