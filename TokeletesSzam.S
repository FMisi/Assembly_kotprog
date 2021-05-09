.intel_syntax noprefix /* szintaxis megadasa */

.section .text /* megadom, hogy text szekciorol van szo */

.global is_perfect /* az is_perfect fuggveny globalis */
is_perfect:
	push ebp /* az ebp erteke a verembe kerul */
	mov ebp, esp /* esp-ben levo adat mozgatasa ebp-be, igy mondjuk kb C-ben: ebp = esp; */
	push ebx /* valtozomentes */
	mov ecx, 1 /* ciklus valtozo */
	xor ebx, ebx /* ebx = osztok osszege; eredmeny op1-be kerul */

.ciklus:
	xor edx, edx /* maradek torles */
	mov eax, [ebp + 8] /* 1. parameter */
	cmp eax, 0 /* if(1. parameter (eax) == 0) */
	je  .nem
	cmp eax, ecx /* if(1. parameter (eax) <= ciklus valtozo (ecx)){ */
	jle .igenvagynem /* goto .igenvagynem; } */
	div ecx	/* edx:eax */
	cmp edx, 0  /* if(maradek == 0){ */
	je .osszeg /* goto .osszeg; } */
	inc ecx /* ecx++; */
	jmp .ciklus /* goto .ciklus; */

.osszeg:
	add ebx, ecx /* ebx += ecx; */
	inc ecx /* ecx++; */
	jmp .ciklus /* goto .ciklus; */

.igenvagynem:
	cmp ebx, eax /* if(ebx != eax) { */
	jne .nem /* goto .nem; } else { */
	jmp .igen /* goto .igen; } */

.nem:
	mov eax, 0 /* return 0; */
	jmp .vege /* goto .vege; */

.igen:
	mov eax, 1 /* return 1; */

.vege:
	pop ebx /* valtozovisszaalitas */
	mov esp, ebp
	pop ebp
	ret

