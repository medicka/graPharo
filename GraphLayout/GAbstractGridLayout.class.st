"
I represent an abstract describtion on all grid based layouts. 
"
Class {
	#name : #GAbstractGridLayout,
	#superclass : #GraphLayout,
	#instVars : [
		'gapSize',
		'lineItemsCountBlock'
	],
	#category : #GraphLayout
}

{ #category : #accessing }
GAbstractGridLayout >> defaultGapSize [ 
	^ 5
]

{ #category : #accessing }
GAbstractGridLayout >> defaultLineItemsCount [ 
	
	^ 10
]

{ #category : #accessing }
GAbstractGridLayout >> gapSize [ 
	^ gapSize
]

{ #category : #accessing }
GAbstractGridLayout >> initialize [ 
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
	
			| height width |
			(aVerticesGroup  size < 3 )
				ifTrue: [ lineItemsCountBlock := (aVerticesGroup  size max: 1) @ 1 ]
				ifFalse: 
					[ height := (aVerticesGroup  size * 0.618034) sqrt ceiling truncated.
					width := (aVerticesGroup  size / height) ceiling truncated.
					lineItemsCountBlock := width @ height ].
			^lineItemsCountBlock 
]
