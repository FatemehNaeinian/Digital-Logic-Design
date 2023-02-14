`timescale 1ns/1ns
module shralways(input si,clk,r,output logic [7:0]so);

always @(posedge clk ) begin
	if(r) so <= 8'd0;
	else so<={si,so[7:1]};
end

endmodule
