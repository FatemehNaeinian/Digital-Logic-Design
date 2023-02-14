`timescale 1ns/1ns
module fp_multiplier_CONTROL(input clk,rst,startFP,doneMUL,output ldA,ldB,ldR,startMUL,doneFP,initR);
	reg doneFP_temp,ldA_temp,ldB_temp,startMUL_temp,ldR_temp,initR_temp;
	reg [2:0]ns,ps;
	parameter[2:0]Idle=0 ,Load=1 ,Mul=2 ,Waitmul=3 ,Add=4;
	always@(ps,startFP,doneMUL)begin
		ns=Idle;
		{ldA_temp,ldB_temp,ldR_temp,startMUL_temp,doneFP_temp,initR_temp}=7'b0;
		case(ps)
		Idle:begin ns=startFP?Load:Idle; doneFP_temp=1'b1; end
		Load:begin ns=startFP?Load:Mul; ldA_temp=1'b1; ldB_temp=1'b1; end
		Mul:begin ns=Waitmul; startMUL_temp=1'b1; end
		Waitmul:begin ns=doneMUL?Add:Waitmul; initR_temp=1'b1; end
		Add:begin ns=Idle;ldR_temp=1'b1; end
		default: ns=Idle;
		endcase
	end
	always @(posedge clk,posedge rst)begin 
		if(rst) ps<=3'b0;
		else ps<=ns;
	end
	assign ldR=ldR_temp;
	assign ldA=ldA_temp;
	assign ldB=ldB_temp;
	assign startMUL=startMUL_temp;
	assign doneFP=doneFP_temp;
	assign initR=initR_temp;
endmodule
		