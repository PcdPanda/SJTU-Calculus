#!/usr/bin/env wolframscript
(* ::Package:: *)

d1:={1.46, 1.47, 1.42, 1.51, 1.55, 1.52, 1.48, 1.47, 1.53,1.50}


StandardDeviation[d1]


Variance[d1]


d2:={1.69,1.79,1.72,1.76,1.80,1.91,1.59,1.89,1.72,1.63,1.55,1.71}


Variance[d2]


Variance[d1]/Variance[d2]


d3:={15.11,15.3,15.44,15.23,15.32,15.48,15.27,15.37,15.36}


d4:={15.14,15.33,15.40,15.28,15.34,15.77,15.26,15.38,15.52}


Mean[d3]


Mean[d4]


Variance[d3]


Variance[d4]


d5:={0.343,0.601,0.676,0.481,0.543,0.541,0.475,0.108,0.106}


d6:={1.533,1.78,1.625,1.190,1.636,1.692,2.015,1.464,1.991}


Mean[d5]


Mean[d6]


Variance[d5]


Variance[d6]


Mean[d5]-Mean[d6]


d7:={0.21,0.223,0.25,0.19,0.20,0.226,0.215,0.24,0.136}


d8:={0.22,0.265,0.217,0.256,0.20,0.27,0.18,0.187,0.23}


Variance[d7]
Variance[d8]


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(**)


(* ::InheritFromParent:: *)
(*Mean[d7]*)


Mean[d8]


X:={161,203,235,176,201,188,228,211,191,178,159,227,193,192,212}


Y:={157,207,198,161,234,197,180,165,202,193,173,137,182,159,156}


D=Y-X


Mean[Y-X]


(* ::InheritFromParent:: *)
(*Variance[Y-X]*)


Sort[X]


Sort[Y]


Sort[D]


(* ::InheritFromParent:: *)
(*Sort[Y-X]*)


D-11


q:=Y-X


Sort[q]


Sort[Abs[q]]
