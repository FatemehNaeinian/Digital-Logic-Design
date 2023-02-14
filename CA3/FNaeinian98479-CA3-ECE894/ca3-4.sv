module adder127taei(input [126:0]a,output[6:0]w);

genvar i;
wire [63:0]add1;
generate
	for(i=0;i<32;i=i+1) begin
	fadder #1 Y(a[3*i],a[3*i+1],a[3*i+2],add1[2*i],add1[2*i+1]);
	end
endgenerate


genvar j;
wire [47:0]add2;
generate
	for(j=0;j<16;j=j+1) begin 
	fadder #2 Y({add1[4*j],add1[4*j+1]},{add1[4*j+2],add1[4*j+3]},a[j+96],{add2[3*j],add2[3*j+1]},add2[3*j+2]);
	end
endgenerate

genvar h;
wire [31:0]add3;
generate
	for(h=0;h<8;h=h+1) begin 
	fadder #3 Y({add2[6*h],add2[6*h+1],add2[6*h+2]},{add2[6*h+3],add2[6*h+4],add2[6*h+5]},a[h+112],{add3[4*h],add3[4*h+1],add3[4*h+2]},add3[4*h+3]);
	end
endgenerate

genvar p;
wire [19:0]add4;
generate
	for(p=0;p<4;p=p+1) begin
	fadder #4 Y({add3[8*p],add3[8*p+1],add3[8*p+2],add3[8*p+3]},{add3[8*p+4],add3[8*p+5],add3[8*p+6],add3[8*p+7]},a[p+120],{add4[5*p],add4[5*p+1],add4[5*p+2],add4[5*p+3]},add4[5*p+4]);
	end
endgenerate



genvar z;
wire [11:0]add5;
generate
	for(z=0;z<2;z=z+1) begin
	fadder #5 Y({add4[10*z],add4[10*z+1],add4[10*z+2],add4[10*z+3],add4[10*z+4]},{add4[10*z+5],add4[10*z+6],add4[10*z+7],add4[10*z+8],add4[10*z+9]},a[z+124],{add5[6*z],add5[6*z+1],add5[6*z+2],add5[6*z+3],add5[6*z+4]},add5[6*z+5]);
	end
endgenerate


wire [6:0]add6;
fadder #6 Y({add5[0],add5[1],add5[2],add5[3],add5[4],add5[5]},{add5[6],add5[7],add5[8],add5[9],add5[10],add5[11]},a[126],{add6[0],add6[1],add6[2],add6[3],add6[4],add6[5]},add6[6]);


assign w=add6;

endmodule
