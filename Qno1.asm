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

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

READ_LOOP:
    ; Read a character
    MOV AH, 1
    INT 21H

    ; Check for Enter key
    CMP AL, 0DH
    JE END_LOOP

    ; Check for uppercase
    CMP AL, 'A'
    JB NOT_UPPER
    CMP AL, 'Z'
    JA NOT_UPPER
    INC UPPER_COUNT
    JMP READ_LOOP

NOT_UPPER:
    ; Check for lowercase
    CMP AL, 'a'
    JB READ_LOOP
    CMP AL, 'z'
    JA READ_LOOP
    INC LOWER_COUNT
    JMP READ_LOOP

END_LOOP:
    ; Print uppercase count
    LEA DX, UPPER_MSG
    MOV AH, 9
    INT 21H

    MOV AL, UPPER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Print lowercase count
    LEA DX, LOWER_MSG
    MOV AH, 9
    INT 21H

    MOV AL, LOWER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
new_string:
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

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

READ_LOOP:
    ; Read a character
    MOV AH, 1
    INT 21H

    ; Check for Enter key
    CMP AL, 0DH
    JE END_LOOP

    ; Check for uppercase
    CMP AL, 'A'
    JB CHECK_LOWER
    CMP AL, 'Z'
    JA CHECK_LOWER
    
    INC UPPER_COUNT
    ; Convert uppercase to lowercase by adding 20H.
    ; This demonstrates the conversion.
    ADD AL, 20H 
    JMP READ_LOOP

CHECK_LOWER:
    ; Check for lowercase
    CMP AL, 'a'
    JB READ_LOOP
    CMP AL, 'z'
    JA READ_LOOP
    
    INC LOWER_COUNT
    ; Convert lowercase to uppercase by subtracting 20H.
    ; This demonstrates the conversion.
    SUB AL, 20H
    JMP READ_LOOP

END_LOOP:
    ; Print uppercase count
    LEA DX, UPPER_MSG
    MOV AH, 9
    INT 21H

    MOV AL, UPPER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Print lowercase count
    LEA DX, LOWER_MSG
    MOV AH, 9
    INT 21H

    MOV AL, LOWER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN
old_string:
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

    ; Display prompt
    LEA DX, PROMPT
    MOV AH, 9
    INT 21H

READ_LOOP:
    ; Read a character
    MOV AH, 1
    INT 21H

    ; Check for Enter key
    CMP AL, 0DH
    JE END_LOOP

    ; Check for uppercase
    CMP AL, 'A'
    JB NOT_UPPER
    CMP AL, 'Z'
    JA NOT_UPPER
    INC UPPER_COUNT
    JMP READ_LOOP

NOT_UPPER:
    ; Check for lowercase
    CMP AL, 'a'
    JB READ_LOOP
    CMP AL, 'z'
    JA READ_LOOP
    INC LOWER_COUNT
    JMP READ_LOOP

END_LOOP:
    ; Print uppercase count
    LEA DX, UPPER_MSG
    MOV AH, 9
    INT 21H

    MOV AL, UPPER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Print lowercase count
    LEA DX, LOWER_MSG
    MOV AH, 9
    INT 21H

    MOV AL, LOWER_COUNT
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 2
    INT 21H

    ; Exit
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN