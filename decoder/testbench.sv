module tb_dec();
 reg inp1;
 reg inp2;
 wire out1;
 wire out2;
 wire out3;
 wire out4;
 //instantiate
 decoder dec1(.a(inp1),
 .b(inp2),
 .q0(out1),
 .q1(out2),
 .q2(out3),
 .q3(out4)
 );
 initial //trigger at zero time
 begin
 inp1 = 0;
 inp2 = 0;
 
 #10

 inp1 = 0;
 inp2 = 1;
 
 #10
 inp1 = 1;
 inp2 = 0;
 
 #10
 inp1 = 1;
 inp2 = 1;
 
 end
 initial
 begin
 //dump waves
 $dumpfile("dump.vcd");
 $dumpvars();
 #80
 $finish;
 end
endmodule
 
