`include "HalfAdder.v"
module full_adder(in1,in2,s,cin,cout);
 input in1,in2,cin;
 output s,cout;
 wire HA_sum1,HA_carry1,HA_carry2;

 half_adder HA1(in1,in2,HA_sum1,HA_carry1);
 half_adder HA2 (cin,HA_sum1,s,HA_carry2);

 assign cout=HA_carry1|HA_carry2;

endmodule

