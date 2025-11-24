*===========================================================
*  Testbench for Neuron Circuit
*===========================================================
.GLOBAL vss! vdd!
.TEMP 25
.OPTION ARTIST=2 INGOLD=2 PARHIER=LOCAL HIER_DELIM=0
.OPTION accurate=1 NUMDGT=8 measdgt=5 GMINDC=1e-18 DELMAX=1n method=gear POST=1

*-----------------------------------------------------------
* Include device models + extracted neuron schematic
*-----------------------------------------------------------
.INCLUDE "/cae/apps/data/asap7PDK-2022/asap7PDK_r1p7/models/hspice/7nm_TT_160803.pm"
.INCLUDE "Neuron.sp"

*-----------------------------------------------------------
* Power supplies
*-----------------------------------------------------------
v_vdd  vdd!  0  0.9
v_vss  vss!  0  0

*===========================================================
* INPUT WEIGHTS (using bus notation)
*===========================================================
* 2-bit W00 (example weight = 2 = 2'b10)
v_w00_1 W00<1> 0 0.9
v_w00_0 W00<0> 0 0

* 2-bit W01 (example weight = 3 = 2'b11)
v_w01_1 W01<1> 0 0.9
v_w01_0 W01<0> 0 0.9

* 3-bit W20 (example weight = 5 = 3'b101)
v_w20_2 W20<2> 0 0.9
v_w20_1 W20<1> 0 0
v_w20_0 W20<0> 0 0.9

*===========================================================
* TIME-VARYING INPUT VALUES X0, X1
*===========================================================
* X0<1:0> toggles through 0→1→2→3 every 2ns
v_x0_1 X0<1> 0 pwl( 0n 0   2n 0   2.01n 0.9   4n 0.9   4.01n 0   6n 0   6.01n 0.9  8n 0.9  8.01n 0  10n 0  10.01n 0.9  12n 0.9)
v_x0_0 X0<0> 0 pwl( 0n 0   1n 0   1.01n 0.9   3n 0.9   3.01n 0   5n 0   5.01n 0.9  7n 0.9  7.01n 0  9n 0   9.01n 0.9  11n 0.9 11.01n 0 12n 0)

* X1<1:0> independent toggle pattern
v_x1_1 X1<1> 0 pwl( 0n 0.9  2n 0.9  2.01n 0  4n 0   4.01n 0.9 6n 0.9 6.01n 0 8n 0 8.01n 0.9 10n 0.9 10.01n 0 12n 0)
v_x1_0 X1<0> 0 pwl( 0n 0    3n 0    3.01n 0.9 5n 0.9 5.01n 0 7n 0 7.01n 0.9 9n 0.9 9.01n 0 11n 0 11.01n 0.9 12n 0.9)

*===========================================================
* NEURON INSTANCE
*===========================================================
* Based on your netlist, the top-level Neuron has these connections:
* Inputs: w00<1:0>, w00<1:0> (appears twice?), x0<1:0>, x1<1:0>, w20<2:0>
* Outputs: s<2:0>, z0<1:0>
* Power: vdd, vss
*
* Check your actual symbol pin order in Virtuoso!
* This matches the netlist you provided:

X_neuron  W00<1> W00<0> W01<1> W01<0> \
          X0<1> X0<0> X1<1> X1<0> \
          W20<2> W20<1> W20<0> \
          S<2> S<1> S<0> \
          Z0<1> Z0<0> \
          vdd! vss!  Neuron

*===========================================================
* ANALYSIS COMMANDS
*===========================================================
.OP
.TRAN 10p 12n

*===========================================================
* MEASUREMENTS
*===========================================================
.MEASURE TRAN avg_power AVG POWER FROM=0n TO=12n
.MEASURE TRAN delay_x0_to_s \
    TRIG V(X0<0>) VAL=0.45 RISE=1 \
    TARG V(S<0>) VAL=0.45 RISE=1

*===========================================================
* DEBUG PRINTS
*===========================================================
.PRINT TRAN V(W00<1>) V(W00<0>) V(W01<1>) V(W01<0>)
.PRINT TRAN V(W20<2>) V(W20<1>) V(W20<0>)
.PRINT TRAN V(X0<1>) V(X0<0>) V(X1<1>) V(X1<0>)
.PRINT TRAN V(S<2>) V(S<1>) V(S<0>)
.PRINT TRAN V(Z0<1>) V(Z0<0>)
.PRINT TRAN PAR('V(S<2>)*4 + V(S<1>)*2 + V(S<0>)')
.PRINT TRAN PAR('V(Z0<1>)*2 + V(Z0<0>)')

.END
