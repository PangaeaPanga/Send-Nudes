db $37

JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH
JMP Cape : JMP Fireball
JMP MarioCorner : JMP MarioBody : JMP MarioHead
JMP WallFeet : JMP WallBody

MarioBelow:
	LDA #$30				; \ Make this block solid.
	STA $1693				; |
	LDY #$01				; /
RTL

MarioAbove:
	LDA #$30				; \ Make this block solid.
	STA $1693				; |
	LDY #$01				; /
RTL

MarioSide:
	LDA #$30				; \ Make this block solid.
	STA $1693				; |
	LDY #$01				; /


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



print "A block that is not passable by Mario."