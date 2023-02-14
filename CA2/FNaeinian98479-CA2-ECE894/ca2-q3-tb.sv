`timescale 1ns/1ns
module mux16to1tb();
logic [15:0]AA=16'b1010101010101010;
logic [3:0]SS=4'b0000;
mux16to1 UUT(AA,SS,W);
initial begin
#160 SS=4'b0001;
#160 SS=4'b0010;
#160 SS=4'b0011;
#160 SS=4'b0100;
#160 SS=4'b0101;
#160 SS=4'b0110;
#160 SS=4'b0111;
#160 SS=4'b1000;
#160 SS=4'b1001;
#160 $stop;
end
endmodule
