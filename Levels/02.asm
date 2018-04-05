load:
	STZ $14AF
	BRA On

main:
	LDA $14AF				; \ Check the status of the "ON/OFF" switch.
	BNE Off					; /
	
	On:						; If ON...
	LDA #$FC				; \ 
	STA $0F2D				; |
	LDA #$18				; | Draw "ON" text in the status bar.
	STA $0F2E				; |
	LDA #$17				; |
	STA $0F2F				; /
	BRA CheckInput
	
	Off:					; If OFF...
	LDA #$18				; \ 
	STA $0F2D				; |
	LDA #$0F				; | Draw "OFF" text in the status bar.
	STA $0F2E				; |
	STA $0F2F				; /
	BRA CheckInput
	
	CheckInput:
	LDA $18					; \ 
	AND #$30				; | Check to see if "L" OR "R" is pressed.
	BNE Switch				; /
	RTL
	
	Switch:					; If "L" OR "R" is pressed...
	LDA $14AF				; \ 
	EOR #$01				; | Switch the "ON/OFF" switch.
	STA $14AF				; /
	LDA #$0B				; \ Play the "ON/OFF switch" sound effect.
	STA $1DF9				; /
	
	Return:
	RTL