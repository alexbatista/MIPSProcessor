module alu
#(parameter WIDTH=32)
(input logic signed [WIDTH-1:0] a, input logic signed [WIDTH-1:0]b, input logic [2:0] sel, output logic [WIDTH-1:0] result, output logic zero);

	always @(*)
	begin
		case(sel)
			3'b000: result = a & b;
			3'b001: result = a | b;
			3'b010: result = a + b;
			3'b100: result = a & ~b;
			3'b101: result = a | ~b;
			3'b110: result = a - b;
			3'b111: result = (a < b) ? 32'd1 : 32'd0;
			default: result = 32'd0;
		endcase	
		
		zero = (result == 0);
	end

endmodule