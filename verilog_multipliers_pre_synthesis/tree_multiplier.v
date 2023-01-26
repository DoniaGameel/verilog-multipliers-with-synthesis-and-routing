`include "carry_save_adder.v"
`include "CarryIncrementAdder.v"

module wallace_tree(A, B,Out, clk, rst);
input clk;
input rst;
input [31:0] A, B;
output reg [63:0] Out;
reg [63:0] partials [31:0];
wire [65:0] sums [31:0];
wire Cout;
wire OF;
//Produce Partial Prodcuts
integer i;
integer j; //For Filling partials with Zeros

reg [31:0] x,y;
wire [63:0] product;
always @(posedge clk) begin
        if(rst) begin
            Out=32'b0;
        end
        else begin
            x=A;
            y=B;
            Out = product;
        end
    end

always @(x,y)
begin
    for (i = 0; i<32; i = i+1)
    begin
        if(y[i] == 1 && i == 31)
        begin
			partials[i] = (~x + 1'b1) << i;
            for(j = 32+i; j<64; j = j+1)
                partials[i][j] = partials[i][j-1];
		end
        else if (y[i] == 1) 
        begin
            partials[i] = x << i;
            for(j = 32+i; j<64; j = j+1)
                partials[i][j] = x[31];
        end
		else
        begin
            for (j = 0; j<64; j = j+1)
			    partials[i][j] = 1'b0;
        end
    end
    //Rearrangement of Partials to be Triangular
    // for (j=0; j<31; j = j +1 )
    //     for (i = j + 1; i<32; i = i + 1)
    //     begin
            
    //         partials[j][31+i-j] = partials[i][31+i-j];
    //         partials[i][31+i-j] = 0;
    //     end
end

    CSA #(64) cs0 (partials[0], partials[1], partials[2], sums[0][63:0], sums[0][65:64]);
    CSA #(64) cs1 (partials[3], partials[4], partials[5], sums[1][63:0], sums[1][65:64]);
    CSA #(64) cs2 (partials[6], partials[7], partials[8], sums[2][63:0], sums[2][65:64]);
    CSA #(64) cs3 (partials[9], partials[10], partials[11], sums[3][63:0], sums[3][65:64]);
    CSA #(64) cs4 (partials[12], partials[13], partials[14], sums[4][63:0], sums[4][65:64]);
    CSA #(64) cs5 (partials[15], partials[16], partials[17], sums[5][63:0], sums[5][65:64]);
    CSA #(64) cs6 (partials[18], partials[19], partials[20], sums[6][63:0], sums[6][65:64]);
    CSA #(64) cs7 (partials[21], partials[22], partials[23], sums[7][63:0], sums[7][65:64]);
    CSA #(64) cs8 (partials[24], partials[25], partials[26], sums[8][63:0], sums[8][65:64]);
    CSA #(64) cs9 (partials[27], partials[28], partials[29], sums[9][63:0], sums[9][65:64]);

    CSA #(64) cs10 (sums[0][63:0], sums[1][63:0], sums[2][63:0], sums[10][63:0], sums[10][65:64]);
    CSA #(64) cs11 (sums[3][63:0], sums[4][63:0], sums[5][63:0], sums[11][63:0], sums[11][65:64]);
    CSA #(64) cs12 (sums[6][63:0], sums[7][63:0], sums[8][63:0], sums[12][63:0], sums[12][65:64]);
    CSA #(64) cs13 (sums[9][63:0], partials[30], partials[31], sums[13][63:0], sums[13][65:64]);

    CSA #(64) cs14 (sums[10][63:0], sums[11][63:0], sums[12][63:0], sums[14][63:0], sums[14][65:64]);

    carry_increment_adder #(64) ci(sums[13][63:0], sums[14][63:0], product, 1'b0, Cout, OF);

endmodule