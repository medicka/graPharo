"
I represent a circle layout in which elements are equidistant from each other: the layout maintains the same distance between elements.
"
Class {
	#name : #GraphEquidistentCircleLayout,
	#superclass : #GAbstractWeightedCircleLayout,
	#category : #'GraphLayout-CircleLayout'
}

{ #category : #'as yet unclassified' }
GraphEquidistentCircleLayout >> calculatingFunctionsFor: aVertex withRadius: aRad [ 
	|position x y|
	position := aVertex  position.
			x := position x.
			y := position y.
			(((y > (2*(x - (aRad/2)))) and:(y > (-2*(x - (3/2*aRad))))) or: 
			((y < (2*(x - (aRad/2)))) and:(y < (-2*(x - (3/2*aRad))))))
				ifTrue: [ ^ aVertex  width  ]
				ifFalse:[ ^ aVertex  height  .].
]

{ #category : #hook }
GraphEquidistentCircleLayout >> computeSeparationFor: elements [ 
"Compute the separation between each element, this separation will always be the same"
	| sep |
	sep := ((2 * Float pi * (self computeRadiusFor: elements)) - (self weightSum: elements))/
	(elements size).
	^sep
]

{ #category : #hook }
GraphEquidistentCircleLayout >> doExecute: elements [ 
	| angle rad center angleIncrement adjustment separation|
	
	super doExecute: elements.
	separation := self computeSeparationFor: elements .
	rad := self computeRadiusFor: elements.
	center := Point x: rad y: rad.
	angle :=  self initialAngle.
	elements
		do: [ :each | 
			| point |
			"First, the angle is increased only by the angle given by the element radius (height/2),
			then the point is set, and then it's increased by the rest of the total increment"
			"This is to consider both last and next elements weights"
			"(((angle > 0.7853981634) and: (angle < 2.3561944902)) or: 
			((angle > 3.926990817) and: (angle < 5.4977871438)))"
			adjustment := self calculatingFunctionsFor: each withRadius: 	rad.	
			angle := angle + ((adjustment)/(2*rad)).
			point := center + (Point radius: rad theta: angle).
			angleIncrement := (((adjustment)/2) + (separation))/rad.
			angle := angle + angleIncrement.
			translator translate: each to: point. ]
]

{ #category : #hook }
GraphEquidistentCircleLayout >> weightSum: elements [ 
	"Computes the sum of all elements 'weight' or size"
	| sum rad|
	sum := 0.
	rad := self computeRadiusFor: elements .
	elements
		do: [ :each | 
			|adjustment|
			adjustment := self calculatingFunctionsFor: each withRadius: rad.
			sum := sum + adjustment .
		].
	^sum
]
