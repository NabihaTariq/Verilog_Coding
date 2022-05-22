module tb_mux();
  reg i0;
  reg i1;
  reg select;
  wire result;
  //instantiation
  mux_2x1 mux(i0, i1, select, result);
  //initial block
  initial 
    begin
      i0=1;
      i1=0;
      select=0;
      #10
      i0=1;
      i1=0;
      select=1;  
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
  