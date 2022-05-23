module decoder(input a,
 input b,
 output q0,
 output q1,
 output q2,
 output q3
 );
 assign q0 = ~a & ~b;
 assign q1 = ~a & b;
 assign q2 = a & ~b;
 assign q3 = a & b;
endmodule