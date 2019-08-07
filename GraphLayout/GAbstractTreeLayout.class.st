"
I represent an abstract class that descris all tree layouts.
"
Class {
	#name : #GAbstractTreeLayout,
	#superclass : #GEdgeDrivenLayout,
	#instVars : [
		'verticalGap',
		'horizontalGap',
		'cachedChildren',
		'cachedParents'
	],
	#category : #GraphLayout
}

{ #category : #getter }
GAbstractTreeLayout >> cachedChildren [
	cachedChildren
		ifNil: [ cachedChildren := IdentityDictionary new: 1000 ].
	^ cachedChildren
]

{ #category : #getter }
GAbstractTreeLayout >> cachedParents [
	cachedParents
		ifNil: [ cachedParents := IdentityDictionary new: 1000 ].
	^ cachedParents
]

{ #category : #getter }
GAbstractTreeLayout >> childrenFor: aVertex [
	
	^self cachedChildren
		at: aVertex
		ifAbsentPut:
			(aVertex outNeighbourhood )
]

{ #category : #hook }
GAbstractTreeLayout >> clear [
	
	cachedParents := nil.
	cachedChildren := nil.
]

{ #category : #hook }
GAbstractTreeLayout >> doInitialize: elements [ 
	super doInitialize: elements.
	self clear.
	self greedyCycleRemoval: elements
]

{ #category : #hook }
GAbstractTreeLayout >> greedyCycleRemoval: aCollection [
	"Di Battista Greedy-Cycle-Removal algorithm. Chapter 9.4, page 297. The last part is not like in the book. The original algorithm only takes
	 local optimas into account. This will break ordinary trees sometimes. This version also takes global optimas into account."
	
	| g sl sr s indeg outdeg degrees vertex | 
	g := aCollection copy asOrderedCollection.
	sl := OrderedCollection new.
	sr := OrderedCollection new.	"While g contains a sink (aka leaf)"
	g copy
		do:
			[:node | 
			(self childrenFor: node) isEmpty
				ifTrue:
					[sr addFirst: node.
					g remove: node]	"self edges detect: [:edge | edge fromFigure == node] ifNone: [sr addFirst: node. g remove: node]"].	"While g contains a source (aka root)"
	g copy
		do:
			[:node | 
			(self parentsFor: node) isEmpty
				ifTrue:
					[sl addLast: node.
					g remove: node]	"self edges detect: [:edge | edge toFigure == node] ifNone: [sl addLast: node. g remove: node]"].	"Calculate deg for all remaining vertices"
	degrees := IdentityDictionary new.
	g
		do:
			[:node | 
			indeg := (self parentsFor: node) size.
			outdeg := (self childrenFor: node) size.	"indeg := self edges inject: 0 into: [:sum :edge | (edge toFigure == node) ifTrue: [sum + 1] ifFalse: [sum]].
		outdeg := self edges inject: 0 into: [:sum :edge | (edge fromFigure == node) ifTrue: [sum + 1] ifFalse: [sum]]."
			degrees
				at: node
				put: outdeg - indeg].	"While g not empty"
	g := g asSortedCollection: [:a :b | (degrees at: a) >= (degrees at: b)].
	[g isEmpty]
		whileFalse:
			[vertex := g
				detect: [:v | (self parentsFor: v) anySatisfy: [:w | sl includes: w]]
				ifNone: [g first].	"Corner case: Closed cycle with not root at all. Eg 1 -> 2 -> 3 -> 1"
			sl addLast: vertex.
			g remove: vertex].	"Remove all leftward edges"
	s := sl , sr.
	self edges notNil
		ifTrue: 
			[ self edges copy
				do:
					[:edge | 
					(s indexOf: edge fromVertex ) > (s indexOf: edge toVertex)
						ifTrue: [self edges remove: edge ] ] ].	
	"Reset the cache"
	self clear
]

{ #category : #getter }
GAbstractTreeLayout >> horizontalGap [
	^ horizontalGap
]

{ #category : #getter }
GAbstractTreeLayout >> parentsFor: aNode [
	
	^ self cachedParents
		at: aNode
		ifAbsentPut:
			(aNode inNeighbourhood  )
]

{ #category : #collection }
GAbstractTreeLayout >> rootNodesFor: aCollection [
	^ aCollection select: [:node | 
		( self parentsFor: node) isEmpty ].
]

{ #category : #getter }
GAbstractTreeLayout >> verticalGap [
	^ verticalGap
]
