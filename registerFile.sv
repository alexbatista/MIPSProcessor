module registerFile
#(WIDTH=32)
(input logic [4:0] A1, A2, A3, input logic [WIDTH-1:0] WD3, input clk,we3, output logic [WIDTH-1:0] RD1, RD2);

	reg[WIDTH-1:0] ram [WIDTH-1:0];
	
	always @(*)
	begin
		if(A1 == 5'd0)
			RD1 <= 32'd0;
		else
			RD1 <= ram[A1];
		if(A2 == 5'd0)
			RD2 <= 32'd0;
		else
			RD2 <= ram[A2];
	end
	
	always @(posedge clk)
	begin
		if(we3)
		begin
			ram[A3] <= WD3;
		end
	end
	
endmodule