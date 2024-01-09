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
    
.Code  

Main Proc
    Mov ax, @data
    mov ds, ax  
    
    call nhapSo 
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
    mov bx, 16
    lap:
        mov dx, 0
        div bx
        push dx
        inc cx
        cmp ax, 0
        jg lap
    hienthi:
        pop dx
        cmp dl, 9
        jg chuSo
        jng so
        chuSo:
            sub dl, 10
            add dl, 'A'
            jmp in
        so:
            add dl, '0'
            jmp in 
        in:
            mov ah, 2
            int 21h
            loop hienthi
    ret
inSo Endp
END MAIN
