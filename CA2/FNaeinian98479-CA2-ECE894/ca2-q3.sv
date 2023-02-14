`timescale 1ns/1ns
module mux16to1(input [0:15]A , [3:0]s, output w);
wire OUT1,OUT2,OUT3,OUT4;
mux41  T1(A[0],A[1],A[2],A[3],{s[1],s[0]},OUT1);
mux41  T2(A[4],A[5],A[6],A[7],{s[1],s[0]},OUT2);
mux41  T3(A[8],A[9],A[10],A[11],{s[1],s[0]},OUT3);
mux41  T4(A[12],A[13],A[14],A[15],{s[1],s[0]},OUT4);
mux41  T5(OUT1,OUT2,OUT3,OUT4,{s[3],s[2]},w);
endmodule