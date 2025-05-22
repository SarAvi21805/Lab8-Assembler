.syntax unified
.cpu cortex-m4
.thumb

.global ejercicio2

@Directivas usadas en el código
.equ RCC_AHB1ENR, 0x40023830
.equ GPIOA_MODER, 0x40020000
.equ GPIOA_ODR, 0x40020014
.equ GPIOC_MODER, 0x40020800
.equ GPIOC_IDR, 0x40020810

@Llamada de las subrutinas
ejercicio2:
	@Habilitar reloj para GPIOA y GPIOC
    LDR R0, =RCC_AHB1ENR
    LDR R1, [R0]
    ORR R1, R1, #(1 << 0) @Habilita GPIOA
    ORR R1, R1, #(1 << 2) @Habilita GPIOC
    STR R1, [R0]

    @Configuaración PA5 como salida
    LDR R0, =GPIOA_MODER
    LDR R1, [R0]
    BIC R1, R1, #(3 << (5 * 2))  @Limpia bits 10:11
    ORR R1, R1, #(1 << (5 * 2))  @Pone 01 (salida)
    STR R1, [R0]

    @Configurar PC13 como entrada
    LDR R0, =GPIOC_MODER
    LDR R1, [R0]
    BIC R1, R1, #(3 << (13 * 2)) @Pone 00 (entrada)
    STR R1, [R0]

loop:
    @Leer botón en PC13
    LDR R0, =GPIOC_IDR
    LDR R1, [R0]
    TST R1, #(1 << 13) @Verifica bit 13

    BEQ encender @Si bit = 0 (botón presionado), encender
    B apagar @Si bit = 1 (botón suelto), apagar

encender:
    LDR R0, =GPIOA_ODR
    LDR R1, [R0]
    ORR R1, R1, #(1 << 5) @Enciende PA5
    STR R1, [R0]
    B loop

apagar:
    LDR R0, =GPIOA_ODR
    LDR R1, [R0]
    BIC R1, R1, #(1 << 5) @Apaga PA5
    STR R1, [R0]
    B loop


