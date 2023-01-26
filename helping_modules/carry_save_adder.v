module halfadder(
input a,b,
output sum,carry);

assign sum = a ^ b;
assign carry = a & b;

endmodule

module fulladder (
input a,b,cin,
output sum,carry);
wire ha_sum1;
wire ha_sum2;
wire ha_carry1;
wire ha_carry2;

halfadder ha1(a,b,ha_sum1,ha_carry1);
halfadder ha2(cin,ha_sum1,ha_sum2,ha_carry2);

assign sum = ha_sum2;
assign carry = ha_carry1 | ha_carry2;

endmodule


module CSA #(parameter N=64)(
input [N-1:0] x,y,z,
output [63:0] s,
output [1:0]carry_final);
            
wire [N-1:0] c1,s1,c2;
wire cout;
wire carry;
genvar i;

generate
	for (i=0; i<N; i= i+1) begin
	   fulladder a(x[i], y[i], z[i] ,s1[i], c1[i]);
	end
	fulladder b0(s1[1],c1[0],1'b0,s[1],c2[1]);
	for (i=1; i<N-1; i= i+1) begin
	   fulladder b(s1[i+1], c1[i],c2[i],s[i+1],c2[i+1]);
	end
	fulladder bFinal(1'b0,c1[N-1],c2[N-1],carry,cout); 
endgenerate

assign carry_final = {cout, carry};
assign s[0] = s1[0];

endmodule
