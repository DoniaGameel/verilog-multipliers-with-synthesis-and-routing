module verilog_tb();
localparam N=32;
localparam T=100;
integer success=0;
integer failure=0;

reg signed[N-1:0]in1,in2;
wire[63:0] verilog_out;

multiplyTimes verilog(in1,in2,verilog_out);

initial
begin

$display("____________________________________________________________________________________________________________________");
in1=32'h87234;
in2=32'h348;
#5000

if(verilog_out==64'h1BB6BAA0)
begin
  success=success+1;
 $display("Test#1 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#1 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end




$display("____________________________________________________________________________________________________________________");
in1=32'h50647236;
in2=32'h50612336;

#5000
if(verilog_out==64'h193DE4CED7437964)
begin
  success=success+1;
 $display("Test#2 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#2 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end




$display("____________________________________________________________________________________________________________________");
in1=32'h87234;
in2=32'hFFFFFEFD;

#5000
if(verilog_out==64'hFFFFFFFFF7747564)
begin
  success=success+1;
 $display("Test#3 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#3 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end

$display("____________________________________________________________________________________________________________________");
in1=32'h50647236;
in2=32'hB887CAAF;

#5000
if(verilog_out==64'hE98E647F4142AEEA)
begin
  success=success+1;
 $display("Test#4 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#4 verilog multiplier          Failure with input %d and %d and output %b",in1,in2,verilog_out);
end



$display("____________________________________________________________________________________________________________________");
in1=32'hFFFFFEFD;
in2=32'h87234;

#5000
if(verilog_out==64'hFFFFFFFFF7747564)
begin
  success=success+1;
 $display("Test#5 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#5 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end



$display("____________________________________________________________________________________________________________________");
in1=-32'd1199060305;
in2=32'd1348760118;

#5000
if(verilog_out==-64'd1617244718460915990)
begin
  success=success+1;
 $display("Test#6 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#6 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end


$display("____________________________________________________________________________________________________________________");

in1=32'hFFFFFEFD;
in2=32'hFFFFFEFD;

#5000
if(verilog_out==64'h10609)
begin
  success=success+1;
 $display("Test#7 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#7 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end

$display("____________________________________________________________________________________________________________________");

in1=32'hFFFFFEFD;
in2=32'hFFFFFEFD;

#5000
if(verilog_out==64'h10609)
begin
  success=success+1;
 $display("Test#8 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#8 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end

$display("____________________________________________________________________________________________________________________");
in1=32'h1;
in2=32'h50647236;

#5000
if(verilog_out==64'h50647236)
begin
  success=success+1;
 $display("Test#9 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#9 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end


$display("____________________________________________________________________________________________________________________");
in1=32'hB887CAAF;
in2=32'h1;

#5000
if(verilog_out==64'hFFFFFFFFB887CAAF)
begin
  success=success+1;
 $display("Test#10 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#10 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end

$display("____________________________________________________________________________________________________________________");

in1=32'h0;
in2=32'h50647236;

#5000
if(verilog_out==64'h0)
begin
  success=success+1;
 $display("Test#11 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#11 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end

$display("____________________________________________________________________________________________________________________");

in1=32'hB887CAAF;
in2=32'h0;

#5000
if(verilog_out==64'h0)
begin
  success=success+1;
 $display("Test#12 verilog multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#12 verilog multiplier          Failure with input %d and %d and output %d",in1,in2,verilog_out);
end

end
endmodule

