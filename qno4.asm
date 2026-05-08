
.MODEL SMALL
.STACK 100H
.DATA
    PROMPT1 DB 'Enter the first number : $'
    PROMPT2 DB 0AH,0DH,'Enter the second number: $'
    QUOTIENT_MSG DB 0AH,0DH,'Quotient: $'
    REMAINDER_MSG DB 0AH,0DH,'Remainder: $'
    DIVIDEND DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, PROMPT1
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, '0' 
    MOV DIVIDEND, AL

    LEA DX, PROMPT2
    MOV AH, 9
    INT 21H

    MOV AH, 1
    INT 21H
    SUB AL, '0' 
    MOV BL, AL

    MOV AL, DIVIDEND
    MOV AH, 0 
    DIV BL    

    MOV BH, AL
    MOV CH, AH

    LEA DX, QUOTIENT_MSG
    MOV AH, 9
    INT 21H


    MOV DL, BH
    ADD DL, '0' 
    MOV AH, 2
    INT 21H

    LEA DX, REMAINDER_MSG
    MOV AH, 9
    INT 21H

    MOV DL, CH
    ADD DL, '0'
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
