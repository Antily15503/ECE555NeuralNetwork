* SPICE NETLIST
***************************************

.SUBCKT MULT2bit VDD VSS
** N=31 EP=2 IP=0 FDC=15
M0 7 3 5 VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=284 $Y=108 $D=1
M1 16 4 VSS VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=1728 $D=1
M2 3 5 7 VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=500 $Y=108 $D=1
M3 8 6 16 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=1728 $D=1
M4 9 23 3 VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=716 $Y=108 $D=1
M5 13 7 9 VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=932 $Y=108 $D=1
M6 9 10 13 VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=1148 $Y=108 $D=1
M7 14 8 VSS VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=1728 $D=1
M8 8 4 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=1188 $D=0
M9 17 5 7 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=648 $D=0
M10 VDD 6 8 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=1188 $D=0
M11 VDD 3 17 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=716 $Y=648 $D=0
M12 18 7 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=932 $Y=648 $D=0
M13 13 10 18 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=648 $D=0
M14 14 8 VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=1148 $Y=1188 $D=0
.ENDS
***************************************
