"
I represent a collection of tests for line based layouts.
"
Class {
	#name : #GAbstractLineLayoutTest,
	#superclass : #GLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GAbstractLineLayoutTest >> testInitialize [ 
"Test that checks initialization of all line based layouts. We are checking if default values are set corectly. Expected result both vertical and horizontal gap are equal to 10."

	|layout|
	layout := self newInstance .
	self assert: ((layout verticalGap = 10) and: (layout horizontalGap = 10))
]
