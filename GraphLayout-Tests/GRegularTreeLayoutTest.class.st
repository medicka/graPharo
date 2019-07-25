"
I represent a collection of tests incomon for all regular tree layouts.
"
Class {
	#name : #GRegularTreeLayoutTest,
	#superclass : #GAbstractTreeLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GRegularTreeLayoutTest >> testInitialize [
	| layout |
	layout := self newInstance.
	self assert: (layout topGap = 5 and: layout leftGap = 5)
]
