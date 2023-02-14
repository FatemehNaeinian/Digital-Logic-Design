module rmsd(input d,r,clk,output q);
wire j;
and (j,d,~r);
msd t(j,clk,q);
endmodule
