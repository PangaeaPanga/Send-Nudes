;Make it act like tile 25

print "block is only passable by shells"

db $42
JMP Solid : JMP Solid : JMP Solid : JMP Main : JMP Main : JMP Solid : JMP Solid
JMP Solid : JMP Solid : JMP Solid

Main:
LDA $9E,x
CMP #$04
BCC Solid
CMP #$08
BCC Cont

Solid:
LDY #$01
LDA #$30 ; solid from above
STA $1693
RTL

Cont:
LDA $14C8,x		
CMP #$09		
BEQ Good
CMP #$0A
BEQ Good
BRA Solid
Good:	
RTL