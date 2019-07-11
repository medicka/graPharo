"
I represent a collection of tests for incomon to all layouts.
"
Class {
	#name : #GLayoutTest,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #testing }
GLayoutTest class >> isAbstract [
	^ (self name beginsWith: 'Graph') not
]

{ #category : #testing }
GLayoutTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
GLayoutTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
GLayoutTest >> newInstance [
	^ self actualClass new
]

{ #category : #tests }
GLayoutTest >> testFatherOfPut [

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
	layout := self newInstance .
	layout fatherOf: v3 put: v5.
	self assert: (layout fatherOf: v3) equals: v5
]

{ #category : #tests }
GLayoutTest >> testLayerOfPut [

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
	layout := self newInstance .
	layout layerOf: v3 put: 2.
	self assert: (layout layerOf: v3) equals: 2
]

{ #category : #tests }
GLayoutTest >> testLeftContourOfPut [

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
	layout := self newInstance .
	layout leftContourOf: v3 put: v1.
	self assert: (layout leftContourOf: v3) equals: v1
]

{ #category : #tests }
GLayoutTest >> testRightContourOfPut [

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
	layout := self newInstance .
	layout rightContourOf: v3 put: v4.
	self assert: (layout rightContourOf: v3) equals: v4
]

{ #category : #tests }
GLayoutTest >> testXOfPut [

	|gr v1 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	layout := self newInstance .
	layout xOf: v1 put: 54.
	self assert: (layout xOf: v1) equals: (54)
]
