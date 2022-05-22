module memory_testbench;
  bit clk;
  always #10 clk=~clk;
  memory_inter pro_tb(clk);
  memory dut(.pro(pro_tb)
            );
  //initial block
  initial begin
    pro_tb.uut.reset=1;
    #30
    pro_tb.uut.reset=0;
  end
  //read or write
  initial begin
    #30
    write();
    #30
    write();
        #30
    write();
    #30
    write();
        #30
    write();
    #30
    write();
        #30
    write();
        #30
    write();
    #30
    write();
        #30
    write();
    #30
    write();
        #30
    fetch();
    #30
    write();
  end
  //task 
  task fetch();
        begin
          pro_tb.uut.op=0;
          pro_tb.uut.data_in=$random;
          pro_tb.uut.addr=$random;
        end  
      endtask
     
  task write();
        begin
          pro_tb.uut.op=1;
          pro_tb.uut.data_in=$random;
          pro_tb.uut.addr=$random;
        end  
      endtask
  //dumpfile
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars();
      #500
      $finish;
    end
endmodule