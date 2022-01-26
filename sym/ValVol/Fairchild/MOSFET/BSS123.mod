*BSS123 at Temp. Electrical 
*--------------------------------------------------
.SUBCKT BSS123 20 10 30 50
*20=DRAIN 10=GATE 30=SOURCE 50=VTEMP
Rg 10 11x 1
Rdu 12x 1 1u
M1 2 1 4x 4x DMOS L=1u W=1u
.MODEL DMOS NMOS(VTO=1.5 KP=1.15
+THETA=0.94118 VMAX=2E5 LEVEL=3)
Cgs 1 5x 30p
Rd 20 4 1.1 
Dds 5x 4 DDS
.MODEL DDS D(M=3.55E-1 VJ=4.12E-1 CJO=22p)
Dbody 5x 20 DBODY
.MODEL DBODY D(IS=7.97E-10 N=1.564708 RS=.0303 TT=36n)
Ra 4 2 1.1 
Rs 5x 5 0.5m
Ls 5 30 0.5n
M2 1 8 6 6 INTER
E2 8 6 4 1 2
.MODEL INTER NMOS(VTO=0 KP=10 LEVEL=1)
Cgdmax 7 4 104p
Rcgd 7 4 10meg
Dgd 6 4 DGD
Rdgd 6 4 10meg
.MODEL DGD D(M=3.17E-1 VJ=7.01E-4 CJO=104p)
M3 7 9 1 1 INTER
E3 9 1 4 1 -2
*ZX SECTION
EOUT 4x 6x poly(2) (1x,0) (3x,0) 0 0 0 0 1
FCOPY 0 3x VSENSE 1
RIN 1x 0 1G
VSENSE 6x 5x 0
RREF 3x 0 10m
*TEMP SECTION
ED 101 0 VALUE {V(50,100)}
VAMB 100 0 25
EKP 1x 0 101 0  2.2
*VTO TEMP SECTION
EVTO 102 0 101 0 .012
EVT 12x 11x 102 0 1
*DIODE THEMO BREAKDOWN SECTION
EBL VB1 VB2 101 0 .08
VBLK VB2 0 100
D 20 DB1 DBLK
.MODEL DBLK D(IS=1E-14 CJO=.1p RS=.1)
EDB DB1 0 VB1 0 1
.ENDS BSS123
*BSS123 (Rev.A1) 5/15/02 **ST