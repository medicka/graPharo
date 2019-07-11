"
I represent a collection of tests for cluster layout.
"
Class {
	#name : #GraphClusterLayoutTest,
	#superclass : #GAbstractTreeLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GraphClusterLayoutTest >> testInitialize [ 

	|layout|
	layout := GraphClusterLayout new.
	self assert: ((layout verticalGap = 30) and: (layout horizontalGap = 20))
]
