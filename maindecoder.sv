module maindec(input logic [5:0] op,
	output logic memtoreg, memwrite,
	output logic branch, bne, alusrc,
	output logic regdst, regwrite,
	output logic jump, lb,
	output logic [1:0] aluop);

logic [10:0] controls;

assign {regwrite, regdst, alusrc, branch, bne,
memwrite, memtoreg, jump, lb, aluop} = controls;

always_comb
case(op)			
	6'b000000: controls <= 11'b1_1000_0000_10; //Rtype
	6'b100011: controls <= 11'b1_0100_0100_00; //LW
	6'b101011: controls <= 11'b0_0100_1000_00; //SW
	6'b000100: controls <= 11'b0_0010_0000_01; //BEQ
	6'b000101: controls <= 11'b0_0001_0000_01; //BNE
	6'b001000: controls <= 11'b1_0100_0000_00; //ADDI
	6'b000010: controls <= 11'b0_0000_0010_00; //J
	6'b100000: controls <= 11'b1_0100_0101_00; //LB
	default: controls <= 11'bxxxxxxxxxxx; //???
endcase
endmodule
