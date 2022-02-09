`timescale 1ns/1ns
module comparator(input [7:0]y,input[9:0]res_in,output check_less);

assign check_less = (res_in < y) ? 1 : 0;

endmodule
