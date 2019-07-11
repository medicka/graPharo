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

{ #category : #api }
GAbstractTreeLayout >> cachedChildren [
	
	cachedChildren ifNil: [cachedChildren := IdentityDictionary new: 1000].
	^cachedChildren
]

{ #category : #accessing }
GAbstractTreeLayout >> cachedParents [
	cachedParents ifNil: [cachedParents := IdentityDictionary new: 1000].
	^cachedParents
]

{ #category : #api }
GAbstractTreeLayout >> childrenFor: aVertex [
	
	^self cachedChildren
		at: aVertex
		ifAbsentPut:
			(aVertex outNeighbourhood )
]

{ #category : #'as yet unclassified' }
GAbstractTreeLayout >> horizontalGap [
	^ horizontalGap
]

{ #category : #'as yet unclassified' }
GAbstractTreeLayout >> parentsFor: aNode [
	
	^ self cachedParents
		at: aNode
		ifAbsentPut:
			(aNode inNeighbourhood  )
]

{ #category : #'as yet unclassified' }
GAbstractTreeLayout >> rootNodesFor: aCollection [
	^ aCollection select: [:node | 
		( self parentsFor: node) isEmpty ].
]

{ #category : #'as yet unclassified' }
GAbstractTreeLayout >> verticalGap [
	^ verticalGap
]
