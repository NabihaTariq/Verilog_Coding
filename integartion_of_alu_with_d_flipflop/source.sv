module cal_culator(input wire[7:0] first_num,
                  input wire[7:0] second_num,
                  input wire[1:0] operation,
                  input clk,
                  input reset,
                  output reg [15:0] Q,
                  output wire [15:0] Qbar
                 );
  reg[15:0] temp_out;
  always @ (*)
    begin
      if(operation==2'b00)
        temp_out = first_num + second_num;
      else if(operation==2'b01)
        temp_out = first_num - second_num;
      else if(operation==2'b10)
        temp_out = first_num * second_num;
      else
        temp_out = first_num / second_num;
    end
  always @ (posedge clk)
    begin
      if(reset)
        Q<=0;
      else 
        Q<=temp_out;
    end
  assign Qbar = ~Q;
endmodule