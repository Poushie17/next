include 'emu8086.inc'
.model small
.stack 100h
.data
msg db 10,13,"Enter marks: ",0

apmsg db 10,13,"Grade A+",0
amsg  db 10,13,"Grade A",0
ammsg db 10,13,"Grade A-",0
bpmsg db 10,13,"Grade B+",0
bmsg  db 10,13,"Grade B",0
bmmsg db 10,13,"Grade B-",0
cpmsg db 10,13,"Grade C+",0
cmsg  db 10,13,"Grade C",0
dmsg  db 10,13,"Grade D",0
fmsg  db 10,13,"Fail",0

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea si,msg
    call print_string
    
    call scan_num       
    
    cmp cx,80
    jge grade_ap
    
    cmp cx,75
    jge grade_a
    
    cmp cx,70
    jge grade_am
    
    cmp cx,65
    jge grade_bp
    
    cmp cx,60
    jge grade_b
    
    cmp cx,55
    jge grade_bm
    
    cmp cx,50
    jge grade_cp
    
    cmp cx,45
    jge grade_c
    
    cmp cx,40
    jge grade_d
    
    jl grade_f
    

grade_ap:
    lea si,apmsg
    call print_string
    jmp exit

grade_a:
    lea si,amsg
    call print_string
    jmp exit

grade_am:
    lea si,ammsg
    call print_string
    jmp exit

grade_bp:
    lea si,bpmsg
    call print_string
    jmp exit

grade_b:
    lea si,bmsg
    call print_string
    jmp exit

grade_bm:
    lea si,bmmsg
    call print_string
    jmp exit

grade_cp:
    lea si,cpmsg
    call print_string
    jmp exit

grade_c:
    lea si,cmsg
    call print_string
    jmp exit

grade_d:
    lea si,dmsg
    call print_string
    jmp exit

grade_f:
    lea si,fmsg
    call print_string

exit:
    mov ah,04ch
    int 21h

main endp

DEFINE_SCAN_NUM
DEFINE_PRINT_STRING
end main