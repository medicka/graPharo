"
I represent abstract class that incorporates edges in to making a layout.
"
Class {
	#name : #GEdgeDrivenLayout,
	#superclass : #GLayout,
	#instVars : [
		'edges',
		'userDefinedEdges',
		'fromPositions',
		'toPositions',
		'shouldSetDefaultAttachPoint'
	],
	#category : #GraphLayout
}

{ #category : #accessing }
GEdgeDrivenLayout >> addDefaultAttachPointToEdges [ 
	self flag: 'Model attach points'.
	
	"edges do: [ :e | e shape attachPoint: self defaultAttachPoint ]"
]

{ #category : #accessing }
GEdgeDrivenLayout >> edges [ 
	^ edges
]

{ #category : #accessing }
GEdgeDrivenLayout >> edges: aCollection [ 
	edges := aCollection asOrderedCollection.
	"self shouldSetDefaultAttachPoint
		ifTrue: [ self addDefaultAttachPointToEdges ]"
]

{ #category : #hook }
GEdgeDrivenLayout >> executeOnElements: elements [ 
	"Execute the layout, myself, on the elements"

	self userDefinedEdges isNil 
		ifTrue: [ self setEdgesFromElements: elements ]
		ifFalse: 
			[ | flat |
			flat := OrderedCollection new.
			self userDefinedEdges do: 
				[ :each | 
				each isCollection 
					ifTrue: [ flat addAll: each ]
					ifFalse: [ flat add: each ] ].
			self edges: flat ].
		
	super executeOnElements: elements
]

{ #category : #initialization }
GEdgeDrivenLayout >> setEdgesFromElements: elements [ 

	|collection|
	collection:= Set new.
	elements isEmpty
		ifTrue: [ ^ self ].
	elements do: [ :aNode | ((aNode outNeighbourhood ) do: [
					:each| |edge| 
					edge := Edge new.
					edge setFrom: aNode to: each. 
					collection add: edge 
				])].
	^ self
		edges:collection
]

{ #category : #accessing }
GEdgeDrivenLayout >> shouldSetDefaultAttachPoint [ 
	"Return true if an attach point has to be added to edges. False else"
	^ shouldSetDefaultAttachPoint
]

{ #category : #accessing }
GEdgeDrivenLayout >> userDefinedEdges [ 
	
	^userDefinedEdges
]

{ #category : #accessing }
GEdgeDrivenLayout >> userDefinedEdges: aCollectionOfEdges [ 
	"useful to tell to the layout which edges have to be used for the layout"

	userDefinedEdges := aCollectionOfEdges.
]
