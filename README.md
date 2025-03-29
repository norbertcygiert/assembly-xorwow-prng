# XORWOW PRNG implemented in x86 ASM
This project implements the XORWOW pseudorandom number generator (PRNG) in x86 assembly (Intel syntax). 
XORWOW is a part of the <b>[xorshift](https://en.wikipedia.org/wiki/Xorshift)</b> family of RNGs, known for its efficiency and good statistical properties.
The XORWOW generator is also used in Nvidia's CUDA Toolkit in the cuRAND library.
My implementation also uses rand() from standard C library for additional entropy.
## References
### "Xorshift RNGs" by George Marsaglia (Florida State Univeristy) - Jul 4, 2003
https://www.jstatsoft.org/article/view/v008i14
### cuRAND - CUDA Toolkit Documentation
https://docs.nvidia.com/cuda/curand/device-api-overview.html#bit-generation-1
### Xorshift - Wikipedia
https://en.wikipedia.org/wiki/Xorshift
<br>

## Building & Running
1. Assemble the ASM Code <br>
`ml /c /coff xorwow.asm`
2. Compile the C Code <br>
`cl /c main.c`
3. Link the Object Files <br>
` link /subsystem:console main.obj xorwow.obj `
4. Run the Program <br>
` .\main.exe `

<br>

## Disclaimer! 
### This RNG isn't by any means safe and you should never use it for cryptography or anything related. It is merely a small project done for fun.
