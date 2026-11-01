#======================================================
# CONFIGURAÇÕES TIPO 3x1 - APENAS PAINÉIS (C) - EIXO Y PADRÃO
#======================================================
reset
set encoding utf8
set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 2.0 font "Arial, 20" size 2800,600
set output 'FreeEnergy_H19_H22_O13_1x3_v1.png'

set border lw 1.5
set grid xtics ytics ls 102 lc rgb "#D3D3D3" dt 2

c1_L = 0.08; c1_R = 0.34
c2_L = 0.39; c2_R = 0.65
c3_L = 0.70; c3_R = 0.96
y_bot = 0.15; y_top = 0.92

set multiplot
set xlabel "r / Å"
set ylabel "- W_{ij}(r) / kcal·mol^{-1}" textcolor rgb "black"
set key bottom right font ",22"

#--- SISTEMA H19-OW ---
# Barra vertical de 3.5 kcal/mol para o Painel (a)
set arrow 7 from 1.9, 1.0 to 1.9, 4.89 heads size 0.05,90 front lc rgb "black" lw 2
set label 7 "-3.8 kcal·mol^{-1}" at 1.85, 2.75 rotate by 90 center font ",22"

set lmargin at screen c1_L; set rmargin at screen c1_R
set bmargin at screen y_bot; set tmargin at screen y_top
set label 1 'a)' at graph 0.11, 0.90 font "Arial:Bold,22" front
plot "FreeEnergy-H19-OW.dat" u 1:2 with points pt 7 ps 1.2 t "N–H···O_{W}", \
     "" u 1:2 smooth mcsplines with lines lw 3 lc rgb "dark-green" t "Smooth"

#--- SISTEMA H22-OW ---
# Barra vertical de 3.5 kcal/mol para o Painel (b)
set arrow 7 from 1.45, 0.8 to 1.45, 4.8 heads size 0.05,90 front lc rgb "black" lw 2
set label 7 "-3.9 kcal·mol^{-1}" at 1.40, 2.55 rotate by 90 center font ",22"

unset label 1
set label 1 'b)' at graph 0.11, 0.90 font "Arial:Bold,22" front
set lmargin at screen c2_L; set rmargin at screen c2_R
plot "FreeEnergy-H22-OW.dat" u 1:2 with points pt 7 ps 1.2 t "O–H···O_{W}", \
     "" u 1:2 smooth mcsplines with lines lw 3 lc rgb "dark-green" t "Smooth"

#--- SISTEMA O13-HW ---
# Barra vertical de 3.5 kcal/mol para o Painel (c)
set arrow 7 from 1.85, 0.9 to 1.85, 3.12 heads size 0.05,90 front lc rgb "black" lw 2
set label 7 "-2.2 kcal·mol^{-1}" at 1.80, 2.05 rotate by 90 center font ",22"

unset label 1
set label 1 'c)' at graph 0.11, 0.90 font "Arial:Bold,22" front
set lmargin at screen c3_L; set rmargin at screen c3_R
plot "FreeEnergy-O13-HW.dat" u 1:2 with points pt 7 ps 1.2 t "C=O···H_{W}", \
     "" u 1:2 smooth mcsplines with lines lw 3 lc rgb "dark-green" t "Smooth"

unset multiplot