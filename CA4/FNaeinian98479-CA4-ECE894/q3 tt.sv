`timescale 1ns/1ns
module dltt();
logic dd=0;
logic clk=0;
wire qq;
dlatch T(dd,clk,qq);
always #50 clk <= ~clk;
initial begin
#100 dd=1;
#100 dd=1;
#100 dd=0;
#100 dd=1;
#100 dd=0;
#100 $stop;
end
endmodule
