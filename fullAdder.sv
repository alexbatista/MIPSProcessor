module fullAdder
#(parameter WIDTH=8)
(input [WIDTH-1:0]  in1, in2,output logic ovf, output logic [WIDTH-1:0] out);

	logic a, b;
	
	always @(*) begin
		{a, out[WIDTH-2:0]} = in1[WIDTH-2:0] + in2[WIDTH-2:0];
		{b,out[WIDTH-1]} = in1[WIDTH-1] + in2[WIDTH-1] + a;
		ovf = a ^ b;
	end
		
endmodule