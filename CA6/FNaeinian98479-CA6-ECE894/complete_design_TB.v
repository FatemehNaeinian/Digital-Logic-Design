`timescale 1ns/1ns
module complete_design_TB();
	reg clk=1'b0;
	reg rst=1'b1;
	reg inReady=1'b0;
	reg resultAccepted=1'b0;
	reg [31:0]inBus;
	wire inAccept,resultReady;	
	wire [31:0]outBus;
	complete_design X1(clk,rst,inReady,resultAccepted,inBus,outBus,inAccept,resultReady);
	always #100 clk=~clk;
	initial begin
	#50 rst=1'b0;
	#200 inBus={1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,23'd99999256};
	#200 inReady=1'b1;
	#200 inReady=1'b0;
	#200 inBus={1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,23'd99999256};
	#200 inReady=1'b1;
	#200 inReady=1'b0;
	#5000 resultAccepted=1'b1;
	#5000 $stop;
	end
endmodule
