;Reference: "Xorshift RNGs" by George Marsaglia - Jul 4, 2003
;https://www.jstatsoft.org/article/view/v008i14

.686
.model flat

.data
;the triples I used out of 2200 suggested by Marsaglia: 
; [2, 1, 4] / [7, 13, 6] / [1, 1, 20] / [13, 17, 5]

bitshift_triple byte 13, 7, 5
xorwow_counter dword 0
xorwow_seed dword 0 ; additional entropy 

.code

_xorwow proc
push ebp
mov ebp, esp
push ebx
push ecx
push edx

mov esi, [ebp+8]

mov edx, [esi][16] ;t = state[4]
mov eax, [esi] ;s = state[0]
  
mov ecx, [esi + 12]   ; state[4] = state[3]
mov [esi + 16], ecx
mov ecx, [esi + 8]    ; state[3] = state[2]
mov [esi + 12], ecx
mov ecx, [esi + 4]    ; state[2] = state[1]
mov [esi + 8], ecx
mov ecx, [esi]        ; state[1] = state[0]
mov [esi + 4], ecx

;t ^= t >> bitshift_triple[0] ; t ^= t << bitshift_triple[1];
mov ebx, edx; ebx = t
mov cl, bitshift_triple[0]
shr ebx, cl ; state[3] = state[2]
xor edx, ebx
mov ebx, edx
mov cl, bitshift_triple[1]
shl ebx, cl
xor edx, ebx

;t ^= s ^ (s << bitshift_triple[2])
mov ebx, eax  
mov cl, bitshift_triple[2]
shl ebx, cl
xor eax, ebx
xor edx, eax

;state->x[0] = t; state->counter += 362437;
mov [esi], edx
add xorwow_counter, 362437

mov ecx, xorwow_counter
add eax, ecx ; return t + xorwow_counter

pop edx
pop ecx
pop ebx
mov esp, ebp
pop ebp
ret
_xorwow endp

END
