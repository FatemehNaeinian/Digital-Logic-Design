`timescale 1ns/1ns
module barrel(input A,B,C,D ,[1:0]s,output sho0,sho1,sho2,sho3 );
mux41  T1(A,B,C,D,s,sho0);
mux41  T2(B,C,D,A,s,sho1);
mux41  T3(C,D,A,B,s,sho2);
mux41  T4(D,A,B,C,s,sho3);
endmodule