.intel_syntax noprefix

.section .text
is_perfect:
    push ebp
    mov ebp, esp
    mov DWORD PTR [ebp-20], edi
    mov DWORD PTR [ebp-4], 1
    mov DWORD PTR [ebp-8], 0
    jmp .L2
.L4:
    mov eax, DWORD PTR [ebp-20]
    cdq
    idiv DWORD PTR [ebp-4]
    mov eax, edx
    test eax, eax
    jne .L3
    mov eax, DWORD PTR [ebp-4]
    add DWORD PTR [ebp-8], eax
.L3:
    add DWORD PTR [ebp-4], 1
.L2:
    mov eax, DWORD PTR [ebp-20]
    mov edx, eax
    shr edx, 31
    add eax, edx
    sar eax
    cmp DWORD PTR [ebp-4], eax
    jle .L4
    mov eax, DWORD PTR [ebp-8]
    cmp eax, DWORD PTR [ebp-20]
    jne .L5
    mov eax, 1
    jmp .L6
.L5:
    mov eax, 0
.L6:
    pop ebp
    ret

.global main
main:
    push ebp
    mov ebp, esp
    sub esp, 16
    mov edi, 6
    call is_perfect
    mov DWORD PTR [ebp-4], eax
    mov eax, DWORD PTR [ebp-4]
    leave
    ret
