module counter_fsm(input  act,
                  input  up_down,
                  input  reset,
                  input clk,
                   output  overflow,
                   output [3:0] count
                  );
  localparam idle=4'b0001,
             cntup=4'b0010,
             cntdn=4'b0100,
             ovflw=4'b1000;
  reg [3:0]temp_out;
  reg[3:0] current_state;
  reg[3:0] next_state;
  always @ (posedge clk)
    begin
      if(reset)
        current_state<=idle;
      else 
        current_state<=next_state;
    end
  
  always @ (act, up_down, current_state)
    begin
      case(current_state)
    idle: begin
      if(act && up_down)
        next_state<=cntup;
      else if(act && ~up_down)
        next_state<=cntdn;
      else
        next_state<=idle;
    end
    cntup: begin
      if(~act)
        next_state<=idle;
      if(act && up_down)
        next_state<=cntup;
      if(act && ~up_down)
        next_state<=cntdn;
      else if(count==15)
        next_state<=ovflw;
    end
      cntdn: begin
        if(~act)
        next_state<=idle;
        if(act && up_down)
        next_state<=cntup;
        if(act && ~up_down)
        next_state<=cntdn;
        else if(count==0)
        next_state<=ovflw;
      end
        ovflw: begin
          next_state<=ovflw;
        end
        default: next_state<=idle;
      endcase
    end
  //output
  assign overflow= (current_state==ovflw) ? 1 : 0;
  //out count
  always @ (posedge clk, current_state)
    begin
      case(current_state)
        idle: begin
          temp_out<=0;
        end
        cntup: begin
          temp_out<=temp_out+1;
        end
        cntdn: begin
          temp_out<=temp_out-1;
        end
        ovflw: begin
          temp_out<=temp_out;
        end
        default:temp_out<=0;
      endcase
    end
  assign count=temp_out;
endmodule