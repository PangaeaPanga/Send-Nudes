!clock = $146C				; One free byte, clock for counting 1 second.
!timer = $1473				; One free byte, 1s digit in timer.

load:
	LDA #$01				;\ Player can carry Yoshi over levels flag. #$00 = can't carry over levels; #$01 = can carry over levels.
	STA $0DC1				;/
	LDA #$06				;\ Yoshi color. #$04=yellow; #$06=blue; #$08=red; #$0A=green. Refreshes on level change.
	STA $13C7				;/ Mario Starts with (Blue) Yoshi.
	RTL

	
main:
	STZ $1697				; Disable consecutive hit combo.
	LDA $18AC				; \ 
	CMP #$FF				; | Check to see if Yoshi is eating something.
	BEQ Activate			; /
	LDA $18AC				; \ Check to see if the timer is active.
	BNE Active				; /
	
	NotActive:				; Yoshi is not eating something.
	LDA #$FC				; \ Draw a blank tile in the status bar.
	STA $0F2F				; /
	BRA Continue
	
	Activate:				; Activate the timer.
	LDA #$26				; \ Set the swallow timer to a smaller number.
	STA $18AC				; /
	LDA #$1D				; \ Reset the clock.
	STA !clock				; /
	LDA #$03				; \ Set the 1s digit to "3".
	STA !timer				; /

	Active:					; Timer is active.
	LDA $13D4				; \ 
	ORA $71					; | If the game is paused, then return.
	BNE Continue			; /
	LDA !timer				; \ Draw the 1s digit in the status bar.
	STA $0F2F				; /
	INC !clock				; \ 
	LDA !clock				; | Every second (60 frames), update.
	CMP #$3C				; |
	BEQ Decrease			; /
	BRA Continue
	
	Decrease:				; Decrease the 1s digit.
	STZ !clock				; Reset the clock.
	LDA !timer				; \ 
	BEQ Return				; | If the 1s digit is 0, then continue.
	DEC !timer				; /
	LDA #$1C				; \ Play the "Yoshi/Dragon Coin" sound effect.
	STA $1DF9				; /
	
	Continue:
	LDX #$0B				; Loop through every sprite slot.
	
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
	
	Return:
	RTL