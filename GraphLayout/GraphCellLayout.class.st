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
