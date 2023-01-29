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

**6- IEEE 754 Floating Point Multiplier**

All multipliers will have an input register before the multiplier and an output register after the multiplier.

![My Image](figures/In_Out_Registers.png)

## Tree Multiplier

[Tree Multiplier Explanation](https://core.ac.uk/download/pdf/234643291.pdf)

[Explanation Video](https://www.youtube.com/watch?v=75JidRFYAQ0)

## Sequential Multiplier

[Sequential Multiplier Explanation](https://www.youtube.com/watch?v=pDuEKDszwHs).

## Booth Multiplier

[Booth Multiplier Explanation](https://www.geeksforgeeks.org/computer-organization-booths-algorithm/).

## Radix_4 Multiplier

[Radix-4 Multiplier Explanation](https://youtu.be/zu88Oq0zd0Y).

## Floating Point Multiplier

[Floating Point Multiplier Explanation](https://digitalsystemdesign.in/floating-point-multiplication/).

### Block Diagram

![My Image](float_multiplier_synthesis_and_routing/screenshots/Block-diagram-of-Floating-point-Multiplier.png)

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

## Files Locations:

**Code files for each design:** **_'multipliers_files_pre_synthesis'_** folder

**Code files for each testbench:** **_'test_benches' folder_**

**Code files for each design:** **_multipliers_files_pre_synthesis_**

**Synthesis, Placing and Rputing Results:** **_[multiplier_name]_multiplier_synthesis_and_routing_**

**DRC_Report_for_floating_multiplier:** **_DRC_Report_FLoat_Mult_** file

**LVC_Report_for_floating_multiplier:** **_LVS_Report_FLoat_Mult_** file

## Oasys Netlists

**Radix4Multiplier:**

![My Image](Radix4_multiplier_synthesis_and_routing/screenshots/netlist1.jpg)
![My Image](Radix4_multiplier_synthesis_and_routing/screenshots/netlist2.jpg)
![My Image](Radix4_multiplier_synthesis_and_routing/screenshots/netlist3.jpg)
![My Image](Radix4_multiplier_synthesis_and_routing/screenshots/netlist4.jpg)
![My Image](Radix4_multiplier_synthesis_and_routing/screenshots/nrtlist5.jpg)

**Verilog_Multiplier:**

![My Image](verilog_multiplier__synthesis_and_routing/netlist1.jpg)
![My Image](verilog_multiplier__synthesis_and_routing/netlist2.jpg)
![My Image](verilog_multiplier__synthesis_and_routing/netlist3.jpg)
![My Image](verilog_multiplier__synthesis_and_routing/netlist4.jpg)

**Floating_Point_Multiplier:**

![My Image](float_multiplier_synthesis_and_routing/screenshots/netlist1.png)
![My Image](float_multiplier_synthesis_and_routing/screenshots/netlist2.png)
![My Image](float_multiplier_synthesis_and_routing/screenshots/netlist3.png)

**Tree_Multiplier:**
<p align="center">
  <img src = "https://user-images.githubusercontent.com/64079821/215327841-e66187bb-5167-4e79-807f-08eee365e136.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327838-d42d8acf-2a12-4dbd-868e-3bc6741ba448.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327840-7ffc5bcf-97d1-40f0-8e04-3e0bb31c1e31.png" />
</p>

**Sequential_Multiplier:**

<p align="center">
  <img src = "https://user-images.githubusercontent.com/64079821/215327274-b70d3b63-36a9-47c8-8b09-2b7889ea8e9c.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327275-31954dc7-b0a3-4ef1-9386-e03a158dd1d8.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327276-cb9c5ea9-7de8-4bd4-bddf-81d4a467569d.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327277-c498cbcd-a3cb-43dd-8dd0-35b61d997e46.png" />
  <img src = "(https://user-images.githubusercontent.com/64079821/215327278-5a32babd-f182-40cf-95c4-5dfa5bff5f90.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327279-01b0a3f5-5b75-4f09-9d8f-cbdca62c1eb1.png" />
  <img src = "(https://user-images.githubusercontent.com/64079821/215327268-d7c3c1dd-8b76-4b97-ad55-93faedc97336.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327271-eb22c71f-72f9-43d1-9349-764797957d99.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327272-0d58fa47-eacb-402c-840d-eaa2608ddaba.png" />
  <img src = "https://user-images.githubusercontent.com/64079821/215327273-4249e779-c696-4b36-9703-a13115fac947.png" />
</p>



## Nitro final layout

**Radix4_Multiplier:**

![My Image](Radix4_multiplier_synthesis_and_routing/screenshots/layout.jpg)

**Booth_Multiplier:**

![My Image](Booth_multiplier_synthesis_and_routing/layout.jpg)

**Verilog_Multiplier:**

![My Image](verilog_multiplier__synthesis_and_routing/lauout.jpg)

**Floating_Point_Multiplier:**

![My Image](float_multiplier_synthesis_and_routing/screenshots/layout.png)

**Tree_Multiplier:**

<p align="center">
  <img src = "https://user-images.githubusercontent.com/64079821/215327025-cbea8fba-fb52-475f-b903-eafcbbdc74df.png" />
</p>

**Sequential_Multiplier:**

<p align="center">
  <img src = "https://user-images.githubusercontent.com/64079821/215327057-d95f6168-4251-43f5-82b2-fd7942cc6b73.png" />
</p>



## Post_Synthesis_and_Routing_folders_content:

○ Do file to run and configure wave.

○ Constraints files

○ Scripts used for synthesis

○ Scripts used for Floorplanning, Placement & Routing

○ Oasys generated reports

○ Nitro generated reports

○ Post-synthesize code

○ Post-routing code

○ Sdf file

○ GDS

○ Final saved database from Nitro

## Post-Routing-Report

detailed reports are in post_synthesis_and_routing folders

**collective results report**:

![My Image](figures/report.png)

## Multiplier used in floating point multiplier
Verlilog * multiplier

### Explanation
From the synthesis results of the 5 multipliers, it has the best efficient combination of delay, power, utilization and area

## How to test the modules?
1-Open Modelsim.

2-Create project

3-Add files in _helping_modules_ folder to the project

4-Add files in _multipliers_files_pre_synthesis_ folder to the project

5-Add files in test_benches folder

6-Simulate test bench files using modelsim


## DRC Report of floating point multiplier:

Results are in 'DRC_Report_FLoat_Mult' folder

![My Image](DRC_Report_FLoat_Mult/DRC_Report_For_Float_Mult.png)

## LVC Report of floating point multiplier:

Results are in 'LVS_Report_FLoat_Mult' folder

![My Image](LVS_Report_FLoat_Mult/LVS.png)

## Contributors

[Donia Gameel](https://github.com/DoniaGameel).

[Heba Ashraf](https://github.com/hebaashraf21).

[Mohammed Waleed](https://github.com/MohamedWw).

[Waleed Hesham](https://github.com/waleedhesham446).
