"
I represent a collection of test for abstract vertex.
"
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

	| vertex |
	vertex := self newInstance.
	self assert: vertex attributes notNil 
]

{ #category : #tests }
AbstractVertexTest >> testCompositeMargin [
	"Testing of setting a margine to a vertex.
	Expected result 10@10"

	| vertex |
	vertex := self newInstance.
	self assert: vertex compositeMargin equals: 10@10 
]

{ #category : #tests }
AbstractVertexTest >> testEncompassingRectangle [
	"Testing of making a encompasing rectangle around a given vertex."

	| vertex |
	vertex := self newInstance.
	self assert: vertex encompassingRectangle notNil  
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

	| vertex |
	vertex := self newInstance.
	vertex setNewHeight: 20.
	self assert: vertex height equals: 20
]

{ #category : #tests }
AbstractVertexTest >> testSetNewWidth [
	"Testing of changing width of a vertex.
	For new width 6, expected result is 6."

	| vertex |
	vertex := self newInstance.
	vertex setNewWidth: 6.
	self assert: vertex width equals: 6
]
