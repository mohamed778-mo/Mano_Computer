module AR_Reg( 
    input clk, LD,
    input [3:0] in,
    output reg [3:0] out_ar
); 
initial begin 
    out_ar = 4'h0; 
end 

always @(posedge clk) begin 
    if (LD) begin 
        out_ar <= in; 
    end
end
endmodule
