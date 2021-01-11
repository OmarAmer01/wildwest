.model large
.386 ;to have high jump
.stack
.data
NAME1				DB		'You:$'
NAME2				DB		'Another player:$'
ToExit              DB      'Press Esc To Exit$'
Cursorme            Dw           ?
Cursorofother       Dw           ?
sendingbyte         db           ?
.CODE
MAIN PROC FAR 
MOV AX,@DATA
MOV DS,AX
MOV AH,0						;CHANGE TO video MODE
MOV AL,13H						; al=13h 320x200 
INT 10H	
;--------------------Get Chat Mode by pressing on (b)------------------------------------------------------------------------
mov ah,0  ;get key pressed from user
int 16h
cmp AL,98
;----------------------------------Draw bold line------------------------------------------------------		
mov Bh,00
mov AH,0cH						;condition of draw pixel
mov al,05h          			;set the purple colour
mov dx,86                       ;Y axis start from pixel 86 and take it as bold from Y:86 to Y:87		
Barrier_between_first_second_chat:
mov cx,00                       ;x axis starts from (0,86) to (320,86)
drawing_horizontal_line:
int 10h
inc cx                          ;increment by one
cmp cx,320
jne drawing_horizontal_line
inc dx
cmp dx,87
jne Barrier_between_first_second_chat
;---------------------------------------------------------------------------
mov ah,2       ;move cursor to x ,y position
mov bh,0
mov dx,0000h  ; Making cursor in position (0,0)        
int 10h
mov ah,09     ;writing name1 as  player 1 
mov dx,offset name1 
int 21h
;------------------------------------------------------------------------------
mov ah,2             		    ;move cursor to x,y
mov bh,0
mov dx,0B00h         		    ; make cursor in this position
int 10h
		
mov ah,09
mov dx,offset name2 
int 21h              ;display name2
;----------------------------------------------------------------------------------

		
mov ah,2             		    ;move cursor to x,y
mov bh,0
mov dx,1800h         		    ;At end of screen
int 10h
		
mov ah,09
mov dx,offset ToExit
int 21h
;-------------------Draw another bold line------------------------------------------------------------------		
mov Bh,00
mov AH,0cH						;condition of draw pixel
mov al,05h          			;set the purple colour
mov dx,185                      ;Y axis start from pixel 86 and take it as bold from Y:86 to Y:87		
Barrier_between_Second_skip_chat:
mov cx,00                       ;x axis starts from (0,185) to (320,186)
drawing_horizont_line:
int 10h
inc cx                          ;increment by one
cmp cx,320
jne drawing_horizont_line
inc dx
cmp dx,186
jne Barrier_between_Second_skip_chat
;---------------------------------------------------------------------------
Mov Cursorme,0100h   ;begining of player 1 curser
Mov Cursorofother,0C00h   ;begining of player 2 curser
;-----------------------sending-------------------------------------
Back:mov ah,1						;get key pressed without waiting and it's loop until user press escape
int 16h	
jz hup;if no key pressed jump to hup without waiting input else go to next line
cmp al,27  ;check if the key pressed is enter
jz escapenow  ;if key was esc then get out of chat mode
;--------check for pressing enter--------------------
cmp al,0dh
jne skip888
mov ah,2                 ;move cursor at player1 pos
mov bh,0
mov dx,Cursorme             ;a5er el screen
inc dh
mov dl,0h
mov Cursorme,dx
int 10h
skip888:
;----------------------------------------------------------------------------
mov sendingbyte,al  ;send entered character to var sendingbyte
;-----
mov al,0  ; just clearing buffer and moving value of al to ah
mov ah,0CH
int 21h 	
;-----------serial port to send character---------------------
mov dx , 3FDH		  ; Line Status Register
AGAIN:  	
In al , dx 			  ;Read Line Status
AND al , 00100000b
JZ AGAIN
mov dx , 3F8H		  ; Transmit data register
mov  al,sendingbyte   ;moving value of sendingbyte to al to send
out dx , al 		
mov ah,2              ;move cursor at player1 pos
mov bh,0
mov dx,Cursorme             
int 10h
;---------display the character get from first player--------
mov ah,2
mov dl,sendingbyte
int 21h
;---------------
mov ah,3      ;Get curser position and make me able to to go to next byte
mov bh,0
int 10h
mov Cursorme,dx
mov dx,Cursorme
cmp dh,11 ;because that's barrier between player1 and player 2
JnE DonotMakeanyscroll		
mov ah,6       
mov al,1        ; Scroll by 1 line    
mov bh,0       ; normal video attribute         
mov ch,1       ; upper left Y
mov cl,0        ; upper left X
mov dh,11     ; lower right Y
mov dl,79      ; lower right X 
int 10h 		
mov dx,Cursorme
mov dh,10
mov Cursorme,dx
DonotMakeanyscroll:
hup:
;----------recieve a char----------------------------------------------------------------
mov dx , 3FDH		; Line Status Register
in al , dx 
AND al , 1
jz skip		
mov dx , 03F8H
in al , dx 
mov sendingbyte , al		
mov ah,2                 ;move cursor at player2 pos
mov bh,0
mov dx,Cursorofother             
int 10h
cmp sendingbyte,27 ; if esc key was pressed
jz escapenow
;--------check for pressing enter--------------------
cmp al,0dh
jne skip889
mov ah,2                 ;move cursor at player1 pos
mov bh,0
mov dx,Cursorofother             ;a5er el screen
inc dh
mov dl,0h
mov Cursorofother,dx
int 10h
skip889:
;----------------------------------------------------------------------------		
mov ah,2
mov dl,sendingbyte
int 21h
mov ah,3        ;get curser position
mov bh,0
int 10h
mov Cursorofother,dx
mov dx,Cursorofother
cmp dh,21
jne Donotshiftmore		
mov ah,6       
mov al,1        ; scroll by 1 line    
mov bh,0       ; normal video attribute         
mov ch,14      ; upper left Y
mov cl,0        ; upper left X
mov dh,22     ; lower right Y
mov dl,79      ; lower right X 
int 10h 		
mov dx,Cursorofother
mov dh,21
mov Cursorofother,dx
Donotshiftmore:
skip:
jmp BACK
escapenow:
;----------------clear screen after chatting--------------------------
MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULLJ SCREEN
MOV BH,01H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
MOV CX,0000H    ;STARTING COORDINATES
MOV DX,184FH    ;ENDING COORDINATES
INT 10H        ;FOR VIDEO DISPLAY
   
MAIN endp

end main
