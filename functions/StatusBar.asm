.MODEL small
.STACK 64
.DATA


Pname1 db 'Amer','$'
Pname2 db 'Mousa','$'
Pscore1 db 'Score: 0','$'
Pscore2 db 'Score: 0','$'
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

main endp
;-----------Display the status bar  -----
Stausbar    PROC
	mov si,@data;moves to si the location in memory of the data segment
        mov es,si;moves to es the location in memory of the data segment
        mov ah,13h;service to print string in graphic mode
        mov al,0;sub-service 0 all the characters will be in the same color(bl)
        mov bh,0;page number=always zero
        Call PlayerOneName
        Call PlayerTwoName
        Call PlayerOneScore
        Call PlayerTwoScore
        RET
Stausbar endp
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
;-----------Display Player One Name  -----
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

        mov cx,8;length of string
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
        mov cx,8;length of string
        mov dl, 70  ;Column
        mov dh, 3  ;Row
        mov bp,offset Pscore2;mov bp the offset of the string
        int 10h
        RET
PlayerTwoScore endp

        end main   
