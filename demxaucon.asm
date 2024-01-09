.model small
.stack 100H
.data    
    crlf db 13, 10, '$'
    str1 db 'ktmt là mon ktmt ktmt KTTM $'
    str2 db 'ktmt$'

.code
MAIN proc
    mov ax, @data
    mov ds, ax
    
    lea si, str1
    mov cx, 0
    lapI:
        cmp [si], '$'
        je xong
        
        mov bx, si
        lea di, str2
        
        lapJ:
            cmp [di], '$'
            je Co
            
            mov al, [bx]
            cmp [di], al
            jne khong
            inc di
            inc bx
            jmp lapJ
        co:
            inc cx
        khong:
            inc si
            jmp lapI
     xong:
        mov ax, cx
        call inSo
   
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
