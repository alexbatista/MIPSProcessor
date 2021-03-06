// Quartus Prime Verilog Template
// Single Port ROM

module single_port_rom
(
	input [31:0] addr,
	input clk, 
	output reg [31:0] q
);

	// Declare the ROM variable
	reg [31:0] rom[31:0];

	// Initialize the ROM with $readmemb.  Put the memory contents
	// in the file single_port_rom_init.txt.  Without this file,
	// this design will not compile.

	// See Verilog LRM 1364-2001 Section 17.2.8 for details on the
	// format of this file, or see the "Using $readmemb and $readmemh"
	// template later in this section.

	initial
	begin
		$readmemh("single_port_rom_init.txt", rom);
	end

	always @ (*)
	begin
		q <= rom[addr];
	end

endmodule 