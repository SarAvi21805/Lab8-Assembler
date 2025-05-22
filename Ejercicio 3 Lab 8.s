.section .text
.global ejercicio3

ejercicio3:
    // Configurar GPIOC
    LDR R0, =0x40020800        // Dirección base de GPIOC
    LDR R1, [R0]               // Leer valor actual de MODER

    // Borrar bits 26 y 27
    LDR R4, =0x0C000000        // (3 << 26)
    BIC R1, R1, R4             // Limpiar bits 26 y 27
    STR R1, [R0]               // Escribir de nuevo en MODER

    MOV R2, #0                 // Inicializar contador
    BL contar_pulsaciones

guardar_valor:
    MOV R1, R2                 // Guardar el valor final en R1

end:
    B end                      // Bucle infinito

contar_pulsaciones:
count_loop:
    LDR R3, [R0, #0x10]        // Leer GPIOC_IDR
    LDR R4, =0x00002000        // (1 << 13)
    AND R3, R3, R4
    CMP R3, #0
    BNE count_loop

    ADD R2, R2, #1             // Incrementar contador

    B count_loop
