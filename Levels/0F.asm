load:
	LDA #$01				;\ Player can carry Yoshi over levels flag. #$00 = can't carry over levels; #$01 = can carry over levels.
	STA $0DC1				;/
	LDA #$06				;\ Yoshi color. #$04=yellow; #$06=blue; #$08=red; #$0A=green. Refreshes on level change.
	STA $13C7				;/ Mario Starts with (Blue) Yoshi.
	RTL

	
main:
	STZ $1697				; Disable consecutive hit combo.
	LDA $18AC				; \ Check to see if Yoshi is eating something.
	CMP #$FF				; /
	BNE Continue			; If not, then continue.
	
	SetSwallow:
	LDA #$26				; \ Set the swallow timer to a smaller number.
	STA $18AC				; /
	
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