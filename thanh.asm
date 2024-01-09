.model small
.stack 100
.data
   crlf db 10,13,'$'
   ten db 'TRUONG CONG TUAN THANH $' 
   tmp db ': $'
   ngaysinh db '19-01-2003$'
   c2 db 'So linh hon : $'

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah, 9
    lea dx, ten
    int 21h
    
    lea dx, tmp
    int 21h
    
    lea dx, ngaysinh
    int 21h
    
    lea dx, crlf
    int 21h
    
    lea dx, c2
    int 21h
    
    
    lea si,ten
    mov bl,9
    mov dl, 0
          
      lapso:
         cmp [si],'$'
         je done
         
         cmp [si],'U'
         je tiep
         
         cmp [si],'E'
         je tiep
         
         cmp [si],'O'
         je tiep
         
         cmp [si],'A'
         je tiep
         
         cmp [si],'I'
         je tiep
         
         inc si
         jmp lapso
         
         tiep:
            mov ah,0
            mov al,[si]  
            sub al, 64
         

            div bl
            add dl, ah 
            inc si
            jmp lapso
               
      done:
      mov al, dl

      lap_rut_gon:
        cmp al, 10
        jl kt_rut_gon
        
        mov bl, 10
        mov dl, 0
        tach:
            mov ah, 0
            div bl
            add dl, ah
            
            cmp al, 0
            jg tach
        mov al, dl
        jmp lap_rut_gon
      kt_rut_gon:   
      
      mov dl, al
      add dl, '0'
      mov ah, 2
      int 21h
      
      mov ah, 4ch
      int 21h
main endp 

end main