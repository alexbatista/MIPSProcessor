module signExtend(input logic [15:0] a, output logic [31:0] y);

	assign y[15:0] = a[15:0];
	assign y[31:16] = {16{a[15]}};

endmodule