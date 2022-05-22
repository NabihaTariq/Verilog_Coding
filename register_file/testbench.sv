module memory_tb;
  bit clk;
  reg [4:0]readreg1;
  reg[4:0]readreg2;
  reg clr;
  reg regwrite;
  reg [4:0]writereg;
  reg[31:0] data;
  wire [31:0] read1;
  wire [31:0] read2;
  memory_register dut(readreg1, readreg2, writereg, data, clk, clr, regwrite, read1, read2);
  always #10 clk = ~clk;
  initial 
    begin
    clr<=1;
    #10
    clr<=0;
       
      for(int i=0; i<10; i++) @ (posedge clk)
        begin
          readreg1<=$random;
          readreg2<=$random;
          regwrite<=$random;
          writereg<=$random;
          data<=$random;
        end
  end
  
  initial 
    begin
    // commands
    $dumpfile("dump.vcd");
    $dumpvars();
    #1100;
    $finish;
  end
endmodule


