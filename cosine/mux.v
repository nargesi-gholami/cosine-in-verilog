`timescale 1ns/1ns
module mux(input[7:0] xo,input[7:0] data,input mult_1, mult_2,output wire[7:0] x1);

assign x1 = mult_1 ? data : mult_2 ? xo : 1;

endmodule
