; Bootloader de exemplo feito graças ao estudo do projeto Neutrino OS (https://github.com/AlissonLinhares/NeutrinoOS)
[ORG 7C00h]
[BITS 16]

JMP 0:main
TIMES 49 - ($-$$) DB 0

main:

	XOR AX,AX
	MOV DS,AX
	MOV ES,AX
	MOV FS,AX
	MOV GS,AX
	MOV SS,AX
	MOV SP,7C00h

	MOV BX,msg
	CALL print
	JMP $

	print:
		PUSH AX
		PUSH BX

		MOV AH,0Eh
		MOV AL,BYTE[BX]

		.nextChar:
			INT 10h
			INC BX
			MOV AL,BYTE[BX]
		TEST AL,AL
		JNZ .nextChar

		POP BX
		POP AX
		RET

msg DB 13,10,'Eai mundo!',13,10,'Por: Aleph Santos Oliveira (18710509)',0

;Esse registro de boot define as partições nos disco, alguns computadores só conseguem dar boot em HDs e USB-Drives com esses registros ativados. 
alignment           TIMES 446-($-$$) DB
bootIndicator       DB 80h ;80 = botável, 0 = não botável
startHeadNumber     DB 0   ;CHS - 0,0,1
startCylinderNumber DW 0100h
descriptor          DB 0Bh ;FAT 32 - Se colocar 0 ocorre erro em alguns PCs...
lastHeadNumber      DB 16
lastCylinderNumber  DW 03FCFh
startingSector      DD 1
partitionSize       DD 207 * 16 * 63
reserved            TIMES 510 - ($-$$) DB 0 ;Alinhando dados do kernel.
bootSignature       DW 0AA55h
kernelAlignment     TIMES 1536 DB 0

