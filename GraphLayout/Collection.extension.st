Extension { #name : #Collection }

{ #category : #'*GraphLayout' }
Collection >> maxValue: aBlock [
	^ self inject: (aBlock value: self anyOne) into: [ :max :each | max max: (aBlock value: each) ]
]
