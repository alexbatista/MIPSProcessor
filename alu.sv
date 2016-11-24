module alu
#(parameter WIDTH=32)
(input logic [WIDTH-1:0] a, input logic [WIDTH-1:0]b, input logic [2:0] sel, output logic [WIDTH-1:0] result, output logic zero);

	logic [31:0] s;
	always @(*)
	begin
		case(sel)
			3'b000: result = a & b;
			3'b001: result = a | b;
			3'b010: result = a + b;
			3'b100: result = a & ~b;
			3'b101: result = a | ~b;
			3'b110: result = a - b;
			3'b111: 
				begin
					s = a - b;
					result = {31'b0,s[31]};
				end
			default: result = 32'd0;
		endcase	
		
		zero = (result == 0);
	end

endmodule