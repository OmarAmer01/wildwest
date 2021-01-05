.model small
.data
p1Name db "Omak $"
p2Name db "7amra $"
.code
main proc far

mov ax,@data
mov ds,ax

call initSerialCom

call waitUntillLineReadyRecieve

mov dx , 3F8H		; Transmit data register
in al,dx
mov p1Name,al

mov ah,9
lea p1Name,dx
int 21h

mov ah,4ch
int 21hs




main endp

initSerialCom proc 



mov dx,3fbh 			; Line Control Register
mov al,10000000b		;Set Divisor Latch Access Bit
out dx,al				;Out it

;--------------SET BAUD RATE TO 9600-----------

mov dx,3f8h			
mov al,0ch			;Baud Rate Divisor LSB = 0CH
out dx,al

mov dx,3f9h
mov al,00h          ;Baud Rate Divisor LSB = 0CH
out dx,al

;-------------Baud Rate Set--------------------


;-------------Port Config----------------------
mov dx,3fbh
mov al,00011011b
out dx,al
ret

initSerialCom endp

waitUntillLineReadyRecieve proc

AGAIN:  	
In al , dx 			;Read Line Status
AND al , 00000001b
JZ AGAIN
ret

waitUntillLineReadyRecieve endp


end main