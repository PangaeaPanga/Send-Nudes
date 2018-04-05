db $37

JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH
JMP Cape : JMP Fireball
JMP MarioCorner : JMP MarioBody : JMP MarioHead
JMP WallFeet : JMP WallBody

MarioBelow:
	LDA #$03				; \ Make the player fiery (without the animation).
	STA $19					; /
RTL

MarioAbove:
	LDA #$03				; \ Make the player fiery (without the animation).
	STA $19					; /
RTL

MarioSide:
	LDA #$03				; \ Make the player fiery (without the animation).
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



print "A block that gives Mario a fireflower."