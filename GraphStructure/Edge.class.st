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
	"Compares self(edge on which we are working on) to edge."
	
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
	"Initializes Edge objects."
	
	from := Vertex new.
	to := Vertex new.
]

{ #category : #initialization }
Edge >> setFrom: aVertex1 to: aVertex2 [

self fromVertex: aVertex1.
self toVertex: aVertex2  
]

{ #category : #getter }
Edge >> toVertex [
	^to
]

{ #category : #setter }
Edge >> toVertex: vertex [
	to := vertex
]
