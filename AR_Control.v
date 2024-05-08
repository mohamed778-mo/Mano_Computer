module AR_Control(LD, T, D, I); 
input  I; 
input [7:0] T, D; 
output LD; 
assign LD = (~D[7] & I & T[3]) | T[2];
endmodule 
