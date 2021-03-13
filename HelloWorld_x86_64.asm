; Should work on MacOS v11.2.2 with x86_64 architecture using nasm v2.15.05 and ld. 
; NAME="idts"; nasm -f macho64 $NAME.asm && ld -macosx_version_min 11.1 -no_pie -syslibroot /Library/Developer/CommandLineTools/SDKs/MacOSX.sdk -L/usr/local/lib -lSystem -o $NAME $NAME.o && rm $NAME.o

global _main

section .text

_main:
    ; make a write syscall to write "msg" to stdout
    mov     eax, 0x2000004 ; write (4)
    mov     edi, 0x1       ; stdout (1)
    mov     rsi, msg       ; message
    mov     edx, msg.len   ; message length
    syscall
    ; make an exit syscall and exit the process with a 0 aka success code
    mov     eax, 0x2000001 ; exit (1)
    mov     edi, 0x0       ; success (0)
    syscall

section .data

msg:    db      "Hello World!", 0xA ; message + new line (0xA)
.len:   equ     $ - msg
