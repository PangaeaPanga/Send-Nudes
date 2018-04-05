!toggle = $147D				; One free byte.

init:
	LDA #$15				; \ 
	STA $0F2D				; |
	LDA #$FC				; | Draw "L R" text in the status bar.
	STA $0F2E				; |
	LDA #$1B				; |
	STA $0F2F				; /
	
main:
	STZ $1697				; Disable consecutive hit combo.
	LDA !toggle				; \ 
	BEQ DisplayLR			; | Check to see which option the player enabled.
	BRA DisplayAB			; /
	
	DisplayLR:				; If L/R is enabled...
	LDA #$15				; \ 
	STA $0F2D				; |
	LDA #$FC				; | Draw "L R" text in the status bar.
	STA $0F2E				; |
	LDA #$1B				; |
	STA $0F2F				; /
	BRA Normal
	
	DisplayAB:				; If A/B is enabled...
	LDA #$0A				; \ 
	STA $0F2D				; |
	LDA #$FC				; | Draw "A B" text in the status bar.
	STA $0F2E				; |
	LDA #$0B				; |
	STA $0F2F				; /
	
	Normal:
	LDA $16					; \ 
	AND #$20				; | Check to see if "Select" is pressed.
	BNE Switch				; / 
	LDA !toggle				; \ If pressed, toggle options.
	BEQ LeftRight			; /
	LDA $15					; \ 
	AND #$80				; | Check to see if "A" OR "B" is pressed.
	BNE NormalJump			; /
	RTL
	
	Switch:
	LDA !toggle				; \ 
	EOR #$01				; | Toggle whether to use L/R or A/B.
	STA !toggle				; / 
	LDA #$29				; \ Play the "correct" sound effect.
	STA $1DFC				; /
	RTL
	
	LeftRight:
	LDA $18					; \ 
	AND #$30				; | Check to see if "L" OR "R" is pressed.
	BNE SwitchJump			; /
	RTL
	
	SwitchJump:
	LDA $140D				; \ 
	EOR #$01				; | Switch the type of jump.
	STA $140D				; /
	RTL
	
	NormalJump:
	LDA $17					; \ 
	AND #$80				; | Check to see if "A" is pressed.
	BNE SpinJump			; /
	STZ $140D
	RTL
	
	SpinJump:
	LDA #$01				; \ Switch to spin-jump when "A" is pressed.
	STA $140D				; /
	RTL