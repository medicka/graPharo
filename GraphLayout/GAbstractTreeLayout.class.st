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
		'cachedParents',
		'cachedParentsWithHighestNestings'
	],
	#category : #GraphLayout
}

{ #category : #getter }
GAbstractTreeLayout >> cachedChildren [
	
	cachedChildren ifNil: [cachedChildren := IdentityDictionary new: 1000].
	^cachedChildren
]

{ #category : #getter }
GAbstractTreeLayout >> cachedParents [
	cachedParents ifNil: [cachedParents := IdentityDictionary new: 1000].
	^cachedParents
]

{ #category : #getter }
GAbstractTreeLayout >> childrenFor: aVertex [
	
	^self cachedChildren
		at: aVertex
		ifAbsentPut:
			(aVertex outNeighbourhood )
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
