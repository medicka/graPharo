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

{ #category : #setter }
GAbstractLineLayout >> alignLeft [
	
	alignment := #left
]

{ #category : #setter }
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

{ #category : #calculating }
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

{ #category : #initalize }
GAbstractLineLayout >> initialize [
	
	super initialize.
	verticalGap := 10.
	horizontalGap := 10.
]

{ #category : #moves }
GAbstractLineLayout >> movePointer: pointer accordingToFigure: aNodeFigure [
	
	self subclassResponsibility
]

{ #category : #calculating }
GAbstractLineLayout >> positionOriginalPointer: aGraph [
	
	^self subclassResponsibility
]

{ #category : #accessing }
GAbstractLineLayout >> verticalGap [
	
	^verticalGap
]
