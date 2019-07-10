"
I represent a collection of tests for incomon to all layouts.
"
Class {
	#name : #GLayoutTest,
	#superclass : #TestCase,
	#category : #'GraphLayout-Tests'
}

{ #category : #testing }
GLayoutTest class >> isAbstract [
	^ (self name beginsWith: 'Graph') not
]

{ #category : #testing }
GLayoutTest class >> shouldInheritSelectors [
	^ true
]

{ #category : #accessing }
GLayoutTest >> actualClass [
	^ self subclassResponsibility
]

{ #category : #accessing }
GLayoutTest >> newInstance [
	^ self actualClass new
]
