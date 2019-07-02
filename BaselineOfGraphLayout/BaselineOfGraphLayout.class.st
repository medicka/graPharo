Class {
	#name : #BaselineOfGraphLayout,
	#superclass : #BaselineOf,
	#category : #BaselineOfGraphLayout
}

{ #category : #baselines }
BaselineOfGraphLayout >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ "Packages"
			spec
				package: 'GraphLayout' with: [ spec requires: #('GraphStructure') ];
				package: 'GraphLayout-Tests' with: [ spec requires: #('GraphLayout') ];
				package: 'GraphStructure';
				package: 'GraphStructure-Tests' with: [ spec requires: #('GraphStructure') ].

			spec
				group: 'Structure' with: #('GraphStructure' 'GraphStructure-Tests');
				group: 'Layout' with: #('GraphLayout' 'GraphLayout-Tests');
				group: 'Core' with: #('GraphLayout') ]
]
