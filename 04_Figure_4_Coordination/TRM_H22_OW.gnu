#
unset grid 
unset key 
set encoding iso_8859_1
set encoding utf8

set style data histogram
#set style histogram cluster gap 1
set style fill solid 
#set style histogram clustered gap 1

set yrange[*:1.2]
set xrange[*:42]
#set style fill solid

set xlabel "Time (ps)" 
#set ylabel "TRM" 
set ylabel "Número de Coordenação" 


plot "TRM_H22_OW.dat" with l

pause -3

set terminal pngcairo enhanced color dashed rounded dashlength 1.0 linewidth 3.5 font "Arial, 28" size 1600,1000
set output 'TRM_H22_OW.png'
replot

exit
