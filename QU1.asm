.MODEL SMALL
.STACK 100H
.DATA
    PROMPT DB 'Enter a sequence of characters (press Enter to finish):$'
    UPPER_MSG DB 0AH,0DH,'Uppercase count: $'
    LOWER_MSG DB 0AH,0DH,'Lowercase count: $'
    UPPER_COUNT DB 0
    LOWER_COUNT DB 0

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

READ_LOOP:
    ; Read a single character from input
    MOV AH, 1
    INT 21H

    ; Check if the character is the 'Enter' key (Carriage Return)
    CMP AL, 0DH
    JE END_LOOP

    CMP AL, 'A'
    JB NOT_UPPER
    CMP AL, 'Z'
    JA NOT_UPPER
    INC UPPER_COUNT
    JMP READ_LOOP

NOT_UPPER:
    ; Check if the character is a lowercase letter ('a' through 'z')
    CMP AL, 'a'
    JB READ_LOOP
    CMP AL, 'z'
    JA READ_LOOP
    INC LOWER_COUNT
    JMP READ_LOOP

END_LOOP:
    ; Display the message for the uppercase count
    LEA DX, UPPER_MSG
    MOV AH, 9
    INT 21H

    ; Convert the count (a number) to a printable character and display it
    MOV AL, UPPER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Display the message for the lowercase count
    LEA DX, LOWER_MSG
    MOV AH, 9
    INT 21H

    ; Convert the count to a printable character and display it
    MOV AL, LOWER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Terminate the program
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN