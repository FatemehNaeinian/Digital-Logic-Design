`timescale 1ns/1ns
module muxtristate (input a,b,c,d,s0,s1,output w);
wire h,q,k,o;
supply1 Vdd;
tristate T1(.a(s0),.b(Vdd),.w(q));
tristate T2(.a(a),.b(q),.w(h));
tristate T3(.a(b),.b(s0),.w(h));
tristate T4(.a(c),.b(l),.w(k));
tristate T5(.a(d),.b(s0),.w(k));
tristate T6(.a(s1),.b(Vdd),.w(o));
tristate T7(.a(h),.b(o),.w(w));
tristate T8(.a(k),.b(s1),.w(w));
tristate T9(.a(s0),.b(Vdd),.w(l));
endmodule
