"
I represent a behavior that class thet represents Veritx has to have.
"
Trait {
	#name : #TVertexTrait,
	#category : #GraphLayout
}

{ #category : #'as yet unclassified' }
TVertexTrait >> measureDimensions: aVertex [
	"Sets dimensions to given vertex."
	
	|tmp|
	tmp := Dictionary new.
	tmp at: #width put: 10.
	tmp at: #height put: 15.
	^tmp
]

{ #category : #'as yet unclassified' }
TVertexTrait >> outNeighborhoodFromVertex: aVertex [
	"Returns out neighborhood of a given vertex."
	
	^aVertex outNeighborhood 
]

{ #category : #'as yet unclassified' }
TVertexTrait >> vertexExists: aVertex in: aCollection [ 
	"Inspects if given vertex exists in given collection."
	
	|tmp|
	tmp := false.
	aCollection do: [ :each| ((each vertexValue) = (self vertexValue) )
		ifTrue: [ tmp :=true ] 
		].
	^tmp
]
