[BITS 16]
[ORG 0x7C00]

main:

    ; zero the data segment.
    mov ax,0x0000
    mov ds,ax

    mov si, Start
    call PutStr

    mov cx, 18h
    call timer

    mov si, keybord
    call PutStr

jmp $

; Procedures

PutStr:        ; Procedure label/start
    mov ah,0x0E    ; The function to display a character (teletype)
    mov bh,0x00    ; Page number
    mov bl,0x07    ; Normal text attribute

    nextchar:
    lodsb
    or al,al
    jz return

    int 0x10
    jmp nextchar
    return:
    ret

timer: ;bit more than a second
    mov ah, 86h
    mov dx, 0000h
    int 15h
    ret


Start db 'BOOTLOADER',13,10,13,10,13,10,'E ai mundo!',0
keybord db 13,10,'Aleph Santos Oliveira - 18710509',13,10,13,10,'PUC Campinas - Sistemas de Informacao',13,10,0


; End Matter
times 510-($-$$) db 0    ; Fill the rest with zeros
dw 0xAA55        ; Boot loader signature

