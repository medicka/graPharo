Class {
	#name : #BaselineOfGraphLayout,
	#superclass : #BaselineOf,
	#category : #BaselineOfGraphLayout
}

{ #category : #baselines }
BaselineOfGraphLayout >> baseline: spec [ 
    <baseline>
    spec for: #common do: [	
				
        "Packages"
        spec
            package: 'GraphLayou';
            package: 'GraphLayout-Tests' with: [ spec requires: #('GraphLayout') ] ].
]
