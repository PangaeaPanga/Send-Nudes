org $00C547
	autoclean JSL noRestore
	NOP #4

freecode
noRestore:
	LDY $190C				; \ Don't reset the music when the
	BNE $00C54F				; / P-Switch runs out.
	RTL

org $01AB02
	autoclean JSL pswitchSFX
	NOP #11
	
freecode
pswitchSFX:
	LDA #$04				; \ Make the P-Switch go "poof" faster.
	STA $163E,X				; /
	RTL