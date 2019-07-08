"
I represent an abstract class, that implements some ˝must have˝ methods and alows creation of a Wrapper.
"
Class {
	#name : #AbstractEdge,
	#superclass : #Object,
	#traits : 'TEdgeTrait',
	#classTraits : 'TEdgeTrait classTrait',
	#instVars : [
		'from',
		'to'
	],
	#category : #GraphStructure
}

{ #category : #'state machine' }
AbstractEdge >> equals: edge [
	"Compares self(edge on which we are working on) to edge."

	^ self fromVertex = edge fromVertex and: [ self toVertex = edge toVertex ]
]

{ #category : #getter }
AbstractEdge >> fromVertex [
	^from
]

{ #category : #setter }
AbstractEdge >> fromVertex: vertex [
	from := vertex
]

{ #category : #getter }
AbstractEdge >> toVertex [
	^to
]

{ #category : #setter }
AbstractEdge >> toVertex: vertex [
	to := vertex
]
