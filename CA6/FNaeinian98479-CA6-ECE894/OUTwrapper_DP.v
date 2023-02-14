`timescale 1ns/1ns
module OUTwrapper_DP(input clk,rst,ld,input [31:0]fpOUT,output[31:0]outBus);
	reg [31:0]outBus_temp;
	always@(posedge clk,posedge rst)begin
		if(rst) outBus_temp<=32'b0;
		else if(ld) outBus_temp=fpOUT;
	end
	assign outBus=outBus_temp;
endmodule