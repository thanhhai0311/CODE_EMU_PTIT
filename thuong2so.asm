
org 100h

.Model Small
.Stack 100H
.Data
    crlf db 13, 10, '$'
    chaoTay db 'Hello$'
    chaoTa db 'xin chao$'
    str db 'Kien Truc MAy TINH$' 
    xau db 50 dup('$')
    x dw ?
    y dw ?
    a dw ?
    b dw ? 
    
.Code  

Main Proc
    Mov ax, @data
    mov ds, ax  
    
    call nhapSo
    mov a, ax
    mov ax, 0
    call endl
    
    call nhapSo
    mov b, ax
   
    call endl 
    mov dx, 0
    mov ax, a
    mov bx, b
    div bx 
    push dx
    call inSo ;in phan nguyen 
    pop dx
    call endl
    mov ax, dx
    call inSo ;in phan du
    
    mov ah, 4ch
    int 21h
Main Endp
    
nhapSo Proc 
    mov x, 0 ; luu so cu
    mov y, 0 ; luu so chuan bi duoc cong vao
    mov bx, 10
     nhap:
        mov ah, 1
        int 21h  
        
        cmp al, 13
        je nhapXong 
        
        sub al, '0'
        mov ah, 0
        mov y, ax
        mov ax, x
        mul bx
        add ax, y
        mov x, ax
        jmp nhap
     nhapXong:
        mov ax, x
     ret
nhapSo Endp 

inSo Proc
    ;push ax
    ;mov ah, 9
    ;lea dx, crlf
    ;int 21h
    ;pop ax
    mov cx, 0
    mov bx, 10
    lap:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        jg lap
    hienthi:
        pop dx
        add dl, '0'
        mov ah, 2
        int 21h
        loop hienthi
    ret
inSo Endp

endl Proc
    push ax
    push dx
    mov ah, 9
    lea dx, crlf
    int 21h
    pop dx
    pop ax
    ret
endl Endp

END MAIN


ret




