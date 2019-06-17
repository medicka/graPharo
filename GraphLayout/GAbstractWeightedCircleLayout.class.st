"
I represent an abstract root class of weighted circle layout. Look at the class comments of my subclasses for more details.
"
Class {
	#name : #GAbstractWeightedCircleLayout,
	#superclass : #GraphCircleLayout,
	#category : #GraphLayout
}

{ #category : #hook }
GAbstractWeightedCircleLayout >> weightSum: elements [ 
	"Computes the sum of all elements 'weight' or size"
	| sum |
	sum := 0.
	elements
		do: [ :each |
			sum := sum + (each height)
		].
	^sum
]
