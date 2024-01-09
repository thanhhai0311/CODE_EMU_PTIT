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
    a dw 1
    b dw 2
    c dw 1
    d dw 2
    e dw ? 
    tu dw ?
    mau dw ?
    
.Code  

Main Proc
    Mov ax, @data
    mov ds, ax  
    
    call nhapSo
    mov e, ax
    mov dx, 0
    mov bx, 1
    add ax, 2
    mov tu, ax
    
    mov dx, 0
    mov ax, e
    mov bx, 1
    mul bx
    sub ax, 2
    mov mau, ax
    
    mov ax, tu
    mov dx, 0
    mov bx, mau
    div bx
    push dx
    call inSo
    mov ah, 9
    lea dx, crlf
    int 21h
    pop dx
    mov ax, dx
    call inSo
    
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
    push ax
    mov ah, 9
    lea dx, crlf
    int 21h
    pop ax
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
END MAIN
