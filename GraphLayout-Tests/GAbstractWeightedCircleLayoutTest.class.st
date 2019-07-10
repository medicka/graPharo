"
I represent a collection of tests for circle layouts based on weights.
"
Class {
	#name : #GAbstractWeightedCircleLayoutTest,
	#superclass : #GraphCircleLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #testing }
GAbstractWeightedCircleLayoutTest class >> isAbstract [
	^ self = GAbstractWeightedCircleLayoutTest
]

{ #category : #testing }
GAbstractWeightedCircleLayoutTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #tests }
GAbstractWeightedCircleLayoutTest >> testWeightSum [

	|graph vertex1 vertex2 layout|
	graph := Graph new.
	vertex1 := graph addVertexWithValue: 1.
	vertex2 := graph addVertexWithValue: 2.
	layout := self newInstance .
	self assert: (layout weightSum: graph vertices) equals: 30
	
]
