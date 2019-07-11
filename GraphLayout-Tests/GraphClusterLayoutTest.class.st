"
I represent a collection of tests for cluster layout.
"
Class {
	#name : #GraphClusterLayoutTest,
	#superclass : #GAbstractTreeLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphClusterLayoutTest >> actualClass [
	^ GraphClusterLayout 
]

{ #category : #tests }
GraphClusterLayoutTest >> testInitialize [ 

	|layout|
	layout := GraphClusterLayout new.
	self assert: ((layout verticalGap = 30) and: (layout horizontalGap = 20))
]

{ #category : #tests }
GraphClusterLayoutTest >> testInitializeNode [

	|gr v1 v2 v3 v4 v5 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := GraphClusterLayout new.
	layout initializeNode: v3.
	self assert: (layout layerOf: v3 )notNil
]
