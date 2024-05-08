module SC_Control ( 
   T, D, I,CLR 
); 
input  I; 
input [7:0] T, D; 
output  CLR; 
assign CLR = ((D[7] & (~I) & T[3]) | ((D[0] | D[1] | D[2] | (D[5])) & T[5]) | (D[3] & T[4]) | (D[4] & T[4]) | (D[6] & T[6]));
endmodule
