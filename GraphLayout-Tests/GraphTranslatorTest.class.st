"
I represent colection of tests for the classes about translation in a graph.
"
Class {
	#name : #GraphTranslatorTest,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GraphTranslatorTest >> testDefault [
	"A test that checks if the default translator is set.
	Explected result is not nil."
	
	|translator|
	translator := GraphTranslator default.
	self deny: (translator defaultTranslator isNil)
	
]

{ #category : #tests }
GraphTranslatorTest >> testDefaultTranslatorDirect [
	"A test that checks if the default translator is set to translator of a type GraphDirectTranslator.
	Expected result is GraphDirectTranslator."
	
	|translator|
	translator := GraphTranslator default.
	self assert: (translator defaultTranslator class) equals: GraphDirectTranslator 
]

{ #category : #tests }
GraphTranslatorTest >> testTranslateBottomLeftOfTo [
	"A test that checks if the translation is done properly. We invoke the translation from bottom left 	corner of element.
	Expected result is new position for each vertex. Position is in the center of vertex.
	For v1 if translated to 2@1 is 7@-6.5.
	For v2 if translated to 3@6 is 8@-1.5."
	
	|gr v1 v2 v3 v4 translator|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	translator := GraphDirectTranslator new.
	translator translateBottomLeftOf: v1 to: (2@1).
	self assert: (v1 position ) equals: (7@ -6.5)
]

{ #category : #tests }
GraphTranslatorTest >> testTranslateBottomRightOfTo [
	"A test that checks if the translation is done properly. We invoke the translation from bottom right 	corner of element.
	Expected result is new position for each vertex. Position is in the center of vertex.
	For v1 if translated to 2@1 is -3@-6.5.
	For v2 if translated to 3@6 is -2@-1.5."
	
	|gr v1 v2 v3 v4 translator|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	translator := GraphDirectTranslator new.
	translator translateBottomRightOf: v2 to: (3@6).
	self assert: (v2 position ) equals: (-2@ -1.5)
]

{ #category : #tests }
GraphTranslatorTest >> testTranslateTopLeftOfTo [
	"A test that checks if the translation is done properly. We invoke the translation from top left 	corner of element.
	Expected result is new position for each vertex. Position is in the center of vertex.
	For v1 if translated to 2@1 is 7@8.5.
	For v2 if translated to 3@6 is 8@13.5."
	
	|gr v1 v2 v3 v4 translator|
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	translator := GraphDirectTranslator new.
	translator translateTopLeftOf: v2 to: (3@6).
	self assert: (v2 position ) equals: (8@13.5)
]
