`timescale 1ns/1ns
module ones127(input [126:0]a, output [6:0]w);
integer x=0;
integer i=0;
always @(a) begin
	for(i=0;i<127;i=i+1)begin
		 x=x+a[i];
	end
end

assign #828 w=x;
endmodule
