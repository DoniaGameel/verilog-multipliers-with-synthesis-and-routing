module sequential_multiplier (
    input clk,
    input rst,
    input [31:0] x,
    input [31:0] y,
    output reg [63:0] product
);
reg [63:0] multiplicand, accumulator;
reg [31:0] multiplier;
wire [63:0] temp_multiplicand;
reg [5:0] ctr;

    BarrelLeftShifter BSHL(multiplicand, temp_multiplicand);
always @(posedge clk) begin
    if (rst) begin
        //product <= 0;
    product <= accumulator;
	accumulator <= 0;
        ctr <= 0;
        {multiplicand,multiplier} = (x[31] == 1'b1) ? {{{32{x[31]}},x[31:0]},y[31:0]} : {{{32{y[31]}},y[31:0]},x[31:0]};
        if(multiplier[31] == 1'b1 & multiplicand[31] == 1'b1) begin
            multiplier = ~(multiplier) +1'b1;
            multiplicand = ~(multiplicand) + 1'b1;
        end
        else begin
            multiplier = multiplier;
            multiplicand = multiplicand;
        end
    end else if (ctr < 32) begin
        product <= product;
        multiplier <= multiplier;
        multiplicand <= temp_multiplicand;
        if (multiplier[ctr] == 1)
        begin
            accumulator <= accumulator + multiplicand;
        end
        ctr <= ctr + 1;
    end else if (ctr >= 32) begin
        product <= accumulator;
        multiplier <= multiplier;
        multiplicand <= multiplicand;
        accumulator <= accumulator;
    end
   
end
endmodule

module BarrelLeftShifter(
    input [63:0] In,
    output [63:0] Out
);
    genvar i;
    generate
    begin
        for(i=63; i>0; i=i-1) begin
            Buffer bf (In[i-1], Out[i]);
        end
	    Buffer bf (1'b0, Out[0]);
	end
    endgenerate


endmodule

module Buffer(
    input in,
    output Out
);
    assign Out = in;

endmodule