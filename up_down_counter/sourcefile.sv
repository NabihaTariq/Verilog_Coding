module counter(input wire clk,
              input wire rst,
              input wire enable,
               input wire up_down,
               input wire count_load,
               input wire[3:0] load_value,
               output wire [3:0] count
              );
  reg [3:0] temp_out;
  always@(posedge clk)
    begin
      if(rst)//or rst==1
        temp_out<=0;
      else if(count_load)
        temp_out=load_value;
      else if(enable)
        begin
          if(up_down)
            temp_out<=temp_out+1;
      else if(~up_down)
        temp_out<=temp_out-1;
    end
  else
    temp_out<=temp_out;
  end
  assign count=temp_out;
endmodule