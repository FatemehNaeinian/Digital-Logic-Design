`timescale 1ns/1ns
module ttones127();
logic [126:0]a=127'b0;
wire [6:0]w;
ones127 u(a,w);
initial begin
repeat(10) #1000 a=$random();
#1000 $stop;
end
endmodule
