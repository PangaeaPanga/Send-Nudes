main:
	LDX #$0B
	
	Loop:
	LDA $9E,x				; \ 
	CMP #$35				; | Check to see if the sprite is a Yoshi.
	BEQ ChangeX				; /
	DEX						; \ Decrement X and keep looping.
	BPL Loop				; /
	
	ChangeX:
	REP #$20				; \ 
	LDA $D1					; |
	SEP #$20				; | Set the sprite's x position to Mario's.
	STA $E4,x				; |
	XBA						; |
	STA $14E0,x				; /
	RTL