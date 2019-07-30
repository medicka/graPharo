"
I represent a abstract class for all regular tree layouts.
"
Class {
	#name : #GRegularTreeLayout,
	#superclass : #GAbstractTreeLayout,
	#instVars : [
		'alreadyLayoutedNodes',
		'topGap',
		'leftGap',
		'nodesByLayer',
		'isLayered'
	],
	#category : #GraphLayout
}

{ #category : #accessing }
GRegularTreeLayout >> atLayer: aNumber add: aNodeCollection [
	| collection |
	collection := nodesByLayer at: aNumber ifAbsentPut: [OrderedCollection new].
	collection addAll: aNodeCollection
]

{ #category : #'as yet unclassified' }
GRegularTreeLayout >> childrenFor: aNode except: aNodeCollection [
	^ (self childrenFor: aNode)
		reject: [ :each | aNodeCollection includes: each ]
]

{ #category : #'as yet unclassified' }
GRegularTreeLayout >> findHeighest: aGroup [
	| max |
	max := aGroup asOrderedCollection first.
	aGroup
		do: [ :each | 
			each height > max height
				ifTrue: [ max := each ] ].
	^ max
]

{ #category : #'as yet unclassified' }
GRegularTreeLayout >> findWidthest: aGroup [
	| max |
	max := aGroup asOrderedCollection first.
	aGroup
		do: [ :each | 
			each width > max width
				ifTrue: [ max := each ] ].
	^ max
]

{ #category : #hook }
GRegularTreeLayout >> initialize [
	super initialize.
	topGap := 5.
	leftGap := 5.
	isLayered := false
]

{ #category : #'as yet unclassified' }
GRegularTreeLayout >> isLayered [
	"Is the layout layered"
	
	^ isLayered
]

{ #category : #accessing }
GRegularTreeLayout >> isLayered:aBoolean [
	
	isLayered := aBoolean
]

{ #category : #accessing }
GRegularTreeLayout >> leftGap [
	^ leftGap
]

{ #category : #'as yet unclassified' }
GRegularTreeLayout >> leftTopOfHeighest: aGroup [
	| max point |
	max := self findHeighest: aGroup .
	point := (max position x - max width) @ (max position y - max height).
	^ point
]

{ #category : #accessing }
GRegularTreeLayout >> nodesByLayer [
	 ^ nodesByLayer
]

{ #category : #accessing }
GRegularTreeLayout >> nodesByLayer: anObject [
	 nodesByLayer := anObject
]

{ #category : #'as yet unclassified' }
GRegularTreeLayout >> rightBottomOfWidthest: aGroup [
	| max point |
	max := self findWidthest: aGroup .
	point := (max position x + (max width/2)) @ (max position y + (max height/2)).
	^ point
]

{ #category : #accessing }
GRegularTreeLayout >> topGap [
	^ topGap
]
