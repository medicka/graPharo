"
I represent a collection of tests for implementing functionalities of a quad tree.
"
Class {
	#name : #QuadTreeTests,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
QuadTreeTests >> testAddBigger [
	"Testing of adding a given node to a quad. 
	
	For origin 3.67@5, corner 9.43@87, given node v1 with position 8.43@51.04, given node v2 with position 33.7@12, adn first adding v1, than v2, expected result is quad at index 2 and 4 in nodes array."
	|quad v1 v2|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 8.43@51.04.
	v2 := Vertex new.
	v2 vertexValue: 5.
	v2 position: 33.42@26.04.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad add: v1.
	quad add: v2.
	self assert: (quad nodes at:2) notNil .
	
]

{ #category : #tests }
QuadTreeTests >> testAddChildBottomLeft [
	"Testing of adding a child to specific node. 
	For origin 3.67@5 and corner 9.43@87 and given node v1 with position 4.5@66.8, expected result is quad at index 3 in nodes array."
	|quad v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 4.5@66.8.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad addChild: v1.
	self assert: (quad nodes at: 3) notNil.
	
]

{ #category : #tests }
QuadTreeTests >> testAddChildBottomRight [
	"Testing of adding a child to specific node. 
	For origin 3.67@5 and corner 9.43@87 and given node v1 with position 8.43@51.04, expected result is quad at index 2 in nodes array."
	|quad v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 8.43@51.04.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad addChild: v1.
	self assert: (quad nodes at: 4) notNil.
	
]

{ #category : #tests }
QuadTreeTests >> testAddChildTopLeft [
	"Testing of adding a child to specific node. 
	For origin 3.67@5 and corner 9.43@87 and given node v1 with position 4.5@25, expected result is quad at index 1 in nodes array."
	|quad v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 4.5@25.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad addChild: v1.
	self assert: (quad nodes at: 1) notNil.
	
]

{ #category : #tests }
QuadTreeTests >> testAddChildTopRight [
	"Testing of adding a child to specific node. 
	For origin 3.67@5 and corner 9.43@87 and given node v1 with position 8.43@15, expected result is quad at index 2 in nodes array."
	|quad v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 8.43@15.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad addChild: v1.
	self assert: (quad nodes at: 2) notNil.
	
]

{ #category : #tests }
QuadTreeTests >> testAddSmaller [
	"Testing of adding a given node to a quad. 
	
	For origin 3.67@5, corner 9.43@87, given node v1 with position 8.43@51.04, given node v2 with position 33.7@12, and first adding v1, than v2, expected result is quad at index 4 in nodes array."
	|quad v1 v2|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 8.43@51.04.
	v2 := Vertex new.
	v2 vertexValue: 5.
	v2 position: 8.42@51.04.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad add: v1.
	quad add: v2.
	self assert: (quad nodes at:4) notNil .
	
]

{ #category : #tests }
QuadTreeTests >> testAddXNil [
	"Testing of adding a given node to a quad. 
	For origin 3.67@5 and corner 9.43@87 and given node v1 with position 8.43@51.04, expected result is quad at index 2 in nodes array."
	|quad v1|
	v1 := Vertex new.
	v1 vertexValue: 4.
	v1 position: 8.43@51.04.
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	quad add: v1.
	self assert: (quad x) equals: 8.43.
	
]

{ #category : #tests }
QuadTreeTests >> testCenter [ 
	"Testing of calculating the center of all nodes. To give some different postitions to nodes we use already implemented circle layout. 
	For origin 3.67@5 and corner 9.43@87, expected result is 6.55@46.0 ."
	|quad|
	quad := GraphQuadTree new.
	quad origin: 3.67@5.
	quad corner: 9.43@87.
	self assert: quad center equals: 6.55@46.0.
	
]

{ #category : #tests }
QuadTreeTests >> testWithAllCorner [
	"Testing of method that looks for maximal x and maximal y in all positions of nodes. To give some different postitions to nodes we use already implemented circle layout. 
	Expected result: 93.0@95.5"
	
	|gr v1 v2 v3 v4 layout quad|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := GraphCircleLayout new.
	layout doExecute: (gr vertices ).
	quad := GraphQuadTree withAll: (gr vertices ).
	self assert: quad corner equals: 93.0@95.5.
]

{ #category : #tests }
QuadTreeTests >> testWithAllOrigin [
	"Testing of method that looks for minimal x and minimal y in all positions of nodes. To give some different postitions to nodes we use already implemented circle layout.
	Expected result: 5@7.5"
	
	|gr v1 v2 v3 v4 layout quad|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	gr addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v4 to: v2.
	layout := GraphCircleLayout new.
	layout doExecute: (gr vertices ).
	quad := GraphQuadTree withAll: (gr vertices ).
	self assert: quad origin equals: 5@7.5.
]
