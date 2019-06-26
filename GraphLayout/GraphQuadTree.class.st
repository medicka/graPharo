"
I represent Quad tree objects.
"
Class {
	#name : #GraphQuadTree,
	#superclass : #Object,
	#instVars : [
		'corner',
		'origin',
		'x',
		'y',
		'node',
		'leaf',
		'nodes',
		'charge',
		'cx',
		'cy'
	],
	#category : #GraphLayout
}

{ #category : #'instance creation' }
GraphQuadTree class >> withAll: aNodeCollection [ 
	^ self
		withAll: aNodeCollection
		origin:
			(aNodeCollection collect: [ :e | e position x ]) min
				@ (aNodeCollection collect: [ :e | e position y ]) min
		corner:
			(aNodeCollection collect: [ :e | e position x ]) max
				@ (aNodeCollection collect: [ :e | e position y ]) max
]

{ #category : #'instance creation' }
GraphQuadTree class >> withAll: aNodeCollection origin: aPoint corner: anotherPoint [ 
	| dx dy root |
	dx := anotherPoint x - aPoint x.
	dy := anotherPoint y - aPoint y.
	(dx closeTo: dy)
		ifTrue: [ root := self new.
			root
				origin: aPoint;
				corner: anotherPoint.
			aNodeCollection do: [ :e | root add: e ].
			^ root ].
	dx > dy
		ifTrue: [ ^ self
				withAll: aNodeCollection
				origin: aPoint
				corner: anotherPoint x @ (aPoint y + dx) ].
	dy > dx
		ifTrue: [ ^ self
				withAll: aNodeCollection
				origin: aPoint
				corner: (aPoint x + dy) @ anotherPoint y ]
]

{ #category : #adding }
GraphQuadTree >> add: aNode [ 

	self isLeaf
		ifFalse: [ ^ self addChild: aNode ].

	"I am a leaf at this point"
	self
		assert: [ self nodes allSatisfy: #isNil ]
		description: [ 'Leaf must not have any sub-nodes' ].
	
	x
		ifNotNil: [ (x - aNode position x) abs + (y - aNode position y) abs < 0.01
			ifTrue: [ self addChild: aNode ]
			ifFalse: [
				| aCurrentNode |
				aCurrentNode := node.

				x := nil.
				y := nil.
				node := nil.

				self
					addChild: aNode;
					addChild: aCurrentNode ] ]
		ifNil: [
			x := aNode position x.
			y := aNode position y.
			node := aNode ]
]

{ #category : #adding }
GraphQuadTree >> addChild: aNode [ 
	| center |
	
	center := self center.
	leaf := false.

	aNode position x < center x
		ifTrue: [ aNode position y < center y
				"top left quad"
				ifTrue: [
					(nodes at: 1) ifNil: [
						| new |
						new := GraphQuadTree new
							origin: origin;
							corner: center.
						nodes at: 1 put: new ].
					(nodes at: 1) add: aNode ]

				"bottom left quad"
				ifFalse: [
					(nodes at: 3) ifNil:[
						| new |
						new := GraphQuadTree new
							origin: origin x @ center y;
							corner: center x @ corner y.
						nodes at: 3 put: new ].
					(nodes at: 3) add: aNode ] ]

		ifFalse: [ aNode position y < center y
				"top right quad"
				ifTrue: [
					(nodes at: 2) ifNil: [
						| new |
						new := GraphQuadTree new
							origin: center x @ origin y;
							corner: corner x @ center y.
						nodes at: 2 put: new ].
					(nodes at: 2) add: aNode ]

				"bottom right quad"
				ifFalse: [ (nodes at: 4) ifNil: [
						| new |
						new := GraphQuadTree new
							origin: center;
							corner: corner.
						nodes at: 4 put: new ].
					(nodes at: 4) add: aNode ] ]
]

{ #category : #accessing }
GraphQuadTree >> center [ 
	| sx sy |

	sx := (origin x / 2.0) + (corner x / 2.0).
	sy := (origin y / 2.0) + (corner y / 2.0).

	^ sx @ sy
]

{ #category : #accessing }
GraphQuadTree >> charge [ 
	^ charge
]

{ #category : #accessing }
GraphQuadTree >> charge: anObject [ 
	charge := anObject
]

{ #category : #accessing }
GraphQuadTree >> corner [ 
	^corner
]

{ #category : #accessing }
GraphQuadTree >> corner: anObject [ 
	corner := anObject
]

{ #category : #accessing }
GraphQuadTree >> cx [ 
	^ cx
]

{ #category : #accessing }
GraphQuadTree >> cx: aFloat [
	cx := aFloat
]

{ #category : #accessing }
GraphQuadTree >> cy [ 
	^ cy
]

{ #category : #accessing }
GraphQuadTree >> cy: aFloat [ 
	cy := aFloat
]

{ #category : #accessing }
GraphQuadTree >> initialize [  

	super initialize.
	
	leaf := true.
	nodes := Array new: 4
]

{ #category : #accessing }
GraphQuadTree >> isLeaf [ 
	^ leaf
]

{ #category : #accessing }
GraphQuadTree >> leaf [ 
	^ leaf
]

{ #category : #accessing }
GraphQuadTree >> node [ 
	^ node
]

{ #category : #accessing }
GraphQuadTree >> nodes [ 
	^ nodes
]

{ #category : #accessing }
GraphQuadTree >> origin [ 
	^ origin
]

{ #category : #accessing }
GraphQuadTree >> origin: aPoint [ 
	origin := aPoint
]

{ #category : #accessing }
GraphQuadTree >> x [
	^x
]

{ #category : #accessing }
GraphQuadTree >> x: aNumber [
	x := aNumber
]

{ #category : #accessing }
GraphQuadTree >> y: aNumber [
	y := aNumber
]
