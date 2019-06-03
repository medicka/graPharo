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
