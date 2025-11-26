.subckt NAND a b y vdd vss
mp0 y a vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp1 y b vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mn3 net11 a vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn2 y b net11 vss nmos_rvt w=81e-9 l=20e-9 nfin=3
.ends NAND
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: INV
** View name: schematic
.subckt INV in out vdd vss
mn0 out in vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mp1 out in vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends INV
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: NOR
** View name: schematic
.subckt NOR a b y vdd vss
mp1 y a net1 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp0 net1 b vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mn3 y a vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 y b vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
.ends NOR
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: XNOR_NOR
** View name: schematic
.subckt XNOR_NOR a b nand vdd vss y
mp1 net5 b net1 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp0 net1 a vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mn4 a vss vss vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn3 net5 a b vss nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 net5 b a vss nmos_rvt w=54e-9 l=20e-9 nfin=2
xi2 nand net5 y vdd vss NOR
.ends XNOR_NOR
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: MULT2bit
** View name: schematic
.subckt MULT2bit a<1> a<0> b<1> b<0> y<1> y<0> vdd vss
xi0 a<0> b<0> net3 vdd vss NAND
xi1 net3 y<0> vdd vss INV
xi6 a<1> b<1> net3 vdd vss y<1> XNOR_NOR
.ends MULT2bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: XOR
** View name: schematic
.subckt XOR a b vdd vss y
mn12 y net1 vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn11 net1 b a vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn10 net1 a b vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mp9 y net1 vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp8 net24 a vdd vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mp7 net1 b net24 vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends XOR
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: Full_Adder_1_bit
** View name: schematic
.subckt Full_Adder_1_bit a b cin cout s vdd vss
xi1 net3 cin vdd vss s XOR
xi0 a b vdd vss net3 XOR
xi4 net13 net18 cout vdd vss NAND
xi3 net3 cin net18 vdd vss NAND
xi2 a b net13 vdd vss NAND
.ends Full_Adder_1_bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: Half_Adder
** View name: schematic
.subckt Half_Adder a b cout s vdd vss
xi0 a b vdd vss s XOR
xi1 a b net3 vdd vss NAND
xi2 net3 cout vdd vss INV
.ends Half_Adder
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: Ripple_Adder_2_bit
** View name: schematic
.subckt Ripple_Adder_2_bit a<1> a<0> b<1> b<0> nc s<2> s<1> s<0> vss vdd
xi1 a<1> b<1> net5 nc s<1> vdd vss Full_Adder_1_bit
xi6 a<0> b<0> net5 s<0> vdd vss Half_Adder
xi12 s<1> net2 vdd vss INV
xi11 net8 net2 s<2> vdd vss NOR
xi10 b<1> a<1> net8 vdd vss NOR
.ends Ripple_Adder_2_bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: Ripple_Adder_3_bit
** View name: schematic
.subckt Ripple_Adder_3_bit a<2> a<1> a<0> s<2> s<1> s<0> vdd vss w20<2> w20<1> w20<0>
xi0 a<0> w20<0> net4 s<0> vdd vss Half_Adder
xi2 a<1> w20<1> net4 net11 s<1> vdd vss Full_Adder_1_bit
xi4 net16 net11 vdd vss s<2> XOR
xi3 a<2> w20<2> vdd vss net16 XOR
.ends Ripple_Adder_3_bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: ReLU_bit
** View name: schematic
.subckt ReLU_bit vdd vss y y2 y2_not z
mp4 z y2 y vdd pmos_rvt w=81e-9 l=20e-9 nfin=3
mn5 z y2 vss vss nmos_rvt w=81e-9 l=20e-9 nfin=3
mn3 y y2_not z vss nmos_rvt w=81e-9 l=20e-9 nfin=3
.ends ReLU_bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: Neuron
** View name: schematic
xi1 x1<1> x1<0> w01<1> w01<0> hbm<1> hbm<0> vdd vss MULT2bit
xi0 x0<1> x0<0> w00<1> w00<0> lbm<1> lbm<0> vdd vss MULT2bit
xi5 lbm<1> lbm<0> hbm<1> hbm<0> nc lb<2> lb<1> lb<0> vss vdd Ripple_Adder_2_bit
xi6 lb<2> lb<1> lb<0> s<2> s<1> s<0> vdd vss w20<2> w20<1> w20<0> Ripple_Adder_3_bit
xi9 vdd vss s<1> s<2> net3 z0<1> ReLU_bit
xi7 vdd vss s<0> s<2> net3 z0<0> ReLU_bit
xi8 s<2> net3 vdd vss INV
