module AC_Control ( 
    input [7:0] T, input [7:0] D ,input I, input [7:0] B, 
    output  LD,CLR,INR 
); 
assign LD = (T[5] & (D[0] | D[1] | D[2])) | ((D[7] & !I & T[3]) & B[2]) | (D[5] & T[5]); //B[9]
assign CLR = (D[7] & !I & T[3]) & B[3]; //B[11]
assign INR = (D[7] & !I & T[3]) & B[0]; //B[5]

endmodule
