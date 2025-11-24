* SPICE NETLIST
***************************************

.SUBCKT XOR A B VSS VDD Y
** N=12 EP=5 IP=0 FDC=4
M0 7 A Y VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=108 $D=1
M1 VSS B 7 VSS nmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=108 $D=1
M2 Y A B VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=284 $Y=648 $D=0
M3 A B Y VDD pmos_rvt L=2e-08 W=8.1e-08 nfin=3 $X=500 $Y=648 $D=0
.ENDS
***************************************
