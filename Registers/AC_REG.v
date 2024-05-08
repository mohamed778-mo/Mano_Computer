module AC_Reg( 
    input INR,clk ,LD,CLR
    
    ,input[7:0] in 
    ,output reg [7:0] out_ac 
    
) ; 

initial begin 
     out_ac=8'hac; 
 
 end 
 

    always @(posedge clk ) begin 
         if(CLR) begin out_ac<=8'b0; end
         else if (LD) begin out_ac <=in; end
         else if (INR) begin  out_ac<=out_ac+1; end
 
    end
endmodule
