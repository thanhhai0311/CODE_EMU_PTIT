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
    lap:
        mov ah, 1
        int 21h; nhap 1 ki tu
        cmp al, 13; kiem tra nhap xong chua
        je nhapXong
        mov [si], al; gan ki tu vua nhap vao si
        inc si; tang si de nhap ki tu tiep theo
    jmp lap
    nhapXong:
        mov ah, 9
        lea dx, crlf; xuong dong
        int 21h 
        lea dx, xau; in xau 
        int 21h
    mov ah, 4ch
    int 21h
Main Endp

END MAIN
