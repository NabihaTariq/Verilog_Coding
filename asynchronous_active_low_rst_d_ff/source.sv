module D_flipflop(input wire D,
                  input wire clk,
                  input wire reset,
                  output reg Q,
                  output wire Qbar
                 );
  always@(negedge clk, negedge reset)
    begin
      if(~reset)
        Q<=0;
      else begin
        Q<=D;
        end
    end
assign Qbar=~Q;
endmodule