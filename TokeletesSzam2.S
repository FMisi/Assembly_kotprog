.intel_syntax noprefix /* szintaxis megadasa */

.section .text /* megadom, hogy text szekciorol van szo */

.global is_perfect /* az is_perfect fuggveny globalis */
is_perfect: /* az is_perfect fuggvenyt itt hozom letre */
        push    ebp /* az ebp erteke a verembe kerul */
        mov     ebp, esp /* esp-ben levo adat mozgatasa ebp-be, igy mondjuk kb C-ben: ebp = esp; */
        /* ez a veremmutato bazis regiszterbe toltese verem cimzeshez */
        /* a verem az alacsonyabb memoriacimek fele bovul */
        /* itt azert kell a DWORD PTR, mert a CPU nem tudja, hany bites a muvelet! */
        mov     DWORD PTR [ebp-12], edi /* int ebp-12 = edi; ez lesz a parameter */
        mov     DWORD PTR [ebp-4], 1 /* int ebp-4 = 1; */
        mov     DWORD PTR [ebp-8], 0 /* int ebp-8 = 0; */
        mov     eax, DWORD PTR [ebp-12] /* int eax = ebp-12; */
        mov     edx, eax /* int edx = eax; */
        add     eax, edx /* int eax += edx*/
        cmp     DWORD PTR [ebp-4], eax /* if(ebp-4 <= eax){ */
        jle     .cimke1 /* goto .cimke1; } */
        mov     eax, DWORD PTR [ebp-8] /* int eax = ebp-8; */
        cmp     eax, DWORD PTR [ebp-12] /* if(eax != ebp-12){ */
        jne     .cimke1 /* goto .cimke1; } */
        mov     eax, 1 /* int eax = 1; */
        jmp     .cimke2 /* goto .cimke2; */
.cimke1:
        mov     eax, 0 /* int eax = 0; */
.cimke2:
        pop     ebp /* a verem tetejenek erteke ebp-be kerul */
        ret /* visszateres a verem tetejen talalhato cimre */
