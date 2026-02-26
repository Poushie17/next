include 'emu8086.inc'

.model small
.stack 100h
.data
msg db 10,13,"Enter Number ",0 
evenm db 10,13,"Number is even",0
oddm db 10,13,"Number is odd",0

.code
main proc 
     mov ax,@data
     mov ds,ax
     
     lea si,msg
     call print_string
     
     call scan_num 
     mov bx,cx   
     
     and bx,1
     cmp bx,0
     je even
     jmp odd
     
     even:
     lea si,evenm
     call print_string 
     jmp exit
     
     odd:
     lea si,oddm
     call print_string
     jmp exit
       
    
      
      exit:
      mov ah, 04ch
      int 21h
    
    main endp 
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
end main