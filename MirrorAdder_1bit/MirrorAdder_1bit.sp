** Generated for: hspiceD
** Generated on: Nov 15 14:47:36 2025
** Design library name: TeamKEK
** Design cell name: MirrorAdder_1bit
** Design view name: schematic
.GLOBAL vdd! vss!


.TEMP 25
.OPTION
+    ARTIST=2
+    INGOLD=2
+    PARHIER=LOCAL
+    PSF=2
+    HIER_DELIM=0

** Library name: TeamKEK
** Cell name: MirrorAdder_1bit
** View name: schematic
mp23 sum cout net2 vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp10 net39 cin sum vdd! pmos_rvt w=243e-9 l=20e-9 nfin=9
mp9 net35 a net39 vdd! pmos_rvt w=243e-9 l=20e-9 nfin=9
mp8 vdd! b net35 vdd! pmos_rvt w=243e-9 l=20e-9 nfin=9
mp7 net2 cin vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp6 net2 b vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp5 net2 a vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp4 cout a net13 vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp3 net13 b vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp2 cout cin net1 vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp1 net1 b vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp0 net1 a vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mn22 vss! b net85 vss! nmos_rvt w=162e-9 l=20e-9 nfin=6
mn21 net85 a net81 vss! nmos_rvt w=162e-9 l=20e-9 nfin=6
mn20 net81 cin sum vss! nmos_rvt w=162e-9 l=20e-9 nfin=6
mn19 net67 cin vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn18 net67 b vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn17 net67 a vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn16 sum cout net67 vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn15 net59 b vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn14 cout a net59 vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn13 net47 b vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn12 net47 a vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn11 cout cin net47 vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
.END

