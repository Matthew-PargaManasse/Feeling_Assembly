        global _start                                   ; NASM directive to dictate the entrypoint of the binary once it gets linked
  
        section .text                                ; Task: Declare the .text section
.sys_write:
_start: mov rdx, len                                    ; Task: Move the length of the string to the register rdx
        mov rsi, string                                 ; Task: Move the string to the register rsi
        mov rdi, 1                                    ; Task: Move the numerical representation of stdout to the register rdi
        mov rax, 1                                    ; Task: Move the 64 bit sys_write system call number to the register rax
        syscall                                         ; This creates the interrupt to tell the operating system to transition to Kernel Mode

        cmp rax, 0                                      ; This checks how many bytes were printed, if it is 0 then we know sys_write failed
        jz _start                                       ; If it is 0 then jump back to the address labelled at '_start' to execute code from there

.sys_exit:
exit:   xor rdi, rdi                                    ; Task: XOR the register rdi to make the exit code '0' to indicate the program ran successfully 
        mov rax, 60                                    ; Task: Move the sys_exit system call number to the register rax
        syscall

        section .data                                ; Task: Declare the .data section
string: db "I Love 64 bit Assembly", 0x0a                               ; Task: Enter the string 'I Love 64 bit Assembly' followed by a new line character
len:    equ $ - string                                    ; Task: Use the current memory location - string to work out the length of the string to print
