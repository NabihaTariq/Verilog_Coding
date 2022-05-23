module gate_not(input in1,
                output result
               );
  reg temp_out;
  always@(*)
    begin
  temp_out = ~in1;
    end
endmodule