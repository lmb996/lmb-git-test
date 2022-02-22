led3.bin : led3.o
	arm-linux-ld -Ttext 0x0 -o led3.elf $^
	arm-linux-objcopy -O binary led3.elf led3.bin
	arm-linux-objdump -D led3.elf >led3_elf.dis
	gcc mkv210_image.c -o mkv210_image
	./mkv210 led3.bin 210.bin
%.o : %.S
	arm-linux-gcc -o $@ $< -c
%.o : %.c
	arm-linux-gcc -o $@ $< -c
clean:
	rm *.c *.o *.bin *.dis mkv210 -f
