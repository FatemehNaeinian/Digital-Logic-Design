`timescale 1ns/1ns
module INwrapper_DP(input clk,rst,ldA,ldB,input [31:0]inBus,output[31:0] Areg,Breg);
	reg[31:0] Areg_temp,Breg_temp;
	always @(posedge clk,posedge rst) begin
		if(rst) Areg_temp<=32'd0;
		else if(ldA) Areg_temp<=inBus;
	end
	always @(posedge clk,posedge rst) begin
		if(rst) Breg_temp<=32'd0;
		else if(ldB) Breg_temp<=inBus;
	end
	assign Areg=Areg_temp;
	assign Breg=Breg_temp;
endmodule