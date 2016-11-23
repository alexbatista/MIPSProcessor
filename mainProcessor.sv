module mainProcessor(input clk,reset);

logic [31:0] pc_in, pc_out, pc_mux_out, inst_mem_out, se_im_out, rf_out1,rf_out2, alu_out, dm_out, mux_alu_out,mux_data_memory_out,shift_out, sum_Pcbranch_out;
logic [4:0] writeReg_out;
logic [2:0] control;
logic en, ovf,ovf2, zero, WE3,we;

//SINAIS DE CONTROLE AINDA NAO ESTAO CONFIGURADOS PARA NENHUMA ENTRADA DOS BLOCOS

mux2_1 PCMux(control,pc_in,sum_Pcbranch_out,pc_mux_out);

register PC(pc_mux_out,clk,reset,en,pc_out);

fullAdder PCPlus4(pc_out,32'd4,ovf,pc_in);

single_port_rom Instruction_Memory(pc_out,clk,inst_mem_out);

registerFile Register_File(inst_mem_out[25:21],inst_mem_out[20:16],writeReg_out,mux_data_memory_out, clk,WE3, rf_out1,rf_out2); 

mux2_1 #(5) WriteReg (control,inst_mem_out[20:16],inst_mem_out[15:11],writeReg_out);

signExtend IM_out(inst_mem_out[15:0],se_im_out);

mux2_1 Mux_Alu(control,rf_out2,se_im_out, mux_alu_out);

alu ALU(rf_out1,mux_alu_out,control,alu_out,zero); //1. falta and com a saida zero da ALU e sinal Branch - 2. DUVIDA SOBRE O QUE POR NA SAIDA ZERO

single_port_ram Data_Memory(alu_out,rf_out2, we, clk,dm_out); //Verificar codigo interno. Are you sure? Yes or No

mux2_1 Mux_Data_Memory(control,alu_out,dm_out,mux_data_memory_out);

shiftLeft Shift(se_im_out,shift_out);

fullAdder PCBranch(shift_out,pc_in,ovf2,sum_Pcbranch_out);

endmodule