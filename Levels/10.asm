main:
	STZ $1697				; Disable consecutive hit combo.
	LDX #$0B
	
	Loop:
	LDA $9E,x				; \ 
	CMP #$07				; | Check to see if the sprite is a Yellow Shell.
	BEQ IsThrown			; /
	LDA $9E,x				; \ 
	CMP #$05				; | Check to see if the sprite is a Red Shell.
	BEQ IsRed				; /
	DEX						; \ Decrement X and keep looping.
	BPL Loop				; /
	BRA Return				; Once finish, return.
	
	IsThrown:
	LDA $14C8,x				; \ 
	CMP #$0A				; | Check to see if the shell is thrown.
	BEQ ChangeX				; /
	BRA ContinueLoop
	
	ChangeX:
	STZ $AA,x				; Set the shell's Y-speed to 0.
	BRA ContinueLoop
	
	IsRed:
	LDA $14C8,x				; \ If the shell is hit and stops...
	CMP #$09				; /
	BNE ContinueLoop
	
	MakeThrown:
	LDA #$0A				; \ Make the shell keep spinning.
	STA $14C8,x				; /
	
	ContinueLoop:
	DEX						; \ Check to see if there is more than one Yellow Shell.
	BRA Loop				; / Keep looping.
	
	Return:
	RTL