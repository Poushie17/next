include 'emu8086.inc'

.model small
.stack 100h   
.data
msg db 10,13,"Enter String to Reverse ",0
msg2 db 10,13,"Reversed: ",0
.code 

main proc   
    
    mov ax,@data
    mov ds,ax
    
    lea si,msg
    call print_string  
    
    mov cx,0
    
    input:
    mov ah,1
    int 21h
    cmp al,13
    je done
    push ax
    inc cx
    jmp input
    
    done: 
    lea si,msg2
    call print_string
    
    output: 
    cmp cx,0
    je exit
    pop ax 
    mov dl,al
    mov ah,2
    int 21h
    dec cx
    jmp output 
    
    exit:
    mov ah,4ch
    int 21h
    
    
    
    
    
    
    
    main endp
    DEFINE_PRINT_STRING
    DEFINE_SCAN_NUM
    end main