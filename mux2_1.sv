module mux2_1
#(parameter WIDTH=32)
(input logic sel, input logic [WIDTH-1:0] a,b, output logic [WIDTH-1:0] y);

	always @(*)
	begin
		if(sel)
			y = b;
		else
			y = a;
	end

endmodule