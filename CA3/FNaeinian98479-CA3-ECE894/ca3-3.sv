`timescale 1ns/1ns
module tbfa();
logic [3:0]aa=4'b0000;
logic [3:0]bb=4'b0000;
logic ci=0;
wire [3:0]si;
wire co;
fadder #4 U(aa,bb,ci,si,co);
initial begin
#100 aa=4'b0001;
#100 bb=4'b0001;
repeat(10) begin #100 aa=$random;
bb=$random;
ci=$random;
end
#100 $stop;
end 
endmodule
