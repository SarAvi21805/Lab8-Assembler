.syntax unified
.cpu cortex-m4
.thumb

.global ejercicio1

@Directivas usadas en el código
.equ RCC_AHB1ENR, 0x40023830
.equ GPIOA_MODER, 0x40020000
.equ GPIOA_ODR, 0x40020014
.equ GPIOA_EN, (1<<0)
.equ PA5, (1<<10)

@Llamada de las subrutinas
ejercicio1:
	bl init_gpioaPA5
	bl led
loop:
	b loop

@Subrutina para inicializar PA5 como salida principal
init_gpioaPA5:
	LDR R0, =RCC_AHB1ENR
	LDR R1, [R0]
	ORR R1, R1, #GPIOA_EN
	STR R1, [R0]

	LDR R0, =GPIOA_MODER
	LDR R1, [R0]
	ORR R1, R1, #PA5
	STR R1, [R0]
	BX LR

@Subrutina para encender led
led:
	LDR R0, =GPIOA_ODR
	LDR R1, [R0]
	ORR R1, R1, #(1<<5)
	STR R1, [R0]
	BX LR
