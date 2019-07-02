"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGraphStructureTests,
	#superclass : #PackageManifest,
	#category : #'GraphStructure-Tests-Manifest'
}

{ #category : #'code-critics' }
ManifestGraphStructureTests class >> ruleRTInvocationSequenceRuleV1FalsePositive [
	^ #(#(#(#RGClassDefinition #(#GraphTest)) #'2019-05-30T07:33:47.627+02:00') )
]
