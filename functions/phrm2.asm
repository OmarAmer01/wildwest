.model small
.data

mbPrompt db "Hold Mouse Buttons To Start",13,10,'$'

P1readyCheck db "P1 : READY" ,13,10,'$'
P2readyCheck db "P2 : READY",13,10,'$'

;noReady db "HOLD LMB TO START" ,13,10,'$'

p1GunDown db "P1 Gun Down",13,10,'$'
p1GunUp db "P1 Gun Up",13,10,'$'

bothDown db "BOTH GUNS DOWN",13,10,'$'
bothUP db "BOTH GUNS UP",13,10,'$'

p2GunDown db "P2 Gun Down",13,10,'$'
p2GunUp db "P2 Gun Up",13,10,'$'

.code

main proc far

mov ax,@data
mov ds,ax

mov ah,9
lea dx,mbPrompt     ;Telling players to get ready
int 21h

readyCheck:         ; loop to make sure players have their guns
                    ; holesterd at the start of the round 

mov ah,9
lea dx,mbPrompt     ;Telling players to get ready
int 21h       

mov ax,3
int 33h             ; Get Mouse Status -> Gets put in BX

cmp bx,1            ; if LMB Pressed, then p1 is ready but p2 isnt
je oneReady
cmp bx,2            ; if RMB Pressed, then p2 is ready but p1 isnt
je twoReady
cmp bx,3            ; if both RMB & LMB are down then both players are ready
je logic
jne readyCheck      ; if no buttons were pressed, repeat the ready check


oneReady:

mov ah,9
lea dx,P1readyCheck     ;DISPLAY P1 READY
int 21h
                        ;GET MOUSE STATUS
mov ax,3
int 33h

cmp bx,2                ;IF PLAYER 2 READY BUT 1 NOT READY
je twoReady

cmp bx,0                ; IF NO ONE IS READY
je readyCheck

cmp bx,3                ; IF BOTH BUTTONS PRESSED
je logic                ; START THE ROUND
jne oneReady




twoReady:               ; JUST LIKE oneReady

mov ah,9
lea dx,P2readyCheck
int 21h

mov ax,3
int 33h

cmp bx,1
je oneReady

cmp bx,0
je readyCheck

cmp bx,3
je logic
jne twoReady


logic: ;the main game

mov ah,9
lea dx,bothUP ; if no buttons are pressed this means that
              ; both guns are held up
              
int 21h

mov ax,3
int 33h     ;GET MOUSE BUTTON STATUS

cmp bx,1    ;IF LMB IS PRESSED
            ; this means that player one has his
            ;pistol holestered
je p1Down   

cmp bx,2    ; if RMB is pressed
            ; this means that player 2 has his
            ;pistol holestered
je p2Down

cmp bx,3    ; if both buttons are pressed
            ; this means that both guns are holestered
je allDown

jne logic

p1Down:     ; while LMB is pressed keep displaying
            ; the p1 gun down message
            ; then if both buttons are pressed, 
            ; display the both guns down message
mov ah,9
lea dx,p1GunDown 
int 21h

mov ax,3
int 33h
cmp bx,1
je p1Down
jne logic



p2Down:     ; while RMB is pressed keep displaying
            ; the p2 gun down message
            ; then if both buttons are pressed, 
            ; display the both guns down message
mov ah,9
lea dx,p2GunDown
int 21h

mov ax,3
int 33h

cmp bx,2
je p2Down
jne logic

allDown:    ; if both guns are down
            ; display the both guns down message

mov ah,9
lea dx,bothDown
int 21h

mov ax,3
int 33h

cmp bx,3
je allDown
jne logic

mov ah,4ch
int 21h

main endp

end main