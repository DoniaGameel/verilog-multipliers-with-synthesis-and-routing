`include "FullAdder.v"
module ripple_adder #(parameter N=32)(in1,in2,s,cin,cout,OF);

input [N-1:0]in1,in2;
input cin;
output [N-1:0]s;
output cout;
output reg OF;

wire[N:0]carry;
assign carry[0]=cin;
assign cout=carry[N];



genvar i;
generate
for(i=0;i<N;i=i+1)
full_adder FA(in1[i],in2[i],s[i],carry[i],carry[i+1]);
endgenerate

always @ *
begin
if((in1[N-1]==0 && in2[N-1]==0 && s[N-1]==1) ||(in1[N-1]==1&&in2[N-1]==1 &&s[N-1]==0))
  OF=1;
else
  OF=0;
end


endmodule
