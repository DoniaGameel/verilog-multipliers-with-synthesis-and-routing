module float_mult (
    input [31:0] A,
    input [31:0] B,
    input clk,
    output Exception,
    output Overflow,
    output Underflow,
    output [31:0] Out
);
    wire [31:0] afterA, afterB, beforeOut;
    Reg regA (A, clk, afterA);
    Reg regB (B, clk, afterB);
    Reg regOut (beforeOut, clk, Out);

    wire [23:0] MA, MB;
    wire [7:0] EA, EB;
    wire SA, SB, Sfinal;

    assign { SA, EA, MA[22:0] } = afterA;
    assign { SB, EB, MB[22:0] } = afterB;
    assign MA[23] = (EA == 0) ? 0 : 1;
    assign MB[23] = (EB == 0) ? 0 : 1;

    assign Sfinal = SA^SB;
    assign Exception = (&EA) | (&EB);	

    wire [47:0] MP, MP_normalized;
    wire [22:0] MP_final;
    wire normalized, zero, round;
    N_Bit_Mult mantissa_multiplier (MA, MB, MP);
    assign normalized = MP[47];
    assign MP_normalized = normalized ? MP : MP << 1;
    assign round = |MP_normalized[22:0];
    assign MP_final = MP_normalized[46:24] + (MP_normalized[23] & round);

    wire [8:0] Esum;
    wire E_OF;
    // carry_increment_adder exponent_adder #(N=8) (EA, EB, Esum[7:0], 0, Esum[8], E_OF);
    assign Esum = EA + EB;
    
    wire [8:0] Esum_Normalized;
    assign Esum_Normalized = Esum - 8'd127 + normalized;

    assign zero = Exception ? 1'b0 : (MP_final == 0);
    assign Overflow = ((Esum_Normalized[8] & !Esum_Normalized[7]) & !zero) ;
    assign Underflow = ((Esum_Normalized[8] & Esum_Normalized[7]) & !zero);

    assign beforeOut = Exception ? 32'd0 : zero ? { Sfinal, 31'd0 } : Overflow ? { Sfinal, 8'hFF, 23'd0 } : Underflow ? { Sfinal, 31'd0 } : { Sfinal, Esum_Normalized[7:0], MP_final };
    
endmodule

module N_Bit_Mult #(
    parameter N = 24
) (
    input [N-1:0] A,
    input [N-1:0] B,
    output [2*N-1:0] Out
);
    
    assign Out = A * B;
    
endmodule

module Reg (
    input [31:0] in,
    input clk,
    output reg [31:0] out
);
    
    always @(posedge clk ) begin
        out = in;
    end
    
endmodule
