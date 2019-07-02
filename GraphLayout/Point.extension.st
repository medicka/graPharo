Extension { #name : #Point }

{ #category : #'*GraphLayout' }
Point class >> radius: radius theta: angle [
	^ (radius * angle cos) @ (radius * angle sin)
]
