`timescale 1ns/1ns
module fp_multiplier_DP(input [31:0]Abus,Bbus,input ci,clk,rst,ldA,ldB,ldR,initR,output[7:0]EXPout);
	reg [31:0]Areg,Breg;
	wire [8:0]Rbus;
	reg [8:0]Rreg;
	always@(posedge clk,posedge rst)begin
		if(rst) Areg<=32'd0;
		else if(ldA) Areg<=Abus;
	end
	always@(posedge clk,posedge rst)begin
		if(rst) Breg<=32'd0;
		else if(ldB) Breg<=Bbus;
	end
	assign Rbus={1'b0,Areg[30:23]}+{1'b0,Breg[30:23]};
	always@(posedge clk,posedge rst)begin
		if(rst) Rreg<=9'd0;
		else begin
			if(initR) Rreg<=9'd0;
			else if(ldR) Rreg<=Rbus;
		end
	end
	assign EXPout=Rreg[7:0]+ci+8'b10000001;
endmodule