module seq_multiplier_CONTROL(input clk ,rst,start,A0,output reg loadA,shiftA,loadB,loadP,initP,Bsel,ready);
	wire co;
	reg ldcounter,inccounter;
	reg [1:0]ps , ns;
	reg [4:0]count;
	parameter [1:0] Idle=0 , Init=1 , Load=2 , Shift=3;

	always@(ps,start,A0,co) begin
		ns=0;
		{loadA,shiftA,loadB,loadP,initP,Bsel,ready}=7'b0;
		{ldcounter , inccounter}=2'b0;
		case(ps)
			Idle: begin ns= start ? Init : Idle ; ready=1'b1;   end
			Init: begin ns= start ? Init : Load ; ldcounter=1'b1; initP=1'b1;   end
			Load: begin ns= Shift ; loadA=1'b1 ; loadB=1'b1;  end
			Shift: begin ns= co ? Idle : Shift ; loadP=1'b1; shiftA=1'b1; inccounter=1'b1; Bsel=A0;  end
			default: ns=Idle;
		endcase
	end

	always@(posedge clk,posedge rst)begin
		if(rst) ps <= Idle;
		else ps <= ns;
	end

	always@(posedge clk,posedge rst) begin
		if(rst) count <= 5'b0;
		else begin
 			if(ldcounter) count <= 5'd8;
			else if(inccounter) count <=count+1;
		end
	end

	assign co= & {count};

endmodule
