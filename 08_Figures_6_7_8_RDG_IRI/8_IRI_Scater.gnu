#======================================================
# SCRIPT IRI - PADRONIZADO COM O ESTILO DO RDG
#======================================================
reset
set encoding iso_8859_1

# Localiza o arquivo de dados do IRI automaticamente
data_file = system("ls *-IRI-scattering.txt  | head -n 1")

# Define o nome do arquivo de saída (substitui a extensão .txt por .png)
output_file = substr(data_file, 1, strlen(data_file)-4) . ".png"

# CONFIGURAÇÕES DE TERMINAL (Mesmas dimensões e espessura base)
set terminal pngcairo enhanced rounded dashlength 1.2 linewidth 1.8 font "Arial, 32" size 1500,1100
set output output_file

# Estilo da Borda 
set border lw 2
unset grid

# Fontes dos Eixos 
set ylabel 'IRI' font "Arial, 32" 
set xlabel 'sign({/Symbol l}_2){/Symbol r} / a.u.' font "Arial, 32"

# Mapeamento de Cores IRI (BGR)
set pm3d map
set palette defined (-0.05 "blue",0.0 "green", 0.05 "red")

# Formatação de Números
set format y "%.1f"
set format x "%.2f"
set format cb "%.2f"

# Fontes dos Tics (Igual ao RDG: 36)
set xtics -0.4, 0.05, 0.100 nomirror rotate font "Arial, 34"
set ytics  0.0, 0.5, 2.5  nomirror font "Arial, 34"
set cbtics -0.04, 0.01, 0.04 nomirror font "Arial, 34"

# Limites (Ranges)
set xrange [-0.400:0.100]  
set yrange [0.0:2.5] 
set cbrange [-0.04:0.04]

# Plotagem (Coluna 4: sign(L2)rho | Coluna 5: IRI)
# Pointsize (ps) 0.5 para manter densidade visual
plot data_file u 4:5:4 with points pt 31 ps 0.005 palette notitle

unset output
exit
