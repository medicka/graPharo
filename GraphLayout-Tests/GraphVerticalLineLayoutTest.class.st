Class {
	#name : #GraphVerticalLineLayoutTest,
	#superclass : #GAbstractLineLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphVerticalLineLayoutTest >> actualClass [
	^ GraphVerticalLineLayout 
]

{ #category : #tests }
GraphVerticalLineLayoutTest >> testDeltaFor [
"Test that checks if point for moving vertex is set to a good position. 
For default size of vertex.
If alightment is center, expected resault is 5@0 .
If alightment is right, expected resault is 10@0 .
If alightment is defaul, expected resault is 0@0 ."

 	|gr v1 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	layout := GraphVerticalLineLayout new .
	layout alignment: #right.
	self assert: (layout deltaFor: v1) equals: (10@0)
]

{ #category : #tests }
GraphVerticalLineLayoutTest >> testDoExecute [ 
"A test that checks execution of Vertical line layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v4, expected result 5.0@82.5 .
	For v3, expected result 5.0@57.5 .
	For v2, expected result 5.0@32,5 .
	For v1, expected result 5.0@7.5 ." 
	
	|gr v1 v2 v3 v4 layout used|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	used := LinkedList new.
	used add: v1;
		add: v2;
		add: v3;
		add: v4.
	layout :=GraphVerticalLineLayout new.
	layout doExecute: (used).
	self assert: (v2 position) equals: (5@32.5)
]

{ #category : #tests }
GraphVerticalLineLayoutTest >> testInitialize [ 

	|layout|
	layout := GraphVerticalLineLayout new.
	self assert: layout alignment equals: #left.
]

{ #category : #tests }
GraphVerticalLineLayoutTest >> testMovePointerAccordingToFigure [
"Test that checks if moving of a pointer for the next vertex is in according to his size is done good.
For default size of vertex.
If alightment is center, expected resault is 5@25 .
If alightment is right, expected resault is 10@25 .
If alightment is defaul, expected resault is 0@25 ."

 	|gr v1 layout pointer|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	layout := GraphVerticalLineLayout new .
	"layout alignment: #right."
	pointer := layout positionOriginalPointer: (gr vertices).
	self assert: (layout movePointer: pointer accordingToFigure: v1) equals: (0@25)
]

{ #category : #tests }
GraphVerticalLineLayoutTest >> testPositionOriginalPointer [
"Test that checks if ogirinal pointer is set to a good position. 
For default size of vertices.
If alightment is center, expected resault is 5@0 .
If alightment is right, expected resault is 10@0 .
If alightment is default, expected resault is 0@0 ."

 	|gr v1 v2 v3 v4 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	layout := GraphVerticalLineLayout new .
	layout alignment: #center.
	self assert: (layout positionOriginalPointer: (gr vertices)) equals: (5@0)
]
