`timescale 1ns/1ns
module controller(input clk, rst, start, ready,check_less,
                     output reg done, mult_1, mult_2, ldt, ldx, ldr,one_t,one_r,zc, enc,zarb_done);
reg [2:0]ps,ns;
parameter [2:0] idle = 0,init = 1,mult1 = 2,mult2 = 3, add = 4;
always@(ps , start,ready, check_less)begin
ns = idle;
   case(ps) 
       idle:
           ns = start ? init : idle;
       init:
           ns = ready ? init : mult1;
       mult1:
           ns = mult2;
       mult2:
           ns = add;
       add:
           ns = check_less ? idle : mult1;
    endcase
end

always@(ps , check_less, start, ready)begin
done = 1'b0; ldt = 1'b0; ldr = 1'b0;ldx = 1'b0;
mult_1 = 1'b0; mult_2 = 1'b0;zc = 1'b0; enc = 1'b0;
one_t = 1'b0 ; one_r = 1'b0;zarb_done = 1'b0;
   case(ps) 
       idle:
           done = 1'b1;

       init:
           begin
             ldt = 1;
             ldr = 1;
	     ldx = 1;
	     zc = 1;
	     one_t = 1;
 	     one_r = 1;
           end

       mult1:
           begin
             ldt = 1;
             mult_1 = 1;
           end

       mult2:
           begin
             ldt = 1;
             mult_2 = 1;
           end

       add:
           begin
 	     zarb_done = 1'b1;
             enc = 1;
             ldr = 1;
           end
    endcase
end

always@(posedge clk , posedge rst)begin
      if(rst)
         ps <= idle;
      else
         ps <= ns;
end
endmodule

