// Quartus Prime Verilog Template
// Single port RAM with single read/write address 

module single_port_ram
#(parameter WIDTH=32) 
(
	input [WIDTH-1:0] addr,
	input [WIDTH-1:0] data,
	input we, clk,
	output [WIDTH-1:0] q
);

	// Declare the RAM variable
	reg [31:0] ram[31:0];


	always @ (posedge clk)
	begin
		// Write
		if (we)
		begin
			ram[addr] <= data;
		end
	
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = ram[addr];

endmodule