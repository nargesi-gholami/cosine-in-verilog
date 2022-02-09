`timescale 1ns/1ns
module register(input clk,rst,ldx,one, input[7:0] x,output reg[7:0] xo);

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