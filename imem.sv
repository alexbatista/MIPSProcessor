module imem (input [5:0] a,
				 output [31:0] rd);

	reg [31:0] ROM[63:0];
	
	initial
		begin
			$readmemh ("memfile.dat",ROM);
		end
		
	assign rd = ROM[a]; // word aligned
endmodule 