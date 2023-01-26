module Booth(M1,M2,result,clk);
input [31:0] M1; //Multiplier
input [31:0] M2; //Multiplicand
input clk;
output [63:0] result;

reg [63:0] Acc[32:0]; //Accumlating sum
reg[63:0] partialProd[31:0];
wire [32:0]Q; //Multiplicand 0 to check bits

reg [1:0]bitsBlock; //three bits to be checked
reg [31:0]modified_M;
integer i=0; //counter

assign result=Acc[32];
assign Q={M2,1'b0};

initial
begin
Acc[0]=64'b0;
end

always @ (posedge clk)
begin
if(i<32)
begin
bitsBlock={Q[i+1],Q[i]};
case (bitsBlock)
2'b00: partialProd[i]= 64'b0;
2'b01: partialProd[i]={{32{M1[31]}},M1};
2'b10: begin
	modified_M=~M1;
	modified_M=modified_M+1;
	partialProd[i]={{32{modified_M[31]}},modified_M}; //*-1
	end
2'b11: partialProd[i]= 64'b0;
endcase

Acc[i+1]=Acc[i]+(partialProd[i]<<i);
i=i+1;
end
end
endmodule
