`timescale 1ns/1ns
module barreltb();
logic aa=0,bb=0,cc=0,dd=0,s1s1=0,s0s0=0;
logic [1:0]ss;
assign ss={s1s1,s0s0};
barrel UUT(aa,bb,cc,dd,ss,sho0,sho1,sho2,sho3);
initial begin
#60 aa=1;
#60 bb=1;
#60 cc=1;
#60 cc=0;
#60 dd=1;
#60 s0s0=1;
#60 s0s0=0;
#60 s1s1=1;
#60 $stop;
end
endmodule
