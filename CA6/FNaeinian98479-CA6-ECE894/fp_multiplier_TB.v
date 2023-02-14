`timescale 1ns/1ns
module fp_multiplier_TB();
	reg clk=1'b0;
	reg [31:0]A,B;
	reg rst=1'b1;
	reg startFP=1'b0;
	wire doneFP;	
	wire [31:0]fpOUT;
	fp_multiplier_TOP X1(clk,rst,startFP,A,B,doneFP,fpOUT);
	always #50 clk=~clk;
	initial begin
	#60 rst=1'b0;
	#30 A={1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,23'd99999256};
	#30 B={1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,23'd99999256};
	#130 startFP=1'b1;
	#230 startFP=1'b0;
	#5000 $stop;
	end
endmodule