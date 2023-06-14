module INST_MEM(
    input [31:0] PC,
    input reset,
    input wire clock,
    output reg [7:0] MD_Memory
);
    reg [7:0] Memory [31:0]; // Byte addressable memory with 32 locations

    // Under normal operation (reset = 0), we assign the instr. code, based on PC
    always @(posedge clock) begin
        MD_Memory <= Memory[PC];
    end

    // Initializing memory when reset is one
    always @(reset)
    begin
        // Setting 32-bit instruction: add t1, s0,s1 => 0x00940333 
            Memory[3] = 8'h00;
            Memory[2] = 8'h20;
            Memory[1] = 8'h8b;
            Memory[0] = 8'h33;
            // Setting 32-bit instruction: sub t2, s2, s3 => 0x413903b3
            Memory[7] = 8'h40;
            Memory[6] = 8'h41;
            Memory[5] = 8'h8b;
            Memory[4] = 8'hb3;
            // Setting 32-bit instruction: mul t0, s4, s5 => 0x035a02b3
            Memory[11] = 8'h02;
            Memory[10] = 8'h62;
            Memory[9] = 8'h8c;
            Memory[8] = 8'h33;
            // Setting 32-bit instruction: xor t3, s6, s7 => 0x017b4e33
            Memory[15] = 8'h00;
            Memory[14] = 8'h83;
            Memory[13] = 8'hcc;
            Memory[12] = 8'hb3;
            // Setting 32-bit instruction: sll t4, s8, s9
            Memory[19] = 8'h00;
            Memory[18] = 8'ha4;
            Memory[17] = 8'h9d;
            Memory[16] = 8'h33;
            // Setting 32-bit instruction: srl t5, s10, s11
            Memory[23] = 8'h00;
            Memory[22] = 8'hc5;
            Memory[21] = 8'hdd;
            Memory[20] = 8'hb3;
            // Setting 32-bit instruction: and t6, a2, a3
            Memory[27] = 8'h00;
            Memory[26] = 8'he6;
            Memory[25] = 8'h7e;
            Memory[24] = 8'h33;
            // Setting 32-bit instruction: or a7, a4, a5
            Memory[31] = 8'h01;
            Memory[30] = 8'h07;
            Memory[29] = 8'he8;
            Memory[28] = 8'hb3;
    end

endmodule