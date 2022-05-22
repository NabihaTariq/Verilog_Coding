module mux_2x1(input i0,
               input i1,
               input select,
               output result
              );
  assign result= select ? i0 : i1;
endmodule