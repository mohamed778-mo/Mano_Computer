module PC_Reg( 
    input INR, clk,
    input [3:0] in,
    output reg [3:0] out_pc
); 
initial begin 
    out_pc = 4'h0; 
end 

always @(posedge clk) begin 
    if (INR) begin 
        out_pc <= out_pc + 1; 
    end
end
endmodule
