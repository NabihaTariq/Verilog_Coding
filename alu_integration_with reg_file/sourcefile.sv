`include "register_file.sv"
module processing_unit(input [4:0]readreg1,
                       input [4:0] readreg2,
                       input[4:0] writereg,
                       input[31:0] data,
                       input clk,
                       input clr,
                       input regwrite,
                       output[31:0] a,
                       output[31:0] b,
                       input[2:0] alu_ctrl,
                        output[31:0] result
                      );
  //instantiation
  memory_register pu(.readreg1(readreg1),
                     .readreg2(readreg2),
                     .writereg(writereg),
                     .data(data),
                     .clk(clk),
                     .clr(clr),
                     .regwrite(regwrite),
                     .read1(a),
                     .read2(b)
                     );
  reg[31:0] temp_out;
  always @ (*)
    begin
      case(alu_ctrl)
        3'b000: temp_out<=a+b;
        3'b001: temp_out<=a-b;
        3'b010: temp_out<=a*b;
        3'b011: temp_out<=a/b;
        3'b100: temp_out<=a&b;
        3'b101: temp_out<=~a;
        3'b110: temp_out<=a|b;
        3'b111: temp_out<=a^b;
        default: temp_out<=0;
      endcase
    end
  assign result = temp_out;
endmodule
