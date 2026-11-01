#======================================================
# CONFIGURAÇÕES DE TERMINAL (ESTILO PANORÂMICO)
#======================================================
reset
set encoding utf8
# Dimensões bem achatadas: 2600 de largura por apenas 750 de altura
set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 2.0 font "Arial, 18" size 2600,750
set output 'Adiabaticity_Temperature_V3.png'

set border lw 1.5
set grid xtics ytics ls 102 lc rgb "#D3D3D3" dt 2

# Layout com vãos otimizados
#set multiplot layout 1,2 spacing 0.10 margins 0.07, 0.95, 0.15, 0.90

# Reduzindo o espaçamento (spacing) de 0.10 para 0.05 para aproximar os gráficos
set multiplot layout 1,2 spacing 0.05 margins 0.08, 0.96, 0.15, 0.92

#=======================================================
# PAINEL (A): ADIABATICIDADE
#=======================================================
#set key top right font ",14" title "Energy Stability" spacing 1.1
set key top right at graph 0.95, 0.85 font ",14" title "Energy Stability" spacing 1.1

set xlabel "Time / ps"
set ylabel "Energies / a.u."
set yrange [-0.1:2.2]
set xrange [*:42]
set label 1 "a)" at graph 0.02, 0.95 font ",20"

# Plot com os cálculos de conversão originais 
plot "ENERGIES" u ($1*0.121/1000.):($5-$4) t "E_{total} - E_{KS}" w l lw 2.5 lc rgb "black", \
     "ENERGIES" u ($1*0.121/1000.):2 t "E_{fictitious kin}" w l lw 1.5 lc rgb "red"

#=======================================================
# PAINEL (B): TEMPERATURA
#=======================================================
unset label 1
set label 2 "b)" at graph 0.02, 0.95 font ",20"

#set key top right font ",14" title "Thermal Control"
set key top right at graph 0.95, 0.95 font ",14" title "Thermal Control"

set yrange [200:400]
set xrange [0.2:42]
set ylabel "Temperature / K"

# Plot com a média suave [cite: 8, 9]
plot "ENERGIES" u ($1*5*0.02418/1000.):3 title "Raw data" w p ps 0.6 pt 7 lc rgb "#A9A9A9", \
     "ENERGIES" u ($1*5*0.02418/1000.):3 smooth sbezier t "Average (300 K)" lw 3.5 lc rgb "#006400"

unset multiplot
set output