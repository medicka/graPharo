"
I represent one edge in a graph.
"
Class {
	#name : #Edge,
	#superclass : #AbstractEdge,
	#category : #GraphStructure
}

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
