`include "Incrementor.v"

module carry_increment_adder #(parameter N=32)(in1,in2,s,cin,cout,OF);

input [N-1:0]in1,in2;
input cin;
output [N-1:0]s;
output cout;
output reg OF;


wire[(N/4)-1:0]Rcarry;
wire[(N/4)-2:0]IncCarry;
wire[N-1:0]Rout;
wire[(N/4)-1:0]ROF;


genvar i;
generate
for(i=0;i<N/4;i=i+1)
if(i==0)
begin
ripple_adder #(4) RCA (in1[3:0],in2[3:0],s[3:0],cin,Rcarry[0],ROF[i]);
assign Rout[3:0]=0;
end
else if (i==1)
begin
ripple_adder #(4) RCA (in1[4*i+3:4*i],in2[4*i+3:4*i],Rout[4*i+3:4*i],1'b0,Rcarry[i],ROF[i]);
incrementor inc (Rout[4*i+3:4*i],s[4*i+3:4*i],Rcarry[i-1],Rcarry[i],IncCarry[0]);
end
else
begin
ripple_adder #(4) RCA (in1[4*i+3:4*i],in2[4*i+3:4*i],Rout[4*i+3:4*i],1'b0,Rcarry[i],ROF[i]);
incrementor inc (Rout[4*i+3:4*i],s[4*i+3:4*i],IncCarry[i-2],Rcarry[i],IncCarry[i-1]);
end
endgenerate

assign cout=IncCarry[(N/4)-2];

always @ *
begin
if((in1[N-1]==0 && in2[N-1]==0 && s[N-1]==1) ||(in1[N-1]==1&&in2[N-1]==1 &&s[N-1]==0))
  OF=1;
else
  OF=0;
end
endmodule
