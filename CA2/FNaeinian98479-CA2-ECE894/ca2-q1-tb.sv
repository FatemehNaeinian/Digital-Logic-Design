`timescale 1ns/1ns
module mux41_testbench();
  logic aa=0,bb=0,cc=0,dd=0,s1s1=0,s0s0=0;
  logic [1:0]ss;
  assign ss={s1s1,s0s0};
  mux41 UUT(aa,bb,cc,dd,ss,ww);
  initial begin
  #100 aa=1;
  #100 aa=0;
  #100 s0s0=1;
  #100 bb=1;
  #100 bb=0;
  #100 s1s1=1;
  #100 dd=1;

  #100   $stop;
  end 
endmodule
