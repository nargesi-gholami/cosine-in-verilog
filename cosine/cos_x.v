`timescale 1ns/1ns
module cos_x(input clk,rst,start,ready, input[7:0] y,input[9:0] x,
             output done, output[1:0] in_result, output [7:0] fra_result);
wire mult_1,mult_2,ldt, ldr, ldx,zc, enc,one_t,one_r;
wire [9:0] result;
wire check_less;

controller c(clk, rst, start, ready,check_less,
                     done, mult_1, mult_2, ldt, ldx, ldr,one_t,one_r,zc, enc,zarb_done);

datapath d(clk, rst, ldx, ldt, ldr, enc, mult_1, mult_2,zc,one_t,one_r,zarb_done,
            y,x, check_less, result);

assign in_result = result[9:8];
assign fra_result = result[7:0];

endmodule
