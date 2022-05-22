module tb_D_flipflop();
  reg [7:0]inp1;
  reg inp2; 
  reg inp3;
  wire [7:0]out1;
  wire [7:0]out2;
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