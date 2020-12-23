
.model small
.stack 64
.data
newLine db 13,10 , '$' ;for debugging purposes
enterPoneName db "Enter Player One Name:" , 13,10 ,'$' ; messages to enter name
enterPtwoName db "Enter Player Two Name:" , 13,10 ,'$' ; messages to enter name
p1 db 15,?,30 dup ('$') ; player 1 name
p2 db 15,?,30 dup ('$') ; player 2 name
                        ;ATTENTION 
                        ;WHEN WE PRINT PLAYER NAMES, N2OOL EL OFFSET BTA3HOM PLUS 2


.code
main proc far


mov ax,@data
mov ds,ax ; Initiate data segment

call cursorToMiddle   ; Center cursor to display message

call clearScreen ; to clear the screen    



lea dx,enterPoneName  ; print ENTER PLAYER 1
mov ah,9
int 21h

call cursorToMiddle   ; Center cursor to display message

call typeNamePone     ; enter name of p1

call cursorToMiddle
call clearScreen ; to clear the screen  


lea dx,enterPtwoName  ; print ENTER PLAYER 2
mov ah,9
int 21h

call typeNamePtwo
;;;;;;; testing
call clearScreen
mov dx,offset p1 +2
mov ah,9
int 21h
mov dx,offset newLine
int 21h
mov dx,offset p2 +2 
int 21h

;call exit ; to exit application
main endp



;--------- PROCEDURES ---------;

exit proc ; Exit the application
    mov ah,4ch
    int 21h
exit endp
       
       
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
                    ; VERY IMPORTANT : I DONT KNOW WHY, BUT NEVER USE AFTER CLEAR SCREEN
                    ; USE BEFORE IT
                    ; WELNABY YA SHABAB
    mov cx,0
    mov ax,0200h
    mov dx,0720h
    int 10h
    ret
cursorToMiddle endp
                         
                         
                         
typeNamePone proc ; moves the cursor to the below middle of the screen and takes input [PLAYER ONE]     
    
   ; call showCursor
    mov ax,0200h
    mov dx,0920h ; Cursor to bellow middle
    mov bh,0
    int 10h
    
    mov ah,0ah   ; to take input from keyboard and store in p1
    lea dx,p1
    int 21h
    
    
    cmp p1,41h
    jl less
    jg gr8

    less:mov ah,2
    mov dl,8
    ret

    gr8:
    cmp al,7ah
    jl lesser
    jg less


    lesser:
    
    ret
typeNamePone endp

typeNamePtwo proc ; moves the cursor to the below middle of the screen and takes input [PLAYER ONE]     
    
   ; call showCursor
    mov ax,0200h
    mov dx,0920h ; Cursor to bellow middle
    mov bh,0
    int 10h
    
    mov ah,0ah   ; to take input from keyboard and store in p2
    lea dx,p2
    int 21h
    
    
    ret
typeNamePtwo endp


end main