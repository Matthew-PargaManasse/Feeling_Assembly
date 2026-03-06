       global _start                           ; NASM directive to dictate the entrypoint of the binary once it gets linked

        section .text                        ; Task: Declare the .text section
_start: mov edx, len                            ; Task: Move the length of the string to the register edx
        mov ecx, string                            ; Task: Move the string to the register ecx
        mov ebx, 1                            ; Task: Move the numerical representation of stdout to the register ebx
        mov eax, 4                            ; Task: Move the 32 bit sys_write system call number to the register eax
        int 80h                                 ; This creates the interrupt to tell the operating system to transition to Kernel Mode
        
        cmp eax, 0                              ; This checks how many bytes were printed, if it is 0 then we know sys_write failed
        jz _start                               ; If it is 0 then jump back to the address labelled at '_start' to execute code from there

exit:   xor ebx, ebx                            ; Task: XOR the register ebx to make the exit code '0' to indicate the program ran successfully 
        mov eax, 1                            ; Task: Move the sys_exit system call number to the register eax
        int 80h                         

        section .data                        ; Task: Declare the .data section
string: db "I Love Assembly", 0x                       ; Task: Enter the string 'I Love Assembly' followed by a new line character
len:    equ $ - string                             ; Task: Use the current memory location - string to work out the length of the string to print
