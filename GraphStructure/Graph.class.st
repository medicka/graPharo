"
I represent a graph structure.
"
Class {
	#name : #Graph,
	#superclass : #Object,
	#instVars : [
		'edges',
		'vertices',
		'directed',
		'undirected',
		'adjacencyList'
	],
	#category : #GraphStructure
}

{ #category : #adding }
Graph >> addEdgeFrom: ver1 to: ver2 [ 
	|tmp|
	tmp := Edge new.
	self addOnEdge: tmp From: ver1. 
	self addOnEdge: tmp to: ver2.
	self edges add: tmp
]

{ #category : #adding }
Graph >> addOnEdge: edge From: ver1 [
	(self vertexExists: ver1)
	 	ifTrue: [ edge fromVertex: ver1 ]
		ifFalse: [ self addVertex: (ver1 vertexValue) ]. 
]

{ #category : #adding }
Graph >> addOnEdge: edge to: ver1 [
	(self vertexExists: ver1)
	 	ifTrue: [ edge toVertex: ver1 ]
		ifFalse: [ self addVertex: (ver1 vertexValue) ]. 
]

{ #category : #adding }
Graph >> addVertex: value [ 
	|tmp|
	tmp := Vertex new.
	tmp vertexValue: value.
	self vertices add: tmp
]

{ #category : #getter }
Graph >> adjacencyList [
	^ adjacencyList
]

{ #category : #getter }
Graph >> directed [ 
	^directed
]

{ #category : #setter }
Graph >> directed: anBoolean [
	directed := anBoolean
]

{ #category : #getter }
Graph >> edges [
	^ edges
]

{ #category : #setter }
Graph >> edges: anObject [
	edges := anObject
]

{ #category : #initialization }
Graph >> initialize [ 
  "Initialization of variables"

  	edges := Set new.
  	vertices := Set new.
	directed := false.
	undirected := false.
  	adjacencyList := LinkedList new

]

{ #category : #getter }
Graph >> undirected [ 
	^undirected
]

{ #category : #setter }
Graph >> undirected: anBoolean [
	undirected := anBoolean
]

{ #category : #'checking existance' }
Graph >> vertexExists: vertix [
	|tmp|
	tmp := false.
	vertices do: [ :each| (each vertexValue = vertix vertexValue )
		ifTrue: [ tmp :=true ] 
		].
	^tmp
	
]

{ #category : #getter }
Graph >> vertices [
	^ vertices
]

{ #category : #setter }
Graph >> vertices: anInteger [
	vertices := anInteger 
]
