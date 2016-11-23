module registerFile
#(WIDTH=32)
(input logic [4:0] A1, A2, A3, input logic [WIDTH-1:0] WD3, input clk,we3, output logic [WIDTH-1:0] RD1, RD2);

	reg[WIDTH-1:0] ram [WIDTH-1:0];
	
	always @(posedge clk)
	begin
		RD1 <= ram[A1];
		RD2 <= ram[A2];
		if(we3)
		begin
			ram[A3] <= WD3;
		end
	end
	
endmodule