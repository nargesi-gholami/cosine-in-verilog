`timescale 1ns/1ns
module adder(input [9:0]result, x ,input zarb,input[2:0] count, output[9:0] res);

assign res = zarb ? (count % 2 : (result - x) : (result + x)) : res;

endmodule
