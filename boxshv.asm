		;; tell NASM we want 16-bit assembly
		BITS	16
		ORG	0x100		; DOS loads us here

Start:		CALL	InitVideo
		MOV	CX, REFRESH_RATE * WAIT_SECS ; Init counter
.gameLoop:	CALL	WaitFrame
		DEC	CX
		JNZ	.gameLoop
		CALL	RestoreVideo
		; exit
		MOV	AH, 0x4C
		MOV	AL, 0
		INT	0x21

REFRESH_RATE	EQU	70
WAIT_SECS	EQU	5

%include	"video.asm"
	
	
	
