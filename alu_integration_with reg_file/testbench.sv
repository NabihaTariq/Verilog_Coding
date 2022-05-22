module tb_pu();
  reg [4:0]readreg1;
  reg [4:0] readreg2;
  reg[4:0] writereg;
  reg[31:0] data;
  bit clk;
  reg clr;
  reg regwrite;
  wire[31:0] a;
  wire[31:0] b;
  reg[2:0] alu_ctrl;
  wire[31:0] result;
  processing_unit dut(readreg1, readreg2, writereg, data, clk, clr, regwrite, a, b, alu_ctrl, result);
  always #10 clk=~clk;
  initial 
    begin
      clr<=1;
      #10
      clr<=0;
      for(int i=0; i<=32; i++) @ (posedge clk)
        begin
          readreg1=$random;
          readreg2=$random;
          writereg=$random;
          data=$random;
          regwrite=1;
          alu_ctrl=$random;
        end  
  end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #900
      $finish;
    end
endmodule