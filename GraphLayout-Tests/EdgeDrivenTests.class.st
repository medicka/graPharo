"
I represent a collection of tests for edge driven layouts.
"
Class {
	#name : #EdgeDrivenTests,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
EdgeDrivenTests >> testEdges [ 
	"This test checks if the collection that has been given is ordered and set as variable edges."
	
	|gr layout|
	gr := Graph new.
	layout := GEdgeDrivenLayout new.
	layout edges: (gr edges).
	self assert: ((layout edges) class) equals: OrderedCollection 
]

{ #category : #tests }
EdgeDrivenTests >> testSetEdgesFromElements [
	"This test checks if the collection of vertices from which edges start is done properly."
	
	|gr v1 v2 v3 v4 layout fromSet|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := GEdgeDrivenLayout new.
	fromSet := (layout setEdgesFromElements: (gr vertices )) edges .
	self assert: (fromSet size) equals: 3
]
