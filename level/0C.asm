;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;VVVVVV flip
;
;Insert this code in any levels (if some levels, use JSR VVVVVVPhysics and
;subroutine (this code) at the very bottom) or gamemode 14 (for all levels).
;
;Make sure you insert the jump disable patch to prevent the ability to jump
;the 1st frame you touch the ground/ceiling.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
!DisableJump = $61
;^[1 byte] Disables jumping glitch where if you press jump the first frame the
;player lands on a ground/ceiling.

!flip_gravity = $94D826
;^[ROM address] the flip subroutine that asar gives you when you insert the
;gravity patch.

!WhiteLineGravBlk = $62
;^[1 byte] used so that vertical lines know what side you came from in order
;to have the opposite side have reversed gravity.

!WhiteLineGravBlkPrev = $63
;^[1 byte] used to detect if !WhiteLineGravBlk is changed to check if the
;player moves from one side of the block to the other.

main:
VVVVVVPhysics:
	LDA #$01
	STA !DisableJump
	LDA $77             ;\If in the air, return
	AND.b #%00000100    ;|
	BEQ .GravFlipDone   ;/

	LDA $9D             ;\Don't allow flipping during
	ORA $13D4           ;|freeze.
	BNE .GravFlipDone   ;/

	LDA $16             ;\If not pressing B, check pressing A
	BPL .PressA         ;/
	BRA .Flip
.PressA
	LDA $18             ;\If not pressing A, return
	BPL .GravFlipDone   ;/
.Flip
	JSL !flip_gravity   ;>Reverse gravity.
.GravFlipDone

WhiteGravityLine:
	LDA !WhiteLineGravBlk
	BEQ .WhiteLineDone
.Left2Right
	SEC                         ;\If !WhiteLineGravBlk = #$03
	SBC !WhiteLineGravBlkPrev   ;|and !WhiteLineGravBlkPrev = #$02
	CMP #$01                    ;|(going from left to right)
	BEQ .Flip                   ;/
	CMP #$FF                    ;\If !WhiteLineGravBlk = #$02
	BEQ .Flip                   ;/and !WhiteLineGravBlkPrev = #$03, flip (right to left)
	LDA !WhiteLineGravBlk       ;>Update previous
	BRA .WhiteLineDone
.Flip
	JSL !flip_gravity
	LDA $7D                     ;\Invert speed for smooth transitions
	EOR #$FF                    ;|(remove if you want instant switch)
	INC                         ;|
	STA $7D                     ;/
	LDA #$23                    ;\Sfx when passing through white line
	STA $1DFC                   ;/
	LDA !WhiteLineGravBlk
.WhiteLineDone
	STA !WhiteLineGravBlkPrev
	LDA #$00
	STA !WhiteLineGravBlk
	RTL