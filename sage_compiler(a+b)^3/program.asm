; (a + b)^3 = a³ + 3a²b + 3ab² + b³
; Assembly with NASM + GoLink + WinAPI

extern printf
extern scanf
extern sprintf
extern MessageBoxA
extern ExitProcess
global Start

section .data
input_fmt      db "%d", 0
output_fmt     db "Result = %d", 10, 0
sprintf_fmt    db "%s", 0
msg_title      db "Cube Expand", 0
msg_text db 8192 dup(0)

promptA        db "Enter value for a: ", 0
promptB        db "Enter value for b: ", 0

fmt_combined db "Tokens:  (IDENTIFIER a) , (OPERATOR ^ ) , (NUMBER 3) , (OPERATOR +) ,  (NUMBER 3) ,  (IDENTIFIER a) ,  (OPERATOR ^) ,  (NUMBER 2) ,  (OPERATOR *) ,  (IDENTIFIER b) ,  (OPERATOR *) ,  (OPERATOR +) ,  (NUMBER 3) ,  (IDENTIFIER a) ,  (OPERATOR *) ,  (IDENTIFIER b) ,  (OPERATOR ^) ,  (NUMBER 2) ,  (OPERATOR *) ,  (OPERATOR +) ,  (IDENTIFIER b) ,  (OPERATOR ^) ,  (NUMBER 3) ,  (OPERATOR) +",10,10
              db "Postfix:",10
              db "  a 3 ^ 3 a 2 ^ * b * + 3 a * b 2 ^ * + b 3 ^ +",10,10
              db "Symbol Table:  a   int   User input  b   int   User input  t1  int   a³  t2  int   3a²b  t3  int   3ab²  t4  int   b³  Z   int   Final result",10,10
               db "Parse Tree:",10
              db "            +",10
              db "          /   \\",10
              db "        +       b³",10
              db "      /   \\",10
              db "    +      3ab²",10
              db "  /   \\",10
              db "a³     3a²b",10,10
              db "Three Address Code:",10
              db "  t1 = a * a",10
              db "  t1 = t1 * a",10
              db "  t2 = a * a",10
              db "  t2 = t2 * b",10
              db "  t2 = t2 * 3",10
              db "  t3 = a * b",10
              db "  t3 = t3 * b",10
              db "  t3 = t3 * 3",10
              db "  t4 = b * b",10
              db "  t4 = t4 * b",10
              db "  Z = t1 + t2 + t3 + t4",10,10
             
              db "Result Z = %d",0


section .bss
a resd 1
b resd 1
result resd 1

section .text
Start:

    ; Input a
    push promptA
    call printf
    add esp, 4

    push a
    push input_fmt
    call scanf
    add esp, 8

    ; Input b
    push promptB
    call printf
    add esp, 4

    push b
    push input_fmt
    call scanf
    add esp, 8

    ; Begin computation of (a + b)^3
    ; result = a^3 + 3a^2b + 3ab^2 + b^3

    ; eax = a
    mov eax, [a]
    imul eax, [a]       ; eax = a²
    imul eax, [a]       ; eax = a³
    mov ebx, eax        ; ebx = a³

    ; ecx = a² * b * 3
    mov eax, [a]
    imul eax, [a]       ; eax = a²
    imul eax, [b]       ; eax = a²b
    imul eax, 3         ; eax = 3a²b
    add ebx, eax        ; ebx += 3a²b

    ; eax = a * b² * 3
    mov eax, [a]
    imul eax, [b]       ; eax = ab
    imul eax, [b]       ; eax = ab²
    imul eax, 3         ; eax = 3ab²
    add ebx, eax        ; ebx += 3ab²

    ; eax = b³
    mov eax, [b]
    imul eax, [b]       ; eax = b²
    imul eax, [b]       ; eax = b³
    add ebx, eax        ; ebx += b³

    ; Store final result
    mov [result], ebx

    ; Output to terminal
    push dword [result]
    push output_fmt
    call printf
    add esp, 8

    ; Format full message with result
   push dword [result]        ; value of Z
push fmt_combined          ; format string with %d at the end
push msg_text              ; output buffer
call sprintf
add esp, 8

    ; Show MessageBox
    push 0
    push msg_title
    push msg_text
    push 0
    call MessageBoxA

    ; Exit
    push 0
    call ExitProcess
