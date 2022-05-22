module D_flip_flop(input wire [7:0]D,
                   input wire clk,
                   input wire reset,
                   output reg[7:0] Q,
                   output wire[7:0] Qbar
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