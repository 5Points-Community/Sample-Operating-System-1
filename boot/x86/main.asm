; Inicia o Código no Endereço de Boot
org 0x7C00

; Código Geral
; Simplesmente um Loop Infinito
loop:
	cmp (use_ram), (max_ram)
	je  abort
	jmp loop

; Aqui tem a Função de Abortar o Boot
abort:
	mov si, (ram_error)
	mov 0x0E
	int 0x10
	hlt

; Cria as Variáveis
section .data
	; Defina o quanto de RAM pode ser Usada no Máximo
	max_ram   db 0x800
 	; Defina o quanto de RAM em Uso Atual
 	use_ram   db 0x000
	; Mensagem de Aborto por excesso de RAM usada no Boot
	ram_error db "Detectamos um Uso Escessivo de RAM no Bootloader, Abortamos o Boot por Segurança", 0x00

times 510-($-$$) db 0x00
db 0x55
db 0xAA
