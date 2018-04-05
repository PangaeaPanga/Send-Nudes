org $00F60A
	autoclean JSL deathSFX
	NOP
	
freecode
deathSFX:
	LDA #$2A				; \ Play the "wrong" sound effect.
	STA $1DFC				; /
	RTL