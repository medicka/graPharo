"
I represent a cluster layout class.
"
Class {
	#name : #GraphClusterLayout,
	#superclass : #GAbstractTreeLayout,
	#instVars : [
		'externalLayer',
		'maxLayer',
		'maxAbcissa'
	],
	#category : #GraphLayout
}

{ #category : #hook }
GraphClusterLayout >> initialize [ 

	super initialize.
	verticalGap := 30.
	horizontalGap := 20.
	externalLayer := OrderedCollection new
]
