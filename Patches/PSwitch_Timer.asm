!clock = $1475				; One free byte, clock for counting 1 second.
!timer1 = $1477				; One free byte, 1s digit in timer.
!timer10 = $1479			; One free byte, 10s digit in timer.

org $00868D
	autoclean JSL pswitchTimer
	NOP
	NOP

freecode
pswitchTimer:
	LDA $14AD				; \ Check to see if a Blue P-Switch has been
	CMP #$B0				; | activated.
	BEQ Activate			; /
	LDA $14AD				; \ Check to see if a Blue P-Switch is active.
	BNE Active				; /
	
	NotActive:				; Blue P-Switch is not active.
	LDA #$FC				; \ 
	STA $0F25				; | Draw blank tiles in the status bar.
	STA $0F26				; /
	
	Return:
	LDA.W $421B				; \ Restore the original code.
	STA.W $0DA3				; /
	RTL
	
	Activate:				; Activate the timer.
	LDA #$13				; \ Reset the clock.
	STA !clock				; /
	LDA #$02				; \ Set the 1s digit to "2".
	STA !timer1				; /
	LDA #$01				; \ Set the 10s digit to "1".
	STA !timer10			; /
	
	Active:					; Blue P-Switch is active.
	LDA $13D4				; \ If the game is paused, then return.
	BNE Return				; /
	LDA !timer10			; \ Draw the 10s digit in the status bar.
	STA $0F25				; /
	LDA !timer1				; \ Draw the 1s digit in the status bar.
	STA $0F26				; /
	INC !clock				; \ 
	LDA !clock				; | Every second (60 frames), update.
	CMP #$3C				; |
	BEQ Decrease			; /
	BRA Return
	
	Decrease:				; Decrease the 1s digit.
	STZ !clock				; Reset the clock.
	LDA !timer1				; \ 
	BEQ Decrease10			; | If the 1s digit is 0, reset it to 9.
	DEC !timer1				; /
	BRA Return
	
	Decrease10:				; Decrease the 10s digit.
	LDA !timer10			; \ If the 10s digit is 0, then return.
	BEQ Return				; /
	DEC !timer10			;
	LDA #$09				; \ Reset the 1s digit back to 9.
	STA !timer1				; /
	BRA Return
	
	