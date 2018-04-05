main:
	LDX #$0B
	
	Loop:
	LDA $9E,x				; \ 
	CMP #$35				; | Check to see if the sprite is a Yoshi.
	BEQ IsYoshi				; /
	DEX						; \ Decrement X and keep looping.
	BPL Loop				; /
	
	IsYoshi:
	LDA $1410				; \ 
	CMP #$02				; | Check to see if Yoshi has wings.
	BNE Return				; /
	
	MakeFly:
	STZ $AA,x				; Set Yoshi's Y-speed to 0.
	
	LDA $76
	BEQ Left
	
	Right:
	LDA #$10				; \ Set the sprite's x position to 16.
	STA $B6,x				; /
	RTL
	
	Left:
	LDA #$F0				; \ Set the sprite's x position to 16.
	STA $B6,x				; /
	
	Return:
	RTL