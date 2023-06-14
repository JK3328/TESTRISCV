module REG_MEM(
    input [4:0] read_reg_num1,
    input [4:0] read_reg_num2,
    output [31:0] read_data1,
    output [31:0] read_data2,
    input clock,
    input reset
);

    reg [31:0] reg_imemory [20:0]; // 32 memory locations each 32 bits wide

    //  When reset is triggered, we initialize the registers with some values
    always @(posedge reset)
    begin
        // Bear with me for now, I tried using loops, but it won't work
        // Just duct-taping this for now
         reg_imemory[0] = 32'h0;
         reg_imemory[1] = 32'h0;
         reg_imemory[2] = 32'h0;
         reg_imemory[3] = 32'h3;
         reg_imemory[4] = 32'h4;
         reg_imemory[5] = 32'h5;
         reg_imemory[6] = 32'h6;
         reg_imemory[7] = 32'h7;
         reg_imemory[8] = 32'h8;
         reg_imemory[9] = 32'h9;
         reg_imemory[10] = 32'h10;
         reg_imemory[12] = 32'h12;
         reg_imemory[13] = 32'h13;
         reg_imemory[14] = 32'h14;
         reg_imemory[15] = 32'h15;
         reg_imemory[17] = 32'h17;
         reg_imemory[18] = 32'h18;
         reg_imemory[19] = 32'h19;
         reg_imemory[20] = 32'h20;
         
    end

    // The register file will always output the vaules corresponding to read register numbers 
    // It is independent of any other signal
    assign read_data1 = reg_imemory[read_reg_num1];
    assign read_data2 = reg_imemory[read_reg_num2];


endmodule