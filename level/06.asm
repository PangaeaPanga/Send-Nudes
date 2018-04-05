load:
	STZ $19					; Resets player's powerup.

main:
	LDA $0071				; \ 
	CMP #$01				; | Check to see if the player is hurt.
	BEQ KillPlayer			; /
	RTL
	
	KillPlayer:
	JSL $00F606				; Kill the player.
	LDA #$01				; \ Play the "hit head" sound effect.
	STA $1DF9				; /
	RTL