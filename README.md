# verilog-multipliers-with-synthesis-and-routing

An important block in “compute” unit is multipliers. Their performance impacts the
whole chip. This is why in this mini project, we will explore different implementations of
multipliers and study their characteristics.

In this repo, we implemented using verilog the following 32-bits signed integer multipliers:

**1- Verilog (‘*’) version of multiplier**

**2- Multiplier Tree (combinational)**

**3- Sequential Multiplier using shift & accumulate**

**4- Booth Algorithm**

**5- Radix-4 Booth Algorithm**

All multipliers will have an input register before the multiplier and an output register after the multiplier.

![My Image](figures/In_Out_Registers.png)

## Test cases in test bench file:

○ Multiplication of positive and negative number

○ Multiplication of positive and positive number

○ Multiplication of negative and negative number

○ Multiplication of negative and positive number

○ Multiplication by zero

○ Multiplication by 1

○ Additional 2 random test cases.

Your testbench should print **“TestCase#1: success”** on success and should
print the **“TestCase#1: failed with input X and Y and Output Z and overflow
status N”** , X,Y,Z snd N should be replaced by your values.

## Synthesis using Oasys:

**Synthesis the adders with the following constraints**

i. Set clock to 6ns.

ii. Set Input delay to 0.2ns.

iii. Set load to 10

iv. Set output load to 0.5ns.

v. Set Utilization to 60%

vi. Enable usage of all library cells.

## Place and route using Nitro:

**Place and route the adders with the following constraints**

i. Constraint clock skew to 0.2ns

ii. Only use vertical strips
