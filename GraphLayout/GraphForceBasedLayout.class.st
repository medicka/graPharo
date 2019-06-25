"
I represent a force based layout. I positin vertices in space in such way that adjacent vertices are attracted and non adjacent ones are repulsed. 
"
Class {
	#name : #GraphForceBasedLayout,
	#superclass : #GEdgeDrivenLayout,
	#instVars : [
		'alpha',
		'initialLayout',
		'nbIterations',
		'nodes',
		'fixedNodes',
		'strengths',
		'lengths',
		'charges',
		'strength',
		'length',
		'charge',
		'gravity',
		'friction',
		'theta',
		'center',
		'shouldUseProgressBar',
		'weights',
		'oldPositions'
	],
	#category : #GraphLayout
}

{ #category : #accessing }
GraphForceBasedLayout >> alpha [ 
	^alpha 
]

{ #category : #'initialize-release' }
GraphForceBasedLayout >> defaultInitialLayout [ 
	^ GraphGridLayout new
]

{ #category : #hook }
GraphForceBasedLayout >> doExecute: nodeElements [ 
	self start: nodeElements.
	self shouldRunLayoutWithProgressBar
		ifTrue: [ self "runLayoutInJob" runLayoutSimply ]
		ifFalse: [ self runLayoutSimply ].
	alpha := 0.
	"nodes do: [ :e | translator translateTopLeftOf: e to: e position ]"
]

{ #category : #hook }
GraphForceBasedLayout >> initialPositionOfNodes: nodeElements [ 
	initialLayout executeOnElements: nodeElements
]

{ #category : #hook }
GraphForceBasedLayout >> initialize [ 
	super initialize.
	nbIterations := 0.
	edges := #().
	nodes := #().
	initialLayout := self defaultInitialLayout.
	fixedNodes := Dictionary new.
	strengths := Dictionary new.
	lengths := Dictionary new.
	charges := Dictionary new.
	strength := 1.
	length := 20.
	charge := -30.
	gravity := 0.1.
	friction := 0.9.
	theta := 0.8.
	center := 200 @ 200.
	alpha := 0.1.
	self useProgressBar
]

{ #category : #hook }
GraphForceBasedLayout >> isJobInstalled [ 
	"Return true if the class Job exist. This is mainly useful to make a distinction between Pharo and VisualWorks"
	^ Smalltalk includesKey: #Job
]

{ #category : #acccessing }
GraphForceBasedLayout >> lengthOf: anEdge [ 
	^ lengths at: anEdge ifAbsent: [ ^ length ] 
]

{ #category : #accessing }
GraphForceBasedLayout >> nbIterations: anObject [ 
	nbIterations := anObject
]

{ #category : #hook }
GraphForceBasedLayout >> prepareNodes: nodeElements [ 
	"Initialize the meta data associated to the nodes. At that stage, position of nodes is not modified"
	weights := Dictionary new.
	oldPositions := Dictionary new.
	nodes := nodeElements.
	nodes
		do: [ :e | 
			weights add: (Association key: e value: 0).
			oldPositions add: (Association key: e value: e position) ].
	edges
		do: [ :e | 
			| from to |
			from := e fromVertex .
			to := e toVertex .
			weights at: from put: (weights at: from) + 1.
			weights at: to put: (weights at: to) + 1 ].
	alpha := 0.1
]

{ #category : #hook }
GraphForceBasedLayout >> runLayoutSimply [ 
	nbIterations = 0
		ifTrue: [ 
			[
			alpha := alpha * 0.99.
			alpha > 0.005 ] whileTrue: [ self step ] ]
		ifFalse: [ 
			nbIterations
				timesRepeat: [ 
					alpha := alpha * 0.99.
					self step ] ]
]

{ #category : #'initailize-release' }
GraphForceBasedLayout >> set: anEdge length: aNumber [ 
	lengths at: anEdge put: aNumber
]

{ #category : #'initailize-release' }
GraphForceBasedLayout >> set: anEdge strength: aNumber [ 
	strengths at: anEdge put: aNumber
]

{ #category : #hook }
GraphForceBasedLayout >> shouldRunLayoutWithProgressBar [ 
	^ self isJobInstalled and: [ self shouldUseProgressBar ]
]

{ #category : #'initialize-release' }
GraphForceBasedLayout >> shouldUseProgressBar [ 
	^ shouldUseProgressBar	
]

{ #category : #hook }
GraphForceBasedLayout >> start: nodeElements [ 
	self initialPositionOfNodes: nodeElements.
	self prepareNodes: nodeElements
]

{ #category : #'stepping and presenter' }
GraphForceBasedLayout >> step [  
	"run a step of the force layout algorithm"
	| from to fp tp x y len k quad old |	
		
	"If there is no nodes, then there is not much to do"
	nodes ifEmpty: [ ^ self ].
	super step.
	edges do: [ :e | 
					from := e fromVertex . 
					fp := from position.
					to := e toVertex . 
					tp := to position.
					x := tp x - fp x.
					y := tp y - fp y.
					len := ((x * x) + (y * y)) sqrt.
					(len closeTo: 0) ifFalse: [ 
						len :=  alpha * (self strengthOf: e) * ( len - (self lengthOf: e) ) / len.
						x := x * len.
						y := y * len.
						k := (weights at: from) / (( weights at: from) +( weights at: to )).
						to position: ( tp x - (x * k) )@( tp y - (y * k) ).
						k := 1 -  k.
						from position: ( fp x + (x * k) )@( fp y + (y * k) ) ] ].
			
		k := alpha * gravity.
		(k closeTo: 0) ifFalse: [ 
			x := center x.
			y := center y.
			nodes do: [ :ea | | pos |
					pos := ea  position.
					ea position: (pos x + ((x - pos x)* k)) @ (pos y + (( y - pos y )* k )) ] ].
				
		quad := GtGraphQuadTree withAll: nodes.
		self accumulate: quad.
		nodes do: [ :e | 
			(self isFixed: e) 
				ifFalse: [ self repulse: e from: quad ]
				ifTrue: [ translator translateTopLeftOf: e to: (fixedNodes at: e) ] ].

		nodes do: [ :e | 
			old := e position.
			e position: 
				(old x - (( (oldPositions at: e) x - old x ) * friction)) @ 
				(old y - (( (oldPositions at: e) y - old y ) * friction)).
			oldPositions at: e put: old.].
]

{ #category : #algorithm }
GraphForceBasedLayout >> strength: aFloat [ 
	"Set the force of attraction for the edges. A high value results in having nodes together.
	The default value is 1.0"
	strength := aFloat
]

{ #category : #algorithm }
GraphForceBasedLayout >> strengthOf: anEdge [ 

	^ strengths at: anEdge ifAbsent: [ ^ strength ] 
]

{ #category : #'initialize-release' }
GraphForceBasedLayout >> useProgressBar [ 
	shouldUseProgressBar := true	
]

{ #category : #accessing }
GraphForceBasedLayout >> weights [  
	^weights 
]