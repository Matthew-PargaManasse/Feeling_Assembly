.386
.model flat, stdcall                            ; Task: Define the .model to be flat and the calling convention of stdcall
option casemap:none

extern  ExitProcess@4:PROC                       ; Task: Add ExitProcess with the correct amount of bytes for the arguments  
extern  GetStdHandle@4:PROC                       ; Task: Add GetStdHandle with the correct amount of bytes for the arguments
extern  WriteConsoleA@20:PROC                    ; Task: Add WriteConsole with the correct amount of bytes for the arguments

.data                                             ; Task: Define the .data section
szMsg       db  "I Love Windows Assembly", 0       ; Task: Define the bytes 'I Love Windows Assembly'
MSG_LEN equ $ - szMsg                             ; Task: Calculate the size of the label szMsg

.data?                                             ; Task: Define the section which creates a block of uninitialised data
BytesWritten dd  ?

.code                                            ; Task: Define the code section
    start:                                     ; Task: Define the start of the code section using the label 'start:'
; GetStdHandle
    push -11                                     ; Task: push the handle to the standard output device to the stack
    call GetStdHandle@4                        ; Task: Call the function 'GetStdHandle' with the amount of bytes for the parameters

;
    push 0                                      ; Task: Push the value '0' to the stack
    push offset BytesWritten                        ; Task: Push the offset of the BytesWritten label to the stack
    push MSG_LEN                                ; Task: Push the label for the length of the message to the stack
    push offset szMsg                           ; Task: Push the offset of the label szMsg to the stack
    push eax                                        ; Task: Push the return value of GetStdHandle to the stack which is located in the register eax
    call WriteConsoleA@20                          ; Task: Call the function 'WriteConsole' with the amount of bytes for the parameters

    push    0
    call    ExitProcess@4
end start                                               ; Task: End with the label 'start'
