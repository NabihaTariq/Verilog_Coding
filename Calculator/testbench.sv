module tb_calculator();
  reg [7:0] inp1;
  reg [7:0] inp2;
  reg [1:0] inp3;
  wire [15:0] out;
  //instantiate
  calculator cal_culator(.first_num(inp1),
               .second_num(inp2),
               .operation(inp3),
               .result(out)
          );
  initial //trigger at zero time
    begin
      inp1 = 200;
      inp2 = 100;
      inp3 = 00;
      
      #10
      inp1 = 230;
      inp2 = 111;
      inp3 = 01;
      
      #10
      inp1 = 202;
      inp2 = 101;
      inp3 = 10;
      
      #10
      inp1 = 210;
      inp2 = 110;
      inp3 = 11;
       
    end
  initial
    begin
      //dump waves
      $dumpfile("dump.vcd");
      $dumpvars();
      #70
      $finish;
    end
endmodule