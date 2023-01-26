module half_adder(in1,in2,s,c);
input in1,in2;
output s,c;

assign c=in1&in2;                          
assign s=in1^in2;                         

endmodule
