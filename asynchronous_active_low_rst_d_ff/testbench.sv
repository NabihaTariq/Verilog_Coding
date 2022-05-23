module tb_dflipflop();
  reg inp1;
  reg inp2;
  reg inp3;
  wire out1, out2;
  //instantiation
  D_flipflop dff(.D(inp1),
                 .clk(inp2),
                 .reset(inp3),
                 .Q(out1),
                 .Qbar(out2)
                );
  always #10 inp2 = ~inp2;
  initial
    begin
      inp2=0; //clk
      inp3<=0; //reset
      #10
      inp3<=1;
      repeat(10) @ (posedge inp2)
      begin
      inp1=$random;
      end
      inp3<=0;
    end
  initial
begin
  $dumpfile("dump.vcd");
  $dumpvars();
  #150
  $finish;
end
endmodule