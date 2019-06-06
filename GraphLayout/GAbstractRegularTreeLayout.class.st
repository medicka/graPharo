"
I represent an abstract class that describes all regular tree layouts. 
"
Class {
	#name : #GAbstractRegularTreeLayout,
	#superclass : #GAbstractTreeLayout,
	#instVars : [
		'alreadyLayoutedNodes',
		'topGap',
		'leftGap',
		'nodesByLayer',
		'isLayered',
		'shouldBeHorizontallyReversed',
		'shouldBeVerticallyReversed'
	],
	#category : #GraphLayout
}
