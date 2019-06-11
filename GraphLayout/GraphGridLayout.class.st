"
I represent a grid layout class.
"
Class {
	#name : #GraphGridLayout,
	#superclass : #GAbstractGridLayout,
	#category : #GraphLayout
}

{ #category : #hook }
GraphGridLayout >> doExecute: elements [ 
	| pointer lineItemCount lineItemSize maxLastLineHeight originalGapLeft originalGapTop width height|
	originalGapLeft := 0.
	originalGapTop := 0.
	
	pointer := originalGapLeft @ originalGapTop.
	lineItemSize := self setLineItemsCount: elements.
	lineItemCount := 0.
	maxLastLineHeight := 0.

	elements
		do: [ :element | 
			translator translateTopLeftOf: element to: pointer.
			width := (element measureDimensions: element) at: #width.
			height := (element measureDimensions: element) at: #height.
			pointer := (pointer x + width + self gapSize) @ pointer y.
			lineItemCount := lineItemCount + 1.
			maxLastLineHeight := maxLastLineHeight max: height .
			lineItemCount >= lineItemSize
				ifTrue: [ 
					pointer := originalGapLeft @ (pointer y + (self gapSize) + maxLastLineHeight).
					
					maxLastLineHeight := 0.
					lineItemCount := 0 ].
			].
]
