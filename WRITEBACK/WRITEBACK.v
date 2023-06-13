module WRITEBACK(
    input clock,
    input reset,
    input DE_regwrite,
    input rd,
    input EM_Result,
    output [31:0] reg_omemory [10:0]
);
 // 32 memory locations each 32 bits wide

        //  When reset is triggered, we initialize the registers with some values
    always @(posedge reset)
    begin
         reg_omemory[0] = 32'h00;
         reg_omemory[1] = 32'h00;
         reg_omemory[2] = 32'h00;
         reg_omemory[3] = 32'h00;
         reg_omemory[4] = 32'h00;
		 reg_omemory[5] = 32'h00;
         reg_omemory[6] = 32'h00;
         reg_omemory[7] = 32'h00;
         reg_omemory[8] = 32'h00;
         reg_omemory[9] = 32'h00;
         reg_omemory[10] = 32'h00;
    end

    // If clock edge is positive and regwrite is 1, we write data to specified register
    always @(posedge clock)
    begin

        if (DE_regwrite) begin
            reg_omemory[rd] = EM_Result;
        end     
    end
endmodule