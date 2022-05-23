module tb_fc();
  reg act, up_down, reset;
  bit clk;
  wire [3:0] count;
  wire overflow;
  counter_fsm coun_fs(act, up_down, reset, clk, overflow, count);
  always #5 clk=~clk;
  initial
    begin
      act=0;
      reset=1;
      #10
      act<=1;
      reset<=0; 
      for(int i=0; i<40;i++) @ (negedge clk)
        begin
          up_down=$random;
        end 
    end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #1100
      $finish;
    end
endmodule