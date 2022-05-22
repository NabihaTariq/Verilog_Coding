`include "include.sv"
interface memory_inter(input clk);
                logic reset;
                logic op;
                logic  [$clog2(`locations)-1:0]addr;	
                logic  [`location_size-1:0] data_in;
                logic  [`location_size-1:0] data_out;
  modport uut (input reset, op, addr, data_in, clk, output data_out);
  modport tb (output reset, op, addr, data_in, input data_out);
  				
endinterface