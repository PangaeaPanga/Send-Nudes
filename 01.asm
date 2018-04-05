init:
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
	RTL
	
	Off:					; If OFF...
	LDA #$18				; \ 
	STA $0F2D				; |
	LDA #$0F				; | Draw "OFF" text in the status bar.
	STA $0F2E				; |
	STA $0F2F				; /
	RTL