.Model Huge
;---------------------------------------------------------------------------------
.Stack 64 ; It's not used in my part
;------------------Data segment---------------------------------------------------
.Data  ;data segment
menu db 10,13, "   Menu: "   ;menu bar 
     db 10,13, "A.Game Mode "
     db 10,13,  "B.chat mode $ "
Game db 10,13, "Choose Level!$"
chat db 10,13,"Chatting will will be implemented in phase 3$"
Level_1 db 10,13, "A.Level 1 "
        db 10,13,  "B.Level 2 $ "
Level_2 db 10,13,"Level 1 is ON $"   
Level_3 db 10,13,"Level 2 will be implemented in phase 3 $"   

;----------------------Menu displaying -------------------------------------------------------   
.code     
main proc far
mov ax,@data
mov ds,ax ; Initiate data segment  
       




MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULL SCREEN
MOV BH,07h    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
MOV CX,0000H    ;STARTING COORDINATES
MOV DX,184FH    ;ENDING COORDINATES
INT 10H        ;FOR VIDEO DISPLAY
recheck:
mov cx,0
mov dh, 0ah ;row
mov dl, 0fh ; colomun
mov ax,0200h
mov bh,0
int 10h


 mov ah,9 ;Menu bar displaying as string
 mov dx,offset menu
 int 21h

;---------------------------------------------
mov ah,0  ;Get key pressed for which part Game Mode or Chat Mode
int 16h     
;---------------------------------------------
    
cmp al,97 ; If Letter "a" was pressed then it will make clear screen then go to Game Mode
jnz skip

;-----------clearscreen------------------------- 
MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULL SCREEN
MOV BH,07H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
MOV CX,0000H    ;STARTING COORDINATES
MOV DX,184FH    ;ENDING COORDINATES
INT 10H        ;FOR VIDEO DISPLAY
;----------------------------------------------------    

mov cx,0
mov dh, 0ah ;row
mov dl, 0fh ; colomun
mov ax,0200h
mov bh,0
int 10h

mov ah,9 ;Display the Game string and Level_1 "Game Mode is ready and choose between level 1 and level 2"
mov dx,offset Game
int 21h   
mov ah,9
mov dx,offset Level_1
int 21h  
;---------------------------------------------
mov ah,0  ;Get key pressed for get which level will be entered
int 16h     
;---------------------------------------------

    
cmp al,97 ; check for enter letter of a to choose level 1


jnz skip_3  
;-----------clearscreen------------------------- 
MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULL SCREEN
MOV BH,71H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
MOV CX,0000H    ;STARTING COORDINATES
MOV DX,184FH    ;ENDING COORDINATES
INT 10H        ;FOR VIDEO DISPLAY
;----------------------------------------------------    

mov ah,9 ;printing string "level 1 is on" massage
mov dx,offset Level_2
int 21h    
skip_3:
;---------------------------------------------

    
cmp al,98 ; check for enter letter of b to go to level 2 of game mode
jnz skip_4  
;-----------clearscreen------------------------- 
MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULLJ SCREEN
MOV BH,71H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
MOV CX,0000H    ;STARTING COORDINATES
MOV DX,184FH    ;ENDING COORDINATES
INT 10H        ;FOR VIDEO DISPLAY
;----------------------------------------------------    

mov ah,9  ;Printing "Level 2 is on " massage
mov dx,offset Level_3
int 21h    
skip_4:
skip:
;---------------------------------------------------  
cmp al,98   ;check for enter letter b to go to chat mode
jnz skip_2       
;-----------clearscreen------------------------- 
MOV AX,0600H    ;06 TO SCROLL & 00 FOR FULL SCREEN
MOV BH,71H    ;ATTRIBUTE 7 FOR BACKGROUND AND 1 FOR FOREGROUND
MOV CX,0000H    ;STARTING COORDINATES
MOV DX,184FH    ;ENDING COORDINATES
INT 10H        ;FOR VIDEO DISPLAY
;----------------------------------------------------    
mov ah,9 ;printing chat mode is on phase 3
mov dx,offset chat
int 21h
   
skip_2:
push ax
push dx
mov ah,6
mov dl,255
int 21h
pop DX
pop ax
jmp recheck
mov CX,0
mov BX,0

main endp
;----------------------------------------
  
end main