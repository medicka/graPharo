Class {
	#name : #BaselineOfGraphStructure,
	#superclass : #BaselineOf,
	#category : #BaselineOfGraphStructure
}

{ #category : #baselines }
BaselineOfGraphStructure >> baseline: spec [
    <baseline>
    spec for: #common do: [	
				
        "Packages"
        spec
            package: 'GraphStructure';
            package: 'GraphStructure-Tests' with: [ spec requires: #('GraphStructure') ] ].
]
