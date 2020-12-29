.Model small
.data

Prompt db "press ","$ "
P1key db ?
P2key db ?
P1HasSheild db 0d
P2HasSheild db 0d

P1HasSheildPrompt db "Player 1 has shield ","$ "
P2HasSheildPrompt db "Player 2 has shield ","$ "

ArrowsSC db 48h,4Bh,50h,4dh 
wasdSC   db 77h,61h,73h,64h

left  db  "left arrow ","$ "
right db  "right arrow ","$ "
up    db  "up arrow ","$ "
down  db  "down arrow ","$ "

w  db  "w key ","$ "
a  db  "a key ","$ "
s  db  "s key ","$ "
d  db  "d key ","$ "

done db "done ","$ "

KeyPressed db ?

.code
main proc far
mov ax,@data
mov ds,ax

 mov ax,0013h
 int 10h

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

l:
mov ah,9
lea dx,done
int 21h

jmp $
main endp

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

end main

