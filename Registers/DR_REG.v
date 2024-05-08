module DR_Reg( 
    input clk, Load,
    input [7:0] in,
    output reg [7:0] out_dr
); 
initial begin 
    out_dr = 8'h63; 
end 

always @(posedge clk) begin 
    if (Load) begin 
        out_dr <= in; 
    end
end
endmodule
