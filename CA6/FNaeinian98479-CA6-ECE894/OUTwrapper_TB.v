`timescale 1ns/1ns
module OUTwrapper_TB();
	reg clk=1'b0;
	reg rst=1'b0;
	reg doneFP=1'b0;
	reg resultAccept=1'b0;
	reg[31:0] fpOUT;
	wire [31:0]outBus;
	wire resultReady;
	
	OUTwrapper_TOP X1(clk,rst,doneFP,resultAccept,fpOUT,outBus,resultReady);
	always #5 clk=~clk;
	initial begin
	#3 fpOUT=$random;
	#10 doneFP=1'b1;
	#30 resultAccept=1'b1;
	#20 doneFP=1'b0;
	#3 fpOUT=$random;
	#10 doneFP=1'b1;
	#30 resultAccept=1'b0;
	#20 doneFP=1'b0;
	#200 $stop;
	end
endmodule