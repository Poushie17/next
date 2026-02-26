include 'emu8086.inc'

.model small
.stack 100h
.data
msg db 10,13,"Enter Number ",0 
abs db 10,13,"Absolute Value ",0

.code
main proc 
     mov ax,@data
     mov ds,ax
     
     lea si,msg
     call print_string
     
     call scan_num
     cmp cx,0
     jge positive
     
     negative:
     neg cx
     mov ax,cx
     jmp exit
 
     
     positive:
     mov ax,cx
    
     
     
     

      exit:
      lea si,abs
      call print_string
      
      call print_num
           
      
      mov ah, 4ch
      int 21h
    
    main endp 

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
DEFINE_PRINT_NUM
DEFINE_PRINT_NUM_UNS
end main