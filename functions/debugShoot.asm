.MODEL compact
.STACK 64
.DATA

bulletimgW equ 39
bulletimgH equ 20

imgW equ 120
imgH equ 119

imgW2 equ 99

Xposition DW 30  ;Player One X_Position
Yposition DW 285 ;Player One Y_Position

XptwoPosition DW 500 ;Player Two X_Position
YptwoPosition DW 285 ;Player Two Y_Position

bulletOneXPosition DW 145  ;Bullet One X_Position
bulletOneYPosition equ 316 ;Bullet One Y_Position

bulletTwoXPosition DW 470

reset DW ?  

bgrndcolor db 0           ;Set background color for images  

clearbulletone DB 0       ;Set to one to draw a bullet with the background color 
;put the img data outputed by python script here:
;--------------------------------- Player One --------------------------------------------

 ;------------------------------------Player Two ---------------------------------

;--------------------------------------------------------------------------------
bulletimg DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 116, 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 116, 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116 
 DB 116, 116, 116, 116, 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116 
 DB 116, 116, 116, 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116 
 DB 116, 116, 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116 
 DB 116, 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116, 116 
 DB 116, 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116, 116, 116 
 DB 116, 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116, 116, 116, 116 
 DB 116, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116, 116, 116, 116, 116 
 DB 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116, 116 
 DB 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 116, 116, 116, 116, 116, 6 
 DB 6, 6, 6, 6, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 116, 6, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
 ;-----------------------------------------------------------------
 bulletimg2 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 6, 116, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 6, 116, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6 
 DB 116, 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116 
 DB 6, 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6 
 DB 6, 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6 
 DB 6, 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6, 6 
 DB 6, 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6, 6, 6 
 DB 116, 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6, 6, 6, 116 
 DB 6, 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6, 6, 6, 116, 6 
 DB 43, 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6, 6, 6, 116, 6, 43 
 DB 6, 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 6, 116, 6, 6, 6, 6, 116, 6, 43, 6 
 DB 116, 6, 6, 6, 6, 6, 6, 6, 6, 6, 116, 116, 116, 116, 116, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 
 DB 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
.CODE
MAIN PROC FAR
    MOV AX , @DATA
    MOV DS , AX
;---------- Graphics Mode configuration ---------;
	;mov ax, 4F02h 
;	mov bx, 0100h	
	;INT 10h      	;execute the configuration
;--------- if these configurations executed twice else where in the code all previous drawings will be lost ------; 
    ;call DrawPlayerOne
    ;call DrawPlayerTwo    
	;--------- Wait for testing ----------
	;testing:mov ah, 07h   ;Input from keyboard without echo to the screen
	;int 21h
    ;call ShootPlayerTwo
   ; jmp testing
testing:
mov ah,1
int 16h

cmp ah,1eh              ; if letter 'a' not pressed
jne nextComp            ; next comparison
mov ah,2
mov dl,'h'
int 21h

nextComp:
cmp ah,1ch               ; if enter key pressed
jne testing
mov ah,2
mov dl,'e'
int 21h

jmp testing


MAIN ENDP	
;-------- Player one will shoot player two --------;
ShootPlayerTwo PROC
    mov bx,bulletOneXPosition    ;save the original value after shootting 
    mov reset,bx
    movebullet:
        Call DrawPlayerOneBullet
        ;Delay
        ;Clear Previous shot
        mov clearbulletone,1
        call DrawPlayerOneBullet
        mov clearbulletone,0
        ;---------------------
        ADD bulletOneXPosition,10        
        CMP bulletOneXPosition,455
        JNZ movebullet      	   
        ;---------Reset the start position-----
        mov bx,reset
        mov bulletOneXPosition,bx
    RET
