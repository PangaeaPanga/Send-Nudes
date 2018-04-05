main:
	LDA #$80				; \ 
	TRB $16					; | Disables jumping off of the ground manually.
	TRB $18					; /
	RTL