;-------------------------------
; Full EMU8086 Program
; User Input Based Positive/Negative/Zero
; Small COM Program
;-------------------------------

include 'emu8086.inc'

.model small
.stack 100h

.data
    msg   db "Enter a Number: ",0
    pos   db 13,10,"Positive number",0
    negat db 13,10,"Negative number",0
    zer   db 13,10,"Zero",0

.code
main proc
    
    mov ax,@data
    mov ds,ax

    ; Print prompt
    lea dx,msg
    call PRINT_STRING

    ; Read number from user (supports multi-digit & negative)
    call SCAN_NUM       ; result stored in CX

    ; Move number to AX for comparison
    mov ax,cx

    ; Compare and jump to appropriate label
    cmp ax,0
    jg positive
    jl negative
    je zero

positive:
    lea dx,pos
    call PRINT_STRING
    jmp exit

negative:
    lea si,negat
    call PRINT_STRING
    jmp exit

zero:
    lea dx,zer
    call PRINT_STRING

exit:
    ; Terminate program
    mov ah,4Ch
    int 21h

main endp

;-------------------------------
; Define library procedures
; Must be after code but before 'end main'
;-------------------------------
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING

end main
