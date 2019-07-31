"
I represent a behavior that class thet represents Edge has to have.
"
Trait {
	#name : #TEdgeTrait,
	#category : #GraphStructure
}

{ #category : #comparing }
TEdgeTrait >> equals: edge [
	"Compares self(edge on which we are working on) to edge."

	^ self fromVertex = edge fromVertex and: [ self toVertex = edge toVertex ]
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
