module tb();
  reg[7:0] first_num;
  reg[7:0] second_num;
  reg[1:0] operation;
  bit clk;
  reg reset;
  wire[15:0] Q;
  wire[15:0] Qbar;
  //instantiation
  cal_culator calculator(first_num, second_num, operation, clk, reset, Q, Qbar);
  //clk signal
  always #5 clk = ~clk;
 //initial block
  initial
    begin
      reset <= 1;
      #10
      reset <=0;
      first_num <= 220;
      second_num <= 100;
      operation <= 00;
      #10
      first_num <= 211;
      second_num <= 200;
      operation <= 01;
      #10
      first_num <= 200;
      second_num <= 200;
      operation <=10;
    end
  //Dump waves
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #100
      $finish;
    end
endmodule