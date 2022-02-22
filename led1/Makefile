led.bin:led1.o
	arm-linux-ld -Ttext 0x0 -o led1.elf $^
	arm-linux-objcopy -O binary led1.elf led.bin
	arm-linux-objdump -D led.elf >led1_elf.dis
	gcc mkv210_image.c -o mkx210
	./mkx210 led1.bin 210.bin
	
%.o : %.S
	arm-linux-gcc -o $@ $< -c
%.o : %.c
	arm-linux-gcc -o $@ $< -c

clean:
	rm *.o *.elf *.bin *.dis max210 -f
