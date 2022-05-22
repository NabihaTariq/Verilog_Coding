module memory_register(input [4:0]readreg1,
                       input [4:0] readreg2,
                       input[4:0] writereg,
                       input[31:0] data,
                       input clk,
                       input clr,
                       input regwrite,
                       output[31:0] read1,
                       output[31:0] read2
                      );
  reg[31:0] memory_reg[32];
  always @ (negedge clk)
    begin
      if(clr) begin
        for(int i=0; i<=32; i++)
        memory_reg[i]<=0;
      end
      else if(regwrite)
        memory_reg[writereg]<=data;
      else
        memory_reg[writereg]<=0;
    end
  assign read1= memory_reg[readreg1];
  assign read2= memory_reg[readreg2];
  
endmodule