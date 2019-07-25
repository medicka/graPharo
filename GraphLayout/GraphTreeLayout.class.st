"
I represent a tree layout for a graph.
"
Class {
	#name : #GraphTreeLayout,
	#superclass : #GAbstractTreeLayout,
	#category : #GraphLayout
}

{ #category : #getter }
GraphTreeLayout >> alreadyLayoutedVertices [
	^alreadyLayoutedVertices 
]

{ #category : #'hook-private' }
GraphTreeLayout >> computeChildrenFor:  aVertex [
	^self childrenFor: aVertex except: alreadyLayoutedVertices
]

{ #category : #initialization }
GraphTreeLayout >> initialize [ 
	alreadyLayoutedVertices := Set new.

]
