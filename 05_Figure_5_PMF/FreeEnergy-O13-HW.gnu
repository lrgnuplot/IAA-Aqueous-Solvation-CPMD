#
unset grid 
unset key 
set encoding iso_8859_1
set encoding utf8

set style data histogram
#set style histogram cluster gap 1
set style fill solid 
#set style histogram clustered gap 1

set yrange[*:]
set xrange[*:]
#set style fill solid

set xlabel "r / Å " 
set ylabel "Helmholtz free energies / kcal·mol^{-1}"  

# Plotando a curva original (pontos) e a suavizada (linha)
plot "FreeEnergy-O13-HW.dat" with points pt 7 ps 1.5 title "Ab initio Points", \
     "" smooth mcsplines with lines lw 2 title "Smooth Curve"

set terminal pngcairo enhanced color dashed rounded dashlength 1.0 linewidth 3.5 font "Arial, 28" size 1600,1000
set output 'FreeEnergy-O13-HW.png'
replot

exit
