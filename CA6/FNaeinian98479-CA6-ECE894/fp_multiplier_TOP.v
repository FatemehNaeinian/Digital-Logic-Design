`timescale 1ns/1ns
 module fp_multiplier_TOP(input clk,rst,startFP,input [31:0]A,B,output doneFP,output [31:0]fpOUT);
	wire ldA,ldB,ldR,startMul,doneMul,initR;
	wire [47:0]resultBus;
	wire[7:0]EXPout;
	seq_multiplier_TOP Z1(clk,rst,startMul,{1'b1,A[22:0]},{1'b1,B[22:0]},resultBus,doneMul);
	fp_multiplier_DP X1(A,B,resultBus[47],clk,rst,ldA,ldB,ldR,initR,EXPout);
	fp_multiplier_CONTROL Y1(clk,rst,startFP,doneMul,ldA,ldB,ldR,startMul,doneFP,initR);
	assign fpOUT[22:0]=resultBus[47]?(~rst & resultBus[46:24]):(~rst & resultBus[45:23]);
	assign fpOUT[31:23]={~rst&(A[31]^B[31]),EXPout[7:0]};
endmodule
