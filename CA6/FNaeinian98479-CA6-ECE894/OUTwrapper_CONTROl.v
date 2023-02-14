`timescale 1ns/1ns
module OUTwrapper_CONTROL(input clk,rst,resultAccept,doneFP,output resultReady,ld);
	reg resultReady_temp,ld_temp;
	reg[1:0]ns,ps;
	parameter[1:0] Idle=0,Load=1,Ready=2;
	always@(doneFP,ps,resultAccept)begin
		ns=Idle;
		{ld_temp,resultReady_temp}=2'b0;
		case(ps)
		Idle:ns=doneFP?Load:Idle;
		Load:begin ns=Ready; ld_temp=1'b1; end
		Ready:begin ns=resultAccept?Idle:Ready; resultReady_temp=1'b1;end
		endcase
	end
	always@(posedge clk,posedge rst) begin
		if(rst) ps<=Idle;
		else ps<=ns;
	end
	assign resultReady=resultReady_temp;
	assign ld=ld_temp;
endmodule