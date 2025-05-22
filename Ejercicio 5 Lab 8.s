.syntax unified
.cpu cortex-m4
.thumb

.section .text
.global ej5
ej5:

	mov r0, #26 /* Inicializar registro */
	lsl r1, r0, #3 /*R1 = Desplazamiento logico a la izquierda de 3 bits*/
	asr r2, r0, #2 /*R2 = Desplazamiento aritmetico a la derecha de 2 bits*/

stop:
	b stop

	.section .data