ShootPlayerTwo ENDP   
;-------- Player two will shoot player one --------;
ShootPlayerOne PROC
    mov bx,bulletTwoXPosition   ;save the original value after shootting 
    mov reset,bx
    movebullet2:
        Call DrawPlayerTwoBullet
        ;Delay
        ;Clear Previous shot
        mov clearbulletone,1
        call DrawPlayerTwoBullet
        mov clearbulletone,0
        ;---------------------
        SUB bulletTwoXPosition,10        
        CMP bulletTwoXPosition,140
        JNZ movebullet2      	   
        ;---------Reset the start position-----
        mov bx,reset
        mov bulletTwoXPosition,bx
    RET
ShootPlayerOne ENDP   
DrawPlayerOneBullet PROC 
	       ;mov ax, 4F02h    ;
	       ;mov bx, 0100h    ; 640x400 screen graphics mode
	       ;INT 10h      	;execute the configuration
	       MOV AH,0Bh   	;set the configuration
	       MOV CX, bulletOneXPosition  	;set the start drawing point 
	       ADD CX, bulletimgW  	;set the width (X) up to 64 (based on image resolution)
	       MOV DX, bulletOneYPosition 	;set the hieght (Y) up to 64 (based on image resolution)
	       ADD DX, bulletimgH 	;set the hieght (Y) up to 64 (based on image resolution)
		   mov DI, offset bulletimg  ; to iterate over the pixels
	       jmp StartBullet    	;Avoid drawing before the calculations
	DrawitBullet:
	       MOV AH,0Ch   	;set the configuration to writing a pixel
           cmp clearbulletone,1
           JNZ currentcolor 
           mov al, bgrndcolor        ; color of Background
           MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
           jmp StartBullet
    currentcolor: mov al, [DI]      ; color of the current coordinates 
	       MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
	StartBullet: 
		   inc DI
	       DEC Cx       	;  loop iteration in x direction
	       cmp Cx,bulletOneXPosition         ;JNZ Drawit      	;  check if we can draw c urrent x and y and excape the y iteration
	       JNZ DrawitBullet
           ADD Cx, bulletimgW 	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	       DEC DX       	;  loop iteration in y direction
	       cmp DX,bulletOneYPosition
           JZ  ENDINGBullet   	;  both x and y reached 00 so end program
		   Jmp DrawitBullet

	ENDINGBullet:
	RET
DrawPlayerOneBullet ENDP




DrawPlayerTwoBullet PROC 
	       ;mov ax, 4F02h    ;
	       ;mov bx, 0100h    ; 640x400 screen graphics mode
	       ;INT 10h      	;execute the configuration
	       MOV AH,0Bh   	;set the configuration
	       MOV CX, bulletTwoXPosition  	;set the start drawing point 
	       ADD CX, bulletimgW  	;set the width (X) up to 64 (based on image resolution)
	       MOV DX, bulletOneYPosition 	;set the hieght (Y) up to 64 (based on image resolution)
	       ADD DX, bulletimgH 	;set the hieght (Y) up to 64 (based on image resolution)
		   mov DI, offset bulletimg2  ; to iterate over the pixels
	       jmp StartBullet2    	;Avoid drawing before the calculations
	DrawitBullet2:
	       MOV AH,0Ch   	;set the configuration to writing a pixel
           cmp clearbulletone,1
           JNZ currentcolor2 
           mov al, bgrndcolor        ; color of Background
           MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
           jmp StartBullet2
    currentcolor2: mov al, [DI]      ; color of the current coordinates 
	       MOV BH,00h   	;set the page number
	       INT 10h      	;execute the configuration
	StartBullet2: 
		   inc DI
	       DEC Cx       	;  loop iteration in x direction
	       cmp Cx,bulletTwoXPosition         ;JNZ Drawit      	;  check if we can draw c urrent x and y and excape the y iteration
	       JNZ DrawitBullet2
           ADD Cx, bulletimgW 	;  if loop iteration in y direction, then x should start over so that we sweep the grid
	       DEC DX       	;  loop iteration in y direction
	       cmp DX,bulletOneYPosition
           JZ  ENDINGBullet2   	;  both x and y reached 00 so end program
		   Jmp DrawitBullet2

	ENDINGBullet2:
	RET
DrawPlayerTwoBullet ENDP


end main 
