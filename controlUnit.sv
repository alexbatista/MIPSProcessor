module controlUnit(input logic [5:0] funct,
						 opcode,
						 output logic memtoreg,
						 memwrite,
						 branch,
						 alusrc,
						 regdst,
						 regwrite,
						 output logic [2:0] alucontrol);

	logic [1:0] aluop;
	
	mainDecoder mdec(.opcode(opcode), .memtoreg(memtoreg), .memwrite(memwrite), .branch(branch),
						  .alusrc(alusrc), .regdst(regdst), .regwrite(regwrite), .aluop(aluop));
	aluDecoder adec(.funct(funct), .aluop(aluop), .alucontrol(alucontrol));
	
endmodule 