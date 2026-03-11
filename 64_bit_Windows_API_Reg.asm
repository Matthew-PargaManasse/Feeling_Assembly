extern  ExitProcess:PROC                    ; Task: Add ExitProcess to the extern directive  
extern  GetStdHandle:PROC                    ; Task: Add GetStdHandle to the extern directive 
extern  WriteConsoleA:PROC                    ; Task: Add WriteConsoleA to the extern directive 

.data                                ; Task: Define the .data section
szMsg       db  "I Love 64 Bit Windows Assembly", 0            ; Task: Define the bytes 'I Love 64 Bit Windows Assembly'
MSG_LEN equ $ - szMsg                         ; Task: Calculate the size of the label szMsg

.data?                                ; Task: Define the section which creates a block of uninitialised data
BytesWritten dd  ?

.code                                ; Task: Define the code section
main PROC                                 ; Task: Define the start of the code using the label main with the PROC directive
    .GetStdHandle:
    mov rcx, -11                         ; Task: Copy the handle to the standard output device to the register RCX
    call GetStdHandle                        ; Task: Call the function 'GetStdHandle' 

    .Write: 
    push 0                        ; Task: Push the value '0' to the stack
    mov r9, offset BytesWritten                         ; Task: Copy the offset of the BytesWritten label to the register R9
    mov r8, MSG_LEN                         ; Task: Copy the label for the length of the message to the register R8
    mov rdx, offset szMsg                         ; Task: Copy the offset of the label szMsg to the register RDX
    mov rcx, rax                         ; Task: Copy the return value of GetStdHandle(located in RAX) to the register RCX
    call WriteConsoleA                        ; Task: Call the function 'WriteConsoleA' with the amount of bytes for the parameters

    .exit:
    mov rcx, 0
    call    ExitProcess

main ENDP                            ; Task: Define the end of the code using the main with the ENDP directive
END 
