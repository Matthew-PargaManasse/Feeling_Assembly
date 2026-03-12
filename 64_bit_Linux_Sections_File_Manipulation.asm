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

        cmp rax, 0                      ;Check output. Fails are negative numbers
        jl exit                         ;jump if less than

        mov r8, rax

    ; read file content into buffer
        mov rdx, 6                      ;size count of lable file_content
        mov rsi, file_content                   ;char buf lable file_content
        mov rdi, r8                     ;fd, this is passed from open
        mov rax, 0
        syscall

        cmp rax, 0                      ;Check output. 0 means EOF
        jle exit                        ;Jump if less than of equal to

    ; write file content to stdout
        mov rdx, 6                      ;size of the 'file_content' variable
        mov rsi, file_content           ;const char buf
        mov rdi, 1                      ;file descriptor, as in STDIN, STDOUT
        mov rax, 1
        syscall

        cmp rax, 0                      ;Check output. Fails are neg
        jl exit                         ;Jump if less than

    ; close file
        mov rdi, r8                     ;File to close
        mov rax, 3
        syscall

    ; exit with some grace man
    exit:
    mov rax, 60
    xor rdi, rdi
    syscall

section .data
filename db "/home/token-user/token.txt", 0

section .bss
file_content resb 6
