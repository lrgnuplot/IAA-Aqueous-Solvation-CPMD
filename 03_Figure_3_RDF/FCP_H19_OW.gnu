#
# Funcao de Distribuicao de Pares


set grid
set key bottom right title ""
#set key at 5, 2.

set xrange [:14.]
set yrange [:]
set y2range [*:*]

set ytics  textcolor rgbcolor "blue"
set y2tics  textcolor rgbcolor "red"

set xlabel "r/Å" 
set ylabel "g_{ij}(r)" textcolor rgbcolor "blue" 
#set y2label "CN (r)" textcolor rgbcolor "red" 
set y2label "Integral of the g_{ij}(r)" textcolor rgbcolor "red" 

#set xtics 0, 0.4, 3.6
set mxtics 2
set mytics 2

plot "FCP_H19_OW.dat" u 1:2  t "H_{19} - O_W" w l lw 3  lc rgb "blue" ,\
     "FCP_H19_OW.dat" u 1:3 axes x1y2 tit 'Num. Coord'  w l lw 3 lt rgb "red"


set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 1.8 font "Arial, 28" size 1500,1100
#set terminal pngcairo enhanced color dashed rounded dashlength 1.2 linewidth 1.5 font "Arial, 28" size 1600,1200
set output 'FCP_O19_OW.png'
replot
