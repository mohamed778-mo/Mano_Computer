module ControlUnit ( 
    input [7:0] T, input [7:0] D ,input I, input [7:0] B, 
    output  LDAC, CLRAC, INRAC,LDAR,RriteMem,LDDR,LDIR,INRPC,CLRSC,
    output [0:2] s, 
    output AND,ADD,LDA,CMA,OR,INC
); 
// AC 
AC_Control my_ac ( 
    .T(T), 
    .D(D), 
    .I(I), 
    .B(B), 
    .LD(LDAC), 
    .CLR(CLRAC), 
    .INR(INRAC) 
); 
//AR 
AR_Control ar(
.I(I),
.T(T),
.D(D),
.LD(LDAR)
) ; 
 //DR OUT
 DR_Control dr ( 
 .T(T),
 .D(D),
 .Load(LDDR)
); 
 //IR
IR_Control  ir ( 
 .T(T),
 .load(LDIR)
); 
 //PC 
 PC_Control  pc ( 
 .T(T),
 .D(D),
 .I(I),
 .INR(INRPC)
); 
//RAM 
 MEM_Control mem ( 
 .I(I), 
 .T(T),  
 .D(D), 
 .R(RriteMem) 
); 
// SC 
SC_Control  sc ( 
 .T(T),
 .D(D),
 .I(I),
 .CLR(CLRSC)
); 
// controlBus 
wire [7:0]x; 
CommonBus_Control commanBus( 
.x(x),  
.D(D), 
.T(T), 
.I(I) 
); 
Selections SELECT( 
    .x(x), 
    .s(s) 
); 
ALU_CONTROL alu ( 
.B(B),  
.D(D), 
.T(T), 
.I(I),
.AND(AND),
.ADD(ADD),
.LDA(LDA),
.CMA(CMA),
.OR(OR),
.INC(INC) 
); 
endmodule 
//  AC_Control 
module AC_Control ( 
    input [7:0] T, input [7:0] D ,input I, input [7:0] B, 
    output  LD,CLR,INR 
); 
assign LD= (T[5]  & (D[0]|D[1]|D[2]) ) | ((D[7] & !I & T[3]) &B[2]) | (D[5]&T[5])|((D[7] & !I & T[3])&B[0]); //B[9]
assign CLR = (D[7] & !I & T[3]) & B[3]; //B[11]
assign INR =0;  //B[5]
endmodule 
//   AR_Control 
module AR_Control(LD, T, D, I); 
 input  I; 
 input [7:0] T, D; 
 output LD; 
 assign LD =((~D[7]) & I & T[3]) | T[2] |T[0];
endmodule 
//   DR_Control 
module DR_Control ( 
    Load,  T, D 
); 
input [7:0] T,D; 
 output Load ; 
 assign Load = (T[4] &(D[0] | D[1] | D[2] )) | (D[5]&T[4]) ; 
endmodule 
// IR_Control 
module IR_Control ( 
    load, T 
); 
input [7:0] T; 
output load; 
assign load=T[1]; 
endmodule 
// PC_Control 
module PC_Control ( 
    I, D, T,INR 
); 
input I; 
input [7:0] T, D; 
output  INR; 
assign INR=(T[1]); 
endmodule 
//CommonBus_Control 
module CommonBus_Control(x, D, T, I); 
 input  I; 
 input [7:0] T, D; 
 output [7:0] x;  
 assign x[0]=0; 
 assign x[1] = (D[4] & T[4]) | (D[5] & T[5]);  //AR  
 assign x[2] = (D[5] & T[4]) | T[0];  //PC  
 assign x[3] = (T[6] & D[6]) |(T[5] & D[2]);     //DR  
 assign x[4] = (D[3] & T[4]);     //AC  
 assign x[5] = T[2] ;   
 assign x[6] =0;       
 assign x[7] = T[1] | ((~D[7]) & I & T[3]) | ((D[0] | D[1] | D[2] |D[6]) & T[4]) | (D[5]&T[4]);   // M[AR]   
endmodule 
////////////////////////
module Selections ( 
 input [7:0]x, 
 output [2:0]s 
); 
assign s[0]=x[1] | x[3] | x[5] | x[7]; 
assign s[1]=x[2] | x[3] | x[6] | x[7]; 
assign s[2]=x[4] | x[5] | x[6] | x[7]; 
endmodule 
// ram_control 
module MEM_Control( 
 input  I, 
 input [7:0] T, D, 
 output wire R 
); 
 assign R = (T[1]) | (~D[7] & I & T[3]) | ((D[2] | D[1] | D[0]) & T[4]) | (D[5]&T[4]);  
endmodule 
// rest of instruction_control 
module ALU_CONTROL ( 
 T, D, I,B ,
AND,ADD,LDA,CMA,OR,INC
); 
input  I; 
input [7:0] T, D ; 
input [7:0] B; 
output AND,ADD,LDA,CMA,OR,INC  ; 
assign AND= D[0] & T[5]; 
assign ADD= D[1] & T[5]; 
assign LDA= D[2] & T[5]; 
assign CMA= (D[7] & !I & T[3]) & B[2]; 
assign OR= D[5]& T[5];    
assign INC=  (D[7] & !I & T[3]) & B[0];         
endmodule 
// sc_Control 
module SC_Control ( 
   T, D, I,CLR 
); 
input  I; 
input [7:0] T, D; 
output  CLR; 
 
assign CLR=((D[7] & ~I & T[3])|((D[0]|D[1]|D[2]|(D[5]))&T[5]));

//assign INR=~((D[3]|D[4])&T[4])|(D[7] & ~I & T[3])|((D[0]|D[1]|D[2]|D[5])&T[5]) |(D[6]&T[6]);

endmodule
