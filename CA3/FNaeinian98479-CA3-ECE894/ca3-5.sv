`timescale 1ns/1ns
module tt127one();
logic [126:0]aa=127'b0;
wire [6:0]w;
adder127taei u(aa,w);
initial begin
#1000 aa[0]=1;

repeat(254) begin #1000 aa={~aa[0],aa[126:1]};
end 
#1000 $stop;
end
endmodule