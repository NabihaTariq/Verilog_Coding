module D_flip_flop(input wire D,
                   input wire clk,
                   input wire reset,
                   output reg Q,
                   output wire Qbar
                   );
  always @ (posedge clk)
    begin
      if(reset)
        Q<=1'b0;
      else begin
        Q<=D;
      end    
    end
  assign Qbar = ~Q;
endmodule