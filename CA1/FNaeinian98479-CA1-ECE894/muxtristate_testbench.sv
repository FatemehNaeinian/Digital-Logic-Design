`timescale 1ns/1ns
module muxtristate_testbench();
  logic aa=0; 
  logic bb=0;
  logic cc=0;
  logic dd=0;
  logic s1s1=0;
  logic s0s0=0;
  wire ww;
  muxtristate UUT(aa,bb,cc,dd,s0s0,s1s1,ww);
  initial begin
  #100 aa=1;bb=1;cc=1;dd=1;s0s0=1;s1s1=1;
  #100 aa=0;bb=0;cc=0;dd=0;s0s0=0;s1s1=1;
  #100 aa=1;bb=1;cc=0;dd=0;s0s0=0;s1s1=0;
  #100 aa=0;bb=1;cc=0;dd=0;s0s0=0;s1s1=0;
  #100 aa=1;bb=0;cc=1;dd=1;s0s0=1;s1s1=1;
  #100 aa=0;bb=0;cc=1;dd=0;s0s0=0;s1s1=1;
  #100 aa=0;bb=1;cc=1;dd=0;s0s0=0;s1s1=0;
  #100 aa=1;bb=0;cc=0;dd=1;s0s0=1;s1s1=1;
  #100 aa=1;bb=1;cc=0;dd=0;s0s0=0;s1s1=0;
  #100   $stop;
  end 
endmodule