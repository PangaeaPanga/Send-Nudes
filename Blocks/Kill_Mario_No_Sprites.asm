db $37

JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH
JMP Cape : JMP Fireball
JMP MarioCorner : JMP MarioBody : JMP MarioHead
JMP WallFeet : JMP WallBody

MarioBelow:
	JSL $00F606				; > Kill the player.
RTL

MarioAbove:
	JSL $00F606				; > Kill the player.
RTL

MarioSide:
	JSL $00F606				; > Kill the player.


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



print "A block that kills Mario and does not interact with sprites."