init:
	LDA #$01
	STA $0DC1		;/ Player can carry Yoshi over levels flag. #$00 = can't carry over levels; #$01 = can carry over levels.

	LDA #$0A		;\ Yoshi color. #$04=yellow; #$06=blue; #$08=red; #$0A=green. Refreshes on level change.
	STA $13C7		;/ Mario Starts with (Green) Yoshi.
	
	RTL