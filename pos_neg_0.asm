
; User Input Based Positive/Negative/------------------------

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

   
    lea dx,msg
    call PRINT_STRING

     call SCAN_NUM       

  mov ax,cx

    
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
  
    mov ah,4Ch
    int 21h

main endp


DEFINE_SCAN_NUM
DEFINE_PRINT_STRING

end main