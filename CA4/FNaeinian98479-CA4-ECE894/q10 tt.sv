`timescale 1ns/1ns
module lfsrtt();
logic r=1;
logic clk=0;
wire [7:0]qq;
lfsr T(r,clk,qq);
always #100 clk <= ~clk;
initial begin
#200 r=0;
#50000 $stop;
end
endmodule
