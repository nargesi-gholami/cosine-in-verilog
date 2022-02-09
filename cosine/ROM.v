`timescale 1ns/1ns
module ROM(input[2:0] adr, output [7:0] data);
reg[7:0] d;

  always@(adr)begin
     case(adr)
         0: d = 8'hFF;
         1: d = 8'h80;//1/2
         2: d = 8'h15;//1/12
         3: d = 8'h08;//1/30
         4: d = 8'h04;//1/56
         5: d = 8'h02;//1/90
         6: d = 8'h01;//1/132
     endcase
  end
assign data = d;
endmodule
