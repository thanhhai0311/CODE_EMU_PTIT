.Model Small
.Stack 100H
.Data
    crlf db 13, 10, '$'
    chaoTay db 'Hello$'
    chaoTa db 'xin chao$'
    str db 'Kien Truc MAy TINH$' 
    xau db 50 dup('$')
    
.Code 
Main Proc
    Mov ax, @data
    mov ds, ax  
    lea si, xau
    mov cx, 0
    lap:
        mov ah, 1
        int 21h
        cmp al, 13
        je hienthi
        mov [si], al
        push [si]
        inc si
        inc cx 
    jmp lap
    hienthi:  
        mov ah, 9
        lea dx, crlf
        int 21h
        lap2:
            pop dx
            mov ah, 2
            int 21h
        loop lap2
    mov ah, 4ch
    int 21h
Main Endp

END MAIN
