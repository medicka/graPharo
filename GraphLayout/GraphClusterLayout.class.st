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

{ #category : #initialization }
GraphClusterLayout >> initializeNode: aNode [

	|children|
	
	children := (self childrenFor: aNode) asOrderedCollection  .
	
	children do: [ :e | self initializeNode: e.
						self fatherOf: e put: aNode ].
	
	children isEmpty 
		ifTrue: [ self layerOf: aNode put: 0.
							externalLayer add: aNode ] 
		ifFalse: [ self layerOf: aNode put: ((children collect: [ :e | (self layerOf: e) ]) max + 1).
							self leftContourOf: aNode put: children first.
							self rightContourOf: aNode put: children last ].
]
