#======================================================
# CONFIGURAÇÕES TIPO 3x1 - APENAS PAINÉIS (A)
#======================================================
reset
set encoding utf8
set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 2.0 font "Arial, 20" size 2800,600
set output 'FDR_H19_H22_O13_1x3_v1.png'

set border lw 1.5
set grid xtics y2tics ls 102 lc rgb "#D3D3D3" dt 2

# Definição de Margens (Layout 3 colunas)
c1_L = 0.08; c1_R = 0.34
c2_L = 0.39; c2_R = 0.65
c3_L = 0.70; c3_R = 0.96
y_bot = 0.15; y_top = 0.92

set multiplot

#--- SISTEMA H19-OW ---
set lmargin at screen c1_L; set rmargin at screen c1_R
set bmargin at screen y_bot; set tmargin at screen y_top
set label 1 'a)' at graph 0.07, 0.90 font "Arial:Bold,22" front
set xlabel "r / Å"
set ylabel "g_{ij}(r) - N–H···O_{W}" textcolor rgb "blue"
#set y2label "Integral - N–H···O_{W}" textcolor rgb "red"
unset y2label
set ytics nomirror textcolor rgb "blue"
set y2tics nomirror textcolor rgb "red"
set y2range [*:6]
set xrange [*:6]
set key bottom right font ",22"
plot "FCP_H19_OW.dat" u 1:2 t "N–H···O_{W}" w l lw 3 lc rgb "blue", \
     "" u 1:3 axes x1y2 t "Coord.  Number" w l lw 3 lc rgb "red"

#--- SISTEMA H22-OW ---
unset label 1
set label 1 'b)' at graph 0.07, 0.90 font "Arial:Bold,22" front
#set ylabel "g_{ij}(r) - O–H···O_{W}" textcolor rgb "blue"
#set y2label "Integral - O–H···O_{W}" textcolor rgb "red"
unset ylabel;unset y2label
set lmargin at screen c2_L; set rmargin at screen c2_R
plot "FCP_H22_OW.dat" u 1:2 t "O–H···O_{W}" w l lw 3 lc rgb "blue", \
     "" u 1:3 axes x1y2 t "Coord. Number" w l lw 3 lc rgb "red"

#--- SISTEMA O13-HW ---
unset label 1
set label 1 'c)' at graph 0.07, 0.90 font "Arial:Bold,22" front
#set ylabel "g_{ij}(r) - O_{13}···H_{W}" textcolor rgb "blue"
set y2label "Integral of the g_{ij}(r) - C=O···H_{W}" textcolor rgb "red"
set y2range [*:6]
set xrange [*:6]
set lmargin at screen c3_L; set rmargin at screen c3_R
plot "FCP_O13_HW.dat" u 1:2 t "C=O···H_{W}" w l lw 3 lc rgb "blue", \
     "" u 1:3 axes x1y2 t "Coord.  Number" w l lw 3 lc rgb "red"

unset multiplot