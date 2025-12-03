** Library name: TeamKEK
** Cell name: Neuron
** View name: schematic
** Pruned Netlist for ECE555

* ================================================================
* Standard Cells (NAND, INV, NOR, XOR, XNOR)
* ================================================================

.subckt NAND a b y vdd vss
m0 y a vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m1 y b vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m3 net11 a vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
m2 y b net11 vss nmos_rvt w=81e-9 l=20e-9 nfin=3
.ends NAND

.subckt INV in out vdd vss
m0 out in vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
m1 out in vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends INV

.subckt NOR a b y vdd vss
m1 y a net1 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m0 net1 b vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m3 y a vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
m2 y b vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
.ends NOR

.subckt XOR a b vdd vss y
m12 y net1 vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
m11 net1 b a vss nmos_rvt w=81e-9 l=20e-9 nfin=3
m10 net1 a b vss nmos_rvt w=81e-9 l=20e-9 nfin=3
m9 y net1 vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m8 net24 a vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m7 net1 b net24 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends XOR

.subckt XNOR_NOR a b nand vdd vss y
m1 net5 a net1 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m0 net1 b vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m4 b vss vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
m3 net5 a b vss nmos_rvt w=54e-9 l=20e-9 nfin=2
m2 net5 b a vss nmos_rvt w=54e-9 l=20e-9 nfin=2
xi2 nand net5 y vdd vss NOR
.ends XNOR_NOR

* ================================================================
* Arithmetic Blocks (Adders, Multipliers)
* ================================================================

.subckt Half_Adder a b cout s vdd vss
xi0 a b vdd vss s XOR
xi1 a b net3 vdd vss NAND
xi2 net3 cout vdd vss INV
.ends Half_Adder

.subckt Full_Adder_1_bit a b cin cout s vdd vss
xi1 net3 cin vdd vss s XOR
xi0 a b vdd vss net3 XOR
xi4 net13 net18 cout vdd vss NAND
xi3 net3 cin net18 vdd vss NAND
xi2 a b net13 vdd vss NAND
.ends Full_Adder_1_bit

.subckt Ripple_Adder_2_bit a<1> a<0> b<1> b<0> s<2> s<1> s<0> vdd vss
xi13 net4 net5 vdd vss s<1> XOR
xi0 a<1> b<1> vdd vss net4 XOR
xi6 a<0> b<0> net5 s<0> vdd vss Half_Adder
xi12 s<1> net2 vdd vss INV
xi10 b<1> a<1> net8 vdd vss NOR
xi11 net8 net2 s<2> vdd vss NOR
.ends Ripple_Adder_2_bit

.subckt Ripple_Adder_3_bit a<2> a<1> a<0> s<2> s<1> s<0> vdd vss w20<2> w20<1> w20<0>
xi0 a<0> w20<0> net4 s<0> vdd vss Half_Adder
xi2 a<1> w20<1> net4 net11 s<1> vdd vss Full_Adder_1_bit
xi4 net16 net11 vdd vss s<2> XOR
xi3 a<2> w20<2> vdd vss net16 XOR
.ends Ripple_Adder_3_bit

.subckt MULT2bit a<1> a<0> b<1> b<0> y<1> y<0> vdd vss
xi0 a<0> b<0> net3 vdd vss NAND
xi1 net3 y<0> vdd vss INV
xi6 a<1> b<1> net3 vdd vss y<1> XNOR_NOR
.ends MULT2bit

* ================================================================
* Activation Block (ReLU)
* ================================================================

.subckt ReLU_bit vdd vss y y2 y2_not z
m4 z y2 y vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
m5 z y2 vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
m3 y y2_not z vss nmos_rvt w=81e-9 l=20e-9 nfin=3
.ends ReLU_bit

* ================================================================
* Top Level Neuron
* ================================================================

.subckt Neuron x0<1> x0<0> x1<1> x1<0> w00<1> w00<0> w01<1> w01<0> w20<2> w20<1> w20<0> z0<1> z0<0> vdd vss

* Multipliers
xi1 x1<1> x1<0> w01<1> w01<0> hbm<1> hbm<0> vdd vss MULT2bit
xi0 x0<1> x0<0> w00<1> w00<0> lbm<1> lbm<0> vdd vss MULT2bit

* Adders
xi5 lbm<1> lbm<0> hbm<1> hbm<0> lb<2> lb<1> lb<0> vdd vss Ripple_Adder_2_bit
xi6 lb<2> lb<1> lb<0> s<2> s<1> s<0> vdd vss w20<2> w20<1> w20<0> Ripple_Adder_3_bit

* Activation (ReLU) and Control Logic
xi9 vdd vss s<1> s<2> net3 z0<1> ReLU_bit
xi7 vdd vss s<0> s<2> net3 z0<0> ReLU_bit
xi8 s<2> net3 vdd vss INV

.ends Neuron
