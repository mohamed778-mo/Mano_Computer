module Alu( 
    input wire AND, ADD, LDA, CMA, OR,
    input wire cin,
    input wire [7:0] out_ac, 
    input wire [7:0] out_dr, 
    output reg [7:0] result, 
    output reg cout 
); 
always @(*) begin 
    // AND operation
    if (AND) begin 
        result = out_ac & out_dr;
        cout = 0; 
    end
    // ADD operation
    else if (ADD) begin
        {cout, result} = out_ac + out_dr + cin;
    end
    // LOAD operation
    else if (LDA) begin
        result = out_dr;
        cout = 0; 
    end 
    // OR operation                                      
    else if (OR) begin
        result = out_ac | out_dr;
        cout = 0; 
    end
    // COMPLEMENT operation
    else if (CMA) begin
        result = ~out_ac;
        cout = 0;
    end
    else begin
        result = out_ac;
        cout = 0;
    end
end
endmodule
