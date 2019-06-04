"
I represent one edge in a graph.
"
Class {
	#name : #Edge,
	#superclass : #Object,
	#instVars : [
		'from',
		'to'
	],
	#category : #GraphStructure
}

{ #category : #'state machine' }
Edge >> equals: edge [
	|tmp|
	tmp := false.
	((self fromVertex) = (edge fromVertex ))
	ifTrue: [ tmp := true ].
	((self toVertex ) ~= (edge toVertex ))
	ifTrue: [ tmp := false ].
	^tmp
]

{ #category : #getter }
Edge >> fromVertex [
	^from
]

{ #category : #setter }
Edge >> fromVertex: vertex [
	from := vertex
]

{ #category : #initialization }
Edge >> initialize [ 
	from := Vertex new.
	to := Vertex new.
]

{ #category : #getter }
Edge >> toVertex [
	^to
]

{ #category : #setter }
Edge >> toVertex: vertex [
	to := vertex
]
