module 	seq_multiplier_TOP (input clk,rst,start,input [23:0]A,B ,output [47:0]resultbus, output ready);
	wire A0;
	wire loadA,shiftA,loadP,initP,Bsel;

	seq_multiplier_DP dp(clk,rst,loadA,loadB,loadP,shiftA,initP,Bsel,A,B,resultbus,A0);
	seq_multiplier_CONTROL cu(clk,rst,start,A0,loadA,shiftA,loadB,loadP,initP,Bsel,ready);
endmodule
