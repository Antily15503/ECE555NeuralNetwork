* SPICE NETLIST
***************************************

.SUBCKT NOR VSS VDD B A Y
** N=11 EP=5 IP=0 FDC=4
M0 Y B VSS VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=284 $Y=108 $D=1
M1 VSS A Y VSS nmos_rvt L=2e-08 W=5.4e-08 nfin=2 $X=500 $Y=108 $D=1
M2 6 B VDD VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=648 $D=0
M3 Y A 6 VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=648 $D=0
.ENDS
***************************************
