module Radix4Booth(M1,M2,result,clk);
input [31:0] M1; //Multiplier
input [31:0] M2; //Multiplicand
input clk;
output [63:0] result;

reg [63:0] Acc[16:0]; //Accumlating sum
reg[63:0] partialProd[15:0];
wire [32:0]Q; //Multiplicand 0 to check bits

reg [2:0]bitsBlock; //three bits to be checked
reg [31:0]modified_M;
integer i=0; //counter

assign result=Acc[16];
assign Q={M2,1'b0};

initial
begin
Acc[0]=64'b0;
end

always @ (posedge clk)
begin
if(i<16)
begin
bitsBlock={Q[2*i+2],Q[2*i+1],Q[2*i]};
case (bitsBlock)
3'b000: partialProd[i]= 64'b0;
3'b001: partialProd[i]={{32{M1[31]}},M1};
3'b010: partialProd[i]={{32{M1[31]}},M1};
3'b011: 
	begin 
	modified_M=M1<<1;
	partialProd[i]={{31{modified_M[31]}},M1,1'b0};//*2
	end 
3'b100: 
	begin
	modified_M=~(M1<<1)+1;
	partialProd[i]={{31{modified_M[31]}},~M1+1,1'b0}; //*-2
	end
3'b101:
	begin
	modified_M=~M1+1;
	partialProd[i]={{32{modified_M[31]}},modified_M}; //*-1
	end
3'b110: 
	begin
	modified_M=~M1+1;
	partialProd[i]={{32{modified_M[31]}},modified_M}; //*-1
	end
3'b111: partialProd[i]= 64'b0;
endcase

Acc[i+1]=Acc[i]+(partialProd[i]<<2*i);
i=i+1;
end
end
endmodule
