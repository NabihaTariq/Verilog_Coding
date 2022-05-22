module seq_dec_1001(input wire clk,
                   input wire reset,
                   input wire inp_1,
                   output wire result
                   );
  //state encoding
  localparam s0 = 3'b000,
             s1 = 3'b001,
             s2 = 3'b010,
             s3 = 3'b011,
             s4 = 3'b100;
  reg[2:0] current_state;
  reg[2:0] next_state;
  //state memory
  always @ (posedge clk)
    begin
      if(reset)
        current_state<=0;
      else
        current_state<=next_state;
    end
  //transition logic
  always @(inp_1 or current_state)
    begin
      case(current_state)
        s0: begin
          if(inp_1==0)
            next_state<=0;
          else
            next_state<=s1;
        end
        s1: begin
          if(inp_1==0)
            next_state<=s2;
          else
            next_state<=s1;
        end
        s2: begin
          if(inp_1==0)
            next_state<=s3;
          else
            next_state<=s1;
        end
        s3: begin
          if(inp_1==0)
            next_state<=s0;
          else
            next_state<=s4;
        end
        s4: begin
          if(inp_1==0)
            next_state<=s2;
          else
            next_state<=s1;
        end
        default: next_state<=s0;
      endcase
    end
  assign result = (current_state==s4)? 1 : 0;
endmodule
  