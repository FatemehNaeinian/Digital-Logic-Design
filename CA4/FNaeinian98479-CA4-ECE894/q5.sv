`timescale 1ns/1ns
module shrtt();
logic si=0;
logic clk=0;
wire [7:0]qq;
shr T(si,clk,qq);
always #100 clk <= ~clk;
initial begin
repeat(30) #200 si=$random();
#200 $stop;
end
endmodule
