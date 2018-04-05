!test = $1487		; One free byte.

main:
	LDA !test
	STA $0F26
	INC !test
	RTL