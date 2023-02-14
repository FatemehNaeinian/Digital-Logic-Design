`timescale 1ns/1ns
module faddertt();
logic a=0,b=0,c=0;
fulladder UT(a,b,c,co,ww);
initial begin
#100 a=1;
#100 a=0;
#100 b=1;
#100 a=1;
#100 c=1;
#100 a=0;
#100 b=0;
#100 a=1;
#100 c=0;
#100 $stop;
end
endmodule
