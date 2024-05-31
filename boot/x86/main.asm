; Inicia o Código no Endereço de Boot
org 0x7C00

; Defina quantos Bits é o Modo Real
bits 16

; Cria as Variáveis
section .data
	; Defina o quanto de RAM pode ser Usada no Máximo
	max_ram db 0x0040
 	; Defina o quanto de RAM em Uso Atual
 	use_ram db 0x0000

; Código Geral
; Simplesmente um Loop Infinito
loop:
	jmp loop

times 510-($-$$) db 0x0000
db 0x0055
db 0x00AA
