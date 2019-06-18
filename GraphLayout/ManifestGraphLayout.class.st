"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestGraphLayout,
	#superclass : #PackageManifest,
	#category : #'GraphLayout-Manifest'
}

{ #category : #'code-critics' }
ManifestGraphLayout class >> ruleRBModifiesCollectionRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#GraphWeightedCircleLayout #doExecute: #false)) #'2019-06-17T11:44:04.0042+02:00') #(#(#RGClassDefinition #(#GraphEquidistentCircleLayout)) #'2019-06-17T11:44:35.3752+02:00') #(#(#RGMethodDefinition #(#GraphEquidistentCircleLayout #doExecute: #false)) #'2019-06-17T11:44:48.3642+02:00') )
]
