.subckt NAND a b y
mp0 y a vdd! vdd! pmos_rvt w=81e-9 l=20e-9 nfin=3
mp1 y b vdd! vdd! pmos_rvt w=81e-9 l=20e-9 nfin=3
mn3 net11 b vss! vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
mn2 y a net11 vss! nmos_rvt w=108e-9 l=20e-9 nfin=4
.ends NAND
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: INV
** View name: schematic
.subckt INV in out
mn0 out in vss! vss! nmos_rvt w=54e-9 l=20e-9 nfin=2
mp1 out in vdd! vdd! pmos_rvt w=81e-9 l=20e-9 nfin=3
.ends INV
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: NOR
** View name: schematic
.subckt NOR a b y
mp1 y b net1 vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp0 net1 a vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mn3 y a vss! y nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 y b vss! y nmos_rvt w=54e-9 l=20e-9 nfin=2
.ends NOR
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: MULT2bit
** View name: schematic
xi0 a<0> b<0> net3 NAND
xi1 net3 y<0> INV
xi2 net3 net4 y<1> NOR
mp1 net4 b<1> net6 vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mp0 net6 a<1> vdd! vdd! pmos_rvt w=162e-9 l=20e-9 nfin=6
mn3 net4 a<1> b<1> vss! nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 net4 b<1> a<1> vss! nmos_rvt w=54e-9 l=20e-9 nfin=2
.END

