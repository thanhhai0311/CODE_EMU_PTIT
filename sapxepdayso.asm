.model small
.stack 100H
.data    
    crlf db 13, 10, '$'
    list db 1, 5, 14, 1, 6, 7, 8, 9, 28, 30
    x dw ?
    y dw ?
    a dw ?
    b dw ?

.code
MAIN proc
    mov ax, @data
    mov ds, ax
    
    lea si, list
    mov cl, 0
    lapI:
        cmp cl, 9
        je xong 
        
        mov bx, si
        
        mov di, si
        mov ch, cl
        
        lapJ:
            cmp ch, 10
            je xong2
            
            mov al, [bx]
            cmp [di], al
            jge continue
            
            mov bx, di
            continue:
                inc ch
                inc di
                jmp lapJ
        xong2:
        cmp bx, si 
        je pass
        mov dl, [bx]
        mov dh, [si]
        mov [si], dl
        mov [bx], dh
        
        pass:
            inc cl
            inc si
            jmp lapI
            
     xong:
        lea si, list
        mov cx, 10
        lap5:
            mov al, [si]
            mov ah, 0
            call inSo
            call endl 
            inc si
            
            loop lap5
          
         
   
    
   
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
