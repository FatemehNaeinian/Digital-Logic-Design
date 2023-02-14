`timescale 1ns/1ns
module mux41(input a,b,c,d,input [1:0]s,output w);
assign #(35,38)  w=(s==2'b00)?a:
                   (s===2'b01)?b:
                   (s==2'b10)?c:
                   (s==2'b11)?d:1'bx;
endmodule
