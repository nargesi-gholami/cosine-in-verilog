`timescale 1ns/1ns
module datapath(input clk, res, ldx, ldt, ldr, enc, mult_1, mult_2,zc,one_t,one_r,zarb_done,
            input[7:0] y,input[9:0] x,output check_less,output wire[9:0] result);
wire [7:0] xo,x1,temp_o, temp_i;
wire [2:0] adr;
wire [7:0] data;
wire [9:0] res_in,res_o;
wire[7:0] xi = x[7:0];


register regx2(.clk(clk), .rst(res),.ldx(ldx),.one(1'b0), .x(xi*xi), .xo(xo));

counter count(.clk(clk), .rst(res), .zc(zc), .enc(enc), .adr(adr));

ROM rom(.adr(adr), .data(data));

mux mux2(.xo(xo), .data(data), .mult_1(mult_1),.mult_2(mult_2), .x1(x1));

multiplier m(.x1(x1), .temp_o(temp_o), .temp_i(temp_i));

register regt(.clk(clk), .rst(res),.ldx(ldt),.one(one_t),.x(temp_i), .xo(temp_o));

adder add(.result(res_o), .x({2'b00,temp_o}),.zarb(zarb_done),.count(adr),.res(res_in));

register10 regr(clk, res, ldr,one_r, res_in, res_o);

comparator comp(y,res_o, check_less);

assign result =  res_o;

endmodule
