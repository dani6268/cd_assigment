%macro FRUSTVOL 4
    ; %1 = output register
    ; %2 = r1 (A)
    ; %3 = r2 (B)
    ; %4 = h  (C)

    mov eax, %2        ; eax = r1
    imul eax, %2       ; eax = r1 * r1

    mov ebx, %2
    imul ebx, %3       ; ebx = r1 * r2
    add eax, ebx       ; eax += r1*r2

    mov ecx, %3
    imul ecx, %3       ; ecx = r2 * r2
    add eax, ecx       ; eax += r2*r2

    imul eax, %4       ; eax *= h
    imul eax, 3        ; approx π * h

    mov %1, eax        ; store result
%endmacro
