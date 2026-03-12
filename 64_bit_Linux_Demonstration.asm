ection .text
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
        mov rdx, 6                      ;size count of lable file_content
        mov rsi, file_content                   ;char buf lable file_content
        mov rdi, 0                      ;fd STDIN
        mov rax, 0
        syscall

        cmp rax, 0
        jz exit

    ; write file content to stdout
        mov rdx, 6              ;size of the 'file_content' variable
        mov rsi, file_content           ;const char buf
        mov rdi, filename               ;file descriptor
        mov rax, 1
        syscall

        cmp rax, 0
        jz exit

    ; close file
        mov rdi, filename
        mov rax, 3
        syscall

    ; exit
    mov rax, 60
    xor rdi, rdi
    syscall

section .data
filename db "/home/token-user/token.txt", 0

section .bss
file_content resb 6
