"
I represent an abstract description of all circle based layouts.
"
Class {
	#name : #GAbstractCircleLayout,
	#superclass : #GLayout,
	#instVars : [
		'initialRadius',
		'factor',
		'initialAngle',
		'initialIncrementalAngle'
	],
	#category : #'GraphLayout-CircleLayout'
}

{ #category : #hook }
GAbstractCircleLayout >> computeIncrementalAngleFor: elements [ 
	"Return the value, in radian, of the incremental angle"
	
	^ initialIncrementalAngle = 0
		ifTrue: [ 2 * Float pi / elements size ]
		ifFalse: [ initialIncrementalAngle ]
]

{ #category : #hook }
GAbstractCircleLayout >> computeRadiusFor: elements [ 
	"Return the radius of the circle. If none has been set (i.e., initialRadius = 0), then it is computed 	as the scale factor times the number of elements"
		
	^ initialRadius = 0 
		ifTrue: [ elements size * self scaleFactor ]
		ifFalse: [ initialRadius ]
]

{ #category : #accessing }
GAbstractCircleLayout >> initialAngle [ 
	"Return the initial angle, in radian"
	
	^ initialAngle
]

{ #category : #hook }
GAbstractCircleLayout >> initialize [ 
	"Initialize a newly created instance. This method must answer the receiver."
	
	super initialize.
	self scaleBy: 15.
	
	"Represent the initial angle to place the elements"
	initialAngle := 0.
	
	"Distance of the circle. If it is 0 when entering doExecute, then it is computed"
	initialRadius := 0.
	
	"0 means that it is computed, and not set by the user"
	initialIncrementalAngle := 0.
]

{ #category : #transformations }
GAbstractCircleLayout >> scaleBy: aNumber [ 
	
	factor := aNumber
]

{ #category : #accessing }
GAbstractCircleLayout >> scaleFactor [ 
	^ factor
]
