module complement2
#(parameter WIDTH=8)
(input logic [WIDTH-1:0] in, output logic [WIDTH-1:0] out);

	assign out = 1+ ~in;

endmodule
