include 'emu8086.inc'

.model small
.stack 100h
.data
msg1 db 10,13,"Enter 1st ",0
msg2 db 10,13,"Enter 2nd ",0
msg3 db 10,13,"Enter 3rd ",0
msg4 db 10,13,"Enter 4th ",0
outmsg db 10,13,"Biggest Number ",0   

.code     
main proc
    
mov ax,@data
mov ds,ax  

lea si,msg1
call print_string
call scan_num

mov bx,cx

lea si,msg2
call print_string
call scan_num

cmp cx,bx
jle skip1
mov bx,cx 

skip1:
lea si,msg3
call print_string

call scan_num
cmp cx,bx
jle skip2
mov bx,cx

skip2: 
lea si,msg4
call print_string

call scan_num
cmp cx,bx
jle skip3
mov bx,cx

skip3:
lea si,outmsg
call print_string

mov ax,bx
call print_num  

mov ah,04ch
int 21h
main endp 
DEFINE_SCAN_NUM
DEFINE_PRINT_STRING 
DEFINE_PRINT_NUM 
DEFINE_PRINT_NUM_UNS
end main

