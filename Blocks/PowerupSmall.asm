db $37

JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH
JMP Cape : JMP Fireball
JMP MarioCorner : JMP MarioBody : JMP MarioHead
JMP WallFeet : JMP WallBody

MarioBelow:
	LDA #$00				; \ Make the player small (without the animation).
	STA $19					; /
RTL

MarioAbove:
	LDA #$00				; \ Make the player small (without the animation).
	STA $19					; /
RTL

MarioSide:
	LDA #$00				; \ Make the player small (without the animation).
	STA $19					; /


SpriteV:
SpriteH:
Cape:
Fireball:
MarioCorner:
MarioBody:
MarioHead:
WallFeet:
WallBody:
RTL



print "A block that makes Mario small."