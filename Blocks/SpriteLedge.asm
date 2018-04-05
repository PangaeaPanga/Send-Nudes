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
	STZ $1693				; |
	LDY #$01				; /
RTL

SpriteH:
	STZ $1693				; |
	LDY #$01				; /


Cape:
Fireball:
MarioCorner:
MarioBody:
MarioHead:
WallFeet:
WallBody:
RTL



print "A block that is not passable by sprites only from the top."