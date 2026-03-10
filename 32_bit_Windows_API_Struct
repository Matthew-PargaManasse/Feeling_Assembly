.386
.model flat, stdcall 
option casemap:none

extern  ExitProcess@4:PROC           ; Task: Add ExitProcess with the correct amount of bytes for the arguments  
extern  GetStdHandle@4:PROC           ; Task: Add GetStdHandle with the correct amount of bytes for the arguments  
extern  WriteConsoleW@20:PROC           ; Task: Add WriteConsoleW with the correct amount of bytes for the arguments  
extern  GetSystemTime@4:PROC           ; Task: Add GetSystemTime with the correct amount of bytes for the arguments  
extern  GetDateFormatEx@28:PROC           ; Task: Add GetDateFormatEx with the correct amount of bytes for the arguments  

.data
buf db 128 DUP (0)                    ; Task: define bytes of a buffer size of 128 '0's
buf_LEN equ $ - buf

LPSYSTEMTIME STRUCT                                ; Task: Initiate the struct with the keyword 'STRUCT'
    wYear dw ?                                        ; Task: Define words called 'wYear' with a '?' value
    wMonth dw ?                                            ; Task: Define words called 'wMonth' with a '?' value
    wDayOfWeek dw ?                                      ; Task: Define words called 'wDayOfWeek' with a '?' value
    wDay dw ?                                            ; Task: Define words called 'wDay' with a '?' value
    wHour dw ?                                            ; Task: Define words called 'wHour' with a '?' value
    wMinute dw ?                                            ; Task: Define words called 'wMinute' with a '?' value
    wSecond dw ?                                            ; Task: Define words called 'wSecond' with a '?' value
    wMilliseconds dw ?                                            ; Task: Define words called 'wMilliseconds' with a '?' value
LPSYSTEMTIME ENDS                                        ; Task: END the struct with the keyword 'ENDS'
DateTimeInfo LPSYSTEMTIME <>                              ; Task: Declare a struct called 'DateTimeInfo' with the keyword '<>'

.data?                          
BytesWritten dd  ?               
HANDLE      dd  ?

.code                                       
WinMain:                                           ; Task: Define 'WinMain' to start the main program

    push offset DateTimeInfo                       ; Task: Push the offset of the struct to the stack
    call GetSystemTime@4                             ; Task: Call the function 'GetSystemTime' with the amount of bytes for the parameters

    push -11                        
    call GetStdHandle@4
    mov HANDLE, eax                         ; Task: Copy the return value located in 'eax' into the label 'HANDLE'

    push 0                                    ; Task: Push the value '0' to the stack
    push buf_LEN                             ; Task: Push the label 'buf_LEN' to the stack 
    push offset buf                            ; Task: Push the offset of the label 'buf' to the stack
    push 0                                     ; Task: Push the value '0' to the stack
    push offset DateTimeInfo                    ; Task: Push the offset of the struct 'DateTimeInfo' to the stack
    push 0                                     ; Task: Push the value '0' to the stack
    push 0                                     ; Task: Push the value '0' to the stack
    call GetDateFormatEx@28                             ; Task: Call the function 'GetDateFormatEx' with the amount of bytes for the parameters

    push 0                                     ; Task: Push the value '0' to the stack
    push offset BytesWritten                                    ; Task: Push the offset of the label 'BytesWritten' to the stack
    push eax                                       ; Task: Push the register eax to the stack which contains the return value from 'GetDateFormatEx'
    push offset buf                                      ; Task: Push the offset of the label 'buf' to the stack
    push HANDLE                                    ; Task: Push the label 'HANDLE' to the stack
    call WriteConsoleW@20                                  ; Task: Call the function 'WriteConsoleW' with the amount of bytes for the parameters

    push 0
    call    ExitProcess@4

end WinMain 
