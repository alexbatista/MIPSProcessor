module mainDecoder(input logic [5:0] opcode,
						 output logic memtoreg, 
						 memwrite,
						 branch,
						 alusrc,
						 regdst,
						 regwrite,
						 jump,
						 output logic [1:0] aluop);

	always @(*)
		begin
			casez(opcode)
				6'b000000:	// R-type
					begin
						regwrite = 1;
						regdst = 1;
						alusrc = 0;
						branch = 0;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b10;
						jump = 0;
					end
				6'b100011:	// lw
					begin
						regwrite = 1;
						regdst = 0;
						alusrc = 1;
						branch = 0;
						memwrite = 0;
						memtoreg = 1;
						aluop = 2'b00;
						jump = 0;
					end
				6'b101011:	// sw
					begin
						regwrite = 0;
						regdst = 0;
						alusrc = 1;
						branch = 0;
						memwrite = 1;
						memtoreg = 0;
						aluop = 2'b00;
						jump = 0;
					end
				6'b00010?:	// beq
					begin
						regwrite = 0;
						regdst = 0;
						alusrc = 0;
						branch = 1;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b01;
						jump = 0;
					end
				6'b001000:	// addi
					begin
						regwrite = 1;
						regdst = 0;
						alusrc = 1;
						branch = 0;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b00;
						jump = 0;
					end
				6'b000010:	// j
					begin
						regwrite = 0;
						regdst = 0;
						alusrc = 0;
						branch = 0;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b00;
						jump = 1;
					end
				6'b001101:	// ori
					begin
						regwrite = 1;
						regdst = 0;
						alusrc = 1;
						branch = 0;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b11;
						jump = 0;
					end
				default:
					begin
						regwrite = 0;
						regdst = 0;
						alusrc = 0;
						branch = 0;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b00;
						jump = 0;
					end
			endcase
		end
endmodule			 