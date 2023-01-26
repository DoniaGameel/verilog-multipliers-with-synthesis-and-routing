#!/bin/sh

export outputDir="outputs_adder"

rm --f $outputDir/odb/*
rm --f $outputDir/mxdb/*

rm --f $outputDir/db/*

rm --f $outputDir/logs/*.log
rm --f $outputDir/logs/*.cmd
rm --f $outputDir/logs/*.dbg
rm --f $outputDir/rpt/*.rpt

rm --f $outputDir/verilog/*
rm --f $outputDir/constraints/*
rm --f $outputDir/floorplan/*
rm --f $outputDir/dft/*

rm --f oasys.cmd*
rm --f oasys.dbg*
rm --f oasys.log*

echo "\n-------------------------------------"
echo "\nCleanup Complete"
echo "\n-------------------------------------\n"
