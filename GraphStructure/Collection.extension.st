Extension { #name : #Collection }

{ #category : #'*GraphStructure' }
Collection >> makeEncompassingRectangles [
	^ self
				ifEmpty: [ 0 @ 0 corner: 0 @ 0 ]
				ifNotEmpty: [ Rectangle merging: (self collect: #encompassingRectangle as: OrderedCollection) ] 
]
