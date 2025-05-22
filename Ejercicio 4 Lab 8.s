    .section .text
    .global _start

_start:
    /* Inicializar registros */
    MOV R1, #5           /* R1 = 5 */
    MOV R2, #10          /* R2 = 10 */
    MOV R3, #3           /* R3 = 3 */

    /* Llamado de la subrutina */
    BL arithmetic_operation

    /* Fin del programa */
    B .

arithmetic_operation:
    ADD R0, R1, R2       /* R0 = 5 + 10 = 15 */
    LSL R3, R3, #2       /* R3 = 3 * 4 = 12 (desplazamiento a la izquierda) */
    SUB R0, R0, R3       /* R0 = 15 - 12 */
    BX LR /* retornar subrutina */