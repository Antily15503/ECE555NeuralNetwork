** Library name: TeamKEK
** Cell name: NAND
** View name: schematic
.subckt NAND a b y vdd vss
.ends NAND
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: INV
** View name: schematic
.subckt INV in out vdd vss
.ends INV
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: NOR
** View name: schematic
.subckt NOR a b y vdd vss
.ends NOR
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: XNOR-NOR
** View name: schematic
.subckt _sub3 a b nand vdd vss y
xi2 nand net5 y vdd vss NOR
.ends _sub3
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: MULT2bit
** View name: schematic
.subckt MULT2bit a<1> a<0> b<1> b<0> y<1> y<0> vdd vss
xi0 a<0> b<0> net3 vdd vss NAND
xi1 net3 y<0> vdd vss INV
xi6 a<1> b<1> net3 vdd vss y<1> _sub3
.ends MULT2bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: XOR
** View name: schematic
.subckt XOR a b vdd vss y
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
.subckt Ripple_Adder_2_bit a<1> a<0> b<1> b<0> s<2> s<1> s<0> vss vdd
xi1 a<1> b<1> net5 s<2> s<1> vdd vss Full_Adder_1_bit
xi6 a<0> b<0> net5 s<0> vdd vss Half_Adder
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
.ends ReLU_bit
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: Neuron
** View name: schematic
xi1 x1<1> x1<0> w01<1> w01<0> net2<0> net2<1> vdd vss MULT2bit
xi0 x0<1> x0<0> w00<1> w00<0> net11<0> net11<1> vdd vss MULT2bit
xi5 net11<0> net11<1> net2<0> net2<1> net12<0> net12<1> net12<2> vss vdd Ripple_Adder_2_bit
xi6 net12<0> net12<1> net12<2> s<2> s<1> s<0> vdd vss w20<2> w20<1> w20<0> Ripple_Adder_3_bit
xi9 vss vdd s<1> s<2> net3 z0<1> ReLU_bit
xi7 vss vdd s<0> s<2> net3 z0<0> ReLU_bit
xi8 s<2> net3 vdd vss INV
.END

