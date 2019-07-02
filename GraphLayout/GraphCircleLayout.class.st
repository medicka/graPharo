"
I represent a circle layout class.
"
Class {
	#name : #GraphCircleLayout,
	#superclass : #GAbstractCircleLayout,
	#category : #GraphLayout
}

{ #category : #hook }
GraphCircleLayout >> doExecute: elements [ 
	
	| angleIncrement angle rad center |
	rad := self computeRadiusFor: elements.
	center := Point x: rad y: rad.
	angleIncrement := self computeIncrementalAngleFor: elements.
	angle := self initialAngle.
	elements
		do: [ :each | 
			| point |
			point := center + (Point radius: rad theta: angle).
			angle := angle + angleIncrement.
			translator translateTopLeftOf: each to: point.
			]
]
