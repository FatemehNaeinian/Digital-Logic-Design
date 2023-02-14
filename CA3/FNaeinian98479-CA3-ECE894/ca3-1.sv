`timescale 1ns/1ns
module fulladder (input ai,bi,ci,output co,si);
wire n,m,k,i,j,w,t,o,p,u,l;
not #(5,7) T1(m,ai);
not #(5,7) T2(w,bi);
nand #(10,8) T3(i,ai,w);
nand #(10,8) T4(j,m,bi);
nand #(10,8) T5(k,i,j);

not #(5,7) T6(n,ci);
not #(5,7) T7(t,k);
nand #(10,8) T8(l,t,ci);
nand #(10,8) T9(u,n,k);
nand #(10,8) T10(si,u,l);

nand #(10,8) T11(p,ai,bi);
nand #(10,8) T12(o,k,ci);
nand #(10,8) T13(co,p,o);

endmodule
