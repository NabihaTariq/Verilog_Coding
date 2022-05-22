module tb_D_flipflop();
  reg inp1;
  reg inp2; //0,1,x,z=clk if any signal is reg
  reg inp3;
  wire out1;
  wire out2;
  D_flip_flop dff(.D(inp1),
                  .clk(inp2),
                  .reset(inp3),
                  .Q(out1),
                  .Qbar(out2)
                 );
  //clk signal
  always #5 inp2 = ~inp2;
  initial
    begin
  /*  inp1=1;
    inp2=1;
    inp3=1;
    #10*/
      inp2=0;
      inp3<=1;
      #10
      inp3<=0;
      repeat(10) @ (negedge inp2)
      begin
      inp1=$random;
      end
      inp3<=1;
    end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars();
    #150
    $finish;
  end
endmodule