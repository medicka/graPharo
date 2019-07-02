Class {
	#name : #AbstractEdgeTest,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #testing }
AbstractEdgeTest class >> isAbstract [
	^ self = AbstractEdgeTest
]

{ #category : #testing }
AbstractEdgeTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
AbstractEdgeTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
AbstractEdgeTest >> newInstance [
	^ self actualClass new
]

{ #category : #tests }
AbstractEdgeTest >> testEdgeEquals [
	"Testing of a method that determends equality between edges.
	Expected result true."

	|v1 v2 v3 e1 e2|
	v1 := Vertex new.
	v1 vertexValue: 1.
	v2 := Vertex new.
	v2 vertexValue: 2.
	v3 := Vertex new.
	v3 vertexValue: 3.
	e1 := self newInstance .
	e1 fromVertex: v1;
		toVertex: v2.
	e2 := self newInstance.
	e2 fromVertex: v1;
		toVertex: v2.
	self assert: (e1 equals: e2)
]
