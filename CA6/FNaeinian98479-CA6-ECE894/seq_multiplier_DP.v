module seq_multiplier_DP(input clk,rst,loadA,loadB,loadP,shiftA,initP,Bsel,input[23:0]Abus,Bbus,output [47:0]resultbus,output A0);
	reg [23:0]Areg,Breg,Preg;
	wire [23:0] BAnd;
	wire [24:0] Addbus;

	always @(posedge clk,posedge rst)begin
		if (rst) Breg <= 24'b0;
		else if(loadB) Breg <= Bbus;
	end


	always @(posedge clk,posedge rst)begin
		if (rst) Preg <= 24'b0;
		else begin
			if(initP)Preg <=24'b0;
			else if(loadP) Preg <= Addbus[24:1];
		end
	end

	always @(posedge clk,posedge rst)begin
		if (rst) Areg <= 24'b0;
		else begin
			if(loadA) Areg <=Abus;
			else if(shiftA) Areg <= {Addbus[0],Areg[23:1]};
		end
	end

	assign BAnd=Bsel? Breg:24'b0;
	assign Addbus=BAnd + Preg ;
	assign resultbus = {Preg ,Areg} ;
	assign A0=Areg[0];

endmodule
