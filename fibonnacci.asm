                                                                   
.model small
.stack 100h
.data
msg db 10,13,"enter terms: ",0  
outmsg db 10,13,"Fibonacci series: ",0

.code

main proc
    
    mov ax,@data
    mov ds,ax
    
    lea si,msg
    call print_string
    
    call scan_num
    mov bx,cx 
    
    mov ax,0
    mov dx,1  
    
    lea si,outmsg
    call print_string   
    
    mov cx,bx
    
    fib:
    mov si,ax
    call print_num
    mov   ax,dx
    add  dx,si 
    loop fib
          
          
    
    
   
    done:
    mov ah,4ch     
    int 21h

main endp 
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING  
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end main