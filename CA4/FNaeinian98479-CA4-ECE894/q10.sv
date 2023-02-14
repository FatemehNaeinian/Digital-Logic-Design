module lfsr(input r, clk , output [7:0]po);
wire sii;
assign sii=(((po[0]^po[3])^po[6])^po[7]);
shralways t(~sii,clk,r,po);
endmodule
