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
	LDA $14C8,x				; \ If the sprite is  alive...
	CMP #$08				; |
	BCC Label_0000			; /
	LDA #$E8				; \ Set the sprite's x position to -24.
	STA $B6,x				; /
Label_0000:					; > --------
RTL

SpriteH:
	LDA $14C8,x				; \ If the sprite is  alive...
	CMP #$08				; |
	BCC Label_0001			; /
	LDA #$E8				; \ Set the sprite's x position to -24.
	STA $B6,x				; /
Label_0001:					; > --------


Cape:
Fireball:
MarioCorner:
MarioBody:
MarioHead:
WallFeet:
WallBody:
RTL



print "Move the sprite left with a speed of 24."