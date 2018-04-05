org $01A0A0
	autoclean JSL spriteKickSpeed

freecode
spriteKickSpeed:
	CLC
	LDA $15					; \ 
	AND #$01				; | Check to see if "right" is pressed.
	BNE .throwRight			; / 
	LDA $15					; \ 
	AND #$02				; | Check to see if "left" is pressed.
	BNE .throwLeft			; / 
	LDA $76					; \ Set the sprite's x speed if neither
	BNE .throwRight			; | "left" nor "right" are pressed
	BRA .throwLeft			; / (kicking goombas or shells)
		.throwRight
			LDA #$2E		; \ Set the sprite's x speed to 46.
			STA $B6,X		; /
			RTL
		.throwLeft
			LDA #$D2		; \ Set the sprite's x speed to -46.
			STA $B6,X		; /
			RTL