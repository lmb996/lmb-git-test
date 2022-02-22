#define GPJ0CON 0xE0200240
#define GPJ0DAT 0xE0200244
.global _start

_start:
	ldr r1, =GPJ0CON
	ldr r0, =0x00111000
	str r0, [r1]
	
led_flash:
	ldr r0, =GPJ0DAT
	ldr r1, =(1<<3)
	str r1, [r0]
	bl delay
	
	ldr r0, =GPJ0DAT
	ldr r1, =(1<<4)
	str r1, [r0]
	bl delay
	
	ldr r0, =GPJ0DAT
	ldr r1, =(1<<5)
	str r1, [r0]
	bl delay
	b led_flash
	
delay:
	ldr r2, =90000000
	ldr r3, =0x0
delay_loop:
	sub r2,r2,#1
	cmp r2, r3
	bne delay_loop
	mov pc, lr
	
