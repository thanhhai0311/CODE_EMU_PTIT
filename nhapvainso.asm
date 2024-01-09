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
END MAIN
