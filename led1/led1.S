.global _start

_start:
	ldr r1, =0xE0200240	//将GPJ0控制器的地址写入r1寄存器
	ldr r0, =0x00101000	//将控制器所需的数据写入寄存器r0，将对应的gpio端口设置为输出
	str r0, [r1]	//将r0的数据写入GPJ0控制器，执行
	mov r2, #0x1000	//利用r2寄存器存储计数数值，设为0x100
	
led_blink:
	ldr r1, =0xE0200244	//将JPJ0数据寄存器大地址写入r1寄存器
	mov r0, #0	//将r0寄存器写入数值0
	str r0, [r1]	//将r0的数值写入以寄存器r1的值为地址的内存中执行，led亮
	bl delay	
	
	ldr r1, =0xE0200244	//将GPJ0数据控制器的地址写入r1寄存器
	mov r0, #0x38	//将0x38写入寄存器r0，控制对应的灯亮。
	str r0, [r1]	//将数据写入寄存器地址对应的内存，led灭
	bl delay
	
	sub r2, r2, #1	//执行计数器的计数值减法
	cmp r2, #0		//检查寄存器r2的值是否为0
	bne led_blink	//若寄存器r2的值不为0，执行led_blink
	
halt :
	b halt //死循环
	
delay:
	mov r0, #0x900000	//写入延时计数值
delay_loop:
	cmp r0, #0
	sub r0, r0, #1 //执行减法
	bne delay_loop	//如果r0的值不为0，则执行delay_loop
	mov pc, lr	//若为0，则恢复现场，转回delay调用的地方继续执行下一句指令