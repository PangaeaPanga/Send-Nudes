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
RTL

SpriteV:
	LDA #$00				; \ Set the sprite's x position to 0.
	STA $B6,x				; /
RTL

SpriteH:
	LDA #$00				; \ Set the sprite's y position to 0.
	STA $AA,x				; /


Cape:
Fireball:
MarioCorner:
MarioBody:
MarioHead:
WallFeet:
WallBody:
RTL



print ""