.model small

.data
code db ?
newline db 13,10,'$'
.code

main proc far

mov ax,@data
mov ds,ax
lbl:
mov ax,0
int 16h

mov code,ah


jmp lbl



main endp
end main