.model small
.data
num1 dw 90
num2 db 10
q db ?
r db ?
.code
mov ax,@data
mov ds,ax
mov ax,num2
div num1
mov q,al
mov r,ah
mov ah,4ch
int 21h
end
