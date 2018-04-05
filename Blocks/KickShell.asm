db $37

JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH
JMP Cape : JMP Fireball
JMP MarioCorner : JMP MarioBody : JMP MarioHead
JMP WallFeet : JMP WallBody

MarioBelow:
MarioAbove:
MarioSide:
RTL

SpriteV:
	LDA $9E,x				; \ 
	CMP #$04				; | Check to see if the sprite is a shell.
	BCC Return				; | (green, red, blue, yellow)
	CMP #$08				; |
	BCC Kick				; /
	
	Kick:
	LDA #$D2				; \ Set the sprite's x position to -46.
	STA $B6,x				; /
	LDA #$0A				; \ Kick the shell.
	STA $14C8,x				; /
	
	Return:
	RTL
	
Label_0000:					; > --------
RTL

SpriteH:
	LDA $9E,x				; \ 
	CMP #$04				; | Check to see if the sprite is a shell.
	BCC Return				; | (green, red, blue, yellow)
	CMP #$08				; |
	BCC Kick				; /
	
	Kick:
	LDA #$D2				; \ Set the sprite's x position to -46.
	STA $B6,x				; /
	LDA #$0A				; \ Kick the shell.
	STA $14C8,x				; /
	
	Return:
	RTL

Cape:
Fireball:
MarioCorner:
MarioBody:
MarioHead:
WallFeet:
WallBody:
RTL



print "A block that kicks shells to the left."