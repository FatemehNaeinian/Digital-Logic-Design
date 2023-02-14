`timescale 1ns/1ns
module fadder #(parameter k) (a,b,ci,s,co);

input [k-1:0]a,b;
input ci;
output [k-1:0]s;
output co;
assign #(48+36*(k-1)) {co,s}=a+b+ci;

endmodule

