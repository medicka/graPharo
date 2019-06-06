"
I represent an abstract class that descris all tree layouts.
"
Class {
	#name : #GAbstractTreeLayout,
	#superclass : #GEdgeDrivenLayout,
	#instVars : [
		'verticalGap',
		'horizontalGap',
		'cachedChildren',
		'cachedParents',
		'cachedParentsWithHighestNestings'
	],
	#category : #GraphLayout
}
