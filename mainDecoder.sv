module mainDecoder(input logic [5:0] opcode,
						 output logic memtoreg, 
						 memwrite,
						 branch,
						 alusrc,
						 regdst,
						 regwrite,
						 output logic [1:0] aluop);

	always @(*)
		begin
			case(opcode)
				6'b000000:
					begin
						regwrite = 1;
						regdst = 1;
						alusrc = 0;
						branch = 0;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b10;
					end
				6'b100011:
					begin
						regwrite = 1;
						regdst = 0;
						alusrc = 1;
						branch = 0;
						memwrite = 0;
						memtoreg = 1;
						aluop = 2'b00;
					end
				6'b101011:
					begin
						regwrite = 0;
						regdst = 0;
						alusrc = 1;
						branch = 0;
						memwrite = 1;
						memtoreg = 0;
						aluop = 2'b00;
					end
				6'b000100:
					begin
						regwrite = 0;
						regdst = 0;
						alusrc = 0;
						branch = 1;
						memwrite = 0;
						memtoreg = 0;
						aluop = 2'b01;
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
					end
			endcase
		end
endmodule			 