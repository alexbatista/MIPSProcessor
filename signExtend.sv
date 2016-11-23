module signExtend(input [15:0] a, output [31:0] y);

	assign y[15:0] = a[15:0];
	assign y[31:16] = {16*a[15]};

endmodule