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

	// Variable to hold the registered read address
	reg [4:0] addr_reg;

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[addr] <= data;

		addr_reg <= addr;
	end

	// Continuous assignment implies read returns NEW data.
	// This is the natural behavior of the TriMatrix memory
	// blocks in Single Port mode.  
	assign q = ram[addr_reg];

endmodule