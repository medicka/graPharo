"
I represent a tree layout for a graph.
"
Class {
	#name : #GraphTreeLayout,
	#superclass : #GRegularTreeLayout,
	#instVars : [
		'orientation'
	],
	#category : #'GraphLayout-TreeLayout'
}

{ #category : #getter }
GraphTreeLayout >> alreadyLayoutedNodes [
	^alreadyLayoutedNodes  
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> bottomLayout: aNodeCollection atPoint: aPoint atLayer: aNumber [
	| childrenPosition x y |
	aNodeCollection isEmpty ifTrue: [ ^ 0 ].
	x := aPoint x.
	y := aPoint y.
	alreadyLayoutedNodes addAll: aNodeCollection.
	self atLayer: aNumber add: aNodeCollection.
	aNodeCollection do: [ :each | 
		translator translateBottomLeftOf: each to: (each position x - (each width / 2)) @ y .
		childrenPosition  := y - each height - self verticalGap.
		self bottomLayout: (self computeChildrenFor: each) atPoint: x @ 
		childrenPosition atLayer: aNumber + 1.
		].
	
]

{ #category : #'hook-private' }
GraphTreeLayout >> computeChildrenFor:  aVertex [
	^self childrenFor: aVertex except: alreadyLayoutedNodes 
]

{ #category : #hook }
GraphTreeLayout >> doExecute: elements [
	| rootNodes aPoint |
	alreadyLayoutedNodes := OrderedCollection new.
	rootNodes := self rootNodesFor: elements.
	nodesByLayer := OrderedCollection new.
	aPoint := self leftGap @ self topGap.
	self
		layout: rootNodes
		atPoint: aPoint
		atLayer: 1
		withOrientation: orientation.
	self isLayered
		ifTrue: [ self rearrangeByLayers: elements ]
]

{ #category : #hook }
GraphTreeLayout >> initialize [ 
	super initialize.
	orientation := #top.
	verticalGap := 20.
	horizontalGap := 20
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> layout: aGroup atPoint: aPoint atLayer: aLayer withOrientation: anOrientation [
	anOrientation == #top
		ifTrue: [ self topLayout: aGroup atPoint: aPoint atLayer: aLayer ].
	anOrientation == #left
		ifTrue: [ self leftLayout: aGroup atPoint: aPoint atLayer: aLayer ].
	anOrientation == #bottom
		ifTrue: [ | point index |
			self topLayout: aGroup atPoint: aPoint atLayer: aLayer.
			index := nodesByLayer size.
			point := self leftTopOfHeighest:  (nodesByLayer at: index).
			alreadyLayoutedNodes removeAll.
			nodesByLayer removeAll.
			self bottomLayout: aGroup atPoint: point atLayer: aLayer ].
	anOrientation == #right
		ifTrue: [ | point index |
			self leftLayout: aGroup atPoint: aPoint atLayer: aLayer.
			index := nodesByLayer size.
			point := self rightBottomOfWidthest: (nodesByLayer at: index).
			alreadyLayoutedNodes removeAll.
			nodesByLayer removeAll.
			self rightLayout: aGroup atPoint: point atLayer: aLayer ]
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> leftLayout: aNodeCollection atPoint: aPoint atLayer: aNumber [
	| treeSize childrenPosition x y middleOfTree |
	aNodeCollection isEmpty
		ifTrue: [ ^ 0 ].
	x := aPoint x.
	y := aPoint y.
	alreadyLayoutedNodes addAll: aNodeCollection.
	self atLayer: aNumber add: aNodeCollection.
	aNodeCollection
		do: [ :each | 
			childrenPosition := x + each width + self horizontalGap.
			treeSize := each height
				max:
					(self
						leftLayout: (self computeChildrenFor: each)
						atPoint: childrenPosition @ y
						atLayer: aNumber + 1).
			middleOfTree := y + (treeSize / 2.0) - (each height / 2.0).
			translator translateTopLeftOf: each to: x @ middleOfTree.
			y := y + treeSize + self verticalGap ].
	^ y - aPoint y - self verticalGap
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> orientation: anOrientation [
	orientation := anOrientation 
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> rearrangeByLayers: aGraph [
		(orientation == #top)
		ifTrue: [self rearrangeByLayersTop: aGraph ].
		 (orientation == #left)
		ifTrue: [self rearrangeByLayersLeft: aGraph ].
		(orientation == #right)
		ifTrue: [self rearrangeByLayersRight: aGraph ].
		(orientation == #bottom)
		ifTrue: [self rearrangeByLayersBottom: aGraph ].

]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> rearrangeByLayersBottom: aGraph [
	| node cursor layerDepthSize |
	node := (nodesByLayer at: 1) first.
	cursor := node position y + node height.
	nodesByLayer
		do: [ :eachSetOfNodes | 
			layerDepthSize := eachSetOfNodes
				inject: 0
				into: [ :max :eachNode | 
					translator
						translate: eachNode
						to: eachNode position x @ (cursor - (eachNode height / 2)).
					max max: eachNode height ].
			cursor := cursor - layerDepthSize - self horizontalGap ]
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> rearrangeByLayersLeft: aGraph [
	| cursor layerDepthSize |
	cursor := self topGap.
	nodesByLayer
		do: [ :eachSetOfNodes | 
			layerDepthSize := eachSetOfNodes
				inject: 0
				into: [ :max :eachNode | 
					translator
						translate: eachNode
						to: (cursor + (eachNode width / 2)) @ eachNode position y.
					max max: eachNode width ].
			cursor := cursor + layerDepthSize + self verticalGap ]
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> rearrangeByLayersRight: aGraph [
	| node separation cursor layerDepthSize |
	node := (nodesByLayer at: 1) first.
	separation := (self
		findWidthest:  (nodesByLayer at: (nodesByLayer size))) width.
	cursor := node position x + node width + separation.
	 nodesByLayer
		do: [ :eachSetOfNodes | 
			layerDepthSize := eachSetOfNodes
				inject: 0
				into: [ :max :eachNode | 
					translator
						translate: eachNode
						to: (cursor - (eachNode width / 2)) @ eachNode position y.
					max max: eachNode width ].
			cursor := cursor - layerDepthSize - self verticalGap ]
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> rearrangeByLayersTop: aGraph [ 
	| cursor layerDepthSize |
	cursor := self topGap.
	nodesByLayer
		do: [ :eachSetOfNodes | 
			layerDepthSize := eachSetOfNodes
				inject: 0
				into: [ :max :eachNode | 
					translator
						translate: eachNode
						to: (eachNode position x) @ (cursor + (eachNode height /2)).
					max max: eachNode height ].
			cursor := cursor + layerDepthSize + self horizontalGap ]
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> rightLayout: aNodeCollection atPoint: aPoint atLayer: aNumber [
	| childrenPosition x y |
	aNodeCollection isEmpty ifTrue: [ ^ 0 ].
	x := aPoint x.
	y := aPoint y.
	alreadyLayoutedNodes addAll: aNodeCollection.
	self atLayer: aNumber add: aNodeCollection.
	aNodeCollection do: [ :each | 
		translator translateBottomRightOf: each to: x @ (each position y + (each height / 2)) .
		childrenPosition  := x - each width - self horizontalGap.
		self rightLayout: (self computeChildrenFor: each) atPoint: 
		childrenPosition @ y atLayer: aNumber + 1.
		].
	
]

{ #category : #'as yet unclassified' }
GraphTreeLayout >> topLayout: aNodeCollection atPoint: aPoint atLayer: aNumber [
	| treeSize childrenPosition x y middleOfTree |
	aNodeCollection isEmpty
		ifTrue: [ ^ 0 ].
	x := aPoint x.
	y := aPoint y.
	alreadyLayoutedNodes addAll: aNodeCollection.
	self atLayer: aNumber add: aNodeCollection.
	aNodeCollection
		do: [ :each | 
			childrenPosition := y + each height + self verticalGap.
			treeSize := each width
				max:
					(self
						topLayout: (self computeChildrenFor: each)
						atPoint: x @ childrenPosition
						atLayer: aNumber + 1).
			middleOfTree := x + (treeSize / 2.0) - (each width / 2.0).
			translator translateTopLeftOf: each to: middleOfTree @ y.
			x := x + treeSize + self horizontalGap ].
	^ x - aPoint x - self horizontalGap
]
