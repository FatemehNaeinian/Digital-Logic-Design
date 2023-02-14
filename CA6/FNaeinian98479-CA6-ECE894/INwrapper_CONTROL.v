`timescale 1ns/1ns
module INwrapper_CONTROL(input clk,rst,inReady,output startFP,inAccept,ldA,ldB);
	reg startFP_temp,ldA_temp,ldB_temp,inAccept_temp;
	reg[2:0]ns,ps;
	parameter[2:0] Idle1=0,Load1=1,Check1=2,Idle2=3,Load2=4,Check2=5;
	always@(ps,inReady)begin
		ns=Idle1;
		{ldA_temp,ldB_temp,startFP_temp,inAccept_temp}=4'b0;
		case(ps)
		Idle1:ns=inReady?Load1:Idle1;
		Load1:begin ns=Check1; ldA_temp=1'b1; end
		Check1:begin ns=inReady?Check1:Idle2;inAccept_temp=1'b1;end
		Idle2:ns=inReady?Load2:Idle2;
		Load2:begin ns=Check2; ldB_temp=1'b1; end
		Check2:begin ns=inReady?Check2:Idle1;inAccept_temp=1'b1;startFP_temp=1'b1; end
		endcase
	end
	always@(posedge clk,posedge rst)begin
		if(rst) ps<=Idle1;
		else ps<=ns;
	end
	assign startFP=startFP_temp;
	assign ldA=ldA_temp;
	assign ldB=ldB_temp;
	assign inAccept=inAccept_temp;
endmodule