`timescale 1ns/1ns
module OUTwrapper_TOP(input clk,rst,doneFP,resultAccept,input[31:0]fpOUT,output [31:0]outBus,output resultReady);
	wire ld;
	OUTwrapper_DP X1(clk,rst,ld,fpOUT,outBus);
	OUTwrapper_CONTROL Y1(clk,rst,resultAccept,doneFP,resultReady,ld);
endmodule
	
