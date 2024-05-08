module BUS_SEL( 
    input [7:0] DR, AC, IR, RAM,
    input [3:0] AR, PC,
    input [2:0] s,
    output [7:0] OUT
); 
wire [7:0] mux_out;   

MUX_8to1 mux_8to1( 
    .d0(8'b0),
    .d1(AR), 
    .d2(PC), 
    .d3(DR), 
    .d4(AC), 
    .d5(IR), 
    .d6(8'b0), 
    .d7(RAM),
    .sel(s), 
    .out(OUT) 
); 
endmodule

module MUX_8to1( 
    input [7:0] d0, d3, d4, d5, d6, d7, // 8-bit input data 
    input [2:0] sel, 
    input [3:0] d2, d1, // Selection input 
    output reg [7:0] out // Output data 
); 
always @* begin 
    case (sel) 
        3'b000: out = d0; 
        3'b001: out = d1; 
        3'b010: out = d2; 
        3'b011: out = d3; 
        3'b100: out = d4; 
        3'b101: out = d5; 
        3'b110: out = d6; 
        3'b111: out = d7; 
    endcase 
end 
endmodule
