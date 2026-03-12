section .text
global main
global _start
_start:

main:
    ; open file handle
        mov rdx, 0                      ;mode Not required for reading
        mov rsi, 0                      ;int flags 0 = read only
        mov rdi, filename               ;const char *filename
        mov rax, 2
        syscall

        cmp rax, 0
        jz exit

    ; read file content into buffer
        mov rdx, 1                      ;size count
        mov rsi,                        ;char buf
        mov rdi,                        ;fd
        mov rax, 0
        syscall

        cmp rax, 0
        jz exit

    ; write file content to stdout
        mov rdx, 1              ;size
        mov rsi,                ;const char buf
        mov rdi,                ;file descriptor
        mov rax, 1
        syscall

        cmp rax, 0
        jz exit

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall

section .data
filename db "/home/token-user/token.txt", 0

section .bss
file_content resb 6
