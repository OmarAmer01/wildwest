
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


time dw ?  ;for bullet to travel
min db ?
x dw 10    ;bullet starting pos
y dw 100

Prompt db "press ","$ " ; for shield
P1key db ?
P2key db ?
P1HasSheild db 0d
P2HasSheild db 0d

P1HasSheildPrompt db "Player 1 has shield ","$ "
P2HasSheildPrompt db "Player 2 has shield ","$ "

ArrowsSC db 48h,4Bh,50h,4dh 
wasdSC   db 77h,61h,73h,64h

left  db  17,"$ "
right db  16,"$ "
up    db  24,"$ "
down  db  25,"$ "

w  db  "w ","$ "
a  db  "a ","$ "
s  db  "s ","$ "
d  db  "d ","$ ";shield end


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

bullet proc

mov ah,0
mov al,13h
int 10h

mov al,15 ;draw pixel initially
mov cx, x
mov dx, y
mov ah,0ch;
int 10h

mov ah,2ch ; 
int 21h
add dx,5
mov time,dx
mov min,cl

BulletL:
mov ah,2ch
int 21h

cmp cl,min ;when a minute passes reset time
jz ignore
mov time,0h
inc min
ignore:

cmp dx, time
jb BulletL ;draw with time

mov al,0
mov cx, x
mov dx, y
mov ah,0ch
int 10h
add x,4 ;increase to increase speed
mov al,15
mov cx, x
mov dx, y
mov ah,0ch
int 10h

mov ah,2ch
int 21h
add dx,5
mov time,dx

mov cx,x
cmp cx,200 ;where to the bullet stops
jbe BulletL

ret

bullet endp

clearkeyboardbuffer		proc	near

	push		ax
	push		es
	mov		ax, 0000h
	mov		es, ax
	mov		es:[041ah], 041eh
	mov		es:[041ch], 041eh				; Clears keyboard buffer
	pop		es
	pop		ax

	ret
clearkeyboardbuffer		endp

ShieldPrompt proc

mov ax,0200h ;set mouse pos
mov dx,0204h
int 10h

mov dx,0

mov ah,9
lea dx,Prompt
int 21h

mov ah,2ch
int 21h
mov ax,dx
mov dx,0
mov ah,0
mov bl,4
div bl

lea di,ArrowsSC
lea si,wasdSC

cmp ah,0
jz pup
cmp ah,1
jz pleft
cmp ah,2
jz pdown1
cmp ah,3
jz pright1

pup: mov ah,9
lea dx,up
int 21h

mov ax,0200h ;set mouse pos
mov dx,0404h
int 10h

mov ah,9
lea dx,Prompt
int 21h

mov ah,9
lea dx,w
int 21h

jmp check1
clr1:call clearkeyboardbuffer

check1:mov ax,0
mov ah,1h
int 16h
jz check1


add di,0
cmp ah, [di]
jnz skip1
mov P1HasSheild,1
mov ah,9
lea dx,P1HasSheildPrompt
int 21h
jmp l1
skip1:add si,0
cmp al,[si]
jnz clr1
mov P2HasSheild,1
mov ah,9
lea dx,P2HasSheildPrompt
int 21h
jmp l1

pright1:jmp pright
pdown1: jmp pdown

pleft: mov ah,9
lea dx,left
int 21h

mov ax,0200h ;set mouse pos
mov dx,0404h
int 10h

mov ah,9
lea dx,Prompt
int 21h

mov ah,9
lea dx,a
int 21h

jmp check2
clr2:call clearkeyboardbuffer

check2: mov ax,0
mov ah,1h
int 16h
jz check2



;add di,1
cmp ah,[di+1]
jnz skip2
mov P1HasSheild,1
mov ah,9
lea dx,P1HasSheildPrompt
int 21h
jmp l1
skip2:;add si,1
cmp al,[si+1]
jnz clr2
mov P2HasSheild,1
mov ah,9
lea dx,P2HasSheildPrompt
int 21h
jmp l1


l1:jmp l

pdown: mov ah,9
lea dx,down
int 21h

mov ax,0200h ;set mouse pos
mov dx,0404h
int 10h

mov ah,9
lea dx,Prompt
int 21h

mov ah,9
lea dx,s
int 21h

jmp check3
clr3:call clearkeyboardbuffer

check3:
mov ah,1
int 16h
jz check3

;add di,2
cmp ah, [di+2]
jnz skip3
mov P1HasSheild,1
mov ah,9
lea dx,P1HasSheildPrompt
int 21h
jmp l
skip3:
cmp al,[si+2]
jnz clr3
mov P2HasSheild,1
mov ah,9
lea dx,P2HasSheildPrompt
int 21h
jmp l



pright:mov ah,9
lea dx,right
int 21h

mov ax,0200h ;set mouse pos
mov dx,0404h
int 10h

mov ah,9
lea dx,Prompt
int 21h

mov ah,9
lea dx,d
int 21h

jmp check4
clr4:call clearkeyboardbuffer

check4: mov ax,0
mov ah,1
int 16h
jz check4


;add di,3
cmp ah,[di+3]
jnz skip4
mov P1HasSheild,1
mov ah,9
lea dx,P1HasSheildPrompt
int 21h
jmp l
skip4:;add si,3
cmp al,[si+3]
jnz clr4
mov P2HasSheild,1
mov ah,9
lea dx,P2HasSheildPrompt
int 21h
jmp l

l:ret

ShieldPrompt endp

end main