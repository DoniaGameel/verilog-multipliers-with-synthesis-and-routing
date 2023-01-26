`include "HalfAdder.v"

module incrementor(inS,outS,cin1,cin2,cout);
input[3:0]inS;
input cin1,cin2;
output cout;
output[3:0]outS;

wire [3:0]w;

genvar i;
generate
for(i=0;i<4;i=i+1)
if(i==0)
half_adder HA(inS[0],cin1,outS[0],w[0]);
else
half_adder HA(inS[i],w[i-1],outS[i],w[i]);
endgenerate

assign cout=cin2|w[3];

endmodule

