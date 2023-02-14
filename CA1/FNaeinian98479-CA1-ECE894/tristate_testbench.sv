`timescale 1ns/1ns
module tristate_testbench();
  logic aa=1; 
  logic bb=1;

  tristate UUT(aa,bb,ww);
  initial begin
  #20 aa=0;
  #20 aa=1;
  #20 bb=1;
  #20 aa=1;
  #20 aa=0;
  #20 bb=1;
  #20 bb=0;
  #20 bb=1;
  #40   $stop;
  end 
endmodule
