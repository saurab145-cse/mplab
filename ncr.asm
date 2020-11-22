.MODEL SMALL
.DATA
N DW 4
R DW 2
NCR DW 0
.CODE

MOV AX,@DATA
MOV DS,AX

MOV AX,N
MOV BX,R
CALL NCRPRO
JMP FINAL

NCRPRO PROC NEAR
CMP AX,BX
JE RES1
CMP BX,0
JE RESN
DEC AX
CMP BX,AX
JE INCR
PUSH AX
PUSH BX
CALL NCRPRO

POP BX
POP AX
DEC BX
PUSH AX
PUSH BX
CALL NCRPRO
POP BX
POP AX
RET

RES1: INC NCR
RET

INCR: INC NCR
RESN: ADD NCR,AX
RET
NCRPRO ENDP 

DISP PROC NEAR
MOV BX,NCR
ADD BX,3030H
MOV DL,BH
MOV AH,02H
INT 21H
MOV DL,BL
MOV AH,02H
INT 21H
RET 
DISP ENDP

FINAL: MOV AH,4CH
INT 21H
END
