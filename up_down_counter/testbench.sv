module tb_counter();
  bit clk;
  reg rst, enable, up_down, count_load;
  reg [3:0] load_value;
  wire [3:0] count;
  //instantiation
  counter up_downcount(clk, rst, enable, up_down, count_load, load_value, count);
  //clk signal
  always #10 clk=~clk;
  //assign values to inputs
  initial
    begin
      rst<=1;
      #10
      rst<=0;
      enable<=1;
      up_down<=0;
      count_load<=0;
      load_value<=1;
      #20
      up_down<=1;
      count_load<=1;
      load_value<=0;
      #20
      rst<=0;
      enable<=1;
      up_down<=1;
      count_load<=0;
      load_value<=1;
      
    end
  //dumpfile
  initial 
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      #800
      $finish;
    end
endmodule