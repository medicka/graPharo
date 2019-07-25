"
I represent a abstract class for all regular tree layouts.
"
Class {
	#name : #GRegularTreeLayout,
	#superclass : #GAbstractTreeLayout,
	#instVars : [
		'alreadyLayoutedNodes',
		'topGap',
		'leftGap',
		'nodesByLayer',
		'isLayered'
	],
	#category : #GraphLayout
}

{ #category : #hook }
GRegularTreeLayout >> initialize [
	super initialize.
	topGap := 5.
	leftGap := 5.
	isLayered := false
]

{ #category : #accessing }
GRegularTreeLayout >> leftGap [
	^ leftGap
]

{ #category : #accessing }
GRegularTreeLayout >> topGap [
	^ topGap
]
