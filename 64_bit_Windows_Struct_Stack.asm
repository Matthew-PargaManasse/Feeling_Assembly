extern  ExitProcess:PROC           ; Task: Add ExitProcess to the extern directive   
extern  GetStdHandle:PROC           ; Task: Add GetStdHandle to the extern directive   
extern  WriteConsoleW:PROC           ; Task: Add WriteConsoleW to the extern directive   
extern  GetSystemTime:PROC           ; Task: Add GetSystemTime to the extern directive   
extern  GetDateFormatEx:PROC           ; Task: Add GetDateFormatEx to the extern directive   

.data
buf db 128 DUP (0)                    ; Task: define bytes of a buffer size of 128 '0's
buf_LEN equ $ - buf

LPSYSTEMTIME STRUCT                               ; Task: Initiate the struct with the keyword 'STRUCT'
    wYear dw ?                                        ; Task: Define words called 'wYear' with a '?' value
    wMonth dw ?                                        ; Task: Define words called 'wMonth' with a '?' value
    wDayOfWeek dw ?                                        ; Task: Define words called 'wDayOfWeek' with a '?' value
    wDay dw ?                                        ; Task: Define words called 'wDay' with a '?' value
    wHour dw ?                                        ; Task: Define words called 'wHour' with a '?' value
    wMinute dw ?                                        ; Task: Define words called 'wMinute' with a '?' value
    wSecond dw ?                                        ; Task: Define words called 'wSecond' with a '?' value
    wMilliseconds dw ?                                        ; Task: Define words called 'wMilliseconds' with a '?' value 
LPSYSTEMTIME ENDS                   ; Task: END the struct with the keyword 'ENDS'
DateTimeInfo LPSYSTEMTIME <>                                ; Task: Declare a struct called 'DateTimeInfo' with the keyword '<>'

.data?
BytesWritten dd  ?
HANDLE      dq  ?

.code
main PROC

;Get System Time:
    mov rcx, offset DateTimeInfo                              ; Task: Copy the offset of the struct to the register RCX
    call GetSystemTime                            ; Task: Call the function 'GetSystemTime'

;Get StdHandle:
    mov rcx, -11
    call    GetStdHandle
    mov HANDLE, rax                              ; Task: Copy the return value located in RAX into the label 'HANDLE'
  

    sub rsp, 40h                             ; Task: Subtract the correct amount of bytes in hexadecimal from the register RSP
    mov rax, 0                             ; Task: Copy the value '0' into the register RAX
    mov rbx, buf_LEN                             ; Task: Copy the label 'buf_LEN' to the register RBX
    mov r10, offset buf                             ; Task: Copy the offset of the label 'buf' to the register R10

;GetDateFormatEx
    mov [rsp+30h], rax                             ; Task: Copy the register RAX into the register RSP + 30h
    mov [rsp+28h], rbx                             ; Task: Copy the register RBX into the register RSP + 28h
    mov [rsp+20h], r10                             ; Task: Copy the register R10 into the register RSP + 20h
    mov r9, 0                             ; Task: Copy the value '0' to the register R9
    mov r8, offset DateTimeInfo                             ; Task: Copy the offset of the struct 'DateTimeInfo' to the register R8
    mov rdx, 0                              ; Task: Copy the value '0' to the register RDX
    mov rcx, 0                             ; Task: Copy the value '0' to the register RCX
    call GetDateFormatEx                            ; Task: Call the function 'GetDateFormatEx' 
    add rsp, 40h                             ; Task: Add the amount of bytes in hexadecimal previously subtracted from the register RSP


;Write:
    push 0                            ; Task: Push the value '0' to the stack
    mov r9, offset BytesWritten                             ; Task: Copy the offset of the label 'BytesWritten' to the register R9
    mov r8, rax                             ; Task: Copy the register RAX into the register R8
    mov rdx, offset buf                             ; Task: Copy the offset of the label 'buf' to the register RDX
    mov rcx, HANDLE                             ; Task: Copy the label 'HANDLE' to the register RCX
    call WriteConsoleW                            ; Task: Call the function 'WriteConsoleW'

    mov rcx, 0
    call    ExitProcess
main ENDP
END
