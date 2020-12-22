
.model small
.stack 64
.data
enterPoneName db "Enter Player One Name:" , 13,10 ,'$'
enterPtwoName db "Enter Player Two Name:" , 13,10 ,'$'
p1 db 15 DUP(?) , '$'


.code
main proc far


mov ax,@data
mov ds,ax ; Initiate data segment

;call clearScreen ; to clear the screen    

call cursorToMiddle   ; Center cursor to display message

lea dx,enterPoneName  ; print msg
mov ah,9
int 21h



call typeNamePone     ; enter name











call exit ; to exit application
main endp



;--------- PROCEDURES ---------;

exit proc ; Exit the application
    mov ah,4ch
    int 21h
    endp exit
       
       
clearScreen proc ; CLEAR SCREEN
    mov bh,7
    mov ah,7
    mov al,0
    mov cx,0
    mov dx,184fh
    int 10h 
    ret
clearScreen endp

showCursor proc
    mov CX,0607h
    mov ah,1h
    int 10h
    ret
showCursor endp

cursorToMiddle proc ; moves the cursor to the middle of the screen
    mov cx,0
    mov ax,0200h
    mov dx,0920h
    int 10h
    ret
cursorToMiddle endp
                         
                         
                         
typeNamePone proc ; moves the cursor to the below middle of the screen and takes input [PLAYER ONE]     
    
    call showCursor
    mov ah,2
    mov dx,0920h ; Cursor to bellow middle
    int 10h
    
    mov ah,0ah   ; to take input from keyboard and store in p1
    lea dx,p1
    int 21h
    
    
    ret
typeNamePone endp


end main