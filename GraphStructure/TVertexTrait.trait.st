"
I represent a behavior that class thet represents Veritx has to have.
"
Trait {
	#name : #TVertexTrait,
	#category : #GraphStructure
}

{ #category : #'as yet unclassified' }
TVertexTrait >> measureDimensions: aVertex [
	"Sets dimensions to given vertex."

	^ Dictionary with: #width -> aVertex width with: #height -> aVertex height
]

{ #category : #'as yet unclassified' }
TVertexTrait >> outNeighbourhoodFromVertex: aVertex [
	"Returns out neighborhood of a given vertex."
	
	^aVertex outNeighbourhood 
]

{ #category : #'as yet unclassified' }
TVertexTrait >> vertexExists: aVertex in: aCollection [
	"Inspects if given vertex exists in given collection."

	^ aCollection includes: aVertex
]
