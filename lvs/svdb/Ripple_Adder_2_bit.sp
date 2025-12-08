* SPICE NETLIST
***************************************

.SUBCKT Ripple_Adder_2_bit VSS VDD A<1> A<0> B<1> B<0> S<1> S<0> S<2>
** N=53 EP=9 IP=0 FDC=34
M0 15 A<1> VSS VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=284 $Y=108 $D=1
M1 9 A<1> B<1> VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=1728 $D=1
M2 18 A<0> 7 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=2268 $D=1
M3 10 A<0> B<0> VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=3888 $D=1
M4 VSS B<1> 15 VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=500 $Y=108 $D=1
M5 A<1> B<1> 9 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=1728 $D=1
M6 VSS B<0> 18 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=2268 $D=1
M7 A<0> B<0> 10 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=3888 $D=1
M8 11 7 VSS VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=716 $Y=2268 $D=1
M9 13 8 11 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=108 $D=1
M10 8 9 VSS VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=1728 $D=1
M11 S<0> 10 VSS VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=3888 $D=1
M12 8 11 13 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1364 $Y=108 $D=1
M13 VSS S<1> 14 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1796 $Y=1728 $D=1
M14 S<1> 13 VSS VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=2012 $Y=108 $D=1
M15 S<2> 14 VSS VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=2012 $Y=1836 $D=1
M16 VSS 15 S<2> VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=2228 $Y=1836 $D=1
M17 19 A<1> VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=648 $D=0
M18 20 A<1> VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=1188 $D=0
M19 7 A<0> VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=2808 $D=0
M20 21 A<0> VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=3348 $D=0
M21 15 B<1> 19 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=648 $D=0
M22 9 B<1> 20 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=1188 $D=0
M23 VDD B<0> 7 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=2808 $D=0
M24 10 B<0> 21 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=3348 $D=0
M25 11 7 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=716 $Y=2808 $D=0
M26 22 8 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=648 $D=0
M27 8 9 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=1188 $D=0
M28 S<0> 10 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=3348 $D=0
M29 13 11 22 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1364 $Y=648 $D=0
M30 VDD S<1> 14 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1796 $Y=1188 $D=0
M31 S<1> 13 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=2012 $Y=648 $D=0
M32 23 14 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=2012 $Y=1188 $D=0
M33 S<2> 15 23 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=2228 $Y=1188 $D=0
.ENDS
***************************************
