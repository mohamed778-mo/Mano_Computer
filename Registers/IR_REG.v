module IR_Reg( 
    input clk, load,
    input [7:0] in,
    output reg [7:0] out_ir
); 
initial begin 
    out_ir = 8'h0; 
end 

always @(posedge clk) begin 
    if (load) begin 
        out_ir <= in; 
    end
end
endmodule
