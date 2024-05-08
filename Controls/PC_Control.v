module PC_Control ( 
    I, D, T,INR 
); 
input I; 
input [7:0] T, D; 
output INR; 
assign INR = (T[1]); 
endmodule 
