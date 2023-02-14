`timescale 1ns/1ns
module shr(input si,clk,output [7:0]so);
wire [8:0]y;
assign y[8]=si;

genvar b;
generate 
	for(b=8;b>0;b=b-1) begin
		dlatch U(y[b],clk,y[b-1]);
	end
endgenerate
assign so[7:0]=y[7:0];
endmodule
