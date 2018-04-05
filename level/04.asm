!counter = $1487			; One free byte.
!temp = $147D				; One free byte.

init:
	STZ !counter			; \ Reset the variables.
	STZ !temp				; /

main:
	LDA #$80				; \ 
	TRB $16					; | Disable jumping off of the ground manually.
	TRB $18					; /
	LDA $13EF				; \ Checks to see if the player is touching ground.
	BNE OnGround			; /
	RTL

	OnGround:				; If the player is touching ground...
	INC !temp				; \ For some reason, lets player touch ground for two frames.
	LDA !temp				; /
	CMP #$02				; \ Checks for interaction on second frame.
	BEQ SwitchJump			; /
	RTL

	SwitchJump:
	LDA !counter			; \ Checks to see which type of jump should be inputted.
	BEQ NormalJump			; /
	LDA #$80				; \ Input a spin-jump (presses A).
	TSB $18					; /
	STZ !counter			; \ Reset the variables to 0.
	STZ !temp				; /
	RTL
	
	NormalJump:
	LDA #$80				; \ 
	TSB $16					; | Input a normal jump (presses B).
	LDA #$01				; /
	STA !counter			; \ Reset the variables to 0.
	STZ !temp				; /
	RTL