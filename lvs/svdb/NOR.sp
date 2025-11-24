* SPICE NETLIST
***************************************

.SUBCKT NOR VDD B A VSS Y
** N=12 EP=5 IP=0 FDC=6
M0 Y A VSS VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=716 $Y=108 $D=1
M1 VSS B Y VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=932 $Y=108 $D=1
M2 6 B VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=648 $D=0
M3 Y A 6 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=648 $D=0
M4 7 A Y VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=716 $Y=648 $D=0
M5 VDD B 7 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=932 $Y=648 $D=0
.ENDS
***************************************
