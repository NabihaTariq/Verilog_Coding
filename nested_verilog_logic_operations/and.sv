module gate_and(input in1,
                input  in2,
                output result
               );
  reg temp_out;
  always@(*)
    begin
  temp_out = in1 & in2;
    end
endmodule