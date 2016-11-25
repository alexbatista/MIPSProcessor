main: 	ori $t0, $0, 0x8000			// t0 = 0 or 0x8000 = 0x8000 = -32768
		addi $t1, $0, -32766		// t1 = 0 + 0x8002 = 0x8002 = -32766
		ori $t2, $t0, 0x8001		// t2 = 0x8000 or 0x8001 = 0x8001 = -32767
		beq $t0, $t1, there			// branch is not taken
		slt $t3, $t1, $t0			// t3 = (t1 < t0) = 0
		bne $t3, $0, here			// branch is not taken
		j there						// jump is taken
here: 	sub $t2, $t2, $t0			// doesn't execute
		ori $t0, $t0, 0xFF			// doesn't execute
there: 	add $t3, $t3, $t2			// t3 = 0 + (-32767) = -32767
		sub $t0, $t2, $t0			// t0 = -32767 - (-32768) = 1
		sw $t0, 82($t3)				
