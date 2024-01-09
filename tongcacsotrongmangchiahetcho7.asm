.model small
.stack 100H
.data    
    crlf db 13, 10, '$'
    list db 50 dup('$') 
    mang db 'Nhap vao cac so cua mang: $'
    tong db 'Tong: $'
    x dw ?
    y dw ?
    a dw ?
    b dw ? 
    tmp dw ?

.code
MAIN proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, mang
    int 21h 
    
    call endl
    
    lea si, list
    mov cx, 10
    nhapMang:
        call nhapSo; nhap vao 1 so 
        call endl
        mov [si], ax; gan so vua nhap vao phan tu dau tien cua mang
        inc si; tang chi so de nhap phan tu tiep theo 
        loop nhapMang
        
    call endl    
    
    lea si, list
    mov bh, 0 ; tong
    mov cx, 10 
    mov bl, 7
    lap3:
        mov al, [si]; gan phan tu dau tien cua mang cho ax de chia
        mov ah, 0; gan phan tu dau tien cua mang cho ax de chi
        div bl; chia phan tu dau tien cua mang cho 7
        cmp ah, 0; so sang so du voi 0
        jne continue; neu khong chia het cho 7
        add bh, [si]; neu chi het cho 7 cong vao tong
        continue:
            inc si; tang chi so de tro den phan tu tiep theo
        loop lap3
        
    mov ah, 9
    lea dx, tong
    int 21h 
        
    mov al, bh
    mov ah, 0
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
