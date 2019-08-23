"
I represent an abstract describtion on all grid based layouts. 
"
Class {
	#name : #GAbstractGridLayout,
	#superclass : #GLayout,
	#instVars : [
		'gapSize',
		'lineItemsCountBlock'
	],
	#category : #'GraphLayout-GridLikeLayout'
}

{ #category : #accessing }
GAbstractGridLayout >> defaultGapSize [ 
	"Sets a default value (5) to the size of a gap between vertices."
	
	^ 15
]

{ #category : #accessing }
GAbstractGridLayout >> defaultLineItemsCount [ 
	"sets a default value for number of Vertices in one line."
	
	^ 10
]

{ #category : #accessing }
GAbstractGridLayout >> gapSize [ 
	^ gapSize
]

{ #category : #accessing }
GAbstractGridLayout >> initialize [ 
	"Initializes AbstractGridLayout objects."
	
	super initialize.
	gapSize := self defaultGapSize.
	lineItemsCountBlock := self defaultLineItemsCount.
]

{ #category : #accessing }
GAbstractGridLayout >> lineItemsCountBlock [
	
	^ lineItemsCountBlock
]

{ #category : #accessing }
GAbstractGridLayout >> setLineItemsCount: aVerticesGroup [ 
	"Based on size of set of vertices of graph in question, calculates optimal number of vertices in one 	line."
		
			| height width |
			(aVerticesGroup  size < 3 )
				ifTrue: [ lineItemsCountBlock := (aVerticesGroup  size max: 1) @ 1 ]
				ifFalse: 
					[ height := (aVerticesGroup  size * 0.618034) sqrt ceiling truncated.
					width := (aVerticesGroup  size / height) ceiling truncated.
					lineItemsCountBlock := width @ height ].
			^lineItemsCountBlock 
]
