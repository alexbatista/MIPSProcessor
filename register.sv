module register
#(parameter WIDTH=32)
(input logic [WIDTH-1:0]  d, input logic clk, reset, en, output logic [WIDTH-1:0] q);
	
always @(posedge clk, posedge reset)
begin
	if(reset)
		q <= 32'd0;
	else if(en)
		q<= d;
end

endmodule
