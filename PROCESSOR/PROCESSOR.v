`include "./../DECODE/DECODE.v"
`include "./../EXECUTE/EXECUTE.v"
`include "./../FETCH/FETCH.v"
`include "./../WRITEBACK/WRITEBACK.v"

module PROCESSOR( 
    input clock, 
    input reset,
    output zero
);

    wire [3:0] alu_control;
    wire regwrite;
    

    wire [31:0] FD_Inst_Code;
    wire [3:0] DE_Control;
    wire [31:0] in1;
    wire [31:0] in2;
    wire [4:0] rd;
    wire [31:0] EM_Result;
    wire [7:0] MD_Memory;
    wire [31:0] PC;
    wire [31:0] reg_omemory [10:0];


    FETCH FETCH_mod(clock,reset,MD_Memory,FD_Inst_Code);
    
    DECODE DECODE_mod(clock,FD_Inst_Code,DE_control,in1,in2,rd);
    
    EXECUTE EXECUTE_mod(in1,in2,DE_control,EM_Result,zero);
    
    WRITEBACK WRITEBACK_mod(clock,reset,DE_regwrite,rd,EM_Result,reg_omemory);
    

endmodule