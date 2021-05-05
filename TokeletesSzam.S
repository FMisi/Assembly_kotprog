.intel_syntax noprefix /* szintaxis megadasa */

.section .text /* megadom, hogy text szekciorol van szo */

.global is_perfect /* az is_perfect fuggveny globalis */
is_perfect: /* az is_perfect fuggvenyt itt hozom letre */
        push    ebp /* az ebp erteke a verembe kerul */
        mov     ebp, esp /* esp-ben levo adat mozgatasa ebp-be, igy mondjuk kb C-ben: ebp = esp; */
        /* ez a veremmutato bazis regiszterbe toltese verem cimzeshez */
        /* a verem az alacsonyabb memoriacimek fele bovul */
        /* itt azert kell a DWORD PTR, mert a CPU nem tudja, hany bites a muvelet! */
        mov     DWORD PTR [ebp-20], edi /* int ebp-20 = edi; ez lesz a parameter */
        mov     DWORD PTR [ebp-4], 1 /* int ebp-4 = 1; */
        mov     DWORD PTR [ebp-8], 0 /* int ebp-8 = 0; */
        jmp     .L2 /* goto .L2; */
.L4:
        mov     eax, DWORD PTR [ebp-20] /* int eax = ebo-20; */
        cdq /* duplaszobol quadraszo */
        idiv    DWORD PTR [ebp-4] /* elojeles osztas */
        mov     eax, edx /* int eax = edx; */
        test    eax, eax /* logikai ESeles, de csak a flag-ek allitodnak */
        jne     .L3 /* if(test eax==false){ goto .L3;} */
        mov     eax, DWORD PTR [ebp-4] /* int eax = ebp-4; */
        add     DWORD PTR [ebp-8], eax /* int ebp-8 = eax; */
.L3:
        add     DWORD PTR [ebp-4], 1 /* int ebp-4 = 1; */
.L2:
        mov     eax, DWORD PTR [ebp-20] /* int eax = ebp-20; */
        mov     edx, eax /* int edx = eax; */
        shr     edx, 31 /* logikai leptetes jobbra a celoperanduson belul */
        add     eax, edx /* int eax += edx*/
        sar     eax /* logikai leptetes jobbra a celoperanduson belul, az eljoel megorzese */
        cmp     DWORD PTR [ebp-4], eax /* if(ebp-4 <= eax){ */
        jle     .L4 /* goto .L4; } */
        mov     eax, DWORD PTR [ebp-8] /* int eax = ebp-8; */
        cmp     eax, DWORD PTR [ebp-20] /* if(eax != ebp-20){ */
        jne     .L5 /* goto .L5; } */
        mov     eax, 1 /* int eax = 1; */
        jmp     .L6 /* goto .L6; */
.L5:
        mov     eax, 0 /* int eax = 0; */
.L6:
        pop     ebp /* a verem tetejenek erteke ebp-be kerul */
        ret /* visszateres a verem tetejen talalhato cimre*/
