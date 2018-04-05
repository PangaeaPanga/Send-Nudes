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
	LDA #$00				; \ Set the sprite's y position to 0.
	STA $AA,x				; /
Label_0000:					; > --------


SpriteH:
Cape:
Fireball:
MarioCorner:
MarioBody:
MarioHead:
WallFeet:
WallBody:
RTL



print "A block that acts like 1F0."