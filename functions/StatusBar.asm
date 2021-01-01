.MODEL small
.STACK 64
.DATA

Gtitle db 'Wild West','$'
readystatement db 'Hold both mouse buttons to start!','$'
missedshot db 'Missed Shot!','$'
Pname1 db 'maxlengthnametest','$'
Pname2 db 'Mousa','$'
Pscore1 db 'Score: ','$'
Pscore2 db 'Score: ','$'
Pscorenum1 db '0','$'
Pscorenum2 db '0','$'
Pshield db 'Shield','$'
.CODE

main    PROC
        mov ax,@data
        mov DS,ax
       ;---------- Graphics Mode configuration ---------;
	mov ax, 4F02h 
	mov bx, 0100h	
	INT 10h      	;execute the configuration
;--------- if these configurations executed twice else where in the code all previous drawings will be lost ------;
       Call Stausbar
       Call GameReadyStatement
      ; Call PlayerOneIncrementScore
      ; Call PlayerOneIncrementScore
      ; Call PlayerOneIncrementScore
     ;  Call PlayerOneIncrementScore
     ;  Call PlayerTwoIncrementScore
       Call ClearGameReadyStatement     ;Clear area before printing
      ; Call MissedShotMessage1
     ;  Call MissedShotMessage2

main endp
;-----------Display the status bar  -----
Stausbar    PROC
	mov si,@data;moves to si the location in memory of the data segment
        mov es,si;moves to es the location in memory of the data segment
        mov ah,13h;service to print string in graphic mode
        mov al,0;sub-service 0 all the characters will be in the same color(bl)
        mov bh,0;page number=always zero
        Call GameTitle
        Call PlayerOneName
        Call PlayerTwoName
        Call PlayerOneScore
        Call PlayerTwoScore
        ;Call PlayerOneStatusBarSheild
       ; Call PlayerTwoStatusBarSheild
                RET
Stausbar endp
;-----------Display Game Title  -----
GameTitle    PROC
        mov bl,00001100b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,9;length of string
        mov dl, 35  ;Column
        mov dh, 1  ;Row
        mov bp,offset Gtitle;mov bp the offset of the string
        int 10h
        RET
GameTitle endp
;-----------Display Player One Name  -----
PlayerOneName    PROC
        mov bl,01001111b;color of the text (white foreground and black background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|

        mov cx,4;length of string
        mov dl, 5  ;Column
        mov dh, 2  ;Row
        mov bp,offset Pname1;mov bp the offset of the string
        int 10h
        RET
PlayerOneName endp
;-----------Display Player Two Name  -----
PlayerTwoName    PROC
        mov bl,01011111b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,5;length of string
        mov dl, 70  ;Column
        mov dh, 2  ;Row
        mov bp,offset Pname2;mov bp the offset of the string
        int 10h
        RET
PlayerTwoName endp
PlayerOneScore    PROC
        mov bl,01001111b;color of the text (white foreground and black background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|

        mov cx,7;length of string
        mov dl, 5  ;Column
        mov dh, 3  ;Row
        mov bp,offset Pscore1;mov bp the offset of the string
        int 10h
        RET
PlayerOneScore endp
;-----------Display Player One Name  -----
PlayerTwoScore    PROC
        mov bl,01011111b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,7;length of string
        mov dl, 70  ;Column
        mov dh, 3  ;Row
        mov bp,offset Pscore2;mov bp the offset of the string
        int 10h
        RET
PlayerTwoScore endp
PlayerOneIncrementScore    PROC
        mov bl,01001111b;color of the text (white foreground and black background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|

        mov cx,1;length of string
        mov dl, 12  ;Column
        mov dh, 3  ;Row
        ADD Pscorenum1,1
        mov bp,offset Pscorenum1;mov bp the offset of the string
        int 10h
        RET
PlayerOneIncrementScore endp
;-----------Display Player One Name  -----
PlayerTwoIncrementScore    PROC
        mov bl,01011111b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,1;length of string
        mov dl, 77  ;Column
        mov dh, 3  ;Row
        ADD Pscorenum2,1
        mov bp,offset Pscorenum2;mov bp the offset of the string
        int 10h
        RET
PlayerTwoIncrementScore endp
PlayerOneStatusBarSheild    PROC
        mov bl,00001100b;color of the text (white foreground and black background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|

        mov cx,6;length of string
        mov dl, 5  ;Column
        mov dh, 4  ;Row
        mov bp,offset Pshield;mov bp the offset of the string
        int 10h
        RET
PlayerOneStatusBarSheild endp
PlayerTwoStatusBarSheild    PROC
        mov bl,00001100b;color of the text (white foreground and black background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|

        mov cx,6;length of string
        mov dl, 70  ;Column
        mov dh, 4  ;Row
        mov bp,offset Pshield;mov bp the offset of the string
        int 10h
        RET
PlayerTwoStatusBarSheild endp
;-----------Display Ready state  -----
GameReadyStatement    PROC
        mov bl,00001011b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,33;length of string
        mov dl, 23  ;Column
        mov dh, 10  ;Row
        mov bp,offset readystatement;mov bp the offset of the string
        int 10h
        RET
GameReadyStatement endp
ClearGameReadyStatement    PROC
        mov bl,00000000b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,33;length of string
        mov dl, 23  ;Column
        mov dh, 10  ;Row
        mov bp,offset readystatement;mov bp the offset of the string
        int 10h
        RET
ClearGameReadyStatement endp
;-----------Display Missed Shot message for Player One  -----
MissedShotMessage1    PROC
        mov bl,00001100b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,12;length of string
        mov dl, 7  ;Column
        mov dh, 10  ;Row
        mov bp,offset missedshot;mov bp the offset of the string
        int 10h
        RET
MissedShotMessage1 endp
;-----------Display Missed Shot message for Player Two  -----
MissedShotMessage2    PROC
        mov bl,00001100b;(foreground and background)
        ;     0000             1111
        ;|_ Background _| |_ Foreground _|
        mov cx,12;length of string
        mov dl, 65  ;Column
        mov dh, 10  ;Row
        mov bp,offset missedshot;mov bp the offset of the string
        int 10h
        RET
MissedShotMessage2 endp

        end main   
