# Localiza automaticamente o arquivo que termina com 'scattering.txt'
file = system("ls *scattering.txt | head -n 1")

# Define o nome do arquivo de saída (substitui a extensão .txt por .png)
output_file = substr(file, 1, strlen(file)-4) . ".png"


set encoding iso_8859_1
set key 
set ylabel 'RDG (a.u)' font "Arial, 48" 
set xlabel 'sign({/Symbol l}_2){/Symbol r} (a.u.)' font "Arial, 48"
set pm3d map
set palette defined (-0.035 "blue",-0.0075 "green", 0.02 "red")
set format y "%.1f"
#set format y2 "%.0s*10^{%T}"
set format x "%.2f"
set format cb "%.3f"
#set format cb "%.0s*10^{%T}"
#set format cb "%2.1t{/Symbol \264}10^{%L}"

set border lw 2
set xtic  -0.05,0.01,0.05 nomirror rotate font "Arial, 36"
set ytic   0.0,0.2,2.0 nomirror font "Arial, 36"
set cbtic  -0.035,0.005,0.02 nomirror font "Arial, 36"
set xrange [-0.05:0.05]  
set yrange [0.0:2.0] 
set cbrange [-0.035:0.02]
plot file u 4:5:4 with points pointtype 31 pointsize 0.0001 palette t ''  

#pause -1 

set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 1.8 font "Arial, 32" size 1500,1100
#set terminal pngcairo enhanced color dashed rounded dashlength 1.2 linewidth 1.5 font "Arial, 34" size 1600,1200  
set output output_file

replot
exit


