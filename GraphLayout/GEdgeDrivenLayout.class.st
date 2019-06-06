"
I represent abstract class that incorporates edges in to making a layout.
"
Class {
	#name : #GEdgeDrivenLayout,
	#superclass : #GraphLayout,
	#instVars : [
		'edges',
		'userDefinedEdges',
		'fromPositions',
		'toPositions',
		'shouldSetDefaultAttachPoint'
	],
	#category : #GraphLayout
}
