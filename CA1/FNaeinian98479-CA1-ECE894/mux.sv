`timescale 1ns/1ns
module mux (input a,b,c,d,s0,s1,output w);
wire j,i,k,o,r,e,q,t,u,y;
NAND_GATE N1(.a(s0),.b(s0),.w(i));
NAND_GATE N2(.a(s1),.b(s1),.w(k));
NAND_GATE N3(.a(a),.b(i),.w(j));
NAND_GATE N4(.a(b),.b(s0),.w(o));
NAND_GATE N5(.a(c),.b(i),.w(r));
NAND_GATE N6(.a(d),.b(s0),.w(e));
NAND_GATE N7(.a(j),.b(o),.w(q));
NAND_GATE N8(.a(r),.b(e),.w(t));
NAND_GATE N9(.a(q),.b(k),.w(u));
NAND_GATE N10(.a(t),.b(s1),.w(y));
NAND_GATE N11(.a(u),.b(y),.w(w));
endmodule
