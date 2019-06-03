"
I represent one vertex(node) in a graph.
"
Class {
	#name : #Vertex,
	#superclass : #Object,
	#instVars : [
		'vertexValue',
		'label'
	],
	#category : #GraphStructure
}

{ #category : #initialization }
Vertex >> initialize [ 
	vertexValue := 0
]

{ #category : #getter }
Vertex >> label [ 
	^label
]

{ #category : #setter }
Vertex >> label: name [ 
	label := name
]

{ #category : #getter }
Vertex >> vertexValue [ 
	^vertexValue 
]

{ #category : #setter }
Vertex >> vertexValue: value [
	vertexValue  := value 
]
