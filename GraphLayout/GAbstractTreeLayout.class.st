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
GAbstractTreeLayout >> childrenFor: aVertex [
	
	^self cachedChildren
		at: aVertex
		ifAbsentPut:
			(aVertex outNeighbourhood )
]

{ #category : #'as yet unclassified' }
GAbstractTreeLayout >> parentsFor: aNode [
	
	^ self cachedParents
		at: aNode
		ifAbsentPut:
			(aNode inNeighbourhood  )
]
