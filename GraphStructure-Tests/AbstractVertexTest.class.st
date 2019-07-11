Class {
	#name : #AbstractVertexTest,
	#superclass : #TestCase,
	#category : #'GraphStructure-Tests'
}

{ #category : #testing }
AbstractVertexTest class >> isAbstract [
	^ self = AbstractVertexTest
]

{ #category : #testing }
AbstractVertexTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #helpers }
AbstractVertexTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #helpers }
AbstractVertexTest >> newInstance [
	^ self actualClass new
]

{ #category : #tests }
AbstractVertexTest >> testAttributes [
	"Testing of adding of attributes dictionary to a vertex."

	| v |
	v := self newInstance.
	self assert: v attributes notNil 
]

{ #category : #tests }
AbstractVertexTest >> testInDegree [
  "Testing of a method that calculates in degree of a vertex.
	For vertex v1 expected result is 2.
	For vertex v4 expected result is 1."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addEdgeFrom: v3 to: v4.
	self assert: (v1 inDegree) equals: 2
]

{ #category : #tests }
AbstractVertexTest >> testOutDegree [
  "Testing of a method that calculates out degree of a vertex.
	For vertex v4 expected result is 2.
	For vertex v3 expected result is 2.
	For vertex v1 expected result is 1."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2;
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v4 to: v1;
		addEdgeFrom: v1 to: v4; 
		addEdgeFrom: v3 to: v4.
	self assert: (v1 outDegree) equals: 1
]

{ #category : #tests }
AbstractVertexTest >> testPosition [
	"Testing of changing position variable of a vertex.
	Default position of newly made vertex is 0@0.
	After sending a message `position:` to it we expect that new positiopn of vertex is 2@7."

	| vertex test |
	vertex := self newInstance.
	test := 2 @ 7.
	vertex position: test.
	self assert: vertex position equals: 2 @ 7
]

{ #category : #tests }
AbstractVertexTest >> testSetNewHeight [
	"Testing of changing height of a vertex.
	For new height 20, expected result is 20."

	| v |
	v := self newInstance.
	v setNewHeight: 20.
	self assert: v height equals: 20
]

{ #category : #tests }
AbstractVertexTest >> testSetNewWidth [
	"Testing of changing width of a vertex.
	For new width 6, expected result is 6."

	| v |
	v := self newInstance.
	v setNewWidth: 6.
	self assert: v width equals: 6
]

{ #category : #tests }
AbstractVertexTest >> testUndirectedDegree [
  "Testing of a method that calculates degree of a vertex in an undirected graph.
	For vertex v4 expected result is 3."

	|tmp v1 v2 v3 v4|
	tmp := Graph new.
	tmp undirected: true.
	v1 := tmp addVertexWithValue: 4.
	v2 := tmp addVertexWithValue: 3.
	v3 := tmp addVertexWithValue: 7.
	v4 := tmp addVertexWithValue: 1.
	tmp addEdgeFrom: v4 to: v2.
	tmp addEdgeFrom: v3 to: v1.
	tmp addEdgeFrom: v4 to: v1.
	tmp addingUndirectedEdgeFrom: v3 to: v4.
	self assert: (v4 degree) equals: 3
]
