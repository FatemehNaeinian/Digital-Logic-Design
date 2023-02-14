`timescale 1ns/1ns
module INwrapper_TB();
	reg clk=1'b0;
	reg rst=1'b0;
	reg ldA=1'b0;
	reg ldB=1'b0;
	reg [31:0]inBus;
	reg inReady=1'b0;
	wire [31:0]Areg,Breg;
	INwrapper_TOP X1(inReady,clk,rst,inBus,inAccept,startFP,Areg,Breg);
	always #5 clk=~clk;
	initial begin
	#3 inBus=$random;
	#10 inReady=1'b1;
	#10 inReady=0;
	#30 inBus=$random;
	#10 inReady=1'b1;
	#10 inReady=1'b0;
	#100 $stop;
	end
endmodule