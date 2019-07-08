"
I represent a behavior that class thet represents Edge has to have.
"
Trait {
	#name : #TEdgeTrait,
	#category : #GraphStructure
}

{ #category : #comparing }
TEdgeTrait >> equals: anEdge [
	^ self explicitRequirement
]

{ #category : #'instance creation' }
TEdgeTrait >> fromVertex [ 
	^ self explicitRequirement
]

{ #category : #'instance creation' }
TEdgeTrait >> fromVertex: anVertex [ 
	^ self explicitRequirement
]

{ #category : #'instance creation' }
TEdgeTrait >> toVertex [ 
	^ self explicitRequirement
]

{ #category : #'instance creation' }
TEdgeTrait >> toVertex: anVertex [ 
	^ self explicitRequirement
]
