`timescale 1ns/1ns
module multiplier(input[7:0] x1, temp_o,output[7:0] temp_i);

assign temp_i = temp_o*x1;

endmodule
