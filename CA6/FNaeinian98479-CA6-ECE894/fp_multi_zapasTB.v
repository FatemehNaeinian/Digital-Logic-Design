`timescale 1ns/1ns
module fp_multi_zapasTB();
	reg clk=1'b0;
	reg rst=1'b1;
	reg [31:0]Abus,Bbus;
	reg s=1'b0,ci=1'b0,ldA=1'b0,ldB=1'b0,ldR=1'b0,initR=1'b0;
	wire [7:0]EXPout;
	fp_multiplier_DP X1(Abus,Bbus,s,ci,clk,rst,ldA,ldB,ldR,initR,EXPout);
	always #50 clk=~clk;
	initial begin 
	#30 rst=1'b0;
	#10 Abus={1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,1'b1,1'b0,1'b0,23'd99999256};
	    Bbus={1'b0,1'b1,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b1,23'd99999256};
	#5 ldA=1'b1;ldB=1'b1;
	#100 initR=1'b1;
	#100 initR=1'b0;
	#100 s=1'b0;
	#100 ldR=1'b1;
	#100 ldR=1'b0;
	      s=1'b1;
	#100 ldR=1'b1;
	#100 ldR=1'b0;
	#500 $stop;
	end
endmodule
	
