`timescale 1ns/1ns
module INwrapper_TOP(input inReady,clk,rst,input [31:0]inBus,output inAccept,startFP,output[31:0]Areg,Breg);
	wire ldA,ldB;
	INwrapper_DP X1(clk,rst,ldA,ldB,inBus,Areg,Breg);
	INwrapper_CONTROL Y1(clk,rst,inReady,startFP,inAccept,ldA,ldB);
endmodule
