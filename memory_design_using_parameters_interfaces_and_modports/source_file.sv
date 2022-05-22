`include "interface.sv"
module memory(memory_inter pro);
  reg[`location_size-1:0] memory_reg[`locations];
  always @ (posedge pro.clk)
    begin
      if(pro.uut.reset)
        begin
          pro.uut.data_out<=0;
          for(int i=0; i<`locations; i++) begin
            memory_reg[i]<=0;
          end
        end
      else begin
        if(pro.uut.op)
          begin
            memory_reg[pro.uut.addr]<=pro.uut.data_in;
          end
        else begin
          pro.uut.data_out<=memory_reg[pro.uut.addr];
        end
    end
    end
endmodule