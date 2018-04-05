db $37

JMP MarioBelow : JMP MarioAbove : JMP MarioSide
JMP SpriteV : JMP SpriteH
JMP Cape : JMP Fireball
JMP MarioCorner : JMP MarioBody : JMP MarioHead
JMP WallFeet : JMP WallBody

MarioBelow:
	LDA #$A1				; \ Set the player's y speed to -95.
	STA $7D					; /
	%shatter_block()			; > Shatter the block with normal shards.
RTL

MarioAbove:
	LDA #$A1				; \ Set the player's y speed to -95.
	STA $7D					; /
	%shatter_block()			; > Shatter the block with normal shards.
RTL

MarioSide:
	LDA #$A1				; \ Set the player's y speed to -95.
	STA $7D					; /
	%shatter_block()			; > Shatter the block with normal shards.


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



print "A block that sets Mario's y speed to -95 and shatters."