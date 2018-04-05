!jumpAddress = $1487		; One free byte.
!temp = $1473				; One free byte.

init:
	LDA #$22				; \ 
	STA $0F2D				; |
	LDA #$0E				; | Draw "YEE" text in the status bar.
	STA $0F2E				; |
	STA $0F2F				; /
	RTL

main:
	LDA $13EF				; \ Check to see if the player is touching ground.
	BEQ NotOnGround			; / 
	
	EnableJump:				;
	LDA #$01				; \ If touching ground, allow player to double-jump.
	STA !jumpAddress		; /
	LDA #$22				; \ 
	STA $0F2D				; |
	LDA #$0E				; | Draw "YEE" text in the status bar.
	STA $0F2E				; |
	STA $0F2F				; /
	RTL

	NotOnGround:			; If the player is not touching ground...
	LDA $17					; \ 
	AND #$30				; | Check to see if "L" OR "R" is held.
	BNE ButtonHeld			; /
	LDA $7D					; \ Check to see if the player's y speed is 16.
	CMP #$10				; | It is always 16 when landing on a grounded
	BEQ EnableJump			; / sprite (i.e. message boxes, grey platforms)
	RTL
	
	ButtonHeld:				; If the player held "L" OR "R"...
	LDA #$80				; \ Let "L"  OR "R" act as "A" OR "B".
	TSB $15					; /
	LDA !jumpAddress		; \ Check to see if a double-jump is allowed.
	BNE DoubleJump			; /
	RTL
	
	DoubleJump:				; Execute a double-jump.
	LDA #$A8				; \ Set the player's y speed to -88.
	STA $7D					; /
	STZ !jumpAddress		; Reset the ability to double-jump.
	LDA #$17				; \ 
	STA $0F2D				; |
	LDA #$0A				; | Draw "NAH" text in the status bar.
	STA $0F2E				; |
	LDA #$11				; |
	STA $0F2F				; /
	RTL