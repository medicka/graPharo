"
I represent a horizontal line layout class.
"
Class {
	#name : #GraphHorizontalLineLayout,
	#superclass : #GAbstractLineLayout,
	#category : #'GraphLayout-LineLayout'
}

{ #category : #calculating }
GraphHorizontalLineLayout >> deltaFor: aVertex [
	
	| delta |
	delta := 0.
	self alignment == #bottom ifTrue: [delta := aVertex height].
	self alignment == #center ifTrue: [delta := aVertex  height / 2.0].
	^0 @ delta
]

{ #category : #initalize }
GraphHorizontalLineLayout >> initialize [
	
	super initialize.
	self alignTop
]

{ #category : #moves }
GraphHorizontalLineLayout >> movePointer: pointer accordingToFigure: element [
	
	^ (pointer x + element width + self horizontalGap) @ pointer y
]

{ #category : #calculating }
GraphHorizontalLineLayout >> positionOriginalPointer: elements [ 
	| maxHeight delta |
	delta := 0.
	self alignment == #bottom ifTrue: 
		[ maxHeight := elements maxValue: #height.
		delta := maxHeight ].
	self alignment == #center ifTrue: 
		[ maxHeight := elements maxValue: #height.
		delta := maxHeight / 2.0 ].
	^ (0) @ ((0) + delta)
]
