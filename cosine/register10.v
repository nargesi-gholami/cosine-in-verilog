`timescale 1ns/1ns
module register10(input clk,input rst,ldx,one,input[9:0] x,output reg[9:0] xo);

always@(posedge clk, posedge rst)begin
if(rst)
   xo <= 0;
else
  if(one)
    xo <= 8'b11111111;
  else
    xo <= ldx ? x : xo;
end

endmodule
