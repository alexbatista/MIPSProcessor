module mainProcessor(input clk,reset, output logic [31:0] result);

logic PCSrc, MemtoReg, MemWrite, Branch, ALUSrc, RegDst, RegWrite, Zero, Jump, Mux_Branch_out;
logic [2:0] ALUControl;
logic [4:0] WriteReg;
logic [31:0] PCPlus4, PCBranch, PC_in, PC_out, Instr, SignImm, SrcA, SrcB, ALUResult, WriteData, ShiftLeft_out, ReadData,
				 Result, Mux_PCSrc_out, ShiftLeftJump_out;

assign result = Result;				 
				 
mux2_1 Mux_PCSrc(.sel(PCSrc), .a(PCPlus4), .b(PCBranch), .y(Mux_PCSrc_out));

mux2_1 Mux_Jump(.sel(Jump), .a(Mux_PCSrc_out), .b({PCPlus4[31:28], ShiftLeftJump_out[27:0]}), .y(PC_in));

register PC(.d(PC_in), .clk(clk), .reset(reset), .en(1'b1), .q(PC_out));
imem InstructionMemory(.a(PC_out[7:2]), .rd(Instr));
assign PCPlus4 = PC_out + 32'd4;


controlUnit ControlUnit(.funct(Instr[5:0]), .op(Instr[31:26]), .memtoreg(MemtoReg), 
								.memwrite(MemWrite), .branch(Branch), .alusrc(ALUSrc), .regdst(RegDst), 
								.regwrite(RegWrite), .alucontrol(ALUControl), .jump(Jump));
registerFile RegisterFile(.A1(Instr[25:21]), .A2(Instr[20:16]), .A3(WriteReg), .WD3(Result), .clk(clk),
								  .we3(RegWrite), .RD1(SrcA), .RD2(WriteData));
mux2_1 #(5) Mux_RegDst(.sel(RegDst), .a(Instr[20:16]),.b(Instr[15:11]), .y(WriteReg));
signExtend SignExtend(.a(Instr[15:0]), .y(SignImm));
shiftLeft ShiftLeftJump(.in({6'b0,Instr[25:0]}), .out(ShiftLeftJump_out));


mux2_1 #(1) Mux_Branch(.sel(Instr[26]), .a(Zero), .b(~Zero), .y(Mux_Branch_out));
assign PCSrc = Branch & Mux_Branch_out;
alu ALU(.a(SrcA), .b(SrcB), .sel(ALUControl), .result(ALUResult), .zero(Zero));
mux2_1 Mux_ALUSrc(.sel(ALUSrc), .a(WriteData), .b(SignImm), .y(SrcB));
shiftLeft ShiftLeft(.in(SignImm), .out(ShiftLeft_out));
assign PCBranch = ShiftLeft_out + PCPlus4;


dmem DataMemory(.a(ALUResult), .wd(WriteData), .we(MemWrite), .clk(clk), .rd(ReadData));
mux2_1 Mux_MemtoReg(.sel(MemtoReg), .a(ALUResult), .b(ReadData), .y(Result));

endmodule 