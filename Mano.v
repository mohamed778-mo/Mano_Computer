module mano_all(
  input CLK ,
  output E,
  output[7:0]MEM,IR,DR,AC,SC,
  output[3:0]AR,PC
  );
  
  // Inputs
  wire [7:0] T;
  wire [7:0] D;
  wire I;
  wire [7:0] B;
  reg cin;
  // Outputs
  wire LDAC, CLRAC, INRAC, LDAR, RriteMem, LDDR, LDIR, INRPC, CLRSC;
  wire [0:2] s;
  wire AND, ADD, LDA, CMA, OR,INC;
  wire [7:0] dr_data,ir_data,ram_data;
  wire [3:0] ar_data, pc_data;
  wire [7:0] adder_out;
  wire [7:0] ac_data;
  wire e_data;
  wire [7:0] out_cb;
  wire [2:0] count;
  
  initial begin cin=0; end
  // Instantiate ControlUnit module
  ControlUnit control_unit_inst (
      .T(T),
      .D(D),
      .I(ir_data[7]),
      .B(ir_data),
      .LDAC(LDAC),
      .CLRAC(CLRAC),
      .INRAC(INRAC),
      .LDAR(LDAR),
      .RriteMem(RriteMem),
      .LDDR(LDDR),
      .LDIR(LDIR),
      .INRPC(INRPC),
      .CLRSC(CLRSC),
      .s(s),
      .AND(AND),
      .ADD(ADD),
      .LDA(LDA),
      .CMA(CMA),
      .OR(OR),
      .INC(INC)
  );
  
  ///////////////////////
  // Inputs
 

  // Instantiate AC_Reg module
  AC_Reg ac_reg_inst (
      .INR(INRAC),
      .clk(CLK),
      .LD(LDAC),
      .CLR(CLRAC),
      .in(adder_out),
      .out_ac(ac_data)

  );
  
  
  
 
  
  // Inputs

  
  
  // Instantiate BUS_SEL module
  BUS_SEL bus_sel_inst (
      .DR(dr_data),
      .AC(ac_data),
      .IR(ir_data),
      .RAM(ram_data),
      .AR(ar_data),
      .PC(pc_data),
      .s(s),
      .OUT(out_cb)
  );
 
 
 // Declare signals
 // Instantiate the AR_Reg module
 AR_Reg AR_Reg_inst (
   
     .clk(CLK),
     .LD(LDAR),
     .in(out_cb[3:0]),
     .out_ar(ar_data)
 );
 
 
 // Instantiate the DR_Reg module
 DR_Reg DR_Reg_inst (
     .clk(CLK),
     .Load(LDDR),
     .in(out_cb),
     .out_dr(dr_data)
 );
 
 // Add your additional code here
 
 
 // Declare signals
 
 
 // Instantiate the IR_Reg module
 IR_Reg IR_Reg_inst (
     .clk(CLK),
     .load(LDIR),
     .in(out_cb),
     .out_ir(ir_data)
 );
 
 // Instantiate the PC_Reg module
 PC_Reg PC_Reg_inst (
     .INR(INRPC),
     .clk(CLK),
     .in(out_cb[3:0]),
     .out_pc(pc_data)
 );
 // Add your additional code here
 
 
 
 
 // Instantiate the RAM_8x4bit module
 RAM_8x4bit RAM_8x4bit_inst (
  
     .R(RriteMem),
     .addr(ar_data),
     .data_in(out_cb),
     .data_out(ram_data)
 );
 
 // Add your additional code here
 
 
 
 // Declare signals
 

 
 // Instantiate the Sequence_Counter3Bit2 module
    Sequence_Counter3Bit2 Sequence_Counter3Bit2_inst (
     .clk(CLK),
     .CLR(CLRSC),
     .count(count) /////////////////////////////////////////////////////////////
 );
 
 // Add your additional code here
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////
 // Declare signals
 
 
 
 // Instantiate the Decoder3x8 module
 Decoder3x8 Decoder3x8_inst (
     .A(count),
     .Y(T)
 );
 
  Decoder3x8 Decoder2_3x8_inst (
     .A(ir_data[6:4]),
     .Y(D)
 );
 
 // Add your additional code here
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
 
 // Declare signals
 

 
 
 // Instantiate the Alu module
 Alu Alu_inst (
     .AND(AND),
     .ADD(ADD),
     .LDA(LDA),
     .CMA(CMA),
     .OR(OR),
     .INC(INC),
     .cin(cin),
     .out_ac(ac_data),
     .out_dr(dr_data),
     .result(adder_out),
     .cout(e_data)
 );
 
 
   assign E=e_data;
 assign MEM=ram_data;
 assign AR=ar_data;
 assign AC=ac_data;
 assign PC=pc_data;
 assign IR=ir_data;
  assign DR=dr_data;
   assign SC=T;
 
 
 
  endmodule