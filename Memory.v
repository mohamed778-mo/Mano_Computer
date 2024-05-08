module MEM_Control( 
 input  I, 
 input [7:0] T, D, 
 output wire R 
); 
assign R = (T[1]) | (~D[7] & I & T[3]) | ((D[2] | D[1] | D[0]) & T[4]) | (D[5] & T[4]);  
endmodule 
