`timescale 1ns/1ns
module counter(input clk, rst, zc,enc ,output reg[2:0] adr);

always@(posedge clk, posedge rst)begin
if(rst)
   adr <= 0;
else
  if(zc)
   adr <= 0;
  else
   adr <= enc ? (adr + 1) : adr;
end

endmodule

