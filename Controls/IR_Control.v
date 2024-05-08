module IR_Control ( 
    load, T 
); 
input [7:0] T; 
output load; 
assign load = T[1]; 
endmodule 
