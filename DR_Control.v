module DR_Control ( 
    Load,  T, D 
); 
input [7:0] T,D; 
output Load ; 
assign Load = (T[4] & (D[0] | D[1] | D[2])) | (D[5] & T[4]); 
endmodule 
