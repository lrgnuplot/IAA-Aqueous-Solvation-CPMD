#======================================================
# CONFIGURAÇÕES TIPO 3x1 - APENAS PAINÉIS (B) - EIXO Y PADRÃO
#======================================================
reset
set encoding utf8
set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 2.0 font "Arial, 20" size 2800,600
set output 'TRM_H19_H22_O13_1x3_v1.png'

set border lw 1.5
set grid xtics ytics ls 102 lc rgb "#D3D3D3" dt 2

c1_L = 0.08; c1_R = 0.34
c2_L = 0.39; c2_R = 0.65
c3_L = 0.70; c3_R = 0.96
y_bot = 0.15; y_top = 0.92

set multiplot
set xlabel "Time / ps"
set xrange [0:42.]
set format y "%.1f"

#--- SISTEMA H19-OW ---  NH···O_{W}
set lmargin at screen c1_L; set rmargin at screen c1_R
set bmargin at screen y_bot; set tmargin at screen y_top
set label 1 'a)' at graph 0.07, 0.90 font "Arial:Bold,22" front
set ylabel "O_{W} Coordination Number" textcolor rgb "black"
set yrange [0:2.2]
plot "TRM_H19_OW.dat" with l lw 2 lc rgb "black" notitle

#--- SISTEMA H22-OW --- OH···O_{W}
unset label 1
set label 1 'b)' at graph 0.07, 0.90 font "Arial:Bold,22" front
set ylabel "O_{W} Coordination Number"
set yrange [0:1.2]
set lmargin at screen c2_L; set rmargin at screen c2_R
plot "TRM_H22_OW.dat" with l lw 2 lc rgb "black" notitle

#--- SISTEMA O13-HW ---  C=O···H_{W}
unset label 1
set label 1 'c)' at graph 0.09, 0.90 font "Arial:Bold,22" front
set ylabel "H_{W} Coordination Number"
set yrange [0:3.2]
set lmargin at screen c3_L; set rmargin at screen c3_R
plot "TRM_O13_HW.dat" with l lw 2 lc rgb "black" notitle

unset multiplot