
module tree_tb();
localparam N=32;
localparam T=100;
integer success=0;
integer failure=0;

reg signed[N-1:0]in1,in2;
wire[63:0] tree_out;
reg  clk=0;
reg start;

wallace_tree tree(in1, in2,tree_out, clk, start);

always begin #25 clk = ~clk; end

initial
begin
#T

$display("____________________________________________________________________________________________________________________");
in1=32'h87234;
in2=32'h348;

start=1;
#T
start=0;

#5000

if(tree_out==64'h1BB6BAA0)
begin
  success=success+1;
 $display("Test#1 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#1 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end




$display("____________________________________________________________________________________________________________________");
in1=32'h50647236;
in2=32'h50612336;
start=1;
#T
start=0;

#5000
if(tree_out==64'h193DE4CED7437964)
begin
  success=success+1;
 $display("Test#2 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#2 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end




$display("____________________________________________________________________________________________________________________");
in1=32'h87234;
in2=32'hFFFFFEFD;
start=1;
#T
start=0;

#5000
if(tree_out==64'hFFFFFFFFF7747564)
begin
  success=success+1;
 $display("Test#3 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#3 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end

$display("____________________________________________________________________________________________________________________");
in1=32'h50647236;
in2=32'hB887CAAF;
start=1;
#T
start=0;

#5000
if(tree_out==64'hE98E647F4142AEEA)
begin
  success=success+1;
 $display("Test#4 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#4 multiplier          Failure with input %d and %d and output %b",in1,in2,tree_out);
end



$display("____________________________________________________________________________________________________________________");
in1=32'hFFFFFEFD;
in2=32'h87234;
start=1;
#T
start=0;

#5000
if(tree_out==64'hFFFFFFFFF7747564)
begin
  success=success+1;
 $display("Test#5 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#5 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end



$display("____________________________________________________________________________________________________________________");
in1=-32'd1199060305;
in2=32'd1348760118;
start=1;
#T
start=0;

#5000
if(tree_out==-64'd1617244718460915990)
begin
  success=success+1;
 $display("Test#6 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#6 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end


$display("____________________________________________________________________________________________________________________");

in1=32'hFFFFFEFD;
in2=32'hFFFFFEFD;
start=1;
#T
start=0;

#5000
if(tree_out==64'h10609)
begin
  success=success+1;
 $display("Test#7 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#7 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end

$display("____________________________________________________________________________________________________________________");

in1=32'hFFFFFEFD;
in2=32'hFFFFFEFD;
start=1;
#T
start=0;

#5000
if(tree_out==64'h10609)
begin
  success=success+1;
 $display("Test#8 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#8 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end

$display("____________________________________________________________________________________________________________________");
in1=32'h1;
in2=32'h50647236;
start=1;
#T
start=0;

#5000
if(tree_out==64'h50647236)
begin
  success=success+1;
 $display("Test#9 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#9 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end


$display("____________________________________________________________________________________________________________________");
in1=32'hB887CAAF;
in2=32'h1;
start=1;
#T
start=0;

#5000
if(tree_out==64'hFFFFFFFFB887CAAF)
begin
  success=success+1;
 $display("Test#10 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#10 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end

$display("____________________________________________________________________________________________________________________");

in1=32'h0;
in2=32'h50647236;
start=1;
#T
start=0;

#5000
if(tree_out==64'h0)
begin
  success=success+1;
 $display("Test#11 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#11 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end

$display("____________________________________________________________________________________________________________________");

in1=32'hB887CAAF;
in2=32'h0;
start=1;
#T
start=0;

#5000
if(tree_out==64'h0)
begin
  success=success+1;
 $display("Test#12 multiplier         SUCCESS");
end
else
begin
failure=failure+1;
 $display("Test#12 multiplier          Failure with input %d and %d and output %d",in1,in2,tree_out);
end

end
endmodule