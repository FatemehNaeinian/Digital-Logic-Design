`timescale 1ns/1ns
module shrrmsdtt();
logic si=0;
logic r=0;
logic clk=0;
wire [7:0]qq;
shrrmsd T(si,clk,r,qq);
always #100 clk <= ~clk;
initial begin
repeat(30) #200 si=$random();
#200 r=1;
#500 $stop;
end
endmodule