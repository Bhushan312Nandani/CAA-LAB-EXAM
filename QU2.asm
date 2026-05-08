.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Enter a single-digit number: $'
    DIV_BY_2_MSG DB 0AH,0DH,'Divisible by 2, Quotient: $'
    DIV_BY_3_MSG DB 0AH,0DH,'Divisible by 3, Quotient: $'
    NOT_DIV_MSG DB 0AH,0DH,'Not divisible by 2 or 3.$'
    NUM DB ?

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H
    
    ; Read number and convert from ASCII to decimal
    MOV AH, 1
    INT 21H
    SUB AL, '0' 
    MOV NUM, AL
    
    MOV CL, 0 ; Flag to see if we found a divisor. 0=no, 1=yes.

    ; Check divisibility by 2
    MOV AX, 0
    MOV AL, NUM
    MOV BL, 2   ; Divisor
    DIV BL      ; AX / BL. Quotient in AL, Remainder in AH.
    CMP AH, 0   ; Check if remainder is 0
    JNE CHECK_3 ; If not zero, jump to check for 3

    ; Divisible by 2
    MOV CL, 1 ; Set the flag
    MOV BH, AL ; Save quotient
    LEA DX, DIV_BY_2_MSG
    MOV AH, 9
    INT 21H
    MOV DL, BH ; Use saved quotient
    ADD DL, '0'
    MOV AH, 2
    INT 21H

CHECK_3:
    ; Check divisibility by 3
    MOV AX, 0
    MOV AL, NUM
    MOV BL, 3   ; Divisor
    DIV BL      ; AX / BL. Quotient in AL, Remainder in AH.
    CMP AH, 0   ; Check if remainder is 0
    JNE CHECK_FLAG ; If not zero, jump to check the flag

    ; Divisible by 3
    MOV CL, 1 ; Set the flag
    MOV BH, AL ; Save quotient
    LEA DX, DIV_BY_3_MSG
    MOV AH, 9
    INT 21H
    MOV DL, BH ; Use saved quotient
    ADD DL, '0'
    MOV AH, 2
    INT 21H

CHECK_FLAG:
    CMP CL, 1
    JE EXIT ; If flag is 1, we are done.

NOT_DIV:
    ; If we get here, CL was 0.
    LEA DX, NOT_DIV_MSG
    MOV AH, 9
    INT 21H

EXIT:
    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
