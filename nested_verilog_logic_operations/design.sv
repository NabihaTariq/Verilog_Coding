`include "and.sv"
`include "or.sv"
`include "not.sv"
`include "nor.sv"
`include "nand.sv"
`include "xor.sv"
module logic_operations(input wire inp_1,
                        input wire inp_2,
                        input wire [2:0] op_cntrl,
                        input wire reset,
                        output wire out
                        );
  reg  temp_out;
  wire result_and; //output of and gate
  wire result_or; //output of or gate
  wire result_not; //output of not gate
  wire result_nor; //output of nor gate
  wire result_nand; //output of nand gate
  wire result_xor; //output of xor gate
  
  
  gate_and and_1(.in1(inp_1), .in2(inp_2), .result(result_and));
  gate_or or_1(.in1(inp_1), .in2(inp_2), .result(result_or));
  gate_not not_1(.in1(inp_1), .result(result_not));
  gate_nor nor_1(.in1(inp_1), .in2(inp_2), .result(result_nor));
  gate_nand nand_1(.in1(inp_1), .in2(inp_2), .result(result_nand));
  gate_xor xor_1(.in1(inp_1), .in2(inp_2), .result(result_xor));
  /* if op_cntrl==000 ->AND OPERATION
     if op_cntrl==001 ->OR OPERATION
     if op_cntrl==010 ->NOT OPERATION
     if op_cntrl==011 ->NOR OPERATION
     if op_cntrl==100 ->NAND OPERATION
     if op_cntrl==101 ->XOR OPERATION
   */
  always@(*)
    begin
      if(reset)
        temp_out = 0;
      
      else if(~reset)
        begin
        if(op_cntrl==3'b000)
          temp_out = result_and;
      else if(op_cntrl==3'b001)
        temp_out = result_or;
      else if(op_cntrl==3'b010)
          temp_out = result_not;
      else if(op_cntrl==3'b011)
        temp_out = result_nor;
      else if(op_cntrl==3'b100)
        temp_out = result_nand;
      else if(op_cntrl==3'b101)
          temp_out = result_xor;  
      else
        temp_out=0;
        end
    end
          assign out = temp_out;
  
endmodule


