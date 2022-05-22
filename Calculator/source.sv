module calculator(input wire [7:0] first_num,
                  input wire [7:0] second_num,
                 
                  //2bits 00=plus; 01=minus; 10=mul; 11=div
                  input wire [1:0] operation,
                  output[15:0] result
                 );
  reg [15:0] temp_out;
  always@(*)
    begin
      if(operation ==2'b0)
        temp_out=first_num + second_num;
      else if(operation==2'b01)
        temp_out= second_num - first_num;
      else if (operation == 2'b10)
        temp_out= first_num * second_num;
      else
        temp_out= first_num / second_num;
    end
  assign result = temp_out;
endmodule
                                    