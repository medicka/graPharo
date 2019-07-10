"
I represent a vertical line layout class.
"
Class {
	#name : #GraphVerticalLineLayout,
	#superclass : #GAbstractLineLayout,
	#category : #GraphLayout
}

{ #category : #'as yet unclassified' }
GraphVerticalLineLayout >> deltaFor: aNodeFigure [
	
	| delta |
	delta := 0.
	self alignment == #right ifTrue: [delta := aNodeFigure width].
	self alignment == #center ifTrue: [delta := aNodeFigure width / 2.0].
	^delta @ 0
]

{ #category : #'as yet unclassified' }
GraphVerticalLineLayout >> initialize [
	
	super initialize.
	self alignLeft
]

{ #category : #'as yet unclassified' }
GraphVerticalLineLayout >> movePointer: pointer accordingToFigure: aNodeFigure [
	
	^ pointer x @ (pointer y + aNodeFigure height + self verticalGap)
]

{ #category : #'as yet unclassified' }
GraphVerticalLineLayout >> positionOriginalPointer: elements [ 
	| maxWidth delta |
	delta := 0.
	self alignment == #right ifTrue: 
		[ maxWidth := elements maxValue: #width.
		delta := maxWidth ].
	self alignment == #center ifTrue: 
		[ maxWidth := elements maxValue: #width.
		delta := maxWidth / 2.0 ].
	^ ((0) + delta) @ (0)
]
