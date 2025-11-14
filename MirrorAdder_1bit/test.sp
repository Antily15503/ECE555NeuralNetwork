**Test
.GLOBAL vss! vdd!
.TEMP 25.0
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    HIER_DELIM=0
.options accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear INGOLD=2 POST=1
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"
.INCLUDE "MirrorAdder_1bit.sp"
v1 vdd! 0 0.9v
v2 vss! 0 0v
v3 a 0 pwl 0ns 0v 2ns 0v 2.02ns 0.9v 4ns 0.9v 4.02ns 0v 6ns 0v 6.02ns 0.9v 8ns 0.9v 8.02ns 0v 10ns 0v 10.02ns 0.9v 12ns 0.9v
v4 b 0 pwl 0ns 0v 1ns 0v 1.02ns 0.9v 3ns 0.9v 3.02ns 0v 5ns 0v 5.02ns 0.9v 7ns 0.9v 7.02ns 0v 9ns 0v 9.02ns 0.9v 11ns 0.9v 11.02ns 0v 12ns 0v
v5 cin 0 pwl 0ns 0v 6ns 0v 6.02ns 0.9v 12ns 0.9v
.OP
.TRAN STEP=10p STOP=14n
.end
