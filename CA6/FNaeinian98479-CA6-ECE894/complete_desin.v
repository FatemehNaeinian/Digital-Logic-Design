`timescale 1ns/1ns
module complete_design(input clk,rst,inReady,resultAccepted,input[31:0]inBus,output[31:0]outBus,output inAccept,resultReady);
	wire startFP,doneFP;
	wire [31:0]A,B;
	wire[31:0]fpOUT;	
	INwrapper_TOP Y1(inReady,clk,rst,inBus,inAccept,startFP,A,B);
	fp_multiplier_TOP X1(clk,rst,startFP,A,B,doneFP,fpOUT);
	OUTwrapper_TOP Z1(clk,rst,doneFP,resultAccept,fpOUT,outBus,resultReady);
endmodule