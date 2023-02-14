`timescale 1ns/1ns
module tristate (input a,b,output w);
wire j,i,y;
supply1 Vdd;
supply0 Gnd;
pmos #(5,6,7) T1(i,Vdd,a);
pmos #(5,6,7) T2(w,i,y);
nmos #(3,4,5) T3(j,Gnd,a);
nmos #(3,4,5) T4(w,j,b);
pmos #(5,6,7) T5(y,Vdd,b);
nmos #(3,4,5) T6(y,Gnd,b);
endmodule
