section .text
global _start
_start:
.sys_write
        mov rdx, len
        mov rsi, string
        mov rdi, 1
        mov rax, 1
        syscall

        cmp rax, 0
        jz exit

input:
        mov rdx, 1                                                    ;Task: Move 1 to rdx
        mov rsi, number                                                    ;Task: Move the label 'number' to rsi
        mov rdi, 0                                                    ;Task: Move the number associated with STDIN to rdi
        mov rax, 0                                                    ;Task: Move the number associated with the 64 bit sys_read to rax
        syscall

        mov rbx, [rsi]                                                    ;Task: Move the VALUE inside the buffer (rsi) to rbx 

checks:
        cmp bl, 31h                                                    ;Task: Compare the hex representation of '1' to the lower 8 bits of rbx
        jb input                                                       ;Task: Use a jump below instruction and point it towards the 'input' label
        cmp bl, 39h                                                    ;Task: Compare the hex representation of '9' to the lower 8 bits of rbx
        ja input                                                       ;Task: Use a jump above instruction and point it towards the 'input' label
        mov [number], rbx                                                    ;Task: Move the number in rbx into the LOCATION WITHIN the label 'number'

filemanipulation:

.createfile:
        mov rsi, 0644o                                                    ;Task: Using octal notation, put 644 into rsi
        mov rdi, filename                                                    ;Task: Move the 'filename' label into rdi
        mov rax, 85                                                    ;Task: Move the number associated with the 64 bit sys_creat to rax
        syscall

        mov [fd], rax                                                    ;Task: Move the return value from rax into the LOCATION WITHIN the label 'fd'

.writefile:
        mov rdx, 1                                                    ;Task: Move the size of the 'number' variable into rdx
        mov rsi, number                                                    ;Task: Move the label 'number' into rsi 
        mov rdi, [fd]                                                    ;Task: Move the VALUE within the label 'fd' into rdi
        mov rax, 1                                                    ;Task: Move the number associated with the 64 bit sys_write to rax
        syscall

.closefile:
        mov rdi, [fd]                                                    ;Task: Move the VALUE within the label 'fd' into rdi
        mov rax, 3                                                    ;Task: Move the number associated with the 64 bit sys_close to rax
        syscall


exit:
        xor rdi, rdi
        mov rax, 60
        syscall

section .data                                                         ;Task: Set up the section which deals with initialized data
        string: db "Please enter a number between 1-9: ", 0x0a
        len:     equ $ - string
        filename: db "Number.txt", 0x00

section .bss                                                        ;Task: Set up the section which deals with uninitialized data
        number: resb 1                                                        ;Task: Reserve one byte for a variable called 'number'
                                                                ;Task: Reserve one byte for a variable called 'fd'
                                                                                                                                                                                                                                                      66,1          Bot
