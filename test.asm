.model small
.stack 100H
.data    
    crlf db 13, 10, '$'
    list db 1, 5, 30, 1, 6, 7, 8, 9, 10, 20
    x dw ?
    y dw ?
    a dw ?
    b dw ?

.code
MAIN proc
    mov ax, @data
    mov ds, ax
    
    call nhapSo
    mov a, ax
    call nhapSo
    mov b, ax
    lap4:
        cmp a, b
   
    mov ah, 4ch
    int 21h
MAIN Endp   

endl Proc 
    push ax
    push dx
    
    mov al, 0
    mov ah, 9
    lea dx, crlf
    int 21h
     
    pop dx
    pop ax
    
    ret
endl Endp 

bintodec Proc
    mov bx, 0
    lap3:
        mov ah, 1
        int 21h 
        
        cmp al, 13
        je break3
        
        sub al, '0'
        mov ah, 0
        add bx, bx
        add bx, ax
        jmp lap3
        break3:
    ret
bintodec Endp

nhapSo Proc
    mov x, 0
    mov y, 0
    mov bx, 10
    lap:
        mov ah, 1
        int 21h
        
        cmp al, 13
        je break
        
        sub al, '0'
        mov ah, 0
        mov y, ax
        mov ax, x
        mul bx
        add ax, y
        mov x, ax
        
        jmp lap
    break:
        mov ax, x
    ret
nhapSo Endp


inSo Proc
    push ax
    push bx
    push cx
    push dx
    
    mov bx, 10
    mov cx, 0
    lap2:
        mov dx, 0
        div bx
        push dx
        inc cx
        
        cmp ax, 0
        jg lap2
        
    hienthi:
        pop dx
        add dl, '0'
        
        mov ah, 2
        int 21h     
        
        loop hienthi
    pop dx
    pop cx
    pop bx
    pop ax
    ret
inSo Endp



END MAIN
