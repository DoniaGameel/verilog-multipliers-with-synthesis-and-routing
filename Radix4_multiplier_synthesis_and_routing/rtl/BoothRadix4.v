module registerNbits #(parameter N = 32) (clk,reset,en, inp, out);
	input clk,reset,en;
	output  reg signed[N-1:0] out;
	input signed [N-1:0] inp;
	always @(posedge clk)
		begin
			if (reset) 
				out <= 'b0;
			else if(en)
				out <= inp;
			
		end
endmodule

module RadixBooth(inputA,inputB,result,clk,reset,en,start);
input [31:0] inputA; //Multiplier
input [31:0] inputB; //Multiplicand
input clk,en,reset,start;
output [63:0] result;

reg [31:0] M1;
reg [31:0] M2;

reg [63:0] Acc; //Accumlating sum
reg[63:0] partialProd;
reg [32:0]Q; //Multiplicand 0 to check bits

reg [63:0] extended_M;
reg [63:0] extended_M_mul_two;
reg [63:0] extended_M_mul_neg_two;
reg [63:0] extended_M_mul_neg_one;

reg[32:0] shifted_M;
reg [31:0] OnesComplement;
reg [31:0] twosComplement;
reg [32:0] shiftedOnesComplement;
reg [32:0] shiftedtwosComplement;

reg signed [5:0] i; //counter
 

wire [31:0] A_reg;
wire [31:0] B_reg;
reg [63:0] out_reg;

registerNbits #(32) regA (clk,reset,en,inputA, A_reg);
registerNbits #(32) regB (clk,reset,en,inputB, B_reg);
registerNbits #(64) regOut (clk,reset,en,out_reg,result);

always @ (posedge clk)
begin
	if(start)
	begin
	M1=A_reg;
	M2=B_reg;
	
	Acc=64'b0;
	i=6'b000000;
	Q={M2,1'b0};

	extended_M={{32{M1[31]}},M1};

	shifted_M=M1<<1;
	//extended_M_mul_two={{31{shifted_M[31]}},M1,1'b0};
	extended_M_mul_two={{31{shifted_M[32]}},M1,1'b0};
	OnesComplement=~M1;
	twosComplement=OnesComplement+1;
	extended_M_mul_neg_one={{32{twosComplement[31]}},twosComplement};

	//shiftedOnesComplement=~shifted_M;
	//shiftedtwosComplement=shiftedOnesComplement+1;
	shiftedtwosComplement=twosComplement<<1;
	extended_M_mul_neg_two={{31{shiftedtwosComplement[32]}},twosComplement,1'b0};
	end
else
begin
   	if(i == 'd32)
   	begin
        	out_reg=Acc;                              
    	end

	else
	begin
		if(i<32)
		begin
		case ({Q[i+2],Q[i+1],Q[i]})
			3'b000: partialProd= 64'b0;

			3'b001: partialProd=extended_M<<i;
			3'b010: partialProd=extended_M<<i;
			3'b011: 
				begin 
				partialProd=extended_M_mul_two<<i;//*2
				end 
			3'b100: 
				begin
				partialProd=extended_M_mul_neg_two<<i; //*-2
				end
			3'b101:
				begin
				partialProd=extended_M_mul_neg_one<<i; //*-1
				end
			3'b110: 
				begin
				partialProd=extended_M_mul_neg_one<<i; //*-1
				end

			3'b111: partialProd= 64'b0;
		endcase

		Acc=Acc+(partialProd);
		i=i+2;
		end
	end
end
end
endmodule


