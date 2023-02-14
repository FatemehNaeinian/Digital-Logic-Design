`timescale 1ns/1ns
module seq_multiplier_TB();
	reg clk=1'b0;
	reg rst=0;
	reg start=0;
	reg [23:0]A;
	reg [23:0]B;
	wire [47:0]resultbus;
	wire ready;
	seq_multiplier_TOP uut(clk,rst,start,A,B,resultbus,ready);
	always #5 clk <= ~clk;
	initial begin
	#3 rst=1;
	#3 rst=0;
	#13 A=24'd2;
	#13 B=24'd2;
	#3 start=1;
	#13 start=0;
	#100 A=24'd5;
	#100 B=24'd5;
	#400 start=1;
	#13 start=0;
	#100 A={1'b1,23'd99999256};
	#100 B={1'b1,23'd99999256};
	#400 start=1;
	#13 start=0;
	#1000 $stop;
	end
endmodule
