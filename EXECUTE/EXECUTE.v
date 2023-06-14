module EXECUTE (
    input [31:0] in1,in2, 
    input [3:0] DE_control,
    output reg [31:0] EM_Result,
    output reg EM_zero_flag
);
    always @(*)
    begin
        // Operating based on control input
        case(DE_control)

        4'b0000: EM_Result = in1&in2;
        4'b0001: EM_Result = in1|in2;
        4'b0010: EM_Result = in1+in2;
        4'b0100: EM_Result = in1-in2;
        4'b1000: begin 
            if(in1<in2)
            EM_Result = 1;
            else
            EM_Result = 0;
        end
        4'b0011: EM_Result = in1<<in2;
        4'b0101: EM_Result = in1>>in2;
        4'b0110: EM_Result = in1*in2;
        4'b0111: EM_Result = in1^in2;

        endcase

        // Setting Zero_flag if ALU_result is zero
        if (EM_Result == 0)
            EM_zero_flag = 1'b1;
        else
            EM_zero_flag = 1'b0;
        
    end
endmodule