`timescale 1ns/1ns
module srlatch(input s,r,clk,output q);
wire s0,r0,clk0,i,j,q0;
nand #8 T1(s0,s,s);
nand #8 T2(r0,r,r);
nand #8 T3(clk0,clk,clk);
nand #8 T4(j,s0,clk0);
nand #8 T5(i,r0,clk0);
nand #8 T6(q0,i,q);
nand #8 T7(q,j,q0);
endmodule
