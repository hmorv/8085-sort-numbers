.DATA 0b
		
		COMPARATIONNUM: dB 0 
		
		TRAVERSE: dB 0

;Main
.org 1000h

LXI D, 0100h ;memory init
CALL COMPARE

;end Main

;Compare 2 consecutive nums
COMPARE:
		INX D 
		LDAX D
		MOV B,A
		DCX D
		LDAX D
		CMP B
		JNC INVERT
		JMP COMPARE2
;Swap it if first num is greater than the next one
INVERT:
		INX D 
		STAX D
		DCX D
		MOV A, B
		STAX D
		JMP COMPARE2

COMPARE2:
		INX D 
		LDA COMPARATIONNUM
		INR A 
		STA COMPARATIONNUM
		CPI 99
		JZ INCTRAVERSE
		JMP COMPARE
	
INCTRAVERSE:
		LDA TRAVERSE
		INR A
		STA TRAVERSE
		CPI 100
		JZ END
		LDA COMPARATIONNUM
		MVI A, 0
		STA COMPARATIONNUM
		LXI D, 0100h
		JMP COMPARE

END:
		HLT