Class {
	#name : #GraphHorizontalLineLayoutTest,
	#superclass : #GAbstractLineLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #accessing }
GraphHorizontalLineLayoutTest >> actualClass [
	^ GraphHorizontalLineLayout 
]

{ #category : #tests }
GraphHorizontalLineLayoutTest >> testDeltaFor [
"Test that checks if point for moving vertex is set to a good position. 
For default size of vertex.
If alightment is center, expected resault is 0@7.5 .
If alightment is bottom, expected resault is 0@15 .
If alightment is defaul, expected resault is 0@0 ."

 	|gr v1 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	layout := GraphHorizontalLineLayout new .
	layout alignment: #center.
	self assert: (layout deltaFor: v1) equals: (0@7.5)
]

{ #category : #tests }
GraphHorizontalLineLayoutTest >> testDoExecute [ 
"A test that checks execution of Horizontal line layout. For easier testing, we transfer the set of vertices 	to LinkedList, so we can have ordered collection. Have in mind that position stors center of 	vertex.
	For v4, expected result 65.0@37.5 .
	For v3, expected result 45.0@27.5 .
	For v2, expected result 25.0@7.5 .
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
	layout :=GraphHorizontalLineLayout new.
	layout doExecute: (used).
	self assert: (v4 position) equals: (65@7.5)
]

{ #category : #tests }
GraphHorizontalLineLayoutTest >> testInitialize [ 

	|layout|
	layout := GraphHorizontalLineLayout new.
	self assert: layout alignment equals: #top.
]

{ #category : #tests }
GraphHorizontalLineLayoutTest >> testMovePointerAccordingToFigure [
"Test that checks if moving of a pointer for the next vertex is in according to his size is done good.
For default size of vertex.
If alightment is center, expected resault is 20@7.5 .
If alightment is bottom, expected resault is 20@15 .
If alightment is defaul, expected resault is 20@0 ."

 	|gr v1 layout pointer|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	layout := GraphHorizontalLineLayout new .
	layout alignment: #bottom.
	pointer := layout positionOriginalPointer: (gr vertices).
	self assert: (layout movePointer: pointer accordingToFigure: v1) equals: (20@15)
]

{ #category : #tests }
GraphHorizontalLineLayoutTest >> testPositionOriginalPointer [
"Test that checks if ogirinal pointer is set to a good position. 
For default size of vertices.
If alightment is center, expected resault is 0@7.5 .
If alightment is bottom, expected resault is 0@15 .
If alightment is default, expected resault is 0@0 ."

 	|gr v1 v2 v3 v4 layout|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	layout := GraphHorizontalLineLayout new .
	layout alignment: #bottom.
	self assert: (layout positionOriginalPointer: (gr vertices)) equals: (0@15)
]
