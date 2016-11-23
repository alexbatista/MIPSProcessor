module shiftLeft
#(WIDTH=32)
(input logic [WIDTH-1:0] in, output logic [WIDTH-1:0] out);

	assign out = in << 2;

endmodule