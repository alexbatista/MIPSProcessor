module register
#(parameter WIDTH=32)
(input logic [WIDTH-1:0]  q, input logic clk, reset, en, output logic [WIDTH-1:0] inst);
	
always @(posedge clk, posedge reset)
begin
	if(reset)
		inst <= 32'd0;
	else if(en)
		inst<= q;
end

endmodule
