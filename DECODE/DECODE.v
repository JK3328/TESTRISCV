`include "./../MEMORY/REG_MEM/REG_MEM.v"

module DECODE(
    input clock,
    input [31:0] FD_Inst_Code,
    output reg [3:0] DE_control,
    output [31:0] in1,
    output [31:0] in2,
    output reg [4:0] rd
);
    reg [2:0]funct3;
    reg [6:0]funct7;
    reg [6:0]opcode;
    reg [4:0]rs1;
    reg [4:0]rs2;
    reg DE_regwrite;

      // Assign values to the internal signals within an always block
    always @(posedge clock) begin
        // Decode instruction and assign values to signals
        funct3  = FD_Inst_Code[14:12];
        funct7  = FD_Inst_Code[31:25];
        opcode  = FD_Inst_Code[6:0];
        rs1     = FD_Inst_Code[19:15];
        rs2     = FD_Inst_Code[24:20];
        rd      = FD_Inst_Code[11:7];
    end


    REG_MEM reg_file_module(
    rs1,
    rs2,
    in1,
    in2,
    clock,
    reset
    );


    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions

            DE_regwrite = 1;

            case (funct3)
                0: begin
                    if(funct7 == 0)
                    DE_control = 4'b0010; // ADD
                    else if(funct7 == 32)
                    DE_control = 4'b0100; // SUB
                end
                6: DE_control = 4'b0001; // OR
                7: DE_control = 4'b0000; // AND
                1: DE_control = 4'b0011; // SLL
                5: DE_control = 4'b0101; // SRL
				2: DE_control = 4'b0110; // MUL
				4: DE_control = 4'b0111; // XOR
            endcase

      end

    end

endmodule