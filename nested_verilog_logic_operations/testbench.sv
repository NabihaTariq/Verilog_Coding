module tb;
  reg inp_1;
  reg inp_2;
  reg [2:0] op_cntrl;
  reg reset;
  wire out;
  //instatntiation
  logic_operations log_op(inp_1, inp_2, op_cntrl, reset, out);
  //initial block
  initial
    begin
      reset<=1;
      #10
      reset<=0;
      inp_1<=1;
      inp_2<=0;
      op_cntrl<=0;
       #10
      reset<=0;
      inp_1<=1;
      inp_2<=0;
      op_cntrl<=1;
     
     
    end
  //dumpfile
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #100
      $finish;
    end
endmodule