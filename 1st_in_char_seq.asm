include 'emu8086.inc'

.model small      
.stack 100h
.data 

msg db 10,13,"Enter the 1st character ",0
msg2 db 10,13,"enter the 2nd character ",0   
msg3 db 10,13,"1st in char sequence ",0
.code    

main proc   
    
    mov ax,@data
    mov ds,ax
    
    
    lea si,msg
    call print_string
    
    mov ah,01h
    int 21h
    mov bl,al
    
    
    lea si,msg2
    call print_string    
    
    mov ah,01h
    int 21h
    mov cl,al    
    
    cmp cl,bl
    jle 1st
    jg 2nd
    
    1st:
    lea si,msg3
    call print_string
    mov dl,cl   
    mov ah,2
    
    int 21h
    
    jmp exit
    
    2nd:
    lea si,msg3
    call print_string 
    mov dl,al
    mov ah,2 
    
    int 21h
    
    
    jmp exit
    
    
    exit:
    mov ah,04ch
    int 21h
    
    
    
    
    
    

    
    
    
    
    main endp
DEFINE_PRINT_STRING
DEFINE_SCAN_NUM
DEFINE_GET_STRING
END MAIN