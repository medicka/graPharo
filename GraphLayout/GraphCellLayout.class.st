"
I represent a cell layout class.
"
Class {
	#name : #GraphCellLayout,
	#superclass : #GAbstractGridLayout,
	#instVars : [
		'align',
		'translateElement',
		'inCellPosition'
	],
	#category : #GraphLayout
}

{ #category : #accessing }
GraphCellLayout >> align [
	^ align
]

{ #category : #'as yet unclassified' }
GraphCellLayout >> doExecute: elements [ 
	
	| lineItemSize pointer columnCount rowCount maxHeight columnsWidths rowHeights |
	lineItemSize := self setLineItemsCount: elements.

	"We compute the size of the grid"
	columnCount := 1.
	rowCount := 1.
	maxHeight := 0.
	columnsWidths := OrderedCollection new.
	rowHeights := OrderedCollection new.
	elements do: [ :e |
		columnsWidths size < columnCount ifTrue: [ columnsWidths add: 0 ].
		columnsWidths at: columnCount put: ((columnsWidths at: columnCount) max: e extent x).		
		maxHeight := maxHeight max: e extent y.
		columnCount := columnCount + 1.
		columnCount > lineItemSize
			ifTrue: [ 
				columnCount := 1. 
				rowHeights add: maxHeight.
				maxHeight := 0 ]
	].
	rowHeights add: maxHeight.


	"We do the translation"
	columnCount := 1.
	rowCount := 1.
	pointer := (((columnsWidths at: 1) / 2) @ ((rowHeights at: 1) / 2)).
	elements do: [ :e | 
		e position: pointer.
		pointer := pointer + (self gapSize * 2 @ 0) + (((columnsWidths at: columnCount) / 2) @ 0).

		columnCount := columnCount + 1.
		columnCount > lineItemSize
			ifTrue: [ 
				columnCount := 1.
				pointer := (((columnsWidths at: 1) / 2) @ pointer y)  + (0 @ ((rowHeights at: rowCount) / 2)).
				rowCount := rowCount + 1.
				rowCount <= rowHeights size 
					ifTrue: [ pointer := pointer + (0 @ ((rowHeights at: rowCount) / 2)) ].				 
				 ]
			ifFalse: [ pointer := pointer + (self gapSize * 2 @ 0) + (((columnsWidths at: columnCount ) / 2) @ 0) ].
	]
]

{ #category : #accessing }
GraphCellLayout >> inCellPosition: anObjectOrOneArgBlock [

	inCellPosition := anObjectOrOneArgBlock
]

{ #category : #accessing }
GraphCellLayout >> initialize [
	super initialize.
	self leftCentered
]

{ #category : #'as yet unclassified' }
GraphCellLayout >> leftCentered [
	align := #left.

	translateElement := [ :aTranslator :anElement :newPos | translator translateTopLeftOf: anElement to: newPos ].
	
	"self inCellPosition: [ :cell | 0 @ ((cell extent y - cell element height) / 2) ]"
	self inCellPosition: [ :cell | cell extent x @ 0 ]
]

{ #category : #accessing }
GraphCellLayout >> translateElement [
	^ translateElement
]
