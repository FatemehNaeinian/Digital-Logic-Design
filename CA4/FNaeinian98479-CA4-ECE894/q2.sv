`timescale 1ns/1ns
module srltt();
logic rr=0;
logic ss=0;
logic clk=0;
wire qq;
srlatch T(ss,rr,clk,qq);
always #50 clk <= ~clk;
initial begin
#100 ss=1;
#100 rr=1;
#100 ss=0;
#100 ss=1;
#100 rr=0;
#100 ss=0;
#100 rr=1;
#100 ss=1;
#100 ss=0;
#100 rr=0;
#100 $stop;
end
endmodule
