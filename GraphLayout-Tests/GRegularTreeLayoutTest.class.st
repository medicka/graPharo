"
I represent a collection of tests incomon for all regular tree layouts.
"
Class {
	#name : #GRegularTreeLayoutTest,
	#superclass : #GAbstractTreeLayoutTest,
	#category : #'GraphLayout-Tests'
}

{ #category : #tests }
GRegularTreeLayoutTest >> testAtLayerAdd [

|layout collection|
layout := self newInstance .
collection := #(1 2 3 4).

layout nodesByLayer: OrderedCollection new.
layout atLayer: 2 add: collection.
self assert: (layout nodesByLayer at: 2) size equals: 4.
]

{ #category : #tests }
GRegularTreeLayoutTest >> testChildrenForExcept [ 
	| gr v1 v2 v3 v4 v5 layout used |
	gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v2 := gr addVertexWithValue: 2.
	v3 := gr addVertexWithValue: 3.
	v4 := gr addVertexWithValue: 4.
	v5 := gr addVertexWithValue: 5.
	gr
		addEdgeFrom: v3 to: v1;
		addEdgeFrom: v3 to: v4;
		addEdgeFrom: v3 to: v5;
		addEdgeFrom: v1 to: v3;  
		addEdgeFrom: v4 to: v2.
	used := Set new.
	used 
		add: v1;
		add: v3.
	layout := self newInstance .
	self assert: (layout childrenFor: v3 except: used) size equals: 2
]

{ #category : #tests }
GRegularTreeLayoutTest >> testHeighest [
 
|layout gr v1 v2 v3 v4 v5|
gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewHeight: 45.
	v2 := gr addVertexWithValue: 2.
	v2 setNewHeight: 12.
	v3 := gr addVertexWithValue: 3.
	v3 setNewHeight: 69.
	v4 := gr addVertexWithValue: 4.
	v4 setNewHeight: 6.
	v5 := gr addVertexWithValue: 5.
	v5 setNewHeight: 88.
	layout := self newInstance .
	self assert: (layout findHeighest: gr vertices) equals: v5
]

{ #category : #tests }
GRegularTreeLayoutTest >> testInitialize [
	| layout |
	layout := self newInstance.
	self assert: (layout topGap = 5 and: layout leftGap = 5)
]

{ #category : #tests }
GRegularTreeLayoutTest >> testLeftTopOfHeighest [
 
|layout gr v1 v2 v3 v4 v5|
gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewHeight: 45.
	v2 := gr addVertexWithValue: 2.
	v2 setNewHeight: 12.
	v3 := gr addVertexWithValue: 3.
	v3 setNewHeight: 69.
	v4 := gr addVertexWithValue: 4.
	v4 setNewHeight: 6.
	v5 := gr addVertexWithValue: 5.
	v5 setNewHeight: 88.
	layout := self newInstance .
	self assert: (layout findHeighest: gr vertices) equals: v5
]

{ #category : #tests }
GRegularTreeLayoutTest >> testRightBottomOfWidthest [
 
|layout gr v1 v2 v3 v4 v5|
gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewWidth: 45.
	v1 position: 57@56.
	v2 := gr addVertexWithValue: 2.
	v2 setNewWidth:  12.
	v3 := gr addVertexWithValue: 3.
	v3 setNewWidth: 70.
	v3 position: 0@0.
	v4 := gr addVertexWithValue: 4.
	v4 setNewWidth:  6.
	v5 := gr addVertexWithValue: 5.
	v5 setNewWidth:  28.
	v5 position: 87@56.
	layout := self newInstance .
	self assert: (layout rightBottomOfWidthest: gr vertices) equals: 35@7.5
]

{ #category : #tests }
GRegularTreeLayoutTest >> testWidthest [
 
|layout gr v1 v2 v3 v4 v5|
gr := Graph new.
	v1 := gr addVertexWithValue: 1.
	v1 setNewWidth: 45.
	v2 := gr addVertexWithValue: 2.
	v2 setNewWidth: 22.
	v3 := gr addVertexWithValue: 3.
	v3 setNewWidth: 62.
	v4 := gr addVertexWithValue: 4.
	v4 setNewWidth: 6.
	v5 := gr addVertexWithValue: 5.
	v5 setNewWidth: 18.
	layout := self newInstance .
	self assert: (layout findWidthest: gr vertices) equals: v3
]
