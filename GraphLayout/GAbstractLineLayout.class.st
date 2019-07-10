"
I represent an abstract describtion on all line based layouts.  
"
Class {
	#name : #GAbstractLineLayout,
	#superclass : #GLayout,
	#instVars : [
		'gapSize',
		'horizontalGap',
		'verticalGap',
		'horizontalOutGap',
		'verticalOutGap',
		'alignment'
	],
	#category : #GraphLayout
}

{ #category : #'as yet unclassified' }
GAbstractLineLayout >> alignTop [
	
	alignment := #top
]

{ #category : #accessing }
GAbstractLineLayout >> alignment [
	
	^alignment
]

{ #category : #accessing }
GAbstractLineLayout >> alignment: anObject [
	
	alignment := anObject
]

{ #category : #'as yet unclassified' }
GAbstractLineLayout >> deltaFor: aNodeFigure [
	
	^self subclassResponsibility
]

{ #category : #hook }
GAbstractLineLayout >> doExecute: elements [ 
	| pointer delta |
	pointer := self positionOriginalPointer: elements.
	elements do: [ :element |
		delta := self deltaFor: element.
		translator translateTopLeftOf: element to: pointer - delta.
		pointer := self 
			movePointer: pointer
			accordingToFigure: element.
		self step ].
]

{ #category : #accessing }
GAbstractLineLayout >> gapSize [
	
	^gapSize
]

{ #category : #accessing }
GAbstractLineLayout >> horizontalGap [
	
	^horizontalGap
]

{ #category : #'as yet unclassified' }
GAbstractLineLayout >> initialize [
	
	super initialize.
	verticalGap := 10.
	horizontalGap := 10.
]

{ #category : #'as yet unclassified' }
GAbstractLineLayout >> movePointer: pointer accordingToFigure: aNodeFigure [
	
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
GAbstractLineLayout >> positionOriginalPointer: aGraph [
	
	^self subclassResponsibility
]

{ #category : #accessing }
GAbstractLineLayout >> verticalGap [
	
	^verticalGap
]
