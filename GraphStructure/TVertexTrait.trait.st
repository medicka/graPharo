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
	^ self neighbourhood size
]

{ #category : #accessing }
TVertexTrait >> dimension [
	^ self hasChildren
		ifTrue: [ self outNeighbourhood makeEncompassingRectangles extent + (2 * self compositeMargin) ]
		ifFalse: [ (self width)@(self height) ]
]

{ #category : #accessing }
TVertexTrait >> extent [
	^ self dimension
]

{ #category : #checking }
TVertexTrait >> hasChildren [
	^ self outNeighbourhood notEmpty
]

{ #category : #accessing }
TVertexTrait >> height [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> inDegree [
	"Returns in degree of a vertex"

	^ self inNeighbourhood size
]

{ #category : #accessing }
TVertexTrait >> inNeighbourhood [
	^ self explicitRequirement
]

{ #category : #accessing }
TVertexTrait >> neighbourhood [ 
	"Returns a neighborhood for vertex of undirected graph"
	
   ^self outNeighbourhood union: self inNeighbourhood
  
]

{ #category : #accessing }
TVertexTrait >> outDegree [
	"Returns out degree of a vertex"

	^ self outNeighbourhood size
]

{ #category : #accessing }
TVertexTrait >> outNeighbourhood [
	^ self explicitRequirement
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

{ #category : #checking }
TVertexTrait >> vertexExists: aVertex in: aCollection [
	"Inspects if given vertex exists in given collection."

	^ aCollection includes: aVertex
]

{ #category : #accessing }
TVertexTrait >> width [
	^ self explicitRequirement
]
