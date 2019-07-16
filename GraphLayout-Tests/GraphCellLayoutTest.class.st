"
I represent a collection of tests for cell based layout.
"
Class {
	#name : #GraphCellLayoutTest,
	#superclass : #GAbstractGridLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphCellLayoutTest >> actualClass [
	^ GraphCellLayout 
]

{ #category : #tests }
GraphCellLayoutTest >> testInitialize [
	| layout |
	layout := GraphCellLayout new.
	self assert: layout align equals: #left
]

{ #category : #tests }
GraphCellLayoutTest >> testLeftCentered [
	| layout |
	layout := GraphCellLayout new.
	self assert: layout translateElement notNil
]
