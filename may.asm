.model small
.stack 100h
.data
    num1 db ?
    num2 db ?
    msg1 db 'Ingrese el primer numero: $'
    msg2 db 'Ingrese el segundo numero: $'
    mayorMsg db 'El numero mayor es: $'
    mayorNum db ?
    
.code
main:
    ; Inicializaci?n
    mov ax, @data
    mov ds, ax

    ; Pedir el primer n?mero
    mov dx, offset msg1
    mov ah, 09h
    int 21h

    ; Leer el primer n?mero
    mov ah, 01h
    int 21h
    sub al, '0'        ; Convertir de ASCII a n?mero
    mov num1, al

    ; Pedir el segundo n?mero
    mov dx, offset msg2
    mov ah, 09h
    int 21h

    ; Leer el segundo n?mero
    mov ah, 01h
    int 21h
    sub al, '0'        ; Convertir de ASCII a n?mero
    mov num2, al

    ; Comparar los n?meros
    mov al, num1
    cmp al, num2
    jge is_num1_greater

    ; Si num2 es mayor
    mov al, num2
    jmp display_result

is_num1_greater:
    ; Si num1 es mayor o igual
    mov al, num1

display_result:
    ; Mostrar el resultado
    mov mayorNum, al
    mov dx, offset mayorMsg
    mov ah, 09h
    int 21h

    ; Convertir el n?mero mayor de nuevo a ASCII para mostrar
    add mayorNum, '0'
    mov dl, mayorNum
    mov ah, 02h
    int 21h

    ; Finalizar el programa
    mov ax, 4C00h
    int 21h
end main


