module msd(input d,clk,output q);
wire clk0,Q1;
not n(clk0,clk);
dlatch t1(d,clk0,Q1);
dlatch t2(Q1,clk,q);

endmodule
