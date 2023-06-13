`include "./../MEMORY/INST_MEM/INST_MEM.v"

module FETCH(
    input clock,
    input reset,
    input [7:0] MD_Memory,
    output [31:0] FD_Inst_code
);
reg [31:0] PC = 32'b0;  // 32-bit program counter is initialized to zero

    // Initializing the instruction memory block
    INST_MEM instr_mem(PC,reset,MD_Memory);

    assign FD_Inst_Code = {MD_Memory[PC+3],MD_Memory[PC+2],MD_Memory[PC+1],MD_Memory[PC]};

    always @(posedge clock, posedge reset)
    begin
        if(reset == 1)  //If reset is one, clear the program counter
        PC <= 0;
        else
        PC <= PC+4;   // Increment program counter on positive clock edge
    end

endmodule