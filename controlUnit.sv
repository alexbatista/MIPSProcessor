module controlUnit(input logic [5:0] funct,
						 op,
						 output logic memtoreg,
						 memwrite,
						 branch,
						 alusrc,
						 regdst,
						 regwrite,
						 jump,
						 output logic [2:0] alucontrol);

	logic [1:0] aluop;
	
	mainDecoder mdec(.opcode(op), .memtoreg(memtoreg), .memwrite(memwrite), .branch(branch),
						  .alusrc(alusrc), .regdst(regdst), .regwrite(regwrite), .aluop(aluop), .jump(jump));
	aluDecoder adec(.funct(funct), .aluop(aluop), .alucontrol(alucontrol));
	
endmodule 