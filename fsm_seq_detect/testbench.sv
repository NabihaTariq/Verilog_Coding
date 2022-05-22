module tb_seq_1001();
  bit clk;
  reg reset,inp_1;
  wire result;
  seq_dec_1001 sd(clk, reset, inp_1, out);
      always #5 clk = ~clk;
  initial
    begin
      reset=1;
      #10 
      reset=0;
      inp_1=1;
      #10
      inp_1=0;
      #10
      inp_1=0;
      #10
      inp_1=1;
      #10
      inp_1=1;
      #10
      inp_1=1;
      #10
      inp_1=0;
      #10
      inp_1=1;
      #20
      reset=1;
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #500
      $finish;
    end
endmodule