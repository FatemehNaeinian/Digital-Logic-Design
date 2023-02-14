`timescale 1ns/1ns
module dlatch(input d,clk,output q);
wire d0;
not n(d0,d);
srlatch T(d0,d,clk,q);
endmodule
