"
I represent a behavior that class thet represents Veritx has to have.
"
Trait {
	#name : #TVertexTrait,
	#category : #GraphStructure
}

{ #category : #accessing }
TVertexTrait >> attributes [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> degree [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> height [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> inDegree [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> inNeighbourhood [
	^ self explicitRequirement
]

{ #category : #'as yet unclassified' }
TVertexTrait >> measureDimensions: aVertex [
	"Sets dimensions to given vertex."

	^ Dictionary with: #width -> aVertex width with: #height -> aVertex height
]

{ #category : #accessing }
TVertexTrait >> neighbourhood [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> outDegree [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> outNeighbourhood [
	^ self explicitRequirement
]

{ #category : #'as yet unclassified' }
TVertexTrait >> outNeighbourhoodFromVertex: aVertex [
	"Returns out neighborhood of a given vertex."
	
	^aVertex outNeighbourhood 
]

{ #category : #accessing }
TVertexTrait >> position [ 
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> position: anPoint [ 
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> setNewHeight: aNumber [ 
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> setNewWidth: aNumber [ 
	^ self explicitRequirement
]

{ #category : #'as yet unclassified' }
TVertexTrait >> vertexExists: aVertex in: aCollection [
	"Inspects if given vertex exists in given collection."

	^ aCollection includes: aVertex
]

{ #category : #accessing }
TVertexTrait >> width [
	^ self explicitRequirement
]
