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
mn3 y a vss! vss! nmos_rvt w=54e-9 l=20e-9 nfin=2
mn2 y b vss! vss! nmos_rvt w=54e-9 l=20e-9 nfin=2
.ends NOR
** End of subcircuit definition.

** Library name: TeamKEK
** Cell name: RELU3
** View name: schematic
xi12 y<1> net1 INV
xi11 y<0> net3 INV
xi9 y<2> net3 z<0> NOR
xi8 y<2> net1 z<1> NOR
.END

